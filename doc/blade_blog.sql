/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.44 : Database - blade_blog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
USE `blade_blog`;

/*Table structure for table `t_message` */

CREATE TABLE `t_message` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `data` text,
  `isread` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_message` */

/*Table structure for table `t_metas` */

CREATE TABLE `t_metas` (
  `mid` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `slug` varchar(100) DEFAULT NULL COMMENT '项目缩略名',
  `type` varchar(32) DEFAULT NULL COMMENT '项目类型',
  `description` varchar(200) DEFAULT NULL COMMENT '选项描述',
  `count` int(10) DEFAULT '0' COMMENT '项目所属内容个数',
  `parent_mid` int(10) DEFAULT '0',
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `t_metas` */

insert  into `t_metas`(`mid`,`name`,`slug`,`type`,`description`,`count`,`parent_mid`) values (2,'编程','program','category',NULL,0,0),(3,'java','java','category',NULL,0,2),(4,'python','python','category',NULL,0,2),(5,'数据库','db','category',NULL,0,0);

/*Table structure for table `t_options` */

CREATE TABLE `t_options` (
  `name` varchar(255) NOT NULL,
  `value` text,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='配置表';

/*Data for the table `t_options` */

insert  into `t_options`(`name`,`value`) values ('menu','[{\"text\": \"首页\",\"href\": \"/\"},{\"text\": \"博客\",\"href\": \"blog\"},{\"text\": \"关于\",\"href\": \"about\"},{\"text\": \"联系\",\"href\": \"contact\"}]'),('site_subtitle','追逐自由的学术境界，为了技术的精湛而坚持不懈。'),('keywords','王爵的技术博客'),('current_theme',''),('description','王爵的技术博客'),('site_title','抛弃世俗之浮躁，留我钻研之刻苦'),('site_prefix','王爵的技术博客'),('weibo_url','http://weibo.com/u/5238733773'),('github_url','https://github.com/biezhi'),('email','biezhi.me@gmail.com');

/*Table structure for table `t_post` */

CREATE TABLE `t_post` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '内容标题',
  `slug` varchar(100) DEFAULT NULL COMMENT '固定链接',
  `content` text,
  `type` varchar(16) DEFAULT NULL COMMENT '内容类别 post|page',
  `status` varchar(16) DEFAULT NULL COMMENT '内容状态 publish已发布 delete已删除 draft草稿',
  `hit` int(10) DEFAULT '0' COMMENT '文章访问量',
  `create_time` datetime NOT NULL COMMENT '文章创建时间',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `t_post` */

insert  into `t_post`(`pid`,`title`,`slug`,`content`,`type`,`status`,`hit`,`create_time`,`update_time`) values (1,'关于','about','','page','publish',0,'2015-06-11 16:08:27','2015-06-11 16:08:29'),(2,'联系','contact','','page','publish',0,'2015-06-11 16:08:27','2015-07-09 16:08:29'),(3,'博客','blog','','page','publish',0,'2015-06-11 16:08:27','2015-05-11 16:08:29'),(4,'友链','link','','page','publish',0,'2015-06-11 16:08:27','2015-06-11 16:08:29'),(5,'hello5','','qqqsad','post','publish',0,'2015-06-11 16:08:27','2015-07-23 11:09:49'),(6,'aaaa','222','[TOC]\r\n												\r\n						- TeX (Based on KaTeX);\r\n						- Emoji;\r\n						- Task lists;\r\n						- HTML tags decode;\r\n						- Flowchart and Sequence Diagram;\r\n						\r\n						','post','delete',0,'2015-06-17 15:47:29','2015-06-17 15:47:29'),(26,'hello','','撰写文章内容，支持`markdown`语法高亮','post','publish',0,'2015-07-22 17:45:30','2015-07-22 17:45:30'),(28,'Blade框架',NULL,'#Blade\n\n[![简洁强大的JavaWeb框架](http://i1.tietuku.com/0c4b9726253b6268.png \"简洁强大的JavaWeb框架\")](http://bladejava.com)\n\n[English](https://github.com/biezhi/blade/blob/master/README_EN.md)\n\n[![@biezhi on weibo](https://img.shields.io/badge/weibo-%40biezhi-red.svg)](http://weibo.com/u/5238733773)\n[![Hex.pm](https://img.shields.io/hexpm/l/plug.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)\n[![Build Status](https://api.travis-ci.org/biezhi/blade.svg?branch=master)](https://travis-ci.org/biezhi/blade)\n[![Circle CI](https://circleci.com/gh/biezhi/blade/tree/master.svg?style=svg)](https://circleci.com/gh/biezhi/blade/tree/master)\n[![release](https://img.shields.io/maven-central/v/com.bladejava/blade.svg)](http://search.maven.org/#search%7Cga%7C1%7Cg%3A%22com.bladejava%22)\n\n**blade** 是一个简洁强大的web框架，它内置了`IOC`管理，拦截器配置，`REST API`开发等众多主流web特性，集成了模板引擎，缓存插件，数据库操作，邮件发送等常用功能，简洁的源码值得你阅读和学习。如果你喜欢，欢迎[Star and Fork](https://github.com/biezhi/blade) ！\n\n## Blade特性\n\n* 简洁的MVC & 拦截器\n* REST风格API\n* 注解方式 开发\n* 微内核IOC容器\n* 实用工具类\n* 模板引擎支持\n* 支持JDK1.6+\n* 内置Jetty启动\n* 插件扩展机制\n* 缓存数据信息\n* 编码/JSON/配置文件\n* ...\n\n## 快速入门\n第一步、用maven构建一个webapp，加入blade的依赖，推荐获取[最新版本](LAST_VERSION.md)\n\n```xml\n<dependency>\n	<groupId>com.bladejava</groupId>\n	<artifactId>blade-core</artifactId>\n	<version>1.2.3</version>\n</dependency>\n```\n	\n第二步、在`web.xml`中配置Blade核心过滤器并设置你的初始化类，你也可以不配置(使用jetty启动)\n	\n```xml\n<web-app>\n	<display-name>Archetype Created Web Application</display-name>\n	<filter>\n		<filter-name>BladeFilter</filter-name>\n		<filter-class>blade.BladeFilter</filter-class>\n		<init-param>\n			<param-name>applicationClass</param-name>\n			<param-value>blade.sample.App</param-value>\n		</init-param>\n	</filter>\n	\n	<filter-mapping>\n		<filter-name>BladeFilter</filter-name>\n		<url-pattern>/*</url-pattern>\n	</filter-mapping>\n	\n</web-app>\n```\n\n第三步、编写App.java和路由文件，下面是一个示例\n\n```java\npublic class App extends BladeApplication{\n\n	Logger logger = Logger.getLogger(App.class);\n	@Override\n	public void init() {\n		// 设置路由、拦截器包所在包\n		Blade.defaultRoute(\"blade.sample\");\n	}\n	\n}\n```\n\n	\n```java\n@Path(\"/\")\npublic class Hello {\n	\n	@Route(\"hello\")\n	public String hello() {\n		System.out.println(\"hello\");\n		return \"hello.jsp\";\n	}\n		\n	@Route(value = \"post\", method = HttpMethod.POST)\n	public void post(Request request) {\n		String name = request.query(\"name\");\n		System.out.println(\"name = \" + name);\n	}\n	\n	@Route(\"users/:name\")\n	public ModelAndView users(Request request, Response response) {\n		System.out.println(\"users\");\n		String name = request.pathParam(\":name\");\n		\n		ModelAndView modelAndView = new ModelAndView(\"users\");\n		modelAndView.add(\"name\", name);\n		return modelAndView;\n	}\n\n	@Route(\"index\")\n	public String index(Request request) {\n		request.attribute(\"name\", \"jack\");\n		return \"index.jsp\";\n	}\n	\n}\n```\n	\nOK，这一切看起来多么的简单，查阅使用指南更多现成的例子供你参考:\n\n+ [API docs](http://bladejava.com/apidocs/)\n+ [使用指南](http://bladejava.com/doc/cn/index.html) (完善中...)\n+ [一些例子](https://github.com/bladejava)\n\n### 计划\n	1. 完善文档\n	2. 用`blade`开发单用户博客系统、音乐系统、图片系统等\n	3. 优化代码性能\n	4. 编写英文文档\n\n## 更新日志\n\n### v1.2.4\n	1. 添加JSON、Properties文件配置\n	2. 优化代码性能\n	\n### v1.2.2\n	1. `DateKit`添加获取当前unix时间戳\n	2. 修复`blade-sql2o`分页bug\n	3. 修复`blade-beetl`没有存储`ModelAndView`的数据\n	\n### v1.2\n	1. 修复sql2o更新Bug\n	2. 去除blade-kit无用类\n	3. 添加邮件支持\n	4. 添加程序计时支持\n	5. 添加http网络请求支持\n	6. 优化内置日志输出\n	7. 添加定时任务支持\n	8. 重构项目结构\n		\n### v1.1.x\n	1. 去除对外公开的多余方法展示\n	2. 添加`Blade.run()`方式运行jetty\n	3. 添加`Blade.register()`方法注册bean对象\n	4. 优化IOC对象管理\n	5. 优化底层IO\n	6. 简化插件扩展\n	7. 拦截器路由匹配分离\n	8. 修复jetty在多maven环境下运行bug \n	9. 添加初始化监听context\n	10. 优化文件上传\n	11. 优化路由匹配\n	12. 添加方法执行监测\n	13. 添加缓存支持\n\n### v1.0.0\n	第一个稳定版本发布\n\n## 开源协议\nBlade框架基于 [Apache2 License](http://www.apache.org/licenses/LICENSE-2.0.html)\n\n## 联系我\nOSC Blog:[http://my.oschina.net/biezhi](http://my.oschina.net/biezhi)\n\nMail: biezhi.me#gmail.com\n\nJava交流群: [1013565](http://shang.qq.com/wpa/qunwpa?idkey=932642920a5c0ef5f1ae902723c4f168c58ea63f3cef1139e30d68145d3b5b2f)\n','post','publish',0,'2015-07-23 14:33:49','2015-07-23 14:33:49');

/*Table structure for table `t_relation` */

CREATE TABLE `t_relation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL COMMENT '内容主键',
  `mid` varchar(50) NOT NULL COMMENT '    项目主键',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='关系表';

/*Data for the table `t_relation` */

insert  into `t_relation`(`id`,`pid`,`mid`) values (1,1,'3'),(2,2,'3'),(3,1,'3'),(4,2,'3');

/*Table structure for table `t_user` */

CREATE TABLE `t_user` (
  `uid` int(10) NOT NULL AUTO_INCREMENT COMMENT 'user表主键',
  `loginname` varchar(50) NOT NULL COMMENT '用户登录名称',
  `password` varchar(50) NOT NULL COMMENT '用户密码',
  `mail` varchar(50) NOT NULL COMMENT '用户的邮箱',
  `nickname` varchar(50) DEFAULT NULL COMMENT '用户显示名称',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `url` varchar(255) DEFAULT NULL,
  `createtime` datetime NOT NULL COMMENT '最后活动时间',
  `lastlogin` datetime NOT NULL COMMENT '最后登录时间',
  `role` varchar(100) NOT NULL COMMENT '是否是管理员',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`uid`,`loginname`,`password`,`mail`,`nickname`,`avatar`,`url`,`createtime`,`lastlogin`,`role`) values (1,'biezhi','916a042f1bde53eba1e49cd59cf4eb75','biezhi.me@gmail.com','123','http://127.0.0.1:9000/upload/20150626140532598_YXBcJAJBH9_crop.jpg',NULL,'2015-06-10 14:00:30','2015-06-12 14:00:32','1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
