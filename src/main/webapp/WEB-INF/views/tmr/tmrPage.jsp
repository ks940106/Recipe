<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>싱싱레시피 이달의 레시피</title>
<link href="../resources/css/import.css" rel="stylesheet" />
<link href="../resources/css/tmr.css" rel="stylesheet" />
<script type="text/javascript" src="../resources/js/tmr.js" ></script> 
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<section>
	<div class="section_content">
		<p id="tmr">이달의 레시피</p>
		<br>
		<hr>
		<c:forEach items="${list }" var ="vo" varStatus="i">
			<c:choose>
			<c:when test="${i.count eq 1}">
				<span class="rank" id="rank${i.count }">${i.count }</span>
			</c:when>
			<c:when test="${i.count eq 2}">
				<span class="rank" id="rank${i.count }">${i.count }</span>
			</c:when>
			<c:when test="${i.count eq 3}">
				<span class="rank" id="rank${i.count }">${i.count }</span>
			</c:when>
			<c:otherwise>
				<span class="rank">${i.count }</span>
			</c:otherwise>
			</c:choose>
			${vo.recipeTitle }
			<hr>
		</c:forEach>
		
	</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>