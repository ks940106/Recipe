<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 이윤석
  Date: 2019-07-15
  Time: 오전 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>싱싱레시피 관리자</title>
    <link href="../resources/css/import.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="../resources/css/ui.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/jquery-ui.min.css">
    <script src="../resources/js/jquery-3.1.1.min.js"></script>
    <script src="../resources/js/jquery-ui-1.12.1.js"></script>
    <script src="../resources/js/ui.js"></script>
    <script src="../resources/js/search.js"></script>
    <script src="../resources/js/include.js"></script>

    <link href="../resources/css/recipeManage.css" rel="stylesheet" />
</head>

<body>

<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"/>
<!--header Fin -->
<section>
    <div class="wrapper">
        <nav class="lnb_wrap">
            <jsp:include page="/WEB-INF/views/admin/recipe/orderRegNav.jsp"/>
        </nav>
        <div class="section_content">
            <div class="set_field">
                <h1>레시피 상품화 관리</h1>
                <div id="cp_div_bg"></div>
            </div>
            <div class="cp_content" style="margin-left:100px;">
                <table id="cp_table_tmr"> <!-- tmr.css -->
                    <colgroup>
                        <col width="5%">
                        <col width="35%">
                        <col width="20%">
                        <col width="10%">
                        <col width="10%">
                        <col width="20%">
                    </colgroup>
                    <tr>
                        <th>순위</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>좋아요</th>
                        <th>상세보기</th>
                        <th>가격등록</th>
                    </tr>
                    <c:forEach var="recipe" items="${recipeList}" varStatus="status">
                        <tr>
                            <td>${status.count}</td>
                            <td>${recipe.recipeTitle}</td>
                            <td>${recipe.recipeWriter}</td>
                            <td>${recipe.recipeLike}</td>
                            <td><a href="/recipe/${recipe.recipeNo}" target="_blank" class="btn small col_main f_w">새 창으로</a></td>
                            <td>
                                <input style="width: 50%" type="text" name="price">
                                <a href="javaScript:void(0)" onclick="orderReg(this,${recipe.recipeNo})"  class="btn small col_main f_w">등록</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <br><br>
                <%--${lpd.pageNavi }--%>
            </div>
        </div>
    </div>
</section>
<jsp:include page="/WEB-INF/views/common/freshfooter.jsp"/>
<script src="${pageContext.request.contextPath}/resources/js/orderReg.js"></script>
</body>
</html>