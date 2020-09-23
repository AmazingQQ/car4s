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
<link href="${ctx }/css/style.min.css" rel="stylesheet">
</head>
  
<body>
<div class="container-fluid p-t-15">
  
  <div class="row">
    <div class="col-lg-12">
      <div class="card">
        <div class="card-toolbar clearfix">
          <form id="f1" class="row" method="post" action="list" role="form">
			<div class="form-group col-md-3">
              <label for="name">供应商名称</label>
              <input type="text" class="form-control" id="name" name="name" value="${param.name }" placeholder="请输入供应商名称">
            </div>
			<div class="form-group col-md-3">
              <label for="contacts">联系人姓名</label>
              <input type="text" class="form-control" id="contacts" name="contacts" value="${param.contacts }" placeholder="请输入联系人姓名">
            </div>
			<div class="form-group col-md-3">
              <label for="contactTel">联系电话</label>
              <input class="form-control" type="text" id="contactTel" name="contactTel" placeholder="请输入联系电话" value="${param.contactTel }">
            </div>
			<div class="form-group col-md-3">
              <label for="bankName">开户银行</label>
              <input class="form-control" type="text" id="bankName" name="bankName" placeholder="请输入开户银行" value="${param.bankName }">
            </div>
            <div class="form-group col-md-12">
              <button type="submit" class="btn btn-primary ajax-post"><i class="mdi mdi-search-web"></i>搜索</button>
              <button type="reset" class="btn btn-default"><i class="mdi mdi-backup-restore"></i>重置</button>
              <button type="button" class="btn btn-primary" onclick="location.href='${ctx}/supplier/add'"><i class="mdi mdi-plus"></i> 新增</button>
              <button id="batchDelBtn" type="button" class="btn btn-danger"><i class="mdi mdi-window-close"></i> 删除</button>
            </div>
          </form>
        </div>
        <div class="card-body">
          
          <div class="table-responsive">
          <form action="del" method="post" id="tableForm">
            <table class="table table-bordered">
              <thead>
                <tr>
                  <th>
                    <label class="lyear-checkbox checkbox-primary">
                      <input type="checkbox" id="check-all"><span></span>
                    </label>
                  </th>
                  <th>编号</th>
                  <th>供应商名称</th>
                  <th>联系人姓名</th>
                  <th>联系电话</th>
                  <th>开户银行</th>
                  <th>银行账号</th>
                  <th>备注</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach items="${page.list }" var="list">
	                <tr>
	                  <td>
	                    <label class="lyear-checkbox checkbox-primary">
	                      <input type="checkbox" name="ids" value="${list.id }"><span></span>
	                    </label>
	                  </td>
	                  <td>${list.id }</td>
	                  <td>${list.name }</td>
	                  <td>${list.contacts }</td>
	                  <td>${list.contactTel }</td>
	                  <td>${list.bankName }</td>
	                  <td>${list.bankAccount }</td>
	                  <td>${list.remark }</td>
	                  <td>
	                    <div class="btn-group">
	                      <a class="btn btn-xs btn-default" href="${ctx }/supplier/edit?id=${list.id}" title="编辑" data-toggle="tooltip"><i class="mdi mdi-pencil"></i></a>
	                      <a class="btn btn-xs btn-default" href="javascript:;" onclick="deleteUser(${list.id})" title="删除" data-toggle="tooltip"><i class="mdi mdi-window-close"></i></a>
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
});


function deleteUser(id){
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
					location.href='del?ids='+id
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