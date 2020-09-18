<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>个人信息 - 光年</title>
<link rel="icon" href="${ctx }/images/favicon.ico" type="image/ico">
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
        <div class="card-body">
          
          <div class="edit-avatar">
            <img src="${ctx }/images/users/avatar.jpg" alt="..." class="img-avatar">
            <div class="avatar-divider"></div>
            <div class="edit-avatar-content">
              <button class="btn btn-default">修改头像</button>
              <p class="m-0">选择一张你喜欢的图片,上传图片大小不能超过2M。</p>
            </div>
          </div>
          <hr>
          <form method="post" action="#!" class="site-form">
            <div class="form-group">
              <label for="username">用户名</label>
              <input type="text" class="form-control" name="username" id="username" value="lightyear" disabled="disabled" />
            </div>
            <div class="form-group">
              <label for="nickname">昵称</label>
              <input type="text" class="form-control" name="nickname" id="nickname" placeholder="输入您的昵称" value="笔下光年">
            </div>
            <div class="form-group">
              <label for="email">邮箱</label>
              <input type="email" class="form-control" name="email" id="email" aria-describedby="emailHelp" placeholder="请输入正确的邮箱地址" value="3331653644@qq.com">
              <small id="emailHelp" class="form-text text-muted">请保证您填写的邮箱地址是正确的。</small>
            </div>
            <div class="form-group">
              <label for="remark">简介</label>
              <textarea class="form-control" name="remark" id="remark" rows="3"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">保存</button>
          </form>
 
        </div>
      </div>
    </div>
    
  </div>
  
</div>

<script type="text/javascript" src="${ctx }/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx }/js/main.min.js"></script>
</body>
</html>