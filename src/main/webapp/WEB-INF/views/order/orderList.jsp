<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
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
			<div class="cp_content">
				<div id="contentName">결제 내역</div>
				<div id="contentNamebar"></div>
				<form action="/cancellationOrder.do" method="post" name="cancellationForm">
					<table class="table">
						<thead>
						<tr>
							<th></th>
							<th>주문번호</th>
							<th>레시피제목</th>
							<th>가격</th>
							<th>인분</th>
							<th>결제 상태</th>

						</tr>
						</thead>
						<tbody>

						<c:forEach items="${list }" var="c" varStatus="i">
							<tr>
								<input type="hidden" name="orderCount" value="${c.orderCount }">
								<td><input type="checkbox" name="orderNo" value="${c.orderNo }"></td>
								<td>${c.orderCode }</td>
								<td>${c.recipeTitle }</td>
								<td >${c.orderPrice }</td>
								<td>${c.orderCount }</td>
								<td >${c.state }</td>
							</tr>
						</c:forEach>
						<c:if test="${empty list }">
							<tr>
								<td colspan="5"><h1>결제 내역이 없습니다.</h1></td>
							</tr>
						</c:if>
						</tbody>
					</table>
					<button type="submit" class="button button1" id="cancellation">결제취소</button>
				</form>
			</div>
		</div>
</section>
<!-- header Fin -->
<jsp:include page="/WEB-INF/views/common/singsingRecipefooter.jsp" />
<script type="text/javascript" src="/resources/js/order.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</body>
</html>