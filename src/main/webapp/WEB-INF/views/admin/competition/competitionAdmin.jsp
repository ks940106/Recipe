<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>요리 대회 관리자 </title>
<link rel="stylesheet" type="text/css" href="../resources/css/import.css">
<link rel="stylesheet" type="text/css" href="../resources/css/ui.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/jquery-ui.min.css">
	<script src="../resources/js/jquery-3.1.1.min.js"></script>
	<script src="../resources/js/jquery-ui-1.12.1.js"></script>
	<script src="../resources/js/ui.js"></script>
	<script src="../resources/js/search.js"></script>
	<script src="../resources/js/include.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" /> 
	<section>
		<div class="wrapper">
	        <nav class="lnb_wrap">
	             <jsp:include page="/WEB-INF/views/common/competition_nav.jsp"/>
	        </nav>
			<div class="section_content">
				<div class="set_field">
					<h1>요리대회 진행 현황</h1>
					<div id="cp_div_bg"></div>
				</div>
				<div class="list_field">
					<table class="list_table2">
						<colgroup>
							<col width="40">
							<col width="75">
							<col width="150">
							<col width="100">
							<col width="100">
							<col width="200">
							<col width="120">
							<col width="85">
							<col width="100">
						</colgroup>
						<thead>
						<tr>
							<th>No</th>
							<th>대회이름</th>
							<th>등록일시</th>
							<th>관리</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td>${competition.competitionNo }</td>
							<td><a href="/competitionAdmin_List.do?competitionNo=${competition.competitionNo }">${competition.competitionTitle}</a></td>
							<td>${competition.competitionDate }</td>
							<td>
								<div>
									<a href="/competitionUpdateWrite.do?competitionNo=${competition.competitionNo}" class="btn small col_main f_w">수정</a>
									<a href="/competitionDelete.do?competitionNo=${competition.competitionNo}" class="btn small col_main f_w">삭제</a>
								</div>						
							</td>
						</tr>	
						
						</tbody>
					</table>
					
					<div id="cp_admin_btn">
						<a href="/competitionAdminWrite.do" class="btn small col_main f_w">글쓰기</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/freshfooter.jsp"/>
</body>
</html>