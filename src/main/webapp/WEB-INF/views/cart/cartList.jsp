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
<link href="../resources/css/import.css" rel="stylesheet" />
</head>
<body>
	 <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<section>
		<div class="section_content">
		<table>
			<tr>
				<th></th><th>주문번호</th><th>주문자</th><th>레시피제목</th><th>가격</th><th>인분</th>
			</tr>
				<c:forEach items="${list }" var="c" >
					<tr>
						<td ><input type="checkbox" class="count" name="count"></td>
						<td>${c.cartNo }</td>
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
		</table>
			<h3>총결제금액<span id="countSpan"></span>원</h3>
			<button type="button" id="payment" >결제하기</button>
			<p id="paymentResult"></p>
		</div>
	</section>
  <!-- header Fin -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script type="text/javascript" src="/resources/js/cart.js"></script>
</body>
</html>