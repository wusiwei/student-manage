<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>欢迎</h1>
	<span>aaaaaaaa</span>
	<button id="login">测试</button>
</body>
<script type="text/javascript" src="../static/scripts/jquery.js"></script>
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