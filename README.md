#blade-shorturl

> `blade`完成的一个短地址生成程序

```bash

POST	http://127.0.0.1:9000/?url=http://www.baidu.com

Res		http://127.0.0.1:9000/aE

```

### 运行该项目

+ 创建数据库,查看`short_url.sql`
+ 下载项目
	```bash
	$ git clone https://github.com/bladejava/blade-shorturl.git
	$ cd blade-shorturl
	```
+ 检查`sql2oPlugin.config("jdbc:mysql://127.0.0.1:3306/short_url", "com.mysql.jdbc.Driver", "root", "root");`
+ 运行`mvn jetty:run`
+ 打开浏览器运行`http://127.0.0.1:9000/`
