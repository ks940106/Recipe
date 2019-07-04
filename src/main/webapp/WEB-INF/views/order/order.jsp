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
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<section>
	<div class="section_content">
		<!-- 컨텐츠 사이드 메뉴 -->
		<div class="sidebar_mypage">
			<div class="sidebar_name">MyPage</div>
			<hr>
			<div>
				<a href="#">개인정보 변경</a>
			</div>
			<div>
				<a href="cart.do">장바구니</a>
			</div>
		</div>
		<h3>결제 페이지</h3>
		<div class="content">
				<!-- 주문하기 페이지로 넘기는 form -->
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
			<h3>
						
				총결제금액<span id="countSpan"><c:out value="${total }"/></span>원
			</h3>
			<button type="button"  onclick="payment('${sessionScope.member.id}','${sessionScope.member.name}','${sessionScope.member.phone}',
														'${sessionScope.member.zipCode}',
														'${sessionScope.member.addr1 }',
														'${sessionScope.member.addr2 }')">결제하기</button>
			<p id="paymentResult"></p>
		</div>
	</div>
	</section>
	<!-- header Fin -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script type="text/javascript" src="/resources/js/cart.js"></script>

</body>
</html>