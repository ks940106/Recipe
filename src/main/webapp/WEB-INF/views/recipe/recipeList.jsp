<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>싱싱레시피 요리대회</title>
    <link href="../resources/css/import.css" rel="stylesheet" />

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/recipe.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


</head>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- header Fin -->
<section>
    <div class="pom_bg">
        <div class="pom_top">
            <h1>레시피</h1>
            <div id="pom_div_bg"></div>
            <%--<p>자연속에서 즐기는 요리대회</p>--%>
        </div>
    </div>
    <div class="pom_wrap">
        <%--<div class="pomNav">--%>
        <%--<jsp:include page="/WEB-INF/views/common/navPom.jsp"/>--%>
        <%--</div>--%>
        <div class="section_content">
            <div class="rcp_content">
                <%--검색필터--%>
                <table class="table">
                    <tr>
                        <th>제목</th>
                        <td colspan="2"><input type="text"></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td colspan="2"><input type="text"></td>
                    </tr>
                    <tr>
                        <th>카테고리</th>
                        <td>
                            <label>카테고리1<select></select></label>
                        </td>
                        <td>
                            <label>카테고리2<select></select></label>
                        </td>
                    </tr>

                </table>
                <div class="rcp_m_list2">
                    <div class="m_list_tit">
                        총 <b>120,788</b>개의 맛있는 레시피가 있습니다.
                        <ul class="nav nav-tabs2 pull-right" style="position:relative;">
                            <li role="presentation" class="active"><a href="javascript:void(0);" onclick="goSearchRecipe('order','accuracy')">정확순</a></li>
                            <li role="presentation"><a href="javascript:void(0);" onclick="goSearchRecipe('order','date')">최신순</a></li>
                            <li role="presentation"><a href="javascript:void(0);" onclick="goSearchRecipe('order','reco')">추천순</a></li>
                        </ul>
                    </div>
                    <div class="row">
                        <c:forEach var="recipe" items="${recipeList}">
                            <div class="col-xs-4">
                                <a href="#" class="thumbnail">
                                    <img src="${pageContext.request.contextPath}/resources/upload/recipe/${recipe.recipeMainImg}" style="width:275px; height:275px;">
                                    <div class="caption">
                                        <h4 class="ellipsis_title2">${recipe.recipeTitle}</h4>
                                        <p>by ${recipe.recipeWriter}</p>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

</html>
