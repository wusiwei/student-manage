<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>密码修改</title>
<link rel="stylesheet" type="text/css" href="../static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../static/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="../static/css/form-theme.css">
<link rel="stylesheet" type="text/css" href="../static/css/bootstrap-dialog.min.css">
</head>
<body>
	<ol class="breadcrumb">
	  <li>学生就业管理系统</li>
	  <li>密码修改</li>
	</ol>
	<div class="container">
		<div class="row">
          <h1 class="text-center">密码修改</h1>
        </div>
        <div class="row pannel-body">
          <table class="form-table">
            <tr>
              <th class="col-xs-4 ">原密码</th>
              <td class="col-xs-6">
              	<input  type="text" class="form-control" id="oldPassword"   value="">
              </td>
            </tr>
            <tr>
              <th class="col-xs-4 ">新密码</th>
              <td class="col-xs-6">
              	<input  type="text" class="form-control"  id="newPassword" value="">
              </td>
            </tr>
            <tr>
              <th class="col-xs-4 ">确认密码</th>
              <td class="col-xs-6">
              	<input  type="text" class="form-control"  id="surePassword" value="">
              </td>
            </tr>
         </table>
         <div class="text-right">
        	<button type="button" class="btn  search-btn btn-default" id="save"><i class="fa fa-search"></i>&nbsp;保存&nbsp;</button>
        </div>
	</div>
</body>
<script type="text/javascript" src="../static/scripts/jquery.js"></script>
<script type="text/javascript" src="../static/scripts/bootstrap.min.js"></script>
<script type="text/javascript" src="../static/scripts/bootstrap-dialog.js"></script>
<script type="text/javascript">
	$(function(){
		$("#save").click(function(){
			var password=$.trim($("#surePassword").val());
			$.ajax({
				   type: "POST",
				   url: "http://localhost:8080/testmybatis/user/modifyPassword.do",
				   data: {"id":2,"password":password},
				   success: function(result){
					   BootstrapDialog.alert(result.msg);
				   }
			});
		});
	});
</script>

</html>