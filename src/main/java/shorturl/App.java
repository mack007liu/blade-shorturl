package shorturl;

import blade.Blade;
import blade.BladeApplication;
import blade.kit.log.Logger;
import blade.plugin.sql2o.Sql2oPlugin;

public class App extends BladeApplication {

	static Logger logger = Logger.getLogger(App.class);
	
	@Override
	public void init() {
		Blade.routes("shorturl.route");
		Sql2oPlugin sql2oPlugin = Sql2oPlugin.INSTANCE;
		sql2oPlugin.config("jdbc:mysql://127.0.0.1:3306/short_url", "com.mysql.jdbc.Driver", "root", "root");
		sql2oPlugin.run();
	}
	
	public static void main(String[] args) {
		Blade.run(App.class, 9000);
	}
}