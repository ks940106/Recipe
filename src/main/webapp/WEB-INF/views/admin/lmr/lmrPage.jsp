<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>싱싱레시피 지난 이달의 레시피</title>

<link href="../resources/css/import.css" rel="stylesheet" />
<link href="../resources/css/tmr.css" rel="stylesheet" />

<script type="text/javascript" src="../resources/js/tmr.js" /> 
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<section>
	<div class="section_content">
		<br>
		<h1 id="tmr">지난 이달의 레시피</h1>
		<br>
		<hr>
		<hr>
		<c:forEach items="${lpd.list }" var="vo">
			<div style="font-size : 15pt;font-weight: bold; height:100px;">
			<div style="float:left; width:13%; font-size: 20pt; line-height:100px;">${vo.recipeDate }</div>
			<div style="float:left; width:29%;">
				<div style="float:left; width:8%; font-size: 20pt; line-height:100px;">1</div>
				<div style="float:left; width:24%; padding-top: 10px;"><a href="#"><img src="/../resources/img/tmr/b_01.png" id="recipeImg"></a></div>
				<div style="float:left; width:68%; padding-top: 5px; overflow:hidden; height:75px; text-overflow:ellipsis"><a href="#">${vo.recipeTitle1 }</a></div>
				<div style="float:left; width:68%; overflow:hidden; height:25px; text-overflow:ellipsis">${vo.recipeWriter1 }</div>
			</div>
			<div style="float:left; width:29%;">
				<div style="float:left; width:8%; font-size: 20pt; line-height:100px;">2</div>
				<div style="float:left; width:24%; padding-top: 10px;"><a href="#"><img src="/../resources/img/tmr/b_01.png" id="recipeImg"></a></div>
				<div style="float:left; width:68%; padding-top: 5px; overflow:hidden; height:75px; text-overflow:ellipsis"><a href="#">${vo.recipeTitle2 }</a></div>
				<div style="float:left; width:68%; overflow:hidden; height:25px; text-overflow:ellipsis">${vo.recipeWriter2 }</div>
			</div>
			<div style="float:left; width:29%;">
				<div style="float:left; width:8%; font-size: 20pt; line-height:100px;">3</div>
				<div style="float:left; width:24%; padding-top: 10px;"><a href="#"><img src="/../resources/img/tmr/b_01.png" id="recipeImg"></a></div>
				<div style="float:left; width:68%; padding-top: 5px; overflow:hidden; height:75px; text-overflow:ellipsis"><a href="#">${vo.recipeTitle3 }</a></div>
				<div style="float:left; width:68%; overflow:hidden; height:25px; text-overflow:ellipsis">${vo.recipeWriter3 }</div>
			</div> 
			</div>
		<hr>
		</c:forEach>
		<div style="margin-bottom:75px;margin-top:25px; text-align:center;">${lpd.pageNavi }</div>
		</div>
	</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>