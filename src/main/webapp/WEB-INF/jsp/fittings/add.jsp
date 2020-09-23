<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="/WEB-INF/myTags.tld" prefix="my"%>
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
<!--日期选择插件-->
<link rel="stylesheet" href="${ctx }/js/bootstrap-datepicker/bootstrap-datepicker3.min.css">
<link href="${ctx }/css/style.min.css" rel="stylesheet">
</head>
  
<body>
<div class="container-fluid p-t-15">
  
  <div class="row">
    <div class="col-lg-12">
      <div class="card">
        <div class="card-body">
          
          <form action="add" method="post" class="row">
          
            <div class="form-group col-md-4">
              <label for="name">配件名称（必填）</label>
              <input type="text" class="form-control" id="name" name="name" placeholder="请输入配件名称" />
            </div>
            
            <div class="form-group col-md-4">
              <label for="brand">品牌（必填）</label>
              <input type="text" class="form-control" id="brand" name="brand" placeholder="请输入品牌" />
            </div>
            
            <div class="form-group col-md-4">
              <label for="unit">单位（必填）</label>
              <div class="form-controls">
                <my:select name="unit" id="unit" css="form-control" data="${dictMap['CAR_UNIT'] }" firstOption="--请选择单位--"/>
              </div>
            </div>
          
          	<div class="form-group col-md-4">
              <label for="price">单价（必填）</label>
              <input type="text" class="form-control" id="price" name="price" placeholder="请输入单价" />
            </div>
            
          	<div class="form-group col-md-4">
              <label for="type">型号</label>
              <input class="form-control" type="text" id="type" name="type" placeholder="请输入型号"/>
            </div>
            
          	<div class="form-group col-md-4">
              <label for="remark">备注</label>
              <input class="form-control" type="text" id="remark" name="remark" placeholder="请输入备注"/>
            </div>
            
            <div class="form-group col-md-12">
              <button type="submit" class="btn btn-primary ajax-post">提交</button>
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
<script src="${ctx }/js/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<script src="${ctx }/js/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
</body>
</html>