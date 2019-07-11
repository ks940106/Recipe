<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 이윤석
  Date: 2019-07-08
  Time: 오후 5:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>싱싱레시피</title>
    <link href="${pageContext.request.contextPath}/resources/css/import.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/resources/css/page.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/resources/css/recipe.css" rel="stylesheet"/>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section>
    <div class="section_content detail_content">
        <div class="detail">
            <div class="main_img image-container">
                <img src="${pageContext.request.contextPath}/resources/upload/recipe/${recipe.recipe.recipeMainImg}" alt="main_img"/>
            </div>
            <c:forEach var="step" items="${recipe.recipeStep}">
                <div class="recipe_step">
                    <div class="step_text">
                            ${step.step}
                    </div>
                    <div class="step_img image-container">
                        <c:if test="${not empty step.img}">
                            <img src="${pageContext.request.contextPath}/resources/upload/recipe/${step.img}" alt="step_img"/>
                        </c:if>
                        <c:if test="${empty step.img}">
                        </c:if>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="detail_right">
            <div class="user_info">
                <table>
                    <tr>
                        <td rowspan="2"><div class="user_profile image-container"><img src="" alt="user_profile"></div></td>
                        <td>${recipe.member.nickname}</td>
                    </tr>
                    <tr>
                        <td>${recipe.member.id}</td>
                    </tr>
                </table>
            </div>
            <div class="recipe_title">
                <h2>${recipe.recipe.recipeTitle}</h2>
            </div>
            <div class="recipe_info">
                ${recipe.recipe.recipeContents}
            </div>
            <div class="recipe_summary">
                ${recipe.count} /
                ${recipe.time} /
                ${recipe.level}
            </div>
            <div class="recipe_cat">
                ${recipe.category1} /
                ${recipe.category2}
            </div>
            <div class="recipe_item">
                <div class="item_title">재료</div>
                ${recipe.recipe.recipeItem}
            </div>
        </div>
    </div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/recipe.js"></script>
</html>