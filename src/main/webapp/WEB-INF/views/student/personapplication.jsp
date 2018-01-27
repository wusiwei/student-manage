<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>密码修改</title>
<link rel="stylesheet" type="text/css" href="../static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../static/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="../static/validation-engine/validationEngine.jquery.css">
<link rel="stylesheet" type="text/css" href="../static/css/form-theme.css">
</head>
<body>
	<ol class="breadcrumb">
	  <li>学生就业管理系统</li>
	  <li>个人信息</li>
	</ol>
	<form id="form">
    <div class="container form-body-div">
        <h1 class="text-center">个人信息</h1>
        <div class="row pannel-body">
          <table class="form-table">
            <tr>
              <input type="hidden" name="id" value="${form.id}">
              <th class="col-xs-4 ">学生学号</th>
              <td class="col-xs-8">
              	<span>${form.id}</span>
              </td>
            </tr>
            <tr>
              <th class="col-xs-4 ">学生姓名</th>
              <td class="col-xs-8">
              	<input type="text"
				class="form-control validate[required]" maxlength="50"
				data-errormessage-value-missing="请填写姓名"
				name="name" value="${form.name}">
              </td>
            </tr>
            <tr>
              <th class="col-xs-4 ">性别</th>
              <td class="col-xs-8">
              	<input type="text"
				class="form-control validate[required]" 
				data-errormessage-value-missing="请填写性别"
				name="gender" value="${form.gender}">
              </td>
            </tr>
            <tr>
              <th class="col-xs-4 ">年龄</th>
              <td class="col-xs-8">
              	<input type="text" class="form-control validate[required]" 
              	data-errormessage-value-missing="请填写年龄"
              	name="age" value="${form.age}">
              </td>
            </tr>
            <tr>
              <th class="col-xs-4 ">联系电话</th>
              <td class="col-xs-8">
              	<input type="text"
				class="form-control validate[required,custom[numberLetter]]" 
				data-errormessage-value-missing="请填写联系电话"
				name="phone" value="${form.phone}">
              </td>
            </tr>
            <tr>
              <th class="col-xs-4 ">所在专业</th>
              <td class="col-xs-8">
              	<input type="text" class="form-control" name="profession" value="${form.profession}">
              </td>
            </tr>
            <tr>
              <th class="col-xs-4 ">班级号</th>
              <td class="col-xs-8">
              	<input type="text"
				class="form-control validate[required]" 
				data-errormessage-value-missing="请填写班级号"
				name="class_id" value="${form.class_id}">
              </td>
            </tr>
            <tr>
              <th class="col-xs-4 ">生日</th>
              <td class="col-xs-8">
              	<input type="text" class="form-control"
				id="birthday"   name="birthday" value="${form.birthday}" />
              </td>
            </tr>
            <tr>
              <th class="col-xs-4 ">你的兴趣</th>
              <td class="col-xs-8">
              	<input type="text"
				class="form-control" name="hobbies" value="${form.hobbies}">
              </td>
            </tr>
            <tr>
              <th class="col-xs-4 ">家庭住址</th>
              <td class="col-xs-8">
              	<input type="text" class="form-control" name="home_address" value="${form.home_address}">
              </td>
            </tr>
          </table>
        </div>
        <div class="text-center">
        	<button type="button" class="btn  search-btn btn-default" id="save"><i class="fa fa-search"></i>&nbsp;保存&nbsp;</button>
        </div>
      </div>
    </form>
</body>
<script type="text/javascript" src="../static/scripts/jquery.js"></script>
<script type="text/javascript" src="../static/scripts/bootstrap.min.js"></script>
<script type="text/javascript" src="../static/validation-engine/jquery.validationEngine-zh_CN.js"></script>
<script type="text/javascript" src="../static/validation-engine/jquery.validationEngine.js"></script>
<script type="text/javascript" src="../static/scripts/WdatePicker.js"></script>
<script type="text/javascript">


 
	$(function(){
		/*
		 *验证初始化
		 */
		 $('#form').validationEngine('attach',{
		       maxErrorsPerField: 1,
		       scroll: false, 
		       validationEventTrigger:"keyup blur change focus",
		       ValidateNoneVisibleFields: true,//验证隐藏域
		       promptPosition: "topRight" //验证弹出框的位置，topRight,topLeft,bottomRight,bottomLeft,centerRight,centerLeft,inline
		 });
		
		$("#save").click(function(){
			if ($('#form').validationEngine('validate')) {
				$.post("http://localhost:8080/testmybatis/student/updateApplication.do", $("#form").serialize(), $.noop(), 'json');
			}
			else {
				return $.Deferred().reject('validatefail');
			}
		});
	});
</script>

</html>