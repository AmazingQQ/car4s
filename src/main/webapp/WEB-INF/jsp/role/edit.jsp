<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/myTags.tld" prefix="my"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>新增文档 - 光年(Light Year Admin)后台管理系统模板</title>
<link rel="icon" href="favicon.ico" type="image/ico">
<meta name="keywords" content="LightYear,光年,后台模板,后台管理系统,光年HTML模板">
<meta name="description"
	content="LightYear是一个基于Bootstrap v3.3.7的后台管理系统的HTML模板。">
<meta name="author" content="yinqi">
<link href="${ctx }/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx }/css/materialdesignicons.min.css" rel="stylesheet">
<!--标签插件-->
<link rel="stylesheet"
	href="${ctx }/js/jquery-tags-input/jquery.tagsinput.min.css">
	<link href="${ctx }/css/style.min.css" rel="stylesheet">
</head>

<body>
	<div class="container-fluid p-t-15">

		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">

						<form action="edit" method="post" class="row">
				          	<input type="hidden" name="id" value="${role.id }">
				          	<div class="form-group col-md-4">
				              <label for="name">更改职位名称</label>
				              <input type="text" class="form-control" id="name" name="name" value="${role.name }" placeholder="新职位姓名" />
				            </div>
				            
				            <div class="form-group col-md-12">
				              <button type="submit" class="btn btn-primary ajax-post">确 定</button>
				              <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);return false;">返 回</button>
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
	<script
		src="${ctx }/js/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
	<script
		src="${ctx }/js/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
</body>
</html>