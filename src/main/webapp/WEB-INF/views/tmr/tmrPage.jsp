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
	<jsp:include page="/WEB-INF/views/common/singsingRecipeheader.jsp"/>
	<section>
	<div class="pom_bg">
        <div class="pom_top">
            <h1>이달의 레시피</h1>
            <div id="pom_div_bg"></div>
            <p>이번달에 가장 많은 추천을 받은 레시피</p>
        </div>
    </div>
    <div class="pom_wrap">
            <div class="pomNav">
                <jsp:include page="/WEB-INF/views/tmr/tmrNav.jsp"/>
            </div>
            <div class="section_content_nav">
                <!--<div class="cp_nav">
                    <jsp:include page="/WEB-INF/views/common/navPom.jsp"/>
                </div>-->
                <div class="cp_content">
                
		<hr>
			<div class="tmrNav">
			<div>순위</div><div>사진</div><div>제목</div><div>작성자</div><div>추천수</div><div>조회수</div> 
			</div>    
		<hr>
		<c:forEach items="${tpd.list }" var ="vo" varStatus="i">
			<div class="tmrDiv">
				<div>
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
				</div>
				<div>
					<a href="#"><img src="${vo.recipeMainImg }"></a> 
				</div>
				<div>
					<a href="#">${vo.recipeTitle }</a> 
				</div>
				<div>
					${vo.recipeWriter } 
				</div>
				<div>
					<img src="/../resources/img/tmr/recommend.png"> ${vo.recipeLike }
				</div>
				<div>
					<img src="/../resources/img/tmr/view.png"> ${vo.recipeHit }
				</div>
			</div>
		<hr>
		</c:forEach>
		<div style="text-align:center;">${tpd.pageNavi }</div>
                </div>
            </div>
        </div>
	</section>
	<jsp:include page="/WEB-INF/views/common/singsingRecipefooter.jsp"/>
</body>
</html>