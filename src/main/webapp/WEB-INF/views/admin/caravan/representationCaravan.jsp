<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Fresh 대표 카라반</title>
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
					<h1>대표카라반 이미지 수정</h1>
					<div id="cp_div_bg"></div>
				</div>
				<div class="list_field">
				<form action="/updateinsertCaravan.do" method="post" enctype="multipart/form-data">
				<button class="button button1" type="submit" >수정</button>
				<table class="list_table">
					<thead>
						<tr>
							<td>대표 이미지</td>
							<td>이미지</td>
							<td>이미지</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<input type="hidden" name="caravanNo" value="${caravan.caravanNo }">
							<input type="file" name="fileTest" onchange="loadImg(this)" class="short" id="file" style="display: none;"> 
							<input type="file" name="fileTest" onchange="loadImg1(this)" class="short" id="file1" style="display: none;"> 
							<input type="file" name="fileTest" onchange="loadImg2(this)" class="short" id="file2" style="display: none;"> 
							<td style="width:400px;">
								<label for="file">
								<img id="img-view" style="max-width: 100%;" src="/resources/img/${caravan.caravanMainImg}">
								</label>
							</td>
							<td style="width:400px;">
								<label for="file1">
								<img id="img-view1" style="max-width: 100%;"  src="/resources/img/${caravan.caravanImg}">
								</label>
							</td>
							<td style="width:400px;">
								<label for="file2" >
										<img  id="img-view2" style="max-width: 100%;" src="/resources/img/${caravan.caravanImg1}">
								</label>
							</td>	
						</tr>
					</tbody>
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