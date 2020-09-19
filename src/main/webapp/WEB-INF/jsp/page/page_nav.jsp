<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript"> 
/**
 * 跳到第i页.
 * 通过JS实现将当前页码数字传递到控制器方法
 * 将当前页码和页面显示行数大小，作为参数加到表单中提交。
 * 要求：将条件查询的表单添加id属性，值必须是“f1”
 */  
function gotoPage(i)  {  // 点击后传递的页码数字  2
    // 获取form表单
    var currentForm = document.getElementById("f1");  
	// 获取当前页码input，注意这里的name属性值，决定了控制器方法参数名
    var currentPage = document.getElementById("currentPage");
	// 设置当前页码为传递的参数
    currentPage.value=i;// 2
	// 将当前页码的input加入到form表单中
    currentForm.appendChild(currentPage);
	// 获取每页条数input，注意这里的name属性值，决定了控制器方法参数名
    var pageSize = document.getElementById("pageSize");
	// 将每页条数的input加入到form表单中
    currentForm.appendChild(pageSize);
    currentForm.submit(); //通过JS提交表单 
}  
</script>
<input id="currentPage" type="hidden" name="currentPage" value="1">
<ul class="pagination">

	<%-- 点击首页查询第一页，传递 1 --%>
	<li onclick="gotoPage(1)"><span>首页</span></li>

	<%-- 如果当前页>1,上一页可用，反之禁用 --%>
	<c:choose>
		<c:when test="${page.pageNum > 1}">
			<li onclick="gotoPage(${page.pageNum - 1})"><span>上一页</span></li>
		</c:when>
		<c:otherwise>
			<li class="disabled"><span>上一页</span></li>
		</c:otherwise>
	</c:choose>

	<%-- 如果当前页>3,显示…… --%>
	<c:if test="${page.pageNum > 3 }">
		<li class="disabled"><span>...</span></li>
	</c:if>
	
	<%-- 显示页码：例如当前页为：3  这一条显示1 --%>
	<c:if test="${page.pageNum > 2 }">
		<li onclick="gotoPage(${page.pageNum - 2 })"><a
			href="javascript:;">${page.pageNum - 2 }</a></li>
	</c:if>

	<%-- 显示页码：例如当前页为：3  这一条显示2 --%>
	<c:if test="${page.pageNum > 1 }">
		<li onclick="gotoPage(${page.pageNum - 1 })"><a
			href="javascript:;">${page.pageNum - 1 }</a></li>
	</c:if>

	<%-- 显示页码：例如当前页为：3  这一条显示3 --%>
	<li class="active"><span>${page.pageNum }</span></li>
	
	<%-- 显示页码：例如当前页为：3  这一条显示4 --%>
	<c:if test="${page.pages - page.pageNum > 0 }">
		<li onclick="gotoPage(${page.pageNum + 1 })"><a
			href="javascript:;">${page.pageNum + 1 }</a></li>
	</c:if>

	<%-- 显示页码：例如当前页为：3  这一条显示5 --%>
	<c:if test="${page.pages - page.pageNum > 1 }">
		<li onclick="gotoPage(${page.pageNum + 2 })"><a
			href="javascript:;">${page.pageNum + 2 }</a></li>
	</c:if>

	<%-- 显示页码：…… --%>
	<c:if test="${page.pages - page.pageNum > 2 }">
		<li class="disabled"><span>...</span></li>
	</c:if>

	<%-- 如果当前页 < 总页数,下一页可用，反之禁用 --%>
	<c:choose>
		<c:when test="${page.pageNum < page.pages}">
			<li onclick="gotoPage(${page.pageNum + 1})"><span>下一页</span></li>
		</c:when>
		<c:otherwise>
			<li class="disabled"><span>下一页</span></li>
		</c:otherwise>
	</c:choose>

	<li onclick="gotoPage(${page.pages})"><span>末页</span></li>
	<li><span>共${page.pages}页，总共${page.total}条记录</span></li>
	<li><span>每页显示 <select id="pageSize" name="pageSize"
			onchange="gotoPage(1)">
				<option value="4" selected="selected">4</option>
				<option value="5">5</option>
				<option value="10">10</option>
				<option value="50">50</option>
				<option value="100">100</option>
		</select>条记录
	</span></li>
</ul>

<script>
   /**
    * 设置选择的每页显示条数
	*/
	// 获取后台每页显示条数
	var pageSize = ${page.pageSize};
	// 获取所有下拉项
	var allOptions = document.getElementById("pageSize").options;
	for (i=0; i<allOptions.length; i++){
	   // 如果当前的值与设定的每页条数相同
	   if (allOptions[i].value == pageSize){
		   allOptions[i].selected = true;// 将当前下拉框选择
	   }
	}
</script>