<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>用户列表 - 光年</title>
<link rel="icon" href="favicon.ico" type="image/ico">
<meta name="keywords" content="LightYear,光年,后台模板,后台管理系统,光年HTML模板">
<meta name="description" content="LightYear是一个基于Bootstrap v3.3.7的后台管理系统的HTML模板。">
<meta name="author" content="yinqi">
<link href="${ctx }/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx }/css/materialdesignicons.min.css" rel="stylesheet">
<link href="${ctx }/css/style.min.css" rel="stylesheet">
</head>
  
<body>
<div class="container-fluid p-t-15">
  
  <div class="row">
    <div class="col-lg-12">
      <div class="card">
        <div class="card-toolbar clearfix">
          <form class="pull-right search-bar" method="get" action="#!" role="form">
            <div class="input-group">
              <div class="input-group-btn">
                <input type="hidden" name="search_field" id="search-field" value="title">
                <button class="btn btn-default dropdown-toggle" id="search-btn" data-toggle="dropdown" type="button" aria-haspopup="true" aria-expanded="false">
                标题 <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                  <li> <a tabindex="-1" href="javascript:void(0)" data-field="title">标题</a> </li>
                  <li> <a tabindex="-1" href="javascript:void(0)" data-field="cat_name">栏目</a> </li>
                </ul>
              </div>
              <input type="text" class="form-control" value="" name="keyword" placeholder="请输入名称">
            </div>
          </form>
          <div class="toolbar-btn-action">
            <a class="btn btn-primary m-r-5" href="#!"><i class="mdi mdi-plus"></i> 新增</a>
            <a class="btn btn-success m-r-5" href="#!"><i class="mdi mdi-check"></i> 启用</a>
            <a class="btn btn-warning m-r-5" href="#!"><i class="mdi mdi-block-helper"></i> 禁用</a>
            <a class="btn btn-danger" href="#!"><i class="mdi mdi-window-close"></i> 删除</a>
          </div>
        </div>
        <div class="card-body">
          
          <div class="table-responsive">
            <table class="table table-bordered">
              <thead>
                <tr>
                  <th>
                    <label class="lyear-checkbox checkbox-primary">
                      <input type="checkbox" id="check-all"><span></span>
                    </label>
                  </th>
                  <th>记录ID</th>
                  <th>姓名</th>
                  <th>性别</th>
                  <th>所属部门</th>
                  <th>出生日期</th>
                  <th>入职时间</th>
                  <th>用户名</th>
                  <th>登录状态</th>
                  <th>申请状态</th>
                  <th>角色</th>
                  
                  <th>创建日期</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach items="${users }" var="user">
	                <tr>
	                  <td>
	                    <label class="lyear-checkbox checkbox-primary">
	                      <input type="checkbox" name="ids[]" value="${user.id }"><span></span>
	                    </label>
	                  </td>
	                  <td>${user.id }</td>
	                  <td>${user.name }</td>
	                  <td>${user.sex }</td>
	                  <td>${user.deptId }</td>
	                  <td><fmt:formatDate value="${user.birthday }" pattern="yyyy-MM-dd"/></td>
	                  <td><fmt:formatDate value="${user.entryDate }" pattern="yyyy-MM-dd"/></td>
	                  <td>${user.username }</td>
	                  <td>${user.loginFlag}</td>
	                  <td>${user.applyFlag}</td>
	                  <td>${user.roleId}</td>
	                  <td><fmt:formatDate value="${user.createDate }" pattern="yyyy-MM-dd"/></td>
	                  <td>
	                    <div class="btn-group">
	                      <a class="btn btn-xs btn-default" href="#!" title="编辑" data-toggle="tooltip"><i class="mdi mdi-pencil"></i></a>
	                      <a class="btn btn-xs btn-default" href="#!" title="删除" data-toggle="tooltip"><i class="mdi mdi-window-close"></i></a>
	                    </div>
	                  </td>
	                </tr>
               </c:forEach>
              </tbody>
            </table>
          </div>
          <ul class="pagination">
            <li class="disabled"><span>«</span></li>
            <li class="active"><span>1</span></li>
            <li><a href="#1">2</a></li>
            <li><a href="#1">3</a></li>
            <li><a href="#1">4</a></li>
            <li><a href="#1">5</a></li>
            <li><a href="#1">6</a></li>
            <li><a href="#1">7</a></li>
            <li><a href="#1">8</a></li>
            <li class="disabled"><span>...</span></li>
            <li><a href="#!">14452</a></li>
            <li><a href="#!">14453</a></li>
            <li><a href="#!">»</a></li>
          </ul>
 
        </div>
      </div>
    </div>
    
  </div>
  
</div>

<script type="text/javascript" src="${ctx }/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx }/js/main.min.js"></script>
<script type="text/javascript">
$(function(){
    $('.search-bar .dropdown-menu a').click(function() {
        var field = $(this).data('field') || '';
        $('#search-field').val(field);
        $('#search-btn').html($(this).text() + ' <span class="caret"></span>');
    });
});
</script>
</body>
</html>