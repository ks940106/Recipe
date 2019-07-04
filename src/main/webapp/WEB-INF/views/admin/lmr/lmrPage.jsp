<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>싱싱레시피 지난 이달의 레시피</title>

<link rel="stylesheet" type="text/css" href="../resources/css/import.css">
<link rel="stylesheet" type="text/css" href="../resources/css/ui.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/jquery-ui.min.css">
	<script src="../resources/js/jquery-3.1.1.min.js"></script>
	<script src="../resources/js/jquery-ui-1.12.1.js"></script>
	<script src="../resources/js/ui.js"></script>
	<script src="../resources/js/search.js"></script>
	<script src="../resources/js/include.js"></script>
	
<link href="../resources/css/tmr.css" rel="stylesheet" />

<script type="text/javascript" src="../resources/js/tmr.js" /> 
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" /> 
	<section>
	<div class="wrapper">
	        <nav class="lnb_wrap">
	             <jsp:include page="/WEB-INF/views/common/competition_nav.jsp"/>
	        </nav>
	<div class="section_content">
		<h1>지난 이달의 레시피</h1>
		<hr>
		<c:forEach items="${lpd.list }" var="vo">
			${vo.recipeDate } <br>
			1등 : <a href="#"><img src="${vo.recipeImg1 }"></a> <a href="#">${vo.recipeTitle1 }</a> ${vo.recipeWriter1 }<br>
			2등 : <a href="#"><img src="${vo.recipeImg2 }"></a> <a href="#">${vo.recipeTitle2 }</a> ${vo.recipeWriter2 }<br>
			3등 : <a href="#"><img src="${vo.recipeImg3 }"></a> <a href="#">${vo.recipeTitle3 }</a> ${vo.recipeWriter3 }<br>
		<hr>
		</c:forEach>
	</div>
	</div>
	<center>${lpd.pageNavi }</center>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>