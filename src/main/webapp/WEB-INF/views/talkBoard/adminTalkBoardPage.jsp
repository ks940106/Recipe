<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>요리 대회 관리자 </title>
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
				<div class="list_field">
					<table class="list_table2">
						<colgroup>
							<col width="10%">
							<col width="10">
							<col width="10%">
							<col width="60%">
							<col width="10%">
						</colgroup>
						<thead>
						<tr>
							<th>No</th>
							<th>Type</th>
							<th>닉네임</th>
							<th>내용</th>
							<th>관리</th>
						</tr>
						</thead>
						<tbody>
						<input type="hidden" name="boardType" value="${type }" >
							<c:forEach items="${pd.list }" var="t" varStatus="status">
							<tr>
								<td>${status.count }</td>
								<c:choose>
									<c:when test="${t.boardType eq 1 }">
										<td>일상톡</td>
									</c:when>
									<c:when test="${t.boardType eq 3 }">
										<td>요리톡</td>
									</c:when>
									<c:when test="${t.boardType eq 5 }">
										<td>후기톡</td>
									</c:when>
								</c:choose>
								<td>${t.nickname }</td>
								<td onclick="view('${t.boardNo}','${t.nickname }','${sessionScope.member.id }')" style="cursor: pointer;" >
								<div style="overflow: hidden; max-height: 100px;">${t.boardContents }</div>
								</td>
								<td><input type="button" onclick="deleteBoard('${t.boardNo}','${type }')" class="admin_btn" value="삭제"></td>
							</tr>
							</c:forEach>
						</tbody>
						<tfoot>
						
						</tfoot>
					</table>
				</div>
				<div id="pageNavi" class="paging">${pd.pageNavi }</div>
			
			</div>
		</div>

	</section>
	<jsp:include page="/WEB-INF/views/common/freshfooter.jsp" />
	

</body>
</html>