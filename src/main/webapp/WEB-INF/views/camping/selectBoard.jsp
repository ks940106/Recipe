<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>
<link href="../resources/css/import.css" rel="stylesheet" />
<link href="../resources/css/global.css" rel="stylesheet" />
<link href="../resources/css/page.css" rel="stylesheet"/>
<link href="../resources/css/common.css" rel="stylesheet" />
<link href="../resources/css/talkBoard.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
<script src="../resources/js/freeBoard/selectFreeBoard.js"/>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/singsingCampingheader.jsp"></jsp:include>
	<div class="bd_cover">
	</div>
	<section>
	<div class="pom_wrap">
		<div class="pomNav">
			<nav class="nav_wrap">
			<div class="nav_con">
				<div class="nav_title">커뮤니티</div>
				<ul class="nav_menu">
					<li><a href="/noticeList.do">공지사항</a><span>&gt;</span></li>
					<li><a href="/freeBoard.do">자유게시판</a><span>&gt;</span></li>
				</ul>
			</div>
			</nav>
		</div>
		<div class="section_content">
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
				    <tfoot>
				    <c:forEach items="${fbc }" var="t">
					    <tr>
					    	<td>${t.commentWriter }</td>
					    	  <% pageContext.setAttribute("crcn", "\n");%> 
					    	<c:set var="commentContent" value="${t.commentContents }"/>
					    	<c:set var="comment" value="${fn:replace(commentContent,'<','&lt') }"/>
					    	<c:set var="comment2" value="${fn:replace(comment,crcn,'<br>') }"/>
					    	
					    	<td>${comment2 }
					    	</td>
					    	<td>
					    	<c:if test="${(sessionScope.member.nickname eq t.commentWriter) or (sessionScope.member.nickname eq '관리자')}">
							<span>
							<input type="button" onclick="del('${t.commentNo}','${fb.boardNo }','${sessionScope.member.id }');" class="freeCommentDel_btn" value="삭제">
							</span>
						</c:if>
					    	</td>
					    </tr>
				    </c:forEach>
				    <tr>
				    	<td style="padding: 0;" colspan="3">
				    	<input type="hidden" id="level" name="level" value="0">
				    	<textarea name="comment-contents" id="comment_tx" class="form-control" placeholder="" style="height:100px; width:89%; resize:none;"></textarea>
                    <span class="input-group-btn">
                    <button class="btn btn-default" onclick="freeComment('${sessionScope.member.nickname}','${fb.boardNo }');" id="commentInsert_btn" style="cursor: pointer;">등록</button>
                    </span>
				    	</td>
				    </tr>
				    </tfoot>
				  </table>
				  <c:if test="${(sessionScope.member.nickname eq fb.nickname) or (sessionScope.member.nickname eq '관리자')}">
			<input type="button" onclick="deleteFreeBoard(${fb.boardNo})" class="talk_btn_right"" value="삭제">
			</c:if>
				<c:if test="${(sessionScope.member.nickname eq fb.nickname) }">
			<input type="button" onclick="modifyFreeBoard(${fb.boardNo})" class="talk_btn_left" value="수정">
				</c:if>
			</div>
			<div style="clear: both; text-align: center; margin-bottom: 10px;">
				<button class="selectBoard_btn" onclick="freelist()">목록으로</button>
			</div>
			<!-- 
			<div class="board_type">
				<input type="hidden" name="nickname" value="${sessionScope.member.nickname }">
				<input type="hidden" name="type" value="${no }">
				${fb.title }
				${fb.nickname }
			</div>
			<div class="d1">
				${fb.contents }
			</div>
			 -->
			
		</div>
		</div>
		
	</section>
	<jsp:include page="/WEB-INF/views/common/freshfooter.jsp"></jsp:include>


</body>
</html>