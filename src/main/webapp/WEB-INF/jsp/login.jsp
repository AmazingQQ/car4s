<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>登录页面 - 光年</title>
<link rel="icon" href="images/favicon.ico" type="image/ico">
<meta name="keywords" content="LightYear,光年,后台模板,后台管理系统,光年HTML模板">
<meta name="description" content="LightYear是一个基于Bootstrap v3.3.7的后台管理系统的HTML模板。">
<meta name="author" content="yinqi">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/materialdesignicons.min.css" rel="stylesheet">
<link href="css/style.min.css" rel="stylesheet">
<style>
.lyear-wrapper {
    position: relative;
}
.lyear-login {
    display: flex !important;
    min-height: 100vh;
    align-items: center !important;
    justify-content: center !important;
}
.login-center {
    background: #fff;
    min-width: 38.25rem;
    padding: 2.14286em 3.57143em;
    border-radius: 5px;
    margin: 2.85714em 0;
}
.login-header {
    margin-bottom: 1.5rem !important;
}
.login-center .has-feedback.feedback-left .form-control {
    padding-left: 38px;
    padding-right: 12px;
}
.login-center .has-feedback.feedback-left .form-control-feedback {
    left: 0;
    right: auto;
    width: 38px;
    height: 38px;
    line-height: 38px;
    z-index: 4;
    color: #dcdcdc;
}
.login-center .has-feedback.feedback-left.row .form-control-feedback {
    left: 15px;
}
</style>
</head>
  
<body>
<div class="row lyear-wrapper">
  <div class="lyear-login">
    <div class="login-center">
      <div class="login-header text-center">
        <a href="index"> <img alt="light year admin" src="images/logo-sidebar.png"> </a>
      </div>
      <sf:form action="${ctx }/doLogin" method="post" id="loginForm" modelAttribute="userLoginForm">
        <div class="form-group has-feedback feedback-left">
          <span class="mdi mdi-account form-control-feedback" aria-hidden="true"></span>
          <input type="text" placeholder="请输入您的用户名" class="form-control" name="username" id="username" />
         <span><sf:errors path="username"></sf:errors></span>
         <c:if test="${msg2 !=null and msg2 !=''}">
        	<div class="alert alert-success" role="alert">${msg2 }</div>
        </c:if>
        </div>
        <div class="form-group has-feedback feedback-left">
          <span class="mdi mdi-lock form-control-feedback" aria-hidden="true"></span>
          <input type="password" placeholder="请输入密码" class="form-control" id="password" name="password" />
      	 <span><sf:errors path="password"></sf:errors></span>
        </div>
        
        <c:if test="${msg !=null and msg !=''}">
        	<div class="alert alert-success" role="alert">${msg }</div>
        </c:if>
        <div class="form-group has-feedback feedback-left row">
          <div class="col-xs-7">
            <input type="text" name="captcha" class="form-control" placeholder="验证码">
            <span class="mdi mdi-check-all form-control-feedback" aria-hidden="true"></span>
          </div>
          <div class="col-xs-5">
            <img src="images/captcha.png" class="pull-right" id="captcha" style="cursor: pointer;" onclick="this.src=this.src+'?d='+Math.random();" title="点击刷新" alt="captcha">
          </div>
        </div>
        <div class="form-group">
          <button class="btn btn-block btn-primary" type="submit" >立即登录</button>
          <button class="btn btn-block btn-purple" type="button" onclick="location.href='register'">立即注册</button>
        </div>
        
      </sf:form>
      <hr>
      <footer class="col-sm-12 text-center">
        <p class="m-b-0">Copyright © 2019 <a href="http://lyear.itshubao.com">IT书包</a>. All right reserved</p>
      </footer>
    </div>
  </div>
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<!--消息提示-->
<script src="js/bootstrap-notify.min.js"></script>
<script type="text/javascript" src="js/lightyear.js"></script>
<script type="text/javascript" src="js/main.min.js"></script>
<script type="text/javascript" src="js/jquery-validate/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/jquery-validate/messages_zh.min.js"></script>
<script type="text/javascript">

/* $("#loginForm").validate({
    rules: {
        username: {
        	required: true,
        	minlength: 6,
        	maxlength: 16
        },
        password: "required"
    }
}); */

if(window !== top){
	window.top.location = window.location 
}
 
</script>
</body>
</html>