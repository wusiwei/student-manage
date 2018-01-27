<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生登录界面</title>
<link rel="stylesheet" type="text/css" href="../static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../static/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="../static/css/bootstrap-table.css">
</head>
<body>
  <div>
	<ol class="breadcrumb">
	  <li>学生就业管理系统</li>
	  <li>招聘信息</li>
	  <li class="active">招聘信息查询</li>
	</ol>
	<div>
        <div>
            <div class="col-*-12">
 
                <div id="toolbar">
                    <div class="btn btn-primary" data-toggle="modal" data-target="#addModal">添加记录</div>
                </div>
                 
                <table id="mytab" class="table table-hover"></table>
 
                <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-hidden="true">
                   <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                <h4 class="modal-title" id="myModalLabel">添加记录</h4>
                            </div>
                            <div class="modal-body">
                              <div class="form-group">
					            <label for="model_id" class="control-label">招聘要求:</label>
					            <input type="text" class="form-control"  readonly id="model_require">
					          </div>
					          <div class="form-group">
					            <label for="model_name" class="control-label">招聘岗位:</label>
					            <input type="text" class="form-control" id="model_job" readonly>
					          </div>
					          <div class="form-group">
					            <label for="model_address" class="control-label">工作地点:</label>
					            <input type="text" class="form-control" id="model_work_address" readonly>
					          </div>
					          <div class="form-group">
					            <label for="model_phoneNumber" class="control-label">公司编号:</label>
					            <input type="text" class="form-control" id="model_compant_id" readonly>
					          </div>
					          <div class="form-group">
					            <label for="model_email" class="control-label">岗位类型:</label>
					            <input type="text" class="form-control" id="model_job_type" readonly>
					          </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                <button type="button" class="btn btn-primary" id="addRecord">提交</button>
                            </div>
                        </div>
                    </div>
                </div>
 
            </div>
        </div>
    </div>
  </div>
</body>
<script type="text/javascript" src="../static/scripts/jquery.js"></script>
<script type="text/javascript" src="../static/scripts/bootstrap.min.js"></script>
<script type="text/javascript" src="../static/scripts/bootstrap-table.js"></script>
<script type="text/javascript" src="../static/scripts/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript" src="../static/scripts/jquery.blockUI.min.js"></script>
<script type="text/javascript">
	function paginationParam(params) {
	    return {
	        userName: encodeURI($.trim($("#username").val())),
	        pageSize: params.limit,
	        offset: params.offset,
	        pageNumber: $('#listTable').bootstrapTable('getOptions').pageNumber
	    };
	}
	$(function(){
		 $('#mytab').bootstrapTable({
             url: "http://localhost:8080/testmybatis/student/getJobOffers.json",//数据源
             dataField: "rows",//服务端返回数据键值 就是说记录放的键值是rows，分页时使用总记录数的键值为total
             height: tableHeight(),//高度调整
             search: true,//是否搜索
             pagination: true,//是否分页
             pageSize: 10,//单页记录数
             pageList: [5, 10, 20, 50],//分页步进值
             sidePagination: "server",//服务端分页
             contentType: "application/x-www-form-urlencoded",//请求数据内容格式 默认是 application/json 自己根据格式自行服务端处理
             dataType: "json",//期待返回数据类型
             method: "post",//请求方式
             searchAlign: "left",//查询框对齐方式
             queryParamsType: "limit",//查询参数组织方式
             queryParams: function getParams(params) {
                 //params obj
                 params.other = "otherInfo";
                 return params;
             },
             searchOnEnterKey: false,//回车搜索
             showRefresh: true,//刷新按钮
             showColumns: true,//列选择按钮
             buttonsAlign: "left",//按钮对齐方式
             toolbar: "#toolbar",//指定工具栏
             toolbarAlign: "right",//工具栏对齐方式
             columns: [
                 {
                     title: "全选",
                     field: "select",
                     checkbox: true,
                     width: 20,//宽度
                     align: "center",//水平
                     valign: "middle"//垂直
                 },
                 {
                     title: "公司编号",//标题
                     field: "id",//键名
                     sortable: true,//是否可排序
                     order: "desc"//默认排序方式
                 },
                 {
                     field: "name",
                     title: "公司名称",
                 },
                 {
                     field: "introduce",
                     title: "公司介绍",
                 },
                 {
                     field: "compantName",
                     title: "公司邮箱",
                     formatter: 'infoFormatter',//对本列数据做格式化
                 }
             ],
             onClickRow: function(row, $element) {
                 //$element是当前tr的jquery对象
                 $element.css("background-color", "green");
             },//单击row事件
             locale: "zh-CN",//中文支持,
             detailView: false, //是否显示详情折叠
             detailFormatter: function(index, row, element) {
                 var html = '';
                 $.each(row, function(key, val){
                     html += "<p>" + key + ":" + val +  "</p>"
                 });
                 return html;
             }
         });
		 function infoFormatter(value, row, index)
	      {
	            return "id:" + row.id + " name:" + row.name + " age:" + row.age;
	      };
	      function tableHeight() {
	            return $(window).height() - 50;
	       };
         $("#addRecord").click(function(){
             alert("name:" + $("#name").val() + " age:" +$("#age").val());
         });
     });
</script>
</html>