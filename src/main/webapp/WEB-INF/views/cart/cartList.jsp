<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="http://code.jquery.com/jquery-3.4.0.js"></script>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link href="../resources/css/import.css" rel="stylesheet" />
	<link href="../resources/css/cart.css" rel="stylesheet" />
</head>
<body>
<jsp:include page="/WEB-INF/views/common/singsingRecipeheader.jsp"/>

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
						<li><a href="/mypageReservationResultRecipe.do">예약내역</a><span>></span></li>
					</ul>
				</div>
			</nav>
		</div>
		<div class="section_content_nav">
			<!--<div class="cp_nav">
                    <jsp:include page="/WEB-INF/views/common/navPom.jsp"/>
                </div>-->
			<div class="cp_content">
				<div id="contentName">장바구니</div>
				<div id="contentNamebar"></div>
				<form action="/order.do" method="post" name="orderForm">  <!-- 주문하기 페이지로 넘기는 form -->
					<table class="table">
						<thead>
						<tr>
							<th></th><th>번호</th><th>주문자</th><th>레시피제목</th><th>가격</th><th>인분</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${list }" var="c" varStatus="i">
							<tr>
								<td ><input type="checkbox" class="count" name="cartNo" value="${c.cartNo }"></td>
								<td>${i.count }</td>
								<td>${c.id }</td>
								<td>${c.recipeTitle }</td>
								<td class="co">${c.recipePrice }</td>
								<td>${c.recipeCount }</td>
							</tr>
						</c:forEach>
						<c:if test="${empty list }">
							<tr>
								<td colspan="5"><h1>장바구니가 비었습니다.</h1></td>
							</tr>
						</c:if>
						</tbody>
					</table>
					<button type="submit" class="button button1">주문하기</button>
					<button type="button" class="button button1" onclick="deletecart();">삭제하기</button>
				</form>
			</div>
		</div>
</section>
</section>
<!-- header Fin -->
<jsp:include page="/WEB-INF/views/common/singsingRecipefooter.jsp"/>
<script type="text/javascript" src="/resources/js/cart.js"></script>
</body>
</html>