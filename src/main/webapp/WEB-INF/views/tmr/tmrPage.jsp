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

<script type="text/javascript" src="../resources/js/tmr.js" /> 
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<section>
	<div class="section_content">
		<h1>이달의 레시피</h1>
		<hr>
			순위 레시피 사진 레시피 제목 레시피 작성자 추천수 조회수
		<hr>
		<c:forEach items="${tpd.list }" var ="vo" varStatus="i">
				<c:choose>
					<c:when test="${tpd.start+i.index eq 1}">
						<span id="rank${tpd.start+i.index }">${tpd.start+i.index }</span>
					</c:when>
					<c:when test="${tpd.start+i.index eq 2}">
						<span id="rank${tpd.start+i.index }">${tpd.start+i.index }</span>
					</c:when>
					<c:when test="${tpd.start+i.index eq 3}">
						<span id="rank${tpd.start+i.index }">${tpd.start+i.index }</span>
					</c:when>
					<c:otherwise>
						<span>${tpd.start+i.index }</span>
					</c:otherwise>
				</c:choose>
			<a href="#"><img src="${vo.recipeMainimg }"></a> 
			<a href="#">${vo.recipeTitle }</a> ${vo.recipeWriter } 
			<img src="/../resources/img/tmr/recommend.png">${vo.recipeLike }
			<img src="/../resources/img/tmr/view.png"> ${vo.recipeHit }
		<hr>
		</c:forEach>
		<div style="text-align:center;">${tpd.pageNavi }</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>