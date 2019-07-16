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
<link href="../resources/css/talkBoard.css" rel="stylesheet" />
<script type="text/javascript" src="../resources/js/talkBoard/selectTalkBoard.js" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/singsingRecipeheader.jsp"/>
	
	 <section>
	 <div class="pom_bg">
        <div class="pom_top">
            <h1>이달의 레시피</h1>
            <div id="pom_div_bg"></div>
            <p>이번달에 가장 많은 추천을 받은 레시피</p>
        </div>
    </div>
    <div class="pom_wrap">
		<div class="pomNav">
			<jsp:include page="/WEB-INF/views/talkBoard/talkBoardNav.jsp" />
		</div>
    
    
    
	 <div class="section_content">
	 	
	 		<div class="d3">
	 			${tb.nickname }
	 			<c:if test="${(sessionScope.member.nickname eq tb.nickname) or (loginId eq 'admin')}">
				<input type="button" onclick="deleteBoard(${tb.boardNo})" class="btn-lg btn-primary" value="삭제">
				<input type="button" onclick="modifyTalkBoard(${tb.boardNo})" class="btn-lg btn-primary" value="수정">
				</c:if>
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
				<input type="hidden" name="commentId" value="${sessionScope.member.id }">
				
				<c:if test="${not empty tbc[0].commentNo}">
				<c:forEach items="${tbc}" var="t">
					<div class="comment-div">
					
						<p>${t.commentWriter }</p>
						<p>${t.commentContents }</p>
						<c:if test="${(sessionScope.member.nickname eq t.commentWriter) or (sessionScope.member.id eq 'admin')}">
							<span><a href="#:;" onclick="del('${t.commentNo}','${tb.boardNo }');">삭제</a></span>
						</c:if>
					</div>
				</c:forEach>
				</c:if>
				
                <div class="btn-like">
                    <button type="button" class="btn btn-default"><img src="http://recipe1.ezmember.co.kr/img/btn_feel.gif"></button>
                </div>
                
                <div id="area_dv" class="comment-box">
                <input type="hidden" id="level" name="level" value="0">
                    <textarea name="comment-contents" id="comment_tx" class="form-control" placeholder="" style="height:100px; width:90%; resize:none;"></textarea>
                    <span class="input-group-btn">
                    <button class="btn btn-default" onclick="comment('${sessionScope.member.nickname}','${tb.boardNo }');" id="commentInsert_btn">등록</button>
                    </span>
                </div>
			</div>
	 	</div>
	 	
	 </div>
	 </section>
	<jsp:include page="/WEB-INF/views/common/singsingRecipefooter.jsp"/>

</body>
</html>