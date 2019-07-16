<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../resources/css/import.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/singsingCampingheader.jsp"></jsp:include>
	<section>
	<div class="pom_wrap">
		<div class="pomNav">
			<nav class="nav_wrap">
			<div class="nav_con">
				<div class="nav_title">마이페이지</div>
				<ul class="nav_menu">
					<li><a href="/mypage.do">개인정보수정</a><span>&gt;</span></li>
					<li><a href="/cart.do">장바구니</a><span>&gt;</span></li>
					<li><a href="/orderList.do">결제내역</a><span>&gt;</span></li>
					<li><a href="/mypageCompetitionResult.do">대회신청결과</a><span>&gt;</span></li>
				</ul>
			</div>
			</nav>
		</div>
		<div class="section_content_nav">
			<div class="myPage">
			<form method="post" action="/myPagePwCheck.do">
				<h1>개인 정보 수정</h1>
					<p>개인 정보 수정을 위해 비밀번호를 입력해주세요</p>
					<table>
					<tbody><tr>
						<th>아이디</th>
						<td>rudtjr008@naver.com</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="pwcheck"></td>
					</tr>
					</tbody></table>
				<button type="submit">확인</button>
			</form>
			</div>
		</div>
	</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/singsingCampingfooter.jsp"></jsp:include>
	
</body>
</html>