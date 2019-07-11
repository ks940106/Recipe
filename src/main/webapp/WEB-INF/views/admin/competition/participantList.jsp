<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/import.css">
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
	<!-- header Fin -->
	<section>
	<div class="wrapper">
		<nav class="lnb_wrap"> 
			<jsp:include	page="/WEB-INF/views/common/competition_nav.jsp" />
		</nav>
		<div class="section_content">
		<div class="set_field">
			<h1>지난 요리 대회 결과 관리</h1>
			<div id="cp_div_bg"></div>
		</div>
		<div class="cp_content" style="margin-left:100px;">
			<!--                <img src="../../../resources/img/logo.png" width="200px;">-->
			<table id="cp_table">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>등록일</th>
				</tr>
				<%-- <c:forEach items="${list}" var="c">
					<tr>
						<td>${c.competitionNo}</td>
						<td><a href="/competitionResultAdmin.do?competitionNo=${c.competitionNo}">${c.competitionTitle}</a></td>
						<td>${c.competitionDate}</td>
					</tr>
				</c:forEach> --%>
			</table>
		</div>
	</div>
	</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/singsingRecipefooter.jsp"/>
</body>
</html>