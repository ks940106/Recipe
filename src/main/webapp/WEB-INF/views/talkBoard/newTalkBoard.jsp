<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>
<title>Insert title here</title>
<link href="../resources/css/import.css" rel="stylesheet" />
<link href="../resources/css/talkBoard.css" rel="stylesheet" />
<script type="text/javascript"
	src="../resources/js/talkBoard/newTalkBoard.js" />
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
		<form action="insertTalkBoard.do" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="nickname"
				value="${sessionScope.member.nickname }"> <input
				type="hidden" name="boardType" value="${boardType}">
			<div class="pomNav">
				<jsp:include page="/WEB-INF/views/talkBoard/talkBoardNav.jsp" />
			</div>
			<div class="section_content">
				<div class="board_type">
					<div class="board_left">
						<span><p>새 글을 등록할수 있어요</p></span>
					</div>
				</div>
				<div class="d1">
					<textarea id="contents" name="boardContents"></textarea>
				</div>
				<div class="img_box">
					<div id="attach">
						<div id="attach2">
							<input class="uploadInputBox" type="file" id="img_0"
								name="filedata">
						</div>
					</div>
				</div>
           		<div class="write_btn">
					<button type="submit" id="submit_btn" class="modify_btn">등록</button>
					<button type="button" class="modify_btn"
						data-dismiss="modal" onclick="location.href='/mainBoard.do'">취소</button>
				</div>
			</div>
		</form>
	</div>
	</section>
	
	<jsp:include page="/WEB-INF/views/common/freshfooter.jsp" />
</body>
</html>