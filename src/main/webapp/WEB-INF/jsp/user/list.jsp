<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/myTags.tld" prefix="my"%>
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
          <form class="row" method="get" action="index" role="form" id="f1">
           <div><h4>快速查询</h4></div>
             <div class="form-group col-md-4">
              <label for="name">姓名</label>
              <input type="text" class="form-control" id="name" name="name" placeholder="请输入姓名" value="${param.name }">
             </div>
             
             <div class="form-group col-md-4">
              <label for="entryDateStart">入职日期始</label>
              <input class="form-control js-datepicker m-b-10" type="text" id="entryDateStart" value="${param.entryDateStart }"
              name="entryDateStart" data-date-format="yyyy-mm-dd" placeholder="入职日期始" autocomplete="off">
             </div>
             
             <div class="form-group col-md-4">
              <label for="entryDateEnd">入职日期止</label>
              <input class="form-control js-datepicker m-b-10" type="text" id="entryDateEnd" value="${param.entryDateEnd }"
              name="entryDateEnd" data-date-format="yyyy-mm-dd" placeholder="入职日期止" autocomplete="off">
             </div>
             
             <div class="form-group col-md-4">
              <label for="username">用户名</label>
              <input type="text" class="form-control" id="username" value="${param.username }"
              name="username" value="" placeholder="请输入用户名">
             </div>
            
             
             <div class="form-group col-md-4">
              <label for="type">所属部门</label>
              <div class="form-controls">
              </div>
            </div>
            
              <div class="form-group col-md-4">
              <label for="loginFlag">登录状态</label>
              <div class="form-controls">
	            <my:select name="loginFlag" id="loginFlag" css="form-control" data="${dictMap['SYS_LOGIN_FLAG']}" firstOption="--请选择登录状态--"/>
              </div>
             </div>
             
             <div class="form-group col-md-12">
             	<button type="submit" class="btn btn-pink ajax-post"><i class="mdi mdi-magnify"></i>查询</button>
             	<button type="reset" class="btn btn-brown ajax-post" id="chongzhi"><i class="mdi mdi-backup-restore"></i>重置</button>
             	<button type="button" onclick="location.href='${ctx }/user/add'" class="btn btn-purple m-r-5"><i class="mdi mdi-plus"></i> 新增</button>
             	<button id="batchDelBtn" type="button" class="btn btn-danger"><i class="mdi mdi-window-close"></i> 删除</button>
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
	                      <input type="checkbox" name="ids" value="${user.id }"><span></span>
	                    </label>
	                  </td>
	                  <td>${user.id }</td>
	                  <td>${user.name }</td>
   	                  <td><my:dict data="${dictMap['SYS_SEX']}" value="${user.sex}"/></td>
   	                  <td><my:select name="deptId" id="deptId" data="${deptMap }" value="${user.deptId }"/></td>
   	                  
	                  <td><fmt:formatDate value="${user.birthday }" pattern="yyyy-MM-dd"/></td>
	                  <td><fmt:formatDate value="${user.entryDate }" pattern="yyyy-MM-dd"/></td>
	                  <td>${user.username }</td>
	                  <td><my:dict data="${dictMap['SYS_LOGIN_FLAG']}" value="${user.loginFlag}"/></td>
	                  <td><my:dict data="${dictMap['APPLY_STATE']}" value="${user.applyFlag}"/></td>
	                  <td>${user.roleId}</td>
	                  <td><fmt:formatDate value="${user.createDate }" pattern="yyyy-MM-dd"/></td>
	                  <td>
	                    <div class="btn-group">
	                      <a class="btn btn-xs btn-default" href="edit?id=${user.id }" title="编辑" data-toggle="tooltip"><i class="mdi mdi-pencil"></i></a>
	                      <a class="btn btn-xs btn-default" onclick="deleteUser(${user.id})" href="javascript:;" title="删除" data-toggle="tooltip"><i class="mdi mdi-window-close"></i></a>
	                    </div>
	                  </td>
	                </tr>
               </c:forEach>
              </tbody>
            </table>
           </form>
          </div>
          <%@ include file="../page/page_nav.jsp" %>
 
        </div>
      </div>
    </div>
    
  </div>
  
</div>

<script type="text/javascript" src="${ctx }/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/js/bootstrap.min.js"></script>
<!--日期选择插件-->
<script src="${ctx }/js/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<script src="${ctx }/js/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<!--消息提示-->
<script src="${ctx }/js/bootstrap-notify.min.js"></script>
<script type="text/javascript" src="${ctx }/js/lightyear.js"></script>
<!--对话框-->
<script src="${ctx }/js/jconfirm/jquery-confirm.min.js"></script>
<script type="text/javascript" src="${ctx }/js/main.min.js"></script>
<script type="text/javascript">

/***
 * 当加载标签时,绑定有点击事件,说明了要执行的方法,系统可以不知道方法什么时间执行,但
 系统会校验方法是否存在,此时$(function(){***})函数还没有执行,那么内部编写的方法
 也就不会被系统识别,结果只能是点击事件验证方法未找到,所以页面显示方法未定义.
 当整个页面加载完毕,$(function(){***})函数才会被执行,但此时点击事件验证的步骤早已执行.
 */
 function deleteUser(id) {
		$.confirm({
	        title: '警告',
	        content: '是否删除选中的用户!!',
	        type: 'orange',
	        typeAnimated: false,
	        buttons: {
	            omg: {
	                text: '确定删除',
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

$(function(){// 在页面加载完毕后立即执行
	
	//批量删除
	$('#batchDelBtn').click(function() {
		if($('input[name="ids"]:checked').size() <=0){
			lightyear.notify('请至少选择一个','warning',3000);
			return;
		}
		
		$.confirm({
	        title: '警告',
	        content: '是否删除选中的用户!!',
	        type: 'orange',
	        typeAnimated: false,
	        buttons: {
	            omg: {
	                text: '确定删除',
	                btnClass: 'btn-orange',
	                action:function(){
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
</script>
</body>
</html>