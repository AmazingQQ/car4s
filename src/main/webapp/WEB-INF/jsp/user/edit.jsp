<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>新增文档 - 光年(Light Year Admin)后台管理系统模板</title>
<link rel="icon" href="favicon.ico" type="image/ico">
<meta name="keywords" content="LightYear,光年,后台模板,后台管理系统,光年HTML模板">
<meta name="description" content="LightYear是一个基于Bootstrap v3.3.7的后台管理系统的HTML模板。">
<meta name="author" content="yinqi">
<link href="${ctx }/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx }/css/materialdesignicons.min.css" rel="stylesheet">
<!--标签插件-->
<link rel="stylesheet" href="${ctx }/js/jquery-tags-input/jquery.tagsinput.min.css">
<link href="${ctx }/css/style.min.css" rel="stylesheet">
<!--日期选择插件-->
<link rel="stylesheet" href="${ctx }/js/bootstrap-datepicker/bootstrap-datepicker3.min.css">
</head>
  
<body>
<div class="container-fluid p-t-15">
  
  <div class="row">
    <div class="col-lg-12">
      <div class="card">
        <div class="card-body">
          <form action="edit" method="post" class="row" id="editForm">
            <input type="text" name="id" value="${user.id}" hidden="hidden">
            <div class="form-group col-md-4">
              <label for="name">用户姓名</label>
              <input type="text" class="form-control" id="name" name="name" value="${user.name }"/>
            </div>
            
            <div class="form-group col-md-4">
              <label for="roleId">用户角色</label>
              <div class="form-controls">
                <select name="roleId" class="form-control" id="roleId">
                  <option value="">--请分配角色--</option>
                  <c:forEach items="${roles }" var="role">
                  	<c:choose>
                  		<c:when test="${role.id == user.roleId }">
                  			<option value="${role.id }" selected="selected">${role.name }</option>
                  		</c:when>
                  		<c:otherwise>
		                  	<option value="${role.id }">${role.name }</option>
                  		</c:otherwise>
                  	</c:choose>
                  </c:forEach>
                </select>
              </div>
            </div>
           
             <div class="form-group col-md-4">
              <label for="birthday">出生日期</label>
              <input class="form-control js-datepicker m-b-10" type="text" id="birthday"
              name="birthday" data-date-format="yyyy-mm-dd"  value='<fmt:formatDate value="${user.entryDate }" pattern="yyyy-MM-dd"/>' autocomplete="off">
             </div>
            
            <div class="form-group col-md-4">
	           <label for="username">用户账号</label>
	           <input type="text" class="form-control" id="username" name="username" value="${user.username }" disabled="disabled"/>
           	 </div>
           	 
            <div class="form-group col-md-4">
              <label for="deptId">所属部门</label>
              <div class="form-controls">
                <select name="deptId" class="form-control" id="deptId">
                  <c:forEach items="${depts }" var="dept">
                  	<c:choose>
                  		<c:when test="${dept.id == user.deptId}">
		                  	<option value="${dept.id }" selected="selected">${dept.name }</option>
                  		</c:when>
                  		<c:otherwise>
                  			<option value="${dept.id }">${dept.name }</option>
                  		</c:otherwise>
                  	</c:choose>
                  </c:forEach>
                </select>
              </div>
            </div>
            
            <div class="form-group col-md-4">
              <label for="entryDate">入职日期</label>
              <input class="form-control js-datepicker m-b-10" type="text" id="entryDate"
              name="entryDate" data-date-format="yyyy-mm-dd" value='<fmt:formatDate value="${user.entryDate }" pattern="yyyy-MM-dd"/>' autocomplete="off">
             </div>
              
            <div class="form-group col-md-4">
              <label for="sex">性别</label>
              <div class="form-controls">
                <select name="sex" class="form-control input-sm" id="sex">
                  <option value="1">男</option>
                  <option value="2">女</option>
                </select>
              </div>
            </div>
            
            <div class="form-group col-md-4">
              <label for="loginFlag">登录状态</label>
              <div class="form-controls">
                <select name="loginFlag" class="form-control input-sm" id="loginFlag">
                  <option value="1">正常</option>
                  <option value="2">冻结</option>
                </select>
              </div>
            </div>
            
            <div class="form-group col-md-4">
              <label for="applyFlag">申请状态</label>
              <div class="form-controls">
                <select name="applyFlag" class="form-control input-sm" id="applyFlag">
                  <option value="1">申请中</option>
                  <option value="2">通过</option>
                </select>
              </div>
            </div>

            <div class="form-group col-md-12">
              <button type="submit" class="btn btn-primary ajax-post">确 定</button>
              <button type="button" class="btn btn-default" onclick="location.href='index'">返 回</button>
            </div>
          </form>
        </div>
      </div>
    </div>
    
  </div>
  
</div>

<script type="text/javascript" src="${ctx }/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/js/bootstrap.min.js"></script>
<!--标签插件-->
<script src="${ctx }/js/jquery-tags-input/jquery.tagsinput.min.js"></script>
<script type="text/javascript" src="${ctx }/js/main.min.js"></script>
<!--日期选择插件-->
<script src="${ctx }/js/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<script src="${ctx }/js/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script type="text/javascript" src="${ctx }/js/main.min.js"></script>

<script type="text/javascript" src="${ctx }/js/jquery-validate/jquery.validate.min.js"></script>
<script type="text/javascript" src="${ctx }/js/jquery-validate/messages_zh.min.js"></script>
<script type="text/javascript">
$("#editForm").validate({
    rules: {
        username: {
        	required: true,
        	minlength: 6,
        	maxlength: 16,
        },
        name:{
        	required: true,
        	minlength: 3,
        	maxlength: 6
        }, 
        deptId:"required",
        loginFlag:"required",
        roleId:"required",
        entryDate:"required"
    },
   
}); 
</script>
</body>
</html>