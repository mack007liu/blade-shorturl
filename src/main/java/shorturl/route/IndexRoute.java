package shorturl.route;

import shorturl.UrlModel;
import shorturl.UrlShortener;
import blade.annotation.Path;
import blade.annotation.Route;
import blade.kit.PatternKit;
import blade.route.HttpMethod;
import blade.servlet.Request;
import blade.servlet.Response;

@Path
public class IndexRoute {

	private UrlModel urlModel = new UrlModel();

	@Route("/:key")
	public void get(Request req, Response response) {
		String key = req.pathParam(":key").replaceAll("[^A-Za-z0-9]", "");
		int id = UrlShortener.decode(key);

		if (id < 0) {
			response.text("没有找到");
			return;
		}

		String result = get(id).getUrl();
		if (result == null) {
			response.text("没有找到");
			return;
		}
		response.redirect(result);
	}

	@Route(value = "/save", method = HttpMethod.POST)
	public void index(Request request, Response response) {
		String longUrl = request.query("url");

		if (!PatternKit.isURL(longUrl)) {
			response.text("非法的URL");
			return;
		}

		Integer id = this.save(longUrl);
		if (id == 0) {
			response.text("保存失败");
			return;
		}
		System.out.println("id = " + id);
		
		String link = "http://127.0.0.1:9000/" + UrlShortener.encode(id);
		response.html("<a href='" + link + "'>" + link + "</a>");
	}

	private Integer save(String url) {
		return urlModel.insert().param("url", url).executeAndCommit();
	}

	private UrlModel get(int id) {
		return urlModel.fetchByPk(id);
	}
}
