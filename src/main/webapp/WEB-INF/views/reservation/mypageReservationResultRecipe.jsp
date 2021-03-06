<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>싱싱레시피 캠핑예약내역</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-3.4.0.js"></script>
	<link href="../resources/css/import.css" rel="stylesheet" />
	<link href="../resources/css/cart.css" rel="stylesheet" />
</head>
<body>
<jsp:include page="/WEB-INF/views/common/singsingRecipeheader.jsp" />

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
						<li><a href="/mypage.do">개인정보수정</a><span>></span></li>
						<li><a href="/cart.do">장바구니</a><span>></span></li>
						<li><a href="/orderList.do">결제내역</a><span>></span></li>
						<li><a href="/mypageCompetitionResult.do">대회신청결과</a><span>></span></li>
						<li><a href="/myRecipe.do">나의 레시피</a><span>></span></li>
						<li><a href="/mypageReservationResultRecipe.do">캠핑 예약 내역</a><span>></span></li>
					</ul>
				</div>
			</nav>
		</div>
		<div class="section_content_nav">
			<!--<div class="cp_nav">
                    <jsp:include page="/WEB-INF/views/common/navPom.jsp"/>
                </div>-->
			<div class="cp_content">
				<div id="contentName">캠핑 예약 내역</div>
				<div id="contentNamebar"></div>
					<table class="table" style="table-layout: fixed;">
						<thead>
						<tr>
							<th style="width:5%;"></th>
							<th style="width:10%;">예약번호</th>
							<th style="width:10%;">카라반 이름</th>
							<th style="width:10%;">예약자 이름</th>
							<th style="width:45%;">예약 날짜</th>
							<th style="width:10%;">결제 가격</th>
							<th style="width:10%;">결제 상태</th>
						</tr>
						</thead>
						<tbody>

						<c:forEach items="${list }" var="r" varStatus="i">
							<tr>
								<c:choose>
									<c:when test="${r.reservationState eq 1}"><td><input type="radio" name="reservationId" value="${r.reservationId}"></td></c:when>
									<c:when test="${r.reservationState eq 2}"><td><input type="radio" name="reservationId" value="${r.reservationId}"></td></c:when>
									<c:when test="${r.reservationState eq 3}"><td></td></c:when>
									<c:otherwise><td></td></c:otherwise>
								</c:choose>
								<td>${r.reservationId}</td>
								<td>${r.reservationRequest}</td>
								<td>${r.reservationName}</td>
								<td style="overflow: auto;">${r.reservationDate}</td>
								<td>${r.totalCost}</td>
								<c:choose>
									<c:when test="${r.reservationState eq 1}"><td style="color:blue;">예약 승인 대기 중</td></c:when>
									<c:when test="${r.reservationState eq 2}"><td style="color:blue;">예약 승인</td></c:when>
									<c:when test="${r.reservationState eq 3}"><td style="color:red;">예약 취소 승인 대기 중</td></c:when>
									<c:otherwise><td style="color:red;">예약 취소</td></c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
						<c:if test="${empty list }">
							<tr>
								<td colspan="7"><h1>예약 내역이 없습니다.</h1></td>
							</tr>
						</c:if>
						</tbody>
					</table>
					<button type="button" class="button button1" onclick="deleteButton()">예약취소</button>
			</div>
		</div>
</section>
<!-- header Fin -->
<jsp:include page="/WEB-INF/views/common/singsingRecipefooter.jsp" />
<script>
	function deleteButton(){
		var bool = confirm("정말 예약을 취소 하시겠습니까?");
		if(bool){
			location.href="/cancelReservationRecipe.do?reservationId="+$('input[name="reservationId"]:checked').val();
		}
		
	}
</script>
</body>
</html>