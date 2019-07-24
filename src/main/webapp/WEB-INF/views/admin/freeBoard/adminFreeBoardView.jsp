<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/import.css">
<link rel="stylesheet" type="text/css" href="../resources/css/ui.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/jquery-ui.min.css">
	<script src="../resources/js/jquery-3.1.1.min.js"></script>
	<script src="../resources/js/jquery-ui-1.12.1.js"></script>
	<script src="../resources/js/ui.js"></script>
	<script src="../resources/js/search.js"></script>
	<script src="../resources/js/include.js"></script>
	<link href="../resources/css/talkBoard.css" rel="stylesheet" />
	<script src="../resources/js/freeBoard/adminFreeBoard.js"/>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" /> 
	<section>
		<div class="wrapper">
	        <nav class="lnb_wrap">
	              <jsp:include page="/WEB-INF/views/common/notice_nav.jsp"/>
	        </nav>
			<div class="section_content">
				<div class="set_field">
					<h1>자유 게시판 관리</h1>
					<div id="cp_div_bg"></div>
				</div>
				<div class="f_d1">
			 <table class="free_table" style="width: 100%;">
				 <colgroup>
			 				<col width="10%">
							<col width="80%">
							<col width="10%">
						</colgroup>
				    <thead>
				      <tr>
				        <th colspan="3" style="text-align: center;">${fb.title }</th>
				      </tr>
				    </thead>
				    <tbody>
				    <tr>
				     <td colspan="3" style="text-align: left; font-size: 20px; font-weight: bolder;">${fb.nickname }</td>
				    </tr>
				      <tr>
				        <td style="height: 500px;" colspan="3">${fb.contents }</td>
				      </tr>
				    </tbody>
				    </table>
				     <c:if test="${(sessionScope.member.nickname eq fb.nickname) or (sessionScope.member.nickname eq '관리자')}">
			<input type="button" onclick="deleteFreeBoard(${fb.boardNo})" class="talk_btn_right"" value="삭제">
			</c:if>
				    </div>
			</div>
		</div>

	</section>
	<jsp:include page="/WEB-INF/views/common/freshfooter.jsp" />



</body>
</html>