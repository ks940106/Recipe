<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
				</ul>
			</div>
			</nav>
		</div>
		<div class="section_content_nav">
			<!--<div class="cp_nav">
                    <jsp:include page="/WEB-INF/views/common/navPom.jsp"/>
                </div>-->
			<div class="cp_content">
				<div id="contentName">결제</div>
				<div id="contentNamebar"></div>
				<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>주문자</th>
							<th>레시피제목</th>
							<th>가격</th>
							<th>인분</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="total" value="0"/>
						<c:forEach items="${list }" var="c" varStatus="i">
							<tr>
								<input type="hidden" name="recipeNo" value="${c.recipeNo }">
								<input type="hidden" name="recipeCount" value="${c.recipeCount }">
								<input type="hidden" name="recipePrice" value="${c.recipePrice }">
								<td>${i.count }</td>
								<td>${c.id }</td>
								<td>${c.recipeTitle }</td>
								<td class="co">${c.recipePrice }</td>
								<td>${c.recipeCount }</td>
							</tr>
							<c:set var="total" value="${total+ c.recipePrice }"></c:set>
						</c:forEach>
						<c:if test="${empty list }">
							<tr>
								<td colspan="5"><h1>장바구니가 비었습니다.</h1></td>
							</tr>
						</c:if>
					</tbody>
				</table>
				<h2 id="addrName">배송지 설정</h2>
				<table class="table">
					<tr>
						<td><input type="radio" name="addrs" id="addrs" checked class="delivery">기본 배송지</td>
						<td><input type="radio" name="addrs" id="newAddrs" class="delivery">새로운 배송지</td>
						<td><input type="radio" name="addrs" id="campingAddrs" class="delivery">캠핑장으로</td>
					</tr>
					<tr>
						
						<td colspan="3">
						<input type="hidden" onclick="sample6_execDaumPostcode()" id="addrsApi" value="우편번호 찾기">
						<input type="text" name="zipCode" id="zipCode" value="${sessionScope.member.zipCode }">
						<input type="text" name="addr1" id="addr1" value="${sessionScope.member.addr1 }">
						<input type="text" name="addr2" id="addr2" value="${sessionScope.member.addr2 }">
						</td>
					</tr>
				</table>
				
				<h3>
				총결제금액<span id="countSpan"><c:out value="${total }"/></span>원
			</h3>
			<button type="button" class="button button1" onclick="payment('${sessionScope.member.id}','${sessionScope.member.name}','${sessionScope.member.phone}')">결제하기</button>
			<p id="paymentResult"></p>
			</div>
		</div>
	</section>
	<!-- header Fin -->
	<jsp:include page="/WEB-INF/views/common/singsingRecipefooter.jsp" />
	<script type="text/javascript" src="/resources/js/cart.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</body>
</html>