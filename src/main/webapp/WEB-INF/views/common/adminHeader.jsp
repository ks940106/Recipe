<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script
            src="https://code.jquery.com/jquery-3.4.0.js"
            integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
            crossorigin="anonymous">
    </script>
    <%--	<link rel="stylesheet" href="/css/common/bootstrap_copy.css">--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<header>
    <h1 class="logo">
        <a href="/" class="logo_btn">
            <img src="../resources/img/logo2.png" alt="로고">
        </a>
    </h1>
    <div class="nav_menu">
        <a href="/orderRegPage.do" class="menu_btn">
            <img src="../resources/img/admin/recipe_icon.png" class="ico set" width="50px;">
            <div class="menu_text">레시피 등록</div>
        </a>
        <a href="/orderAdminList.do" class="menu_btn">
            <img src="../resources/img/admin/buy_icon.png" class="ico set"  width="50px;">
            <div class="menu_text">레시피 판매</div>
        </a>
        <a href="/competitionAdminList.do?competitionCheck='Y'" class="menu_btn">
            <img src="../resources/img/admin/competition_icon.png" class="ico set"  width="50px;">
            <div class="menu_text">요리대회</div>
        </a>
        <a href="/lmr.do" class="menu_btn">
            <img src="../resources/img/admin/tmr_icon.png" class="ico set"  width="50px;">
            <div class="menu_text">이달의 레시피</div>
        </a>
        <a href="stock_index.html" class="menu_btn">
            <img src="../resources/img/admin/board_icon.png" class="ico set"  width="50px;">
            <div class="menu_text">토크 게시판</div>
        </a>
        <a href="/seletecaravan.do" class="menu_btn">
            <img src="../resources/img/admin/member_icon.png" class="ico set"  width="50px;">
            <div class="menu_text">카라반</div>
        </a>
        <a href="/memberList.do" class="menu_btn">
            <img src="../resources/img/admin/member_icon.png" class="ico set"  width="50px;">
            <div class="menu_text">회원 관리</div>
        </a>
        
    </div>
</header>
</body>
</html>