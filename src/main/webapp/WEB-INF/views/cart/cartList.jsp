<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>
<link href="../resources/css/import.css" rel="stylesheet" />
</head>
<body>
	 <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<section>
		<div class="section_content">
		<table>
			<tr>
				<th>주문번호</th><th>주문자</th><th>레시피제목</th><th>가격</th><th>인분</th>
			</tr>
			<tr>
				<c:forEach items="${list }" var="c" >
					<td>${c.cartNo }</td>
					<td>${c.id }</td>
					<td>${c.recipeTitle }</td>
					<td>${c.recipePrice }</td>
					<td>${c.recipeCount }</td>
				</c:forEach>
			</tr>				
		</table>
		</div>
	</section>
	
	
  <!-- header Fin -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>