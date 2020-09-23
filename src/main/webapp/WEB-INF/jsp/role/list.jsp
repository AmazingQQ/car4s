<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="/WEB-INF/myTags.tld" prefix="my"%>
<!-- 注释掉的原因是: 写了启动类SystemInitHelper.java，在项目启动时就把contextPath放入到了ctx中-->
<%-- <c:set var="ctx" value="${pageContext.request.contextPath }" /> --%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="UTF-8">
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
<link href="${ctx }/css/style.min.css" rel="stylesheet">
</head>
  
<body>
<div class="container-fluid p-t-15">
  
  <div class="row">
    <div class="col-lg-12">
      <div class="card">
        <div class="card-toolbar clearfix">
          <form id="f1" class="row" method="post" action="index" role="form">
			
            <div class="form-group col-md-12">
              <button type="button" class="btn btn-info" onclick="location.href='add'"><i class="mdi mdi-plus"></i> 新增</button>
              <button id="batchDelBtn" type="button" class="btn btn-danger"><i class="mdi mdi-window-close"></i> 删除</button>
              <button type="reset" class="btn btn-pink" id="chongzhi"><i class="mdi mdi-backup-restore"></i>重置</button>
              <button type="submit" class="btn btn-primary ajax-post"><i class="mdi mdi-search-web"></i>搜索</button>
            </div>
            <div class="form-group col-md-4">
              <label for="name">职位名称查询</label>
              <input type="text" class="form-control" id="name" name="name" value="" placeholder="请输入名称">
            </div>
          </form>
        </div>
        <div class="card-body">
          
          <div class="table-responsive">
          <form action="delete" method="post" id="tableForm">
            <table class="table table-bordered">
              <thead>
                <tr>
                  <th>
                    <label class="lyear-checkbox checkbox-primary">
                      <input type="checkbox" id="check-all"><span></span>
                    </label>
                  </th>
                  <th>编号</th>
                  <th>职位名称</th>
                  <th>创建日期</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach items="${page.list }" var="role">
	                <tr>
	                  <td>
	                    <label class="lyear-checkbox checkbox-primary">
	                      <input type="checkbox" name="ids" value="${role.id }"><span></span>
	                    </label>
	                  </td>
	                  <td>${role.id }</td>
	                  <td>${role.name }</td>
	                  <td><fmt:formatDate value="${role.createDate }" pattern="yyyy-MM-dd"/></td>
	                  <td>
	                    <div class="btn-group">
	                      <a class="btn btn-xs btn-default" href="${ctx }/role/edit?id=${role.id}" title="编辑" data-toggle="tooltip"><i class="mdi mdi-pencil"></i></a>
	                      <a class="btn btn-xs btn-default" href="${ctx }/role/assign?id=${role.id}" title="分配菜单"  data-toggle="tooltip"><i class="mdi mdi-home-assistant"></i></a>
	                      <a class="btn btn-xs btn-default" href="javascript:;" onclick="deleteRole(${role.id})" title="删除" data-toggle="tooltip"><i class="mdi mdi-window-close"></i></a>
	                    </div>
	                  </td>
	                </tr>
                </c:forEach>
              </tbody>
            </table>
            </form>
          </div>
			<%@include file="../page/page_nav.jsp" %> 
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
<script type="text/javascript">
$(function(){
	$('#batchDelBtn').click(function(){
		if($('input[name="ids"]:checked').size() <=0 ){
			lightyear.notify('请至少选择一个用户！！','warning',3000);
			return;
		}
		
		$.confirm({
	        title: '警告',
	        content: '是否要删除所选中的用户',
	        type: 'orange',
	        typeAnimated: false,
	        buttons: {
	            omg: {
	                text: '确定',
	                btnClass: 'btn-orange',
	                action: function(){
	                    $('#tableForm').submit();
	                }
	            },
	            close: {
	                text: '取消',
	            }
	        }
	    });
		
	});
	
	
	  //重置
   	$("#chongzhi").click(function () {
   		$(".form-control").each(function(){
   			$(this).removeAttr("value");
   		})
   	});
});


function deleteRole(id){
	$.confirm({
        title: '警告',
        content: '是否要删除所选中的用户',
        type: 'orange',
        typeAnimated: false,
        buttons: {
            omg: {
                text: '确定',
                btnClass: 'btn-orange',
                action: function(){
					location.href='delete?ids='+id
                }
            },
            close: {
                text: '取消',
            }
        }
    });
}
</script>
</body>
</html>