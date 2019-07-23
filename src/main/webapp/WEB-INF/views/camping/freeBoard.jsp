<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="../resources/js/freeBoard/freeBoard.js"/>
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
		<div class="d1">
			 <table class="list_table" style="text-align: center">
				    <thead>
				      <tr>
				        <th>번호</th>
				        <th>제목</th>
				        <th>작성자</th>
				        <th>조회수</th>
				      </tr>
				    </thead>
				    <tbody>
				    <c:forEach items="${fb.list }" var="t">
				      <tr>
				        <td>${t.boardNo }</td>
				        <td onclick="select('${t.boardNo}')" style="text-align: left;cursor: pointer; ">${t.title }[${t.commentCount }]</td>
				        <td>${t.nickname }</td>
				        <td>${t.viewCount }</td>
				      </tr>
				    </c:forEach>
				  
				    </tbody>
				  </table>
				  <div class="board_right">
				<a href="#:;" class="freeboard_btn" onclick="insert('${sessionScope.member.nickname}');">등록</a>				
				</div>
			</div>
				<div id="pageNavi" class="paging">${fb.pageNavi }</div>
			</div>
		</div>
	</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/freshfooter.jsp"></jsp:include>

	
	
</body>
</html>