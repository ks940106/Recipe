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
	<script src="../resources/js/freeBoard/adminTalkBoard.js"/>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" /> 
	<section>
		<div class="wrapper">
	        <nav class="lnb_wrap">
	             <jsp:include page="/WEB-INF/views/common/talkBoard_nav.jsp"/>
	        </nav>
			<div class="section_content">
			<div class="set_field">
					<h1>토크 게시판 관리</h1>
					<div id="cp_div_bg"></div>
				</div>
				<div class="s1" style="width:1060px;">
					<div class="d2" style="margin-top:30px;">
						<img src="/resources/upload/member/${tb.memberImg }">
					</div>
				<c:if test="${(sessionScope.member.nickname eq tb.nickname) or (sessionScope.member.nickname eq '관리자')}">
					<input type="button" onclick="deleteBoard(${tb.boardNo})" class="talk_btn_right" value="삭제">
				</c:if>
				<c:if test="${sessionScope.member.nickname eq tb.nickname }">
					<input type="button" onclick="modifyTalkBoard(${tb.boardNo})" class="talk_btn_left" value="수정">
				</c:if>
			<div class="talk_content1">
	 		<div class="c1">
	 			${tb.nickname }
	 			<div style="font-size: 35px; float: right; margin-top: 10px;">
	 			<img src="/resources/img/talk/138533.png"  style="width:30px; height:30px;">    ${likeCount }
	 			<img src="/resources/img/talk/66932.png"  style="width:30px; height:30px;">    ${commentCount } 
	 			</div>
	 		</div>
	 		<div class="c2">
	 			${tb.boardContents }
	 		<c:forTokens items="${tb.boardImg }" delims="/" var="item">
	 		<div class="d3">
			<img src="/resources/talkBoard/${item}" width="100%">
			</div>
			</c:forTokens>
			</div>
	 		</div>
	 		</div>
				
				
				<div id="pageNavi" class="paging">${pd.pageNavi }</div>
			
			</div>
		</div>

	</section>
	<jsp:include page="/WEB-INF/views/common/freshfooter.jsp" />
	


</body>
</html>