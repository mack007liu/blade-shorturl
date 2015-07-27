package shorturl.route;

import shorturl.Hashids;
import shorturl.UrlModel;
import blade.annotation.Path;
import blade.annotation.Route;
import blade.kit.PatternKit;
import blade.route.HttpMethod;
import blade.servlet.Request;
import blade.servlet.Response;

@Path
public class IndexRoute {

	private static final Hashids HASHIDS = new Hashids("blade-shorturl");
	
	private UrlModel urlModel = new UrlModel();

	@Route("/:key")
	public void get(Request req, Response response) {
		String key = req.pathParam(":key").replaceAll("[^A-Za-z0-9]", "");
		long[] numbers = HASHIDS.decode(key);

		if (null == numbers || numbers.length < 1) {
			response.text("没有找到");
			return;
		}
		int id = (int) numbers[0];
		String result = get(id).getUrl();
		if (result == null) {
			response.text("没有找到");
			return;
		}
		response.redirect(result);
	}
	
	@Route(value = "/", method = HttpMethod.GET)
	public String index() {
		return "index";
	}
	
	@Route(value = "/", method = HttpMethod.POST)
	public String save(Request request, Response response) {
		String resJsp = "index.jsp";
		String longUrl = request.query("url");

		if (!PatternKit.isURL(longUrl)) {
			request.attribute("error", "非法的URL");
			return resJsp;
		}
		
		Integer id = this.save(longUrl);
		if (id == 0) {
			request.attribute("error", "保存失败");
			return resJsp;
		}
		
		System.out.println("id = " + id);
		
		String hash = HASHIDS.encode(id);
		request.attribute("url_hash", hash);
		return resJsp;
	}

	private Integer save(String url) {
		return urlModel.insert().param("url", url).executeAndCommit();
	}
	
	private UrlModel get(int id) {
		return urlModel.fetchByPk(id);
	}
}
