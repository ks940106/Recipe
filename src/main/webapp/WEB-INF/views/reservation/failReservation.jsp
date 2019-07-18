<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="../resources/css/campingImport.css" rel="stylesheet" />
<link href="../resources/css/reservation.css" rel="stylesheet" />
<script type="text/javascript" src="/resources/js/reservation.js"></script>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/singsingCampingheader.jsp"/>
<section>
	<div class="pom_bg">
        <div class="pom_top">
            <h1>예약</h1>
            <div id="pom_div_bg"></div>
            <p>카라반 예약하기</p>
        </div>
    </div>
    <div class="pom_wrap">
            <div class="pomNav">
                <jsp:include page="/WEB-INF/views/tmr/tmrNav.jsp"/>
            </div>
            <div class="section_content_nav">
                <div class="cp_content">
            			<div id="failDiv">
            			<h1>예약 실패</h1>
            			<span>사유 : ${error}</span>
            			<button type="button" onclick="location.href='/views/singsingCampingIndex.jsp'">메인으로</button>
            			</div>
                </div>
            </div>
    </div>
</section>
<jsp:include page="/WEB-INF/views/common/singsingCampingfooter.jsp"/>
</body>
</html>