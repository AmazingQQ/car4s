<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
          
          <form method="post" action="${ctx }/user/update" class="site-form" enctype="multipart/form-data" id="formImg">
          	<input type="text" name="id" value="${loginUser.id }" hidden="hidden">
            <img src="/myupload/${loginUser.pic }" alt="..." class="img-avatar" id="file_img">
            <div class="avatar-divider">
            	<br>
            	&nbsp;&nbsp;&nbsp;<div class="btn btn-pink btn-xs" onclick="getFile()">修改头像</div>
              	&nbsp;&nbsp;&nbsp;选择一张你喜欢的图片,上传图片大小不能超过2M。
           		 <input type="file" name="picFile" id="inputImage" class="hide">
            </div>
          <hr>
            <%-- <div class="form-group">
              <label for="username">用户名</label>
              <input type="text" class="form-control" name="username" id="username" value="${loginUser.username }" disabled="disabled" />
            </div>
            <div class="form-group">
              <label for="name">姓名</label>
              <input type="text" class="form-control" name="name" id="name" placeholder="输入您的姓名" value="${loginUser.name }">
            </div>
            
            <div class="form-group">
              <label for="password">密码</label>
              <input type="password" class="form-control" name="password" id="password" placeholder="输入您的密码" value="${loginUser.password}">
            </div>
            <div class="form-group">
              <label for="dirthday">出生日期</label>
              <input type="date" class="form-control" name="dirthday" id="dirthday" value="${loginUser.dirthday}">
            </div>
            <div class="form-group">
              <label for="entryDate">入职日期</label>
              <input type="date" class="form-control" name="entryDate" id="entryDate" value="${loginUser.entryDate}">
            </div>
            
            <div class="form-group">
              <label for="deptId">所属部门</label>
              <select name="deptId">
              	<option value="1"></option>
              </select>
              
              <label for="roleId">用户角色</label>
              <select name="roleId">
              	<option value="1"></option>
              </select>
            </div>
            
            <div class="form-group">
	            <label for="sex">性别</label>
	              <select name="sex">
	              	<option value="1">男</option>
	              	<option value="2">女</option>
	              </select>
	              
	            <label for="loginFlag">登录状态</label>
	              <select name="loginFlag">
	              	<option value="1">冻结</option>
	              	<option value="2">正常</option>
	              </select>
	              
	            <label for="applyFlag">申请状态</label>
	              <select name="applyFlag">
	              	<option value="1">申请中</option>
	              	<option value="2">通过</option>
	              	<option value="3">不通过</option>
	              </select>
            </div> --%>
            
            <button type="submit" class="btn btn-primary">保存</button>
          </form>
 
        </div>
      </div>
    </div>
    
  </div>
  
</div>

<script type="text/javascript" src="${ctx }/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${ctx }/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx }/js/main.min.js"></script>

  <script type="text/javascript">
	  function getFile(){
		    $("#inputImage").click();
	  }
	  
	  
	  var input  = document.getElementById("inputImage");   // 获取上传图片input（file）
	  input.onchange = function(){// 改变事件
	      var file = this.files[0];// 获取上传的第一张图片，若希望input实现多文件上传。添加属性multiple="multiple"。
	      if(!!file){// 判断是否选择文件
	          var reader = new FileReader();// 读取文件对象
	          // 图片文件转换为base64
	          reader.readAsDataURL(file);// 读取文件
	          reader.onload = function(){// 读取完毕执行
	                // 获取显示图片img。设置src属性地址为显示当前选择的图像
	                document.getElementById("file_img").src = this.result;
	          }
	      }
	  };
   </script>

</body>
</html>