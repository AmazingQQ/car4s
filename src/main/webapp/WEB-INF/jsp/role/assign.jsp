<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="/WEB-INF/myTags.tld" prefix="my"%>
<!-- 注释掉的原因是: 写了启动类SystemInitHelper.java，在项目启动时就把contextPath放入到了ctx中-->
<%-- <c:set var="ctx" value="${pageContext.request.contextPath }" /> --%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>文档列表 - 光年(Light Year Admin)后台管理系统模板</title>
<link rel="icon" href="favicon.ico" type="image/ico">
<meta name="keywords" content="LightYear,光年,后台模板,后台管理系统,光年HTML模板">
<meta name="description" content="LightYear是一个基于Bootstrap v3.3.7的后台管理系统的HTML模板。">
<meta name="author" content="yinqi">
<link href="${ctx }/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx }/css/materialdesignicons.min.css" rel="stylesheet">
<!--日期选择插件-->
<link rel="stylesheet" href="${ctx }/js/bootstrap-datepicker/bootstrap-datepicker3.min.css">
<!--对话框-->
<link rel="stylesheet" href="${ctx }/js/jconfirm/jquery-confirm.min.css">
<!-- zTree -->
<link rel="stylesheet" href="${ctx }/js/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<link href="${ctx }/css/style.min.css" rel="stylesheet">
</head>
  
<body>
<div class="container-fluid p-t-15">
  
  <div class="row">
    <div class="col-lg-12">
      <div class="card">
       <div class="card-header">
       		<h3>正在给“${role.name }”分配菜单</h3>
       </div>
      
        <div class="card-toolbar clearfix">
          <form id="f1" class="row" method="post" action="list" role="form">
            <div class="form-group col-md-12">
              <a class="btn btn-primary" href="javascript:;" onclick="checkAll();"><i class="mdi mdi-playlist-plus"></i> 全选</a>
              <a class="btn btn-danger" href="javascript:;" onclick="uncheckAll();"><i class="mdi mdi-playlist-remove"></i> 全不选</a>
              <a class="btn btn-success" href="javascript:;" onclick="doAssign();"><i class="mdi mdi-playlist-check"></i> 确认</a>
              <a class="btn btn-default" href="javascript:;" onclick="javascript:history.back(-1);return false;"><i class="mdi mdi-playlist-minus"></i> 取消</a>
            </div>
          </form>
        </div>
        <div class="card-body">
          <ul id="treeDemo" class="ztree"></ul>
        </div>
      </div> 
    </div>
    
  </div>
  
</div>

<script type="text/javascript" src="${ctx }/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx }/js/main.min.js"></script>
<!--日期选择插件-->
<script src="${ctx }/js/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<script src="${ctx }/js/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<!--消息提示-->
<script src="${ctx }/js/bootstrap-notify.min.js"></script>
<script type="text/javascript" src="${ctx }/js/lightyear.js"></script>
<!--对话框-->
<script src="${ctx }/js/jconfirm/jquery-confirm.min.js"></script>
<!-- zTree -->
<script type="text/javascript" src="${ctx }/js/zTree/js/jquery.ztree.core.js"></script>
<!-- 引入多选扩展 -->
<script type="text/javascript" src="${ctx }/js/zTree/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript">

	var setting = {
		check : {
			enable : true
		},
		async : {
			enable : true,
			url : "${ctx}/role/loadMenu?roleId=${role.id}",
			autoParam : []
		}
	};

	$(document).ready(function() {
		$.fn.zTree.init($("#treeDemo"), setting);
	});

	function doAssign() {
		var treeObj = $.fn.zTree.getZTreeObj("treeDemo");

		var nodes = treeObj.getCheckedNodes(true);
		//console.log(nodes);

		if (nodes.length == 0) {
			lightyear.notify("请至少选择一个菜单！", 'danger');
		} else {
			//拼装roleId和menuId参数
			var data = "roleId=${role.id}";
			$.each(nodes, function(i, node) {
				//console.log(node.id);
				data += "&menuIds=" + node.id;
			});
			//console.log(data);

			$.ajax({
				type : 'POST',
				url : '${ctx}/role/doAssign',
				data : data,
				beforeSend : function() {
					lightyear.loading('show');//显示一下等待图标示
				},
				success : function(result) {
					lightyear.loading('hide');
					if (result.success) {
						lightyear.notify("分配菜单成功！", 'success');
					} else {
						lightyear.notify("分配菜单失败！", 'error');
					}
				}
			})
		}
	}
	function checkAll(){
		var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
		treeObj.checkAllNodes(true);
	}
	function uncheckAll(){
		var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
		treeObj.checkAllNodes(false);
	}
</script>
</body>
</html>