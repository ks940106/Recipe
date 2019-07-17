<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Fresh 카라반 등록</title>
<link rel="stylesheet" type="text/css"href="../resources/css/import.css">
<link rel="stylesheet" type="text/css" href="../resources/css/ui.css">
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
<link rel="stylesheet" type="text/css"href="../resources/css/jquery-ui.min.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
	<section>
	<div class="wrapper">
		<nav class="lnb_wrap">
		<div class="lnb_con">
			<div class="lnb_show">카라반</div>
			<ul class="lnb_menu">
				<li><a href="#none" class="menu_name">카라반 관리</a>
					<ul class="lnb_sub_menu">
						<li><a href="/seletecaravan.do">카라반 리스트</a></li>
						<li><a href="/caravanMainImg.do">대표 카라반 리스트</a></li>
					</ul></li>
			</ul>
			
		</div>
		</nav>
		<div class="section_content">
				<div class="set_field">
					<h1>카라반 등록</h1>
					<div id="cp_div_bg"></div>
				</div>
				<div class="list_field">
				<select id="caravanOption">
					<option value="" selected>-- 선택 --</option>
					<option value="카라반A" >카라반 A</option>
					<option value="카라반B" >카라반 B</option>
					<option value="카라반C" >카라반 C</option>
				</select>
				<form action="/insertCaravanList.do"method="post" >
				<button class="button button1" onclick="location.href='/seletecaravan.do'">취소</button>
				<button class="button button1" type="submit">등록</button>
				<table class="list_table" >
					
						<tr>
							<td>이름</td>
							<td><input type="text" name="caravanName" id="caravanName" class="insertCaravan"></td>
						</tr>					
						<tr>
							<td>평수</td>
							<td><input type="text" name="caravanArea" id="caravanArea" class="insertCaravan">평</td>
						</tr>
						<tr>
							<td>최소인원</td>
							<td><input type="text" name="caravanPeople" id="caravanPeople" class="insertCaravan">명</td>						
						</tr>
						<tr>
							<td>최대인원</td>
							<td><input type="text" name="caravanMaxPeople" id="caravanMaxPeople" class="insertCaravan">명</td>							
						</tr>
						<tr>
							<td>추가인원 금액</td>
							<td><input type="text" name="caravanPlusCost" id="caravanPlusCost" class="insertCaravan">원</td>							
						</tr>
						<tr>
							<td>가격</td>
							<td><input type="text" name="caravanCost" id="caravanCost" class="insertCaravan">원</td>
						</tr>
						<tr>
							<td>기본 정보</td>
							<td><textarea cols="50" rows="5" name="caravanInfo" id="caravanInfo"></textarea></td>
						</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
	</section>
		<jsp:include page="/WEB-INF/views/common/singsingRecipefooter.jsp" />
		<script type="text/javascript" src="/resources/js/caravan.js"></script>
</body>
</html>