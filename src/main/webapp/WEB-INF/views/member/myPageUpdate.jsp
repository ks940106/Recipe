<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>싱싱레시피 마이페이지</title>

<script src="http://code.jquery.com/jquery-3.4.0.js"></script>
<link href="../resources/css/import.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/singsingRecipeheader.jsp" />
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
					<li><a href="/mypage.do">개인정보수정</a><span>></span></li>
					<li><a href="/cart.do">장바구니</a><span>></span></li>
					<li><a href="/competitionResultList.do">결제내역</a><span>></span></li>
				</ul>
			</div>
			</nav>
		</div>
		<div class="section_content_nav">
			<div class="myPageUpdate">
			<form method="post" action="/myPageUpdate.do" id="myPageFrm" enctype="multipart/form-data" onsubmit="return reg()">
				<h1>개인 정보 수정</h1>
				<div>
					<table>
						<tbody>
							<tr>
								<th>아이디</th>
								<td>${member.id }<input type="hidden" name="id"value=${member.id }></td>
							</tr>
							<tr>
								<th>새 비밀번호</th>
								<td><input type="password" id="new_pw"name="new_pw"></td>
							</tr>
							<tr>
								<th>새 비밀번호 확인</th>
								<td><input type="password" id="pwck"name="pwck"></td>
							</tr>
							<tr>
								<th>이름</th>
								<td>${member.name }</td>
							</tr>
							<tr>
								<th>닉네임</th>
								<td>${member.nickname }</td>
							</tr>
							<tr>
								<th>핸드폰 번호</th>
								<td><input type="text" name="phone" value=${member.phone } placeholder="010-0000-0000"></td>
							</tr>
						</tbody>
					</table>
					<h1>배송지 변경</h1>
						<table>
							<tr>
								<th><input type="text" name="zipCode" id="zipCode" placeholder="우편번호"></th>
								<td><input type="button"onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br></td>
							</tr>
							<tr>
								<th><input type="text" name="addr1" id="addr1" placeholder="주소"></th>
								<td><input type="text" name="addr2" id="addr2" placeholder="상세주소"></td>
							<tr>
						</table>
						<h1>프로필 사진 변경</h1>
					 <img id="image_section" src="../resources/upload/member/${member.memberImg}"/><br>
					<input type="file" id="fileUpload" name="fileUpload" accept=".jpg,.jpeg,.png">
				</div>
				<button type="submit">수정 </button>
				<a href="/myPageDelete.do?id=${member.id}" class="btn">탈퇴하기</a>
			</form>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/singsingRecipefooter.jsp" />
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="/resources/js/member/myPageUpdate.js"></script>
</body>
</html>