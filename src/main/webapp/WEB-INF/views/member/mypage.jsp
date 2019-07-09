<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>싱싱레시피 마이페이지</title>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>
<link href="../resources/css/import.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
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
					<li><a href="/memberUpdatePage.do">개인정보수정</a><span>></span></li>
					<li><a href="/cart.do">장바구니</a><span>></span></li>
					<li><a href="/competitionResultList.do">결제내역</a><span>></span></li>
				</ul>
			</div>
			</nav>
		</div>
		<div class="section_content_nav">
			<!--<div class="cp_nav">
                    <jsp:include page="/WEB-INF/views/common/navPom.jsp"/>
                </div>-->
			<div class="cp_content">
			
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>