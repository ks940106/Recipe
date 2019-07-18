<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../resources/css/import.css" rel="stylesheet" />
<link href="../resources/css/campingImport.css" rel="stylesheet" />
<link href="../resources/css/caravanIntroduce.css" rel="stylesheet"/>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/singsingCampingheader.jsp"></jsp:include>
	<div class="ab_cover"></div>
	<section>
	<div class="pom_wrap">
		<div class="pomNav">
			<nav class="nav_wrap">
			<div class="nav_con">
				<div class="nav_title">카라반 소개</div>
				<ul class="nav_menu">
					<li><a href="/mypage.do">싱싱카라반 a</a><span>&gt;</span></li>
					<li><a href="/cart.do">싱싱카라반b</a><span>&gt;</span></li>
					<li><a href="/orderList.do">싱싱카라반c</a><span>&gt;</span></li>
				</ul>
			</div>
			</nav>
		</div>
		<div class="section_content_nav">
			<div class="cp_content">
				<div id="contentName">싱싱 카라반 A</div>
				<div id="contentNamebar"></div>
			</div>
		</div>
	</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/singsingCampingfooter.jsp"></jsp:include>
	
</body>
</html>