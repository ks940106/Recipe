<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>

<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link href="../resources/css/import.css" rel="stylesheet" />
<link href="../resources/css/talkBoard.css" rel="stylesheet" />
<script  src="../resources/js/talkBoard/modifyTalkBoard.js" />

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/singsingRecipeheader.jsp" />

	<section>
	<div class="pom_bg">
		<div class="pom_top">
			<h1>토크</h1>
			<div id="pom_div_bg"></div>
			<p>나만의 특별한 하루를 공유해요</p>
		</div>
	</div>
	<div class="pom_wrap">
		<form action="/modifyCompleteTalkBoard.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="boardNo" value="${tb.boardNo }"> 
			<input type="hidden" name="boardType" value="${tb.boardType }">
			<input type="hidden" name="nickname" value="${sessionScope.member.nickname}">
			<div class="pomNav">
				<jsp:include page="/WEB-INF/views/talkBoard/talkBoardNav.jsp" />
			</div>
			<div class="section_content">
				<div class="board_type">
					<div class="board_left">
						<span><p>전체글을 볼수 있어요</p></span>
					</div>
				</div>
				<div class="d1">
					<textarea id="contents" name="boardContents">${tb.boardContents }</textarea>
				</div>
				<div class="img_box">
				
					<div id="attach">
					<input type="hidden" name="fullImg" value="${tb.boardImg }">
						<div id="attach2">
							<input type="hidden" id="imgN" value="${fn:length(img) }">
							<input class="uploadInputBox" type="file" id='img_${fn:length(img)}' name="filedata">
						</div>
						<c:forTokens items="${tb.boardImg }" delims="/" var="item"	varStatus="status">
							<div class="preview" value="${status.index }">
								<input type="hidden" name="oneImg" value="${item}">
								 <img class="thumbnail" src="/resources/talkBoard/${item }" value="${status.index }" onclick="deletePreview(this)">
								<p style='display: none'>${item }</p>
							</div>
						</c:forTokens>
						
					</div>
				</div>
				<div class="write_btn">
					<button type="submit" id="submit_btn" class="btn-lg btn-primary">등록</button>
					<button type="button" class="btn-lg btn-default"
						data-dismiss="modal" onclick="location.href='/mainBoard.do'">취소</button>
				</div>
			</div>
		</form>
	</div>
	</section>
	
	<jsp:include page="/WEB-INF/views/common/singsingRecipefooter.jsp" />
</body>
</html>