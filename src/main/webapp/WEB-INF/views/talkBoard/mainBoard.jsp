<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>
<link href="../resources/css/import.css" rel="stylesheet" />
<link href="../resources/css/talkBoard.css" rel="stylesheet" />
<script type="text/javascript" src="../resources/js/talkBoard/talkBoard.js" />

</head>
<body>

	<jsp:include page="/WEB-INF/views/common/singsingRecipeheader.jsp" />
	<section>
	<div class="pom_bg4">
	</div>
	<div class="pom_wrap">
		<div class="pomNav">
			<jsp:include page="/WEB-INF/views/talkBoard/talkBoardNav.jsp" />
		</div>

		<div class="section_content">
			<div class="board_type">
				<div class="board_left">
					<input type="hidden" id="selectType" value="${pd.type }">
					<c:if test="${pd.type eq '0' }">
					<span><p>전체글을 볼수 있어요</p></span>
					</c:if>
					<c:if test="${pd.type eq '1' }">
					<span><p>일상톡을 볼수 있어요</p></span>
					</c:if>
					<c:if test="${pd.type eq '3' }">
					<span><p>요리톡을 볼수 있어요</p></span>
					</c:if>
					<c:if test="${pd.type eq '5' }">
					<span><p>후기톡을 볼수 있어요</p></span>
					</c:if>
					
				</div>
				<div class="board_right">
				<a href="#:;" class="board_btn" onclick="insert();">등록</a>				
				</div>
				<div id="go_register_dv" class="list-group talk_smn"
					style="display:none; width: 280px; text-align:center; top:50px; border:2px solid #000; position: absolute;  background-color: white; z-index: 10;">
					<a href="/newTalkBoard.do?boardType=1" class="list-group-item">일상톡</a> 
					<a href="/newTalkBoard.do?boardType=3" class="list-group-item">요리톡</a> 
					<a href="/newTalkBoard.do?boardType=5" class="list-group-item">후기톡</a>
				</div>
			</div>
				<input type="hidden" id="sessionId" value="${sessionScope.member.id }">
				
			<c:forEach items="${pd.list}" var="t">

				<div class="d1">
					<div class="d2" style="margin-top:30px;">
						<img src="/resources/upload/member/${t.memberImg }">
					</div>
					<div class="board_content_right">
					<div class="c1"> <p style="float:left;">${t.nickname }</p>
						<div style="font-size: 35px; float: right;">
	 			<img src="/resources/img/talk/138533.png"  style="width:25px; height:25px;">    ${t.likeCount }
	 			<img src="/resources/img/talk/66932.png"  style="width:25px; height:25px;">    ${t.commentCount } 
	 			</div>
					</div>
					<div class="c2" style="height:170px; max-height: 170px; cursor: pointer;" onclick="select('${t.boardNo}','${sessionScope.member.id }','${t.nickname }')">
						${t.boardContents }</div>
					<div class="c3" style="cursor: pointer;"onclick="select('${t.boardNo}','${sessionScope.member.id }','${t.nickname }');">
						<c:forTokens items="${t.boardImg }" delims="/" var="item" varStatus="g">
							<c:if test="${g.count==1 }">
							<!-- 
								<img src="/resources/talkBoard/${item}" width="800px"
									class="imgsum">
							 -->
							 <div class="img_bg" style="background-image: url('../../resources/talkBoard/${item}');">
							 	
							 </div>
							</c:if>
						</c:forTokens>
					</div>
					</div>
				</div>
			</c:forEach>
			<div id="pageNavi" class="paging">${pd.pageNavi }</div>
			</div>
		
	</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/freshfooter.jsp" />

</body>
</html>