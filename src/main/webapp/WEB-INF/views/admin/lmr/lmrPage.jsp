<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Fresh 지난 이달의 레시피</title>
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
	             <jsp:include page="/WEB-INF/views/admin/lmr/lmrAdminNav.jsp"/>
	        </nav>
			<div class="section_content">
				<div class="set_field">
					<h1>이달의 레시피 관리</h1>
					<div id="cp_div_bg"></div>
				</div>
				<div class="cp_content" style="margin-left:100px;">
					<table id="cp_table_tmr"> <!-- tmr.css -->
						<tr>
							<th>날짜</th>
							<th>등수</th>
							<th>제목</th>
							<th>작성자</th>
						</tr>
						<c:forEach items="${lpd.list}" var="vo">
							<tr>
								<td></td>
								<td>1</td>
								<td><a href="/recipe/${vo.recipeNo1}">${vo.recipeTitle1}</a></td>
								<td><a href="/memberDetailLMR.do?id=${vo.recipeWriter1}">${vo.recipeWriter1 }</a></td>
							</tr>
							<tr>
								<td style="border-top-style: hidden;">${vo.recipeDate }</td>
								<td>2</td>
								<td><a href="/recipe/${vo.recipeNo2}">${vo.recipeTitle2 }</a></td>
								<td><a href="/memberDetailLMR.do?id=${vo.recipeWriter2}">${vo.recipeWriter2 }</a></td>
							</tr>
							<tr>
								<td style="border-top-style: hidden;"></td>
								<td>3</td>
								<td><a href="/recipe/${vo.recipeNo3}">${vo.recipeTitle3 }</a></td>
								<td><a href="/memberDetailLMR.do?id=${vo.recipeWriter3}">${vo.recipeWriter3 }</a></td>
							</tr>
						</c:forEach>
					</table>
					<br><br>
					${lpd.pageNavi }
				</div>
			</div>
		</div>
		
	</section>
	
<jsp:include page="/WEB-INF/views/common/freshfooter.jsp"/>
</body>
</html>