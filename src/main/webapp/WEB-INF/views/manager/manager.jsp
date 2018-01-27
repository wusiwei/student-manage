<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登录界面</title>
<link rel="stylesheet" type="text/css" href="../static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../static/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="../static/css/student.css">
</head>
<body>
	<nav class="navbar navbar-default navbar-inverse navbar-static-top">
	  <div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#">学生就业管理系统</a>
	    </div>
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	          <li class="active"><a href="javascript:void(0)" id="managerMain" onclick="changeMyIframeSrc('http://localhost:8080/testmybatis/manager/main.html')"> 首页</a></li>
	          <li><a href="javascript:void(0)" onclick="changeMyIframeSrc('http://localhost:8080/testmybatis/manager/getSendJob.html')">我的工作</a></li>
			  <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">招聘信息管理<span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li><a href="javascript:void(0)" onclick="changeMyIframeSrc('http://localhost:8080/testmybatis/manager/getJobOffers.html')">招聘信息查询</a></li>
		            <li><a href="javascript:void(0)" onclick="changeMyIframeSrc('http://localhost:8080/testmybatis/manager/getCompany.html')">单位信息查询</a></li>
		          </ul>
		      </li>
			  <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">就业信息管理<span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li><a href="javascript:void(0)" onclick="changeMyIframeSrc('http://localhost:8080/testmybatis/manager/getJobOffers.html')">就业信息查询</a></li>
		            <li><a href="javascript:void(0)" onclick="changeMyIframeSrc('http://localhost:8080/testmybatis/manager/getJobOffers.html')">就业信息统计</a></li>
		            <li><a href="javascript:void(0)" onclick="changeMyIframeSrc('http://localhost:8080/testmybatis/user/login.html')">学生信息查询</a></li>
		          </ul>
		      </li>
			  <li><a href="javascript:void(0)">账号管理</a></li>
			  <li><a href="javascript:void(0)" onclick="changeMyIframeSrc('http://localhost:8080/testmybatis/student/getModifypwd.html')">密码修改</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li><p class="navbar-text">admin，管理员</p></li>
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">下拉菜单 <span class="caret"></span></a>
	          <ul class="dropdown-menu">
	            <li><a href="#">重新登录</a></li>
	            <li><a href="#">注销</a></li>
	          </ul>
	        </li>
	      </ul>
	    </div>
	  </div>
	</nav>
	<hr>
	<div class="container-fluid">
	  <div class="row-fluid">
	    <div class="col-md-2 divForPill">
	      <ul class="nav nav-pills  nav-stacked">
			  <li class="active"><a href="javascript:void(0)"> 首页</a></li>
			  <li><a href="javascript:void(0)" onclick="changeMyIframeSrc('http://localhost:8080/testmybatis/user/login.html')">招聘信息</a></li>
			  <li><a href="javascript:void(0)">已投岗位</a></li>
			  <li><a href="javascript:void(0)">个人信息</a></li>
			  <li><a href="javascript:void(0)">密码修改</a></li>
		  </ul>   
	    </div>
	    <div class="col-md-10">
	      <div class="col-md-12" id ="iframeDiv">
			<iframe  id="myIframe" name="myIframe"  src="" class="autoHeight" scrolling="no" frameborder="0" width="100%" style="min-Height:600px;">
				
			</iframe>
		  </div>
	    </div>
	  </div>
	</div>  
</body>
<script type="text/javascript" src="../static/scripts/jquery.js"></script>
<script type="text/javascript" src="../static/scripts/bootstrap.min.js"></script>
<script type="text/javascript" src="../static/scripts/jquery.blockUI.min.js"></script>
<script type="text/javascript" src="../static/scripts/jquery.autoheight.js"></script>
<script type="text/javascript">
$(function(){
	$("#managerMain").click();
	
	$('ul.nav > li').click(function (e) {
		e.preventDefault();
		$('ul.nav > li').removeClass('active');
		$(this).addClass('active');

	});
});

function  changeMyIframeSrc(url){
	    $.blockUI({css: {border : '1px solid red', width:'80px',height:'60px',background: '#fff  no-repeat 100% 90% '} });
		var frameDom = $('#myIframe');
		try {
			frameDom.contentWindow.document.write('');
			frameDom.contentWindow.document.clear();
			frameDom.contentWindow.close();
		} catch (e) {
		};
		if(frameDom){
			frameDom.remove();
		}
		$('#iframeDiv')
				.append(
						'<iframe  id="myIframe" name="myIframe"  src="'+url+'" class="autoHeight" scrolling="no" frameborder="0" style="min-Height:600px;"></iframe>');
				
		var myIframe = document.getElementById('myIframe');
		 if (myIframe.attachEvent){
			myIframe.attachEvent("onload", function(){
				$.unblockUI(); 
		 });
		} else {
			myIframe.onload = function(){
				$.unblockUI(); 
			}
		} 
	}
</script>

</html>