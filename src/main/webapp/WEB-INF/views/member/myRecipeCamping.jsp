<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>싱싱캠핑 마이페이지</title>
    <script src="http://code.jquery.com/jquery-3.4.0.js"></script>
    <link href="../resources/css/import.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/recipeList.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/recipe.css">
    <style type="text/css">
        .col-xs-4{
            overflow: auto;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/singsingCampingheader.jsp" />
<section>
    <div class="pom_bg">
        <div class="pom_top">
            <h1>마이페이지</h1>
            <div id="pom_div_bg"></div>

        </div>
    </div>
    <div class="pom_wrap">
        <div class="pomNav">
            <nav class="nav_wrap">
                <div class="nav_con">
                    <div class="nav_title">마이페이지</div>
                    <ul class="nav_menu">
                        <li><a href="/mypageCamping.do">개인정보수정</a><span>></span></li>
                        <li><a href="/cartCamping.do">장바구니</a><span>></span></li>
                        <li><a href="/orderListCamping.do">결제내역</a><span>></span></li>
                        <li><a href="/mypageCompetitionResult.do">대회신청결과</a><span>></span></li>
                        <li><a href="/myRecipeCamping.do">나의 레시피</a><span>></span></li>
                        <li><a href="/mypageReservationResultCamping.do">캠핑 예약 내역</a><span>></span></li>
                    </ul>
                </div>
            </nav>
        </div>

        <div class="section_content_nav">
            <!--<div class="cp_nav">
                    <jsp:include page="/WEB-INF/views/common/navPom.jsp"/>
                </div>-->
            <div class="myPage">
                <div class="row">
                    <c:forEach var="recipe" items="${recipeList}">
                        <div class="col-xs-4">
                            <a href="${pageContext.request.contextPath}/recipeRegPage.do?recipeNo=${recipe.recipeNo}" class="thumbnail">
                                <img src="${pageContext.request.contextPath}/resources/upload/recipe/${recipe.recipeMainImg}"
                                     style="width:275px; height:275px;">
                                <div class="caption">
                                    <h4 class="ellipsis_title2">${recipe.recipeTitle}</h4>
                                    <p>by ${recipe.recipeWriter}</p>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
                <div class="page_nav" style="text-align: center">
                    ${pageNav}
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="/WEB-INF/views/common/singsingCampingfooter.jsp" />
</body>
</html>