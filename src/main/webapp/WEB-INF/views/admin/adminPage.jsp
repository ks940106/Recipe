<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>싱싱레시피 관리자 페이지</title>
<link href="../resources/css/import.css" rel="stylesheet" />
</head>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<!-- header Fin -->
	<section>
	<div class="section_content">
		<div><a href="/competitionWrite.do">요리대회</a></div>
		<div><a href="/lmr.do">지난 이달의 레시피 1,2,3 등 목록</a></div>
	</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

</html>
