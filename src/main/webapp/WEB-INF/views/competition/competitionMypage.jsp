<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>요리대회 결과</title>
<link href="../resources/css/import.css" rel="stylesheet" />
</head>

<body>

	<jsp:include page="/WEB-INF/views/common/singsingRecipeheader.jsp" />
	<!-- header Fin -->
	<section>
	<div class="cp_bg"></div>		
		<div class="cp_content">
			<h1>지원한 요리 대회</h1>
			<!-- <p>싱싱레시피의 요리 대회의 결과를 확인 할 수 있습니다.</p> -->
			<!-- <div id="cp_div_bg"></div> -->
			<nav class="nav_wrap">
	<div class="nav_con">
		<div class="nav_title">요리대회 관리</div>
		<ul class="nav_menu">
			<li>
                <a href="/competitionList.do">진행중인 대회</a><span>></span>
            </li>
            <li>
                <a href="/competitionResultList.do">지난 대회 관리</a><span>></span>
            </li>
            <li>
                 <a href="#">대회 참가자 리스트</a><span>></span>
            </li>
		</ul>
	</div>
</nav>
			<table id="cp_table">
				<tr>
					<th>대회이름</th>
					<th>사연</th>
					<th>합격여부</th>
				</tr>				
				<tr>
					<td>${participant.nickname}</td>
					<td>${participant.participantContent }</td>
					<c:if test="${participant.participantPass == 'Y' }">
						<td>합격</td>
					</c:if>
					<c:if test="${participant.participantPass == 'N' }">
						<td>불합격</td>
					</c:if>
				</tr>
			
			</table>
		</div>
	</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/singsingRecipefooter.jsp" />
</body>
</html>