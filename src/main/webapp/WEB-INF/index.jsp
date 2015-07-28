<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="blade框架短地址生成">
    <meta name="author" content="biezhi">
    <title>Blade - 短地址生成</title>
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
	<link href="/static/css//roboto.min.css" rel="stylesheet">
    <link href="/static/css/material.min.css" rel="stylesheet">
    <link href="/static/css/ripples.min.css" rel="stylesheet">
	<style type="text/css">
		body,html,h1{
			font-family: 'Microsoft JhengHei', '微软雅黑', 'Source Sans Pro', 'Helvetica Neue', Helvetica, Arial, sans-serif;
		}
		form {
			margin-top: 20px;
		}
	</style>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body class="container">
<div class="row text-center">
	<h1>短网址生成</h1>
</div>

<c:if test="${null != error }">
	<font color="red">${error }</font>
</c:if>
<c:if test="${null == error }">

<c:if test="${null != url_hash && url_hash != ''}">

<p><a href="http://127.0.0.1:9000/${url_hash }">http://127.0.0.1:9000/${url_hash }</a></p>
<a href="http://127.0.0.1:9000/" class="btn btn-success">重新输入</a>
	
</c:if>

<c:if test="${null == url_hash || url_hash == ''}">	       	
<form class="form-horizontal" method="post">
    <div class="row">
        <div class="form-group">
	       	<c:if test="${null == url_hash || url_hash == ''}">
	       	<label for="inputEmail" class="col-lg-2 control-label">要转换的网址</label>
	           <div class="col-lg-10">
	               <input type="text" name="url" class="form-control" placeholder="http://" />
	           </div>
	       	</c:if>
        </div>
        <div class="form-group">
            <div class="col-lg-10 col-lg-offset-2">
                <button type="submit" class="btn btn-primary">提交</button>
            </div>
        </div>
    </div>
</form>
</c:if>
</c:if>
<script type="text/javascript" src="/static/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/js/ripples.min.js"></script>
<script type="text/javascript" src="/static/js/material.min.js"></script>
<script>
    $(document).ready(function() {
        // This command is used to initialize some elements and make them work properly
        $.material.init();
    });
</script>
</body>
</html>