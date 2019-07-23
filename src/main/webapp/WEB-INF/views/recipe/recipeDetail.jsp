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
    <link href="${pageContext.request.contextPath}/resources/css/recipeImport.css" rel="stylesheet"/>
    <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="/WEB-INF/views/common/singsingRecipeheader.jsp"/>
<section>
    <div class="section_content detail_content">
        <div class="detail">
            <div class="main_img image-container" style="position:relative; margin-bottom:0;">
                <img src="${pageContext.request.contextPath}/resources/upload/recipe/${recipe.recipe.recipeMainImg}" onerror="this.src='/resources/img/recipe/pic_none4.gif'" alt="main_img" width="800px;"  height="600px;" />
            </div>
            <div class="main_icon">
                <img src="../../../resources/img/recipe/icon_01.png" width="45px;">
                <span>${recipe.recipe.recipeHit}</span>
            </div>

            <div class="detail_right">

                <div class="user_info">
                    <div class="user_profile"><img src="${pageContext.request.contextPath}/resources/upload/member/${recipe.member.memberImg}" alt="user_profile" width="180px;" height="180px;"></div>

                    <h3>${recipe.member.nickname}</h3>

                    <span>${recipe.member.id}</span>

                </div>
                <div class="recipe_title">
                    <h1>${recipe.recipe.recipeTitle}</h1>
                    <!-- 조회수 : ${recipe.recipe.recipeHit}<br>-->

                    <c:if test="${not empty sessionScope.member && isLiked}">
                        <div class="bg_like">
                            <a class="bg_like" href="javaScript:unLike(${recipe.recipe.recipeNo})" style="font-size: larger; color: red">
                                <img src="../../../resources/img/recipe/like.png" width="40px;"></a>
                        </div>
                    </c:if>
                    <c:if test="${not empty sessionScope.member && !isLiked}">
                        <div class="bg_like">
                            <a  href="javaScript:like(${recipe.recipe.recipeNo})" style="font-size: larger; color: red"><img src="../../../resources/img/recipe/heart.png" width="40px;"></a>
                        </div>
                    </c:if>
                    <span class="bg_like"> 좋아요 ${recipe.recipe.recipeLike}</span>
                </div>
                <div class="item_title" style="white-space: pre-line">
                    <img src="../../../resources/img/recipe/icon_4.png">
                    ${recipe.recipe.recipeContents}
                    <img src="../../../resources/img/recipe/icon_5.png">
                </div>
                <div class="item_content1">
                    <ul>
                        <li>
                            <img src="../../../resources/img/recipe/icon_02.png">
                            <span>${recipe.count}</span>
                        </li>
                        <li>
                            <img src="../../../resources/img/recipe/icon_03.png">
                            <span>${recipe.time}</span>
                        </li>
                        <li>
                            <img src="../../../resources/img/recipe/icon_8.png">
                            <span>${recipe.level}</span>
                        </li>
                    </ul>
                </div>
                <%--                    ${recipe.category1} ,--%>
                <%--                    ${recipe.category2}--%>
                <%--                    <div class="item_content2">--%>

                <%--                    </div>--%>
                <div class="item_content2" style="text-align: left;white-space: pre-line">${recipe.recipe.recipeItem}</div>
                <c:if test='${recipe.recipe.recipeVideo.contains("/")}'>
                    <div class="recipe_video">
                        <iframe id="player" type="text/html" width="640" height="360" src='https://www.youtube.com/embed${recipe.recipe.recipeVideo.substring(recipe.recipe.recipeVideo.lastIndexOf("/"))}' frameborder="0"></iframe>
                    </div>
                </c:if>
                <c:if test="${recipe.recipe.recipePrice ne 0}">
                    <div class="recipe_order">
                        <table class="type04">
                            <tr>
                                <th>가격</th>
                                <td id="price">${recipe.recipe.recipePrice}</td>
                            </tr>
                            <tr>
                                <th>갯수</th>
                                <td><input type="number" name="count" min="1" value="1"></td>
                            </tr>
                            <tr>
                                <th>총 가격</th>
                                <td><span id="total_price">${recipe.recipe.recipePrice}</span></td>
                            </tr>
                        </table>
                        <a class="btn normal col_main f_w"  style="font-size:14px; border-radius:10px; margin-top:15px; width:135px;" href="javaScript:void(0)" onclick="cart(${recipe.recipe.recipeNo})">장바구니에 넣기</a>
                    </div>
                </c:if>
            </div>
            <c:forEach var="step" items="${recipe.recipe.recipeStep}" varStatus="status">
                <div class="recipe_step">
                    <div class="step_count">
                        Step${status.count}
                    </div>
                    <div class="step_text item_content">
                            ${step.step}
                    </div>
                    <div class="step_img">
                        <c:if test="${not empty step.img}">
                            <img src="${pageContext.request.contextPath}/resources/upload/recipe/${step.img}" alt="step_img"/>
                        </c:if>
                        <c:if test="${empty step.img}">
                        </c:if>
                    </div>
                </div>
            </c:forEach>
<c:if test="${recipe.recipe.recipeWorkImg.size() > 0}">
    <div class="slider-wrap001">
        <ul id="slider001">
            <c:forEach var="img" items="${recipe.recipe.recipeWorkImg}">
            <c:if test="${not empty img}">
            <li class="step_img image-container" style="display: inline-block">
                <img src="${pageContext.request.contextPath}/resources/upload/recipe/${img}" alt=""/>
            </li>
            </c:if>
            </c:forEach>
            <!-- <div class="btns" id="recipe_next"><img src="../resources/img/right_arrow.png"></div>
            <div class="btns" id="recipe_previous"><img src="../resources/img/left_arrow.png"></div> -->
            <div id="counter001"></div>

            <div id="pagination-wrap001">
                <ul>
                </ul>
            </div>
            <!--controls-->
    </div>
</c:if>
            <div class="bottom">
                <button type="button" class="btn-lg btn-primary" onclick="location.href='/recipePage.do'">목록으로</button>
            </div>
        </div>
    </div>
    <%--
       <div class="section_content work_img">
           <div class="bottom">
               <c:forEach var="img" items="${recipe.recipe.recipeWorkImg}">
                   <div class="step_img image-container" style="display: inline-block">
                       <img src="${pageContext.request.contextPath}/resources/upload/recipe/${img}" alt=""/>
                   </div>
               </c:forEach>
           </div>
       </div> --%>
</section>
<jsp:include page="/WEB-INF/views/common/singsingRecipefooter.jsp"/>
</body>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/recipe.js"></script>
</html>