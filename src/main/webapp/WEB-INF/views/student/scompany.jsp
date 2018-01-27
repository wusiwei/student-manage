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
	  <li class="active">单位信息查询</li>
	</ol>
	<div>
        <div>
            <div class="col-*-12">
 				<div class="panel panel-default">
				   <div class="panel-heading">查询条件</div>
				   <div class="panel-body">
				    <form id="formSearch" class="form-horizontal">
				     <div class="form-group" style="margin-top:15px">
				      <label class="control-label col-sm-2" for="txt_search_name">公司名称</label>
				      <div class="col-sm-3">
				       <input type="text" class="form-control" id="txt_search_name">
				      </div>
				      <label class="control-label col-sm-2" for="txt_search_address">公司地址</label>
				      <div class="col-sm-3">
				       <input type="text" class="form-control" id="txt_search_address">
				      </div>
				     </div>
				     <div class="form-group" style="margin-top:15px">
				      
				      <label class="control-label col-sm-2" for="txt_search_companyType">公司类型</label>
				      <div class="col-sm-3">
				       <input type="text" class="form-control" id="txt_search_companyType">
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
                  	<button type="button" class="btn  search-btn btn-default" id="see"><i class="glyphicon glyphicon-eye-open"></i>查看</button>
                </div>
                <table id="mytab" class="table table-hover"></table>
                <div class="modal fade" id="seeModal" tabindex="-1" role="dialog" aria-hidden="true">
                   <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                <h4 class="modal-title" id="myModalLabel">查看单位信息</h4>
                            </div>
                            <div class="modal-body">
                              <div class="form-group">
					            <label for="model_id" class="control-label">公司编号:</label>
					            <input type="text" class="form-control"  readonly id="model_id">
					          </div>
					          <div class="form-group">
					            <label for="model_name" class="control-label">公司名称:</label>
					            <input type="text" class="form-control" id="model_name" readonly>
					          </div>
					          <div class="form-group">
					            <label for="model_address" class="control-label">公司地址:</label>
					            <input type="text" class="form-control" id="model_address" readonly>
					          </div>
					          <div class="form-group">
					            <label for="model_phoneNumber" class="control-label">公司电话:</label>
					            <input type="text" class="form-control" id="model_phoneNumber" readonly>
					          </div>
					          <div class="form-group">
					            <label for="model_email" class="control-label">公司邮箱:</label>
					            <input type="text" class="form-control" id="model_email" readonly>
					          </div>
					          <div class="form-group">
					            <label for="model_introduce" class="control-label">公司介绍:</label>
					            <textarea class="form-control" id="model_introduce" readonly></textarea>
					          </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
             url: "http://localhost:8080/testmybatis/student/getCompany.json",//数据源
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
                 params["name"]=$.trim($("#txt_search_name").val());
                 params["address"]=$.trim($("#txt_search_address").val());
                 params["companyType"]=$.trim($("#txt_search_companyType").val());
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
                     title: "选择",
                     field: "select",
                     radio: true,
                     width: 20,//宽度
                     align: "center",//水平
                     valign: "middle"//垂直
                 },
                 {
                     field: "id",
                     title: "公司编号",
                 },
                 {
                     field: "name",
                     title: "公司名称",
                 },
                 {
                     field: "companyType",
                     title: "公司类型",
                 },
                 {
                     field: "address",
                     title: "公司地址",
                 },
                 {
                     field: "introduce",
                     title: "公司介绍",
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
             $("#txt_search_name").val("");
             $("#txt_search_address").val("");
             $("#txt_search_companyType").val("");
         });
         
         $("#see").click(function(){
        	 var selectData=$('#mytab').bootstrapTable('getSelections');
        	//model_introduce
        	 $("#model_id").val(selectData[0].id);
        	 $("#model_name").val(selectData[0].name);
        	 $("#model_address").val(selectData[0].address);
        	 $("#model_phone").val(selectData[0].phone);
        	 $("#model_email").val(selectData[0].email);
        	 $("#model_phoneNumber").val(selectData[0].phoneNumber);
        	 $("#model_introduce").val(selectData[0].introduce);
        	 $("#seeModal").modal('show');
        	 
         });
     });
</script>
</html>