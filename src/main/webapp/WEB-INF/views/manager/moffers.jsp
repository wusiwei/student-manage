<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生登录界面</title>
<link rel="stylesheet" type="text/css" href="../static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../static/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="../static/css/bootstrap-table.css">
<link rel="stylesheet" type="text/css" href="../static/css/bootstrap-dialog.min.css">
</head>
<body>
  <div class="container-fluid">
	<ol class="breadcrumb">
	  <li>学生就业管理系统</li>
	  <li>招聘信息</li>
	  <li class="active">招聘信息查询</li>
	</ol>
	<div >
 				<div class="panel panel-default">
				   <div class="panel-heading">查询条件</div>
				   <div class="panel-body">
				    <form id="formSearch" class="form-horizontal">
				     <div class="form-group" style="margin-top:15px">
				      <label class="control-label col-sm-2" for="txt_search_job">招聘岗位</label>
				      <div class="col-sm-3">
				       <input type="text" class="form-control" id="txt_search_job">
				      </div>
				      <label class="control-label col-sm-2" for="txt_search_jobType">岗位类型</label>
				      <div class="col-sm-3">
				       <input type="text" class="form-control" id="txt_search_jobType">
				      </div>
				     </div>
				     <div class="form-group" style="margin-top:15px">
				      <label class="control-label col-sm-2" for="txt_search_companyName">公司名称</label>
				      <div class="col-sm-3">
				       <input type="text" class="form-control" id="txt_search_companyName">
				      </div>
				      <label class="control-label col-sm-2" for="txt_search_workAddress">工作地点</label>
				      <div class="col-sm-3">
				       <input type="text" class="form-control" id="txt_search_workAddress">
				      </div>
				     </div>
				     <div class="form-group" style="text-align:right;">
				       <button type="button"  id="btn_query" class="btn btn-primary">查询</button>
				       <button type="button"  id="btn_remove" class="btn btn-primary">清空</button>
				      </div>
				    </form>
				   </div>
				</div>  
                <div id="toolbar">
                  <button type="button" class="btn  search-btn btn-default " id="remove_joboffers"><i class="glyphicon glyphicon-trash"></i>删除招聘信息</button>
                  <button type="button" class="btn  search-btn btn-default " id="add_joboffers"><i class="glyphicon glyphicon-plus"></i>添加招聘信息</button>
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
					            <input type="text" class="form-control"   id="model_require">
					          </div>
					          <div class="form-group">
					            <label for="model_name" class="control-label">招聘岗位:</label>
					            <input type="text" class="form-control" id="model_job" >
					          </div>
					          <div class="form-group">
					            <label for="model_address" class="control-label">工作地点:</label>
					            <input type="text" class="form-control" id="model_work_address" >
					          </div>
					          <div class="form-group">
					            <label for="model_phoneNumber" class="control-label">公司编号:</label>
					            <input type="text" class="form-control" id="model_compant_id">
					          </div>
					          <div class="form-group">
					            <label for="model_email" class="control-label">岗位类型:</label>
					            <input type="text" class="form-control" id="model_job_type">
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
</body>
<script type="text/javascript" src="../static/scripts/jquery.js"></script>
<script type="text/javascript" src="../static/scripts/bootstrap.min.js"></script>
<script type="text/javascript" src="../static/scripts/bootstrap-table.js"></script>
<script type="text/javascript" src="../static/scripts/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript" src="../static/scripts/jquery.blockUI.min.js"></script>
<script type="text/javascript" src="../static/scripts/bootstrap-dialog.js"></script>
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
             pageList: [5, 10, 15, 20],//分页步进值
             sidePagination: "server",//服务端分页
             dataType: "json",//期待返回数据类型
             method: "post",//请求方式
             contentType:'application/x-www-form-urlencoded',
             searchAlign: "right",//查询框对齐方式
             queryParamsType:"limit",
             queryParams: function getParams(params) {
                 //params obj
                 params["page.startPage"]= params.offset;
                 params["page.pageSize"] = params.limit;
                 params["job"]=$.trim($("#txt_search_job").val());
                 params["jobType"]=$.trim($("#txt_search_jobType").val());
                 params["compantName"]=$.trim($("#txt_search_companyName").val());
                 params["workAddress"]=$.trim($("#txt_search_workAddress").val());
 				 delete params.offset;
 				 delete params.limit;
 				 return params;
             },
             searchOnEnterKey: false,//回车搜索
             showRefresh: true,//刷新按钮
             showColumns: true,//列选择按钮
             clickToSelect: true, 
             showToggle:true, 
             buttonsAlign: "right",//按钮对齐方式
             toolbar: "#toolbar",//指定工具栏
             toolbarAlign: "left",//工具栏对齐方式
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
                     field: "id",
                     title: "id",
                     visible:false,
                     cardVisible:false,
                     switchable:false,
                 },
                 {
                     field: "job",
                     title: "招聘岗位",
                 },
                 {
                     field: "jobType",
                     title: "岗位类型",
                 },
                 {
                     field: "require",
                     title: "招聘要求",
                 },
                 {
                     field: "compantName",
                     title: "公司名称",
                 },
                 {
                     field: "workAddress",
                     title: "工作地点",
                 }
             ],
             locale: "zh-CN",//中文支持,
             detailView: false, //是否显示详情折叠
             detailFormatter: function(index, row, element) {
                 var html = '';
                 $.each(row, function(key, val){
                     html += "<p>" + key + ":" + val +  "</p>"
                 });
                 return html;
             },
             silent: true,  //刷新事件必须设置
             formatLoadingMessage: function () {
         	    return "请稍等，正在加载中...";
         	 },
	         formatNoMatches: function () {  //没有匹配的结果
	         	return '无符合条件的记录';
	         },
         });
		 function infoFormatter(value, row, index)
	      {
	            return "id:" + row.id + " name:" + row.name + " age:" + row.age;
	      };
	      function tableHeight() {
	            return $(window).height() - 50;
	      };
         
         $("#btn_query").click(function(){
        	 $('#mytab').bootstrapTable('refresh');
         });
         
         $("#btn_remove").click(function(){
        	 $("#txt_search_job").val("");
             $("#txt_search_jobType").val("");
             $("#txt_search_companyName").val("");
             $("#txt_search_workAddress").val("");
         });
         
         $("#add_joboffers").click(function(){
        	 $("#addModal").modal('show');
         });
         
         
         $("#addRecord").click(function(){
        	 var require=$.trim($("#model_require").val());
        	 var job=$.trim($("#model_job").val());
        	 var jobType=$.trim($("#model_job_type").val());
        	 var compantId=$.trim($("#model_compant_id").val());
        	 var workAddress=$.trim($("#model_work_address").val());
        	 $.ajax({
        		   type: "POST",
        		   url: "http://localhost:8080/testmybatis/manager/saveJobOffers.do",
        		   data: {"require":require,"job":job,"jobType":jobType,"compantId":compantId,"workAddress":workAddress},
        		   dataType:"json",
        		   success: function(result){
        			   BootstrapDialog.alert(result.msg);
        		   }
        	 });
          });
         
         $("#remove_joboffers").click(function(){
        	 var selectList=$('#mytab').bootstrapTable('getSelections');
        	 if(selectList.length<1){
        		 BootstrapDialog.alert("请选择要删除的信息");
        		 return;
        	 }
        	 var _id=selectList[0].id;
        	 $.ajax({
      		   type: "POST",
      		   url: "http://localhost:8080/testmybatis/manager/removeJobOffers.do",
      		   data: {"_id":_id},
      		   dataType:"json",
      		   success: function(result){
      			   BootstrapDialog.alert(result.msg);
      		   }
      		});
         });
     });
</script>
</html>