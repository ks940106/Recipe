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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/recipeList.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


</head>

<body>
<jsp:include page="/WEB-INF/views/common/singsingRecipeheader.jsp" />
<!-- header Fin -->
<section>
    <div class="pom_bg">
        <div class="pom_top">
            <h1>레시피</h1>
            <div id="pom_div_bg"></div>
        </div>
    </div>
    <div class="pom_wrap">
        <div class="section_content">
            <div class="rcp_content">
                <%--검색필터--%>
                <%--                <form action="/recipePage.do" method="get" id="srRecipeFrm" name="srRecipeFrm">--%>
                <%--                    <input type="hidden" name="q" value="${q}">--%>

                <%--                </form>--%>
                <div class="search">
                    <div class="search_filter">
                        <form action="/recipePage.do" method="get" id="frmTopRecipeSearch">
                            <input type="text" name="q" value="${recipeSearch.q}"  placeholder="검색어 입력">
                            <input type="hidden" name="cat1" value="${recipeSearch.cat1}">
                            <input type="hidden" name="cat2" value="${recipeSearch.cat2}">
                            <input type="hidden" name="order" value="${recipeSearch.order}">
                            <button onclick="$('#frmTopRecipeSearch').submit();">검색</button>
                        </form>
                    </div>
                    <div class="category">
                        <select name="cat1">
                            <option value="">종류별</option>
                            <c:forEach var="category1" items="${categoryList}" varStatus="">
                                <c:if test="${category1.categoryType == 1}">
                                    <c:choose>
                                        <c:when test="${category1.categoryNo eq recipeSearch.cat1}">
                                            <option selected value="${category1.categoryNo}">${category1.categoryName}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${category1.categoryNo}">${category1.categoryName}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                            </c:forEach>
                        </select>
                        <select name="cat2">
                            <option value="">상황별</option>
                            <c:forEach var="category2" items="${categoryList}" varStatus="">
                                <c:if test="${category2.categoryType == 2}">
                                    <c:choose>
                                        <c:when test="${category2.categoryNo eq recipeSearch.cat2}">
                                            <option selected value="${category2.categoryNo}">${category2.categoryName}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${category2.categoryNo}">${category2.categoryName}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="rcp_reg">
                        <a href="${pageContext.request.contextPath}/recipeRegPage.do"><img
                                src="${pageContext.request.contextPath}/resources/img/recipe/tmn_write.png" alt="글쓰기"/>
                        </a>
                    </div>
                </div>

                <div class="rcp_m_list2">

                    <div class="m_list_tit">
                        <%--                        총 <b>120,788</b>개의 맛있는 레시피가 있습니다.--%>
                        <ul class="nav nav-tabs2 pull-right" style="position:relative;">
                            <li role="presentation"><a href="javascript:void(0);"
                                                       onclick="goSearchRecipe('order','accuracy')">정확순</a>
                            </li>
                            <li role="presentation"><a href="javascript:void(0);"
                                                       onclick="goSearchRecipe('order','date')">최신순</a></li>
                            <li role="presentation"><a href="javascript:void(0);"
                                                       onclick="goSearchRecipe('order','reco')">추천순</a></li>
                        </ul>
                    </div>

                    <div class="row">
                        <c:forEach var="recipe" items="${recipeList}">
                            <div class="col-xs-4">
                                <a href="/recipe/${recipe.recipeNo}" class="thumbnail">
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
    </div>
</section>
<jsp:include page="/WEB-INF/views/common/singsingRecipefooter.jsp" />
<script type="text/javascript">
    $(document).ready(function () {
        var order = '${recipeSearch.order}';
        var list = $("ul.nav>li");
        switch (order) {
            case 'accuracy':
                list.eq(0).addClass('active');
                break;
            case 'date':
                list.eq(1).addClass('active');
                break;
            case 'reco':
                list.eq(2).addClass('active');
                break;
            default:
                list.eq(0).addClass('active');
                break;
        }
    });
    $("select").change(function () {
        var name = $(this).attr('name');
        var value = $(this).val();
        $('input[name="'+name+'"]').val(value);
    });
    function goSearchRecipe(n,v) {
        $('input[name="'+n+'"]').val(v);
        $('#frmTopRecipeSearch').submit();
    }

</script>
</body>

</html>
