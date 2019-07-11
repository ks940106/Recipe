<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>
<link href="../resources/css/import.css" rel="stylesheet" />
</head>
	<style>
		.d2{
			border : 1px solid green;
			width : 10%;
			heigth : 100%;
			box-sizing: border-box;
			float: left;
			
		}
		.d3{
			border : 1px solid blue;
			width : 90%;
			height: 100%;
			box-sizing: border-box;
			float: right;
			padding-left : 15px;
			padding-right: 15px;
			margin-bottom: 30px;
		}
		.d4{
			border : 1px solid red;
			width : 100%;
			height : 100px;
			float: right;
		}
		.d5{
			border : 1px solid red;
			width : 100%;
			height : 100%;
			float: right;
			position: relative;
		}
		.btn-like{
			width:10%;
			border : 1px solid green;
			margin-right : 0;
			box-sizing: border-box;
			float: left;
		}
		.comment-box{
			width : 80%;
			border : 1px solid blue;
			float: left;
			position: relative;
		}
	</style>
<body>
	<jsp:include page="/WEB-INF/views/common/singsingRecipeheader.jsp"/>
	<!-- 
	<h1>부히힛</h1>
	<table>
		<tr>
			<th>번호</th>
			<th>타입</th>
			<th>닉네임</th>
			<th>이미지</th>
			<th>내용</th>
		</tr>
		
		<tr>
			<td>${tb.boardNo }</td>
			<td>${tb.boardType }</td>
			<td>${tb.nickname }</td>
			<td>
			<c:forTokens items="${tb.boardImg }" delims="/" var="item">
			<img src="/resources/talkBoard/${item}" width="500">
			</c:forTokens>
			</td>
			<td>${tb.boardContents }</td>
		</tr>
		
	</table>
	 -->
	 <section>
	 <div class="section_content">
	 	<div class="d2">
	 		<p>가나다라</p>
	 	</div>
	 		<div class="d3">
	 			${tb.nickname }
	 			${sessionScope.member.id }
	 		</div>
	 		<div class="d3">
	 			${tb.boardContents }
	 		</div>
	 	
	 		<c:forTokens items="${tb.boardImg }" delims="/" var="item">
	 		<div class="d3">
			<img src="/resources/talkBoard/${item}" width="100%">
			</div>
			</c:forTokens>
			<div class="d4">
				
			</div>
			
			<div class="d5">
			
				<form class="cmtForm"action="/siPreBoardCommentUpdate" method="post">
				
                <div class="btn-like">
                    <button type="button" class="btn btn-default"><img src="http://recipe1.ezmember.co.kr/img/btn_feel.gif"></button>
                </div>
                
                <div id="area_dv" class="comment-box">
                    <textarea name="comment_tx" id="comment_tx" class="form-control" placeholder="" style="height:100px; width:80%; resize:none;"></textarea>
                    <span class="input-group-btn">
                    <button id="reply_submit_btn" class="btn btn-default" type="button" style="height:100px; width:100px;">등록</button>
                    </span>
                </div>
                	
				</form>
			</div>
			
	 </div>
	 <c:set var="nickname" value="${tb.nickname}"/>
	 <c:set var="loginNickname" value="${sessionScope.member.nickname}"/>
	 <c:set var="LoginId" value="${sessionScope.member.id}"/>
	 
	 <c:if test="${(nickname eq loginNickname) or (loginId eq 'admin')}">
	 <input type="button" onclick="deleteBoard(${tb.boardNo})" value="삭제">
	 <input type="button" onclick="modifyTalkBoard(${tb.boardNo})" value="수정">
	 </c:if>
	 </section>
	<jsp:include page="/WEB-INF/views/common/singsingRecipefooter.jsp"/>
	
	<script>
		function deleteBoard(boardNo){
			location.href="/deleteTalkBoard.do?boardNo="+boardNo;
		}
		function modifyTalkBoard(boardNo){
			location.href="/modifyTalkBoard.do?boardNo="+boardNo;
		}
	</script>
</body>
</html>