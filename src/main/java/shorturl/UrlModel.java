package shorturl;

import blade.plugin.sql2o.Model;
import blade.plugin.sql2o.Table;

@Table(value = "t_url")
public class UrlModel extends Model{

	private static final long serialVersionUID = -7830819602844319629L;
	private Integer id;
	private String url;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}