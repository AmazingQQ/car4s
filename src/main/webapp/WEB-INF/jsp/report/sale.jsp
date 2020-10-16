<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="my" uri="/WEB-INF/myTags.tld" %>
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
      	<canvas class="demoChart"></canvas>
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
<script type="text/javascript" src="${ctx }/js/Chart.js"></script>

<script type="text/javascript">
$(document).ready(function(e) { 
	
	$.ajax({
		type : 'POST',
		url : '${ctx}/report/loadSaleData',
		beforeSend : function() {
			lightyear.loading('show');//显示一下等待图标示
		},
		success : function(result) {
			lightyear.loading('hide');
			if (result.success) {
				generatorChart(result);
			} else {
				lightyear.notify("加载数据报表失败！", 'error');
			}
		}
	});
	
});	
	
	
function generatorChart(result) {
	//报表的数据以及显示的格式
    var mydata = {
		
   		labels: result.labels,
   		datasets: [
   			{
   				label: '注册用户',
                   borderWidth: 1,
                   borderColor: 'rgba(0,0,0,0)',
   				backgroundColor: 'rgba(51,202,185,0.5)',
                   hoverBackgroundColor: "rgba(51,202,185,0.7)",
                   hoverBorderColor: "rgba(0,0,0,0)",
   				data: result.data
   			}
   		]
   	};
    var canChart = $(".demoChart")[0].getContext( '2d' );
   
    new Chart(canChart, {
        type: 'bar',
        data: mydata
    });
}	
	
	
    
    

</script>
</body>
</html>