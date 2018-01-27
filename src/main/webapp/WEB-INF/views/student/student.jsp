<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生登录界面</title>
<link rel="stylesheet" type="text/css" href="../static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../static/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="../static/css/student.css">
</head>
<body>
	<nav class="navbar navbar-default navbar-inverse navbar-static-top">
	  <div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="javascript:void(0)">学生就业管理系统</a>
	    </div>
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	        <li class="active"><a href="javascript:void(0)" id="studentMain" onclick="changeMyIframeSrc('http://localhost:8080/testmybatis/student/main.html')"> 首页</a></li>
			  <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">招聘信息<span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li><a href="javascript:void(0)" onclick="changeMyIframeSrc('http://localhost:8080/testmybatis/student/getJobOffers.html')">招聘信息查询</a></li>
		            <li><a href="javascript:void(0)" onclick="changeMyIframeSrc('http://localhost:8080/testmybatis/student/getCompany.html')">单位信息查询</a></li>
		          </ul>
		      </li>
			  <li><a href="javascript:void(0)" onclick="changeMyIframeSrc('http://localhost:8080/testmybatis/student/getSendJob.html')">已投岗位</a></li>
			  <li><a href="javascript:void(0)" onclick="changeMyIframeSrc('http://localhost:8080/testmybatis/student/getPersonApplication.html?id=1021')">个人信息</a></li>
			  <li><a href="javascript:void(0)" onclick="changeMyIframeSrc('http://localhost:8080/testmybatis/student/getModifypwd.html')">密码修改</a></li>
			  <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">我的论坛<span class="caret"></span></a>
		          <ul class="dropdown-menu">
		          	<li><a href="javascript:void(0)" onclick="">论坛查看</a></li>
		            <li><a href="javascript:void(0)" onclick="">我的帖子</a></li>
		            <li><a href="javascript:void(0)" onclick="">我的收藏</a></li>
		          </ul>
		      </li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li><p class="navbar-text">user，学生</p><p id="showtime" class="navbar-text"></p></li>
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
			  <li><a href="javascript:void(0)">招聘信息</a></li>
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
	initTime();
	$("#studentMain").click();
	
	$('ul.nav > li').click(function (e) {
		e.preventDefault();
		$('ul.nav > li').removeClass('active');
		$(this).addClass('active');

	});
	
});

function initTime(){
    var show_day=new Array('星期日','星期一','星期二','星期三','星期四','星期五','星期六'); 
    var time=new Date(); 
    var year=time.getFullYear(); 
    var month=time.getMonth(); 
    var date=time.getDate(); 
    var day=time.getDay();  
    month=month+1; 
    var now_time= year+'年'+month+'月'+date+'日'+' '+show_day[day]; 
    document.getElementById('showtime').innerHTML=now_time; 
}

function  changeMyIframeSrc(url){
	$.blockUI({css: {border : '1px solid red', width:'80px',height:'60px',background: '#fff  no-repeat 100% 100% '} });
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