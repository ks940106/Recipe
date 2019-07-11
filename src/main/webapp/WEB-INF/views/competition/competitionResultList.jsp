<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>싱싱레시피 지난대회 결과</title>
<link href="../resources/css/import.css" rel="stylesheet" />
</head>

<body>

	<jsp:include page="/WEB-INF/views/common/singsingRecipeheader.jsp" />
	<!-- header Fin -->
	<section>
	<div class="cp_bg"></div>
	<div class="section_content">
		<div class="cp_nav">
			<div class="cp_nav_l"><a href="/competitionList.do?competitionCheck='Y'">요리 대회</a></div>
			<div class="cp_nav_r"><a href="/competitionResultList.do"> 지난 대회 결과</a></div>
		</div>
		<div class="cp_content">
			<!--                <img src="../../../resources/img/logo.png" width="200px;">-->
			<h1>지난 요리 대회 결과</h1>
			<p>싱싱레시피의 요리 대회의 결과를 확인 할 수 있습니다.</p>
			<div id="cp_div_bg"></div>
			<table id="cp_table">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>등록일</th>
				</tr>
				<c:forEach items="${list}" var="c">
					<tr>
						<td>${c.competitionNo}</td>
						<td><a href="/competitionResultAdmin.do?competitionNo=${c.competitionNo}">${c.competitionTitle }</a></td>
						<td>${c.competitionDate }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/singsingRecipefooter.jsp" />
</body>
</html>