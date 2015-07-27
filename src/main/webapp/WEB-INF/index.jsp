<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="blade框架短地址生成">
    <meta name="author" content="biezhi">

    <title>Blade - 短地址生成</title>

    <!-- Bootstrap Core CSS -->
    <link href="http://apps.bdimg.com/libs/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
	<link href="/static/css/roboto.min.css" rel="stylesheet">
    <link href="/static/css/material.min.css" rel="stylesheet">
    <link href="/static/css/ripples.min.css" rel="stylesheet">
	
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<form class="form-horizontal" method="post">
    <fieldset>
        <legend>短网址生成</legend>
        <div class="form-group">
            <label for="inputEmail" class="col-lg-2 control-label">要转换的网址</label>
            <div class="col-lg-10">
                <input type="text" name="url" class="form-control" value="http://" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-10 col-lg-offset-2">
                <button type="submit" class="btn btn-primary">提交</button>
            </div>
        </div>
    </fieldset>
</form>
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="http://apps.bdimg.com/libs/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="/static/js/ripples.min.js"></script>
<script src="/static/js/material.min.js"></script>
<script>
    $(document).ready(function() {
        // This command is used to initialize some elements and make them work properly
        $.material.init();
    });
</script>
</body>
</html>