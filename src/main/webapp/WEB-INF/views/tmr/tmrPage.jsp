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
		<br>
		<p id="tmr">이달의 레시피</p>
		<button onclick="location.href='/lmt.do'">지난 달 레시피</button>
		<br>
		<hr>
		<div style="height:25px; text-align:center;">
			<div style="width:30%; float:left;">순위</div>
			<div style="width:10%; float:left;">레시피 사진</div>
			<div style="width:30%; float:left;">레시피 제목</div>
			<div style="width:15%; float:left;">추천수</div>
			<div style="width:15%; float:left;">조회수</div>
		</div>
		<hr>
		
		<c:forEach items="${list }" var ="vo" varStatus="i">
		<div style="height:100px; text-align: center;" id="tmrDiv">
			<div style="width:30%">
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
			</div>
			<div style="padding-top:10px; width:10%">
			<a href="#"><img src="/../resources/img/tmr/b_01.png" id="recipeImg"></a>
			</div>
			<div style="width:30%" id="recipeTitle">
			${vo.recipeTitle }
			</div>
			<div style="width:30%" id="recipeInfo">
				<div style="width:50%" style="float:left;">
					<img src="/../resources/img/tmr/recommend.png" id="recipeInfoImg"> ${vo.recipeLike }
				</div>
				<div style="width:50%" style="float:left;">
					<img src="/../resources/img/tmr/view.png" id="recipeInfoImg"> ${vo.recipeHit }
				</div>
			</div>
		</div>
		<hr>
		</c:forEach>
	</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>