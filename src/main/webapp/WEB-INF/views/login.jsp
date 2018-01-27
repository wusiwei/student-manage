<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<link rel="stylesheet" type="text/css" href="../static/css/login.css">
<link rel="stylesheet" type="text/css" href="../static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../static/css/bootstrap-dialog.min.css">
</head>
<body>
	<div class="container">
		<div id="loginMainDiv" class="loginMainDiv">
	         <div  class='form-horizontal'>
				<h1 class='form-signin-heading center'>用户登录</h1>
				<div class="form-group">
			      <label for="firstname" class="col-sm-3 control-label">用户名：</label>
			      <div class="col-sm-9 controls">
			         <input type="text" class="form-control" id="userName" 
			            placeholder="请输入用户名" >
			      </div>
			   </div>
			   <div class="form-group">
			      <label for="firstname" class="col-sm-3 control-label">密码：</label>
			      <div class="col-sm-9">
			         <input type="password" class="form-control" id="userPassword" 
			            placeholder="请输入密码">
			      </div>
			   </div>
			   <div class="form-group">
			      <label for="userCompetence" class="col-sm-3 control-label">登录身份：</label>
			      <div class="col-sm-9">
			         <select class="form-control" id="userCompetence"> 
				        <option>学生</option> 
				        <option>管理员</option> 
				    </select>
			      </div>
			   </div>
			   <div class="form-group">
			      <div class="col-sm-offset-3 col-sm-9">
			         <div class="checkbox">
			            <label>
			               <input type="checkbox"> 请记住我
			            </label>
			         </div>
			      </div>
			   </div>
				<button class='btn btn-lg btn-primary btn-block' id="userLogin">登录</button>
				<button class='btn btn-lg btn-block' id="toUserEnroll">注册</button>
			</div>
		</div>
		<div id="enrolMainDiv" class="loginMainDiv" style="display:none">
	         <div  class='form-horizontal'>
				<h1 class='form-signin-heading center'>学生账号注册</h1>
				<div class="form-group">
			      <label for="firstname" class="col-sm-3 control-label">注册用户名：</label>
			      <div class="col-sm-9">
			         <input type="text" class="form-control" id="logging_name"
			            placeholder="请填写用户名" >
			      </div>
			   </div>
			   <div class="form-group">
			      <label for="firstname" class="col-sm-3 control-label">注册密码：</label>
			      <div class="col-sm-9">
			         <input type="password" class="form-control"  id="logging_password"
			            placeholder="请填写密码">
			      </div>
			   </div>
			   <div class="form-group">
			      <label for="firstname" class="col-sm-3 control-label">确认密码：</label>
			      <div class="col-sm-9">
			         <input type="password" class="form-control"  id="logging_surePassword"
			            placeholder="请确认密码">
			      </div>
			   </div>
			   <div class="form-group">
			      <label for="firstname" class="col-sm-3 control-label">注册邮箱：</label>
			      <div class="col-sm-9">
			         <input type="password" class="form-control" id="logging_email"
			            placeholder="请填写邮箱">
			      </div>
			   </div>
			   <div class="form-group">
			      <label for="firstname" class="col-sm-3 control-label">你的学号：</label>
			      <div class="col-sm-9">
			         <input type="password" class="form-control" id="logging_studentId"
			            placeholder="请填写学号">
			      </div>
			   </div>
				<button type="button" class='btn btn-lg btn-primary btn-block' id="userEnrol">注册</button>
				<button type="button" class='btn btn-lg btn-block' id="backTo">返回</button>
			</div>
		</div>
	</div>
<script type="text/javascript" src="../static/scripts/jquery.js"></script>
<script type="text/javascript" src="../static/scripts/login.js"></script>
<script type="text/javascript" src="../static/scripts/bootstrap.min.js"></script>
<script type="text/javascript" src="../static/scripts/bootstrap-dialog.js"></script>
<script type="text/javascript">



$(function(){
	$("#userLogin").click(checkUser);
	
	$("#userEnrol").click(registered);
	
	$("#toUserEnroll").click(function(){
		$("#loginMainDiv").hide("slow");
		$("#enrolMainDiv").show("slow");
	});
	$("#backTo").click(backLogin);
});

function backLogin(){
	$("#loginMainDiv").show("slow");
	$("#enrolMainDiv").hide("slow");
	$("#logging_name").val("");
	$("#logging_password").val("");
	$("#logging_surePassword").val("");
	$("#logging_email").val("");
	$("#logging_studentId").val("");
}

function checkUser(){
	var _userName=$("#userName").val();
	var _userPassword=$("#userPassword").val();
	var _userCompetence=$("#userCompetence").val();
	$.ajax({
		   type: "POST",
		   url: "http://localhost:8080/testmybatis/user/login.do",
		   data: {"name":_userName,"password":_userPassword,"userCompetence":_userCompetence},
		   dataType:"json",
		   success: function(result){
			   if(result.status==1){
				   var userId=result.data;
				   if(_userCompetence=="学生"){
					   window.location.href="http://localhost:8080/testmybatis/user/student.html?userId"+userId;
				   }else if(_userCompetence=="管理员"){
					   window.location.href="http://localhost:8080/testmybatis/user/manager.html?userId"+userId;
					   
				   }
				   
			   }else{
				   BootstrapDialog.alert(result.msg);
			   }
		   }
	});
}

function registered(){
	var _userName=$("#logging_name").val();
	var _userPassword=$("#logging_password").val();
	var _userEmail=$("#logging_email").val();
	var _userStudentId=$("#logging_studentId").val();
	$.ajax({
		   type: "POST",
		   url: "http://localhost:8080/testmybatis/user/registered.do",
		   data: {"name":_userName,"password":_userPassword,"email":_userEmail,
			      "competenceId":1,"studentId":_userStudentId},
		   dataType:"json",
		   success: function(result){
		   		BootstrapDialog.alert(result.msg);
		   }
	});
}
</script>
</body>
</html>