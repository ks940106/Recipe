<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>싱싱캠핑 예약성공</title>

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
            			<div id="successDiv">
                		<h1>예약 성공</h1>
                		결제 ID : <span>${r.reservationId }</span><br>
                		예약 카라반 이름 : <span id="caravanName">${caravanName }</span><br>
                		예약자 이름 : <span id="name">${r.reservationName }</span><br>
                		예약 날짜 : <span id="reservationDate">${r.reservationDate }</span><br>
                		결제 금액 : <span id="price">${r.totalCost }</span><br>
                		<button type="button" onclick="location.href='/views/singsingCampingIndex.jsp'">메인으로</button>
            			</div>
                </div>
                </div>
            </div>
    </div>
</section>
<jsp:include page="/WEB-INF/views/common/singsingCampingfooter.jsp"/>

</body>
</html>