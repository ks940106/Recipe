<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>
<link href="../resources/css/import.css" rel="stylesheet" />
<link href="../resources/css/global.css" rel="stylesheet" />
<link href="../resources/css/page.css" rel="stylesheet"/>
<link href="../resources/css/common.css" rel="stylesheet" />
<link href="../resources/css/talkBoard.css" rel="stylesheet" />
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
			 <table class="table table-hover">
				    <thead>
				      <tr>
				        <th colspan="2">${fb.title }</th>
				      </tr>
				    </thead>
				    <tbody>
				    <tr>
				     <th colspan="2">${fb.nickname }</th>
				    </tr>
				      <tr>
				        <td style="height: 500px;" colspan="2">${fb.contents }</td>
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
					    	<c:if test="${(sessionScope.member.nickname eq t.commentWriter) or (sessionScope.member.id eq 'admin')}">
							<span>
							<input type="button" onclick="del('${t.commentNo}','${fb.boardNo }','${sessionScope.member.id }');" class="btn-xs btn-danger" value="삭제">
							</span>
						</c:if>
					    	</td>
					    </tr>
				    </c:forEach>
				    <tr>
				    	<td style="padding: 0;" colspan="2">
				    	<input type="hidden" id="level" name="level" value="0">
				    	<textarea name="comment-contents" id="comment_tx" class="form-control" placeholder="" style="height:100px; width:89%; resize:none;"></textarea>
                    <span class="input-group-btn">
                    <button class="btn btn-default" onclick="freeComment('${sessionScope.member.nickname}','${fb.boardNo }');" id="commentInsert_btn">등록</button>
                    </span>
				    	</td>
				    </tr>
				    </tfoot>
				  </table>
				  <c:if test="${(sessionScope.member.nickname eq t.commentWriter) or (sessionScope.member.nickname eq '관리자')}">
			<input type="button" onclick="deleteFreeBoard(${fb.boardNo})" class="btn-lg btn-danger" value="삭제">
			<input type="button" onclick="modifyFreeBoard(${fb.boardNo})" class="btn-lg btn-success" value="수정">
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
			</c:if>
		
	</section>
	<jsp:include page="/WEB-INF/views/common/freshfooter.jsp"></jsp:include>
	<script>
		function deleteFreeBoard(no){
			location.href="/deleteFreeBoard.do?boardNo="+no;
		}
		function modifyFreeBoard(no){
			location.href="/modifyFreeBoard.do?boardNo="+no;
		}
		function freeComment(nickname,no){
			console.log("닉네임 : "+nickname);
			if(nickname == ""){
				alert("로그인해 주세요");
			}else{
			var level = $('#level').val();
			var contents = $('#comment_tx').val();
			console.log(nickname);
			console.log(no);
			console.log(level);
			console.log(contents);
			var data = "nickname="+nickname+"&boardNo="+no+"&level="+level+"&contents="+contents;
			$.ajax({
				url : "/freeBoardCommentInset.do",
				type : "post",
				data : data,
				success : function(data){
					alert(data);
					location.href="/selectFreeBoard.do?boardNo="+no;
				},
				error : function(){
					alert("댓글실패");
				}
			});
			}
			
		}
		
		function del(commentNo,boardNo,memberId){
			var no = commentNo;
			$.ajax({
				url : "/freeBoardDeleteComment.do",
				type : "post",
				data : {no:no},
				success : function(data){
					location.href="/selectFreeBoard.do?boardNo="+boardNo+"&memberId="+memberId;
				},
				error : function(){
					console.log("댓글삭제 실패해따");
				}
			});
		}
		
	</script>

</body>
</html>