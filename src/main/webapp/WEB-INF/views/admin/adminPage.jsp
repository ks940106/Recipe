<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>싱싱레시피 관리자</title>
    <link href="../resources/css/import.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../resources/css/ui.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/jquery-ui.min.css">
    <script src="../resources/js/jquery-3.1.1.min.js"></script>
    <script src="../resources/js/jquery-ui-1.12.1.js"></script>
    <script src="../resources/js/ui.js"></script>
    <script src="../resources/js/search.js"></script>
    <script src="../resources/js/include.js"></script>
</head>

<body>

<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
<!--header Fin -->
<section>
    <div class="wrapper">
        <nav class="lnb_wrap">
            <div class="lnb_con">싱싱레시피 관리자 페이지</div>
        </nav>
        <div class="contents">싱싱레시피 관리자 페이지</div>
    </div>
</section>
<jsp:include page="/WEB-INF/views/common/singsingRecipefooter.jsp" />
</body>

</html>
