<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link rel="stylesheet" type="text/css" href="../static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../static/css/bootstrap-theme.min.css">
</head>
<body>
  <div>
	<ol class="breadcrumb">
	  <li>学生就业管理系统</li>
	  <li>首页</li>
	</ol>
	<div class="container">
		<h1>欢迎使用学生就业管理系统</h1>
	</div>
  </div>
</body>
<script type="text/javascript" src="../static/scripts/jquery.js"></script>
<script type="text/javascript" src="../static/scripts/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#login").click(function(){
			alert(1);
			$.ajax({
				   type: "POST",
				   url: "http://localhost:8080/student-management/studentInfo/login.do",
				   data: {"name":"admin","password":"admin"},
				   success: function(result){
				     alert( "Data Saved: " + result.msg);
				   }
			});
		});
	});
</script>

</html>