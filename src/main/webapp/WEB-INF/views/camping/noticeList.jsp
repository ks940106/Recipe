<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>싱싱캠핑 공지사항</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>
<link href="../resources/css/import.css" rel="stylesheet" />
<link href="../resources/css/campingReset.css" rel="stylesheet" />
<link href="../resources/css/global.css" rel="stylesheet" />
<link href="../resources/css/page.css" rel="stylesheet"/>
<link href="../resources/css/common.css" rel="stylesheet" />
<link href="../resources/css/talkBoard.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/singsingCampingheader.jsp"></jsp:include>
	<div class="bd_cover">
	</div>
	<section class="noticeView">
	<div class="pom_wrap">
		<div class="pomNav">
			<nav class="nav_wrap">
			<div class="nav_con">
				<div class="nav_title">커뮤니티</div>
				<ul class="nav_menu">
					<li><a href="/noticeList.do">공지사항</a><span>&gt;</span></li>
					<li><a href="/cart.do">자유게시판</a><span>&gt;</span></li>
					<li><a href="/orderList.do">Q&A</a><span>&gt;</span></li>
				</ul>
			</div>
			</nav>
		</div>
			<h1>공지사항</h1>
		<div class="section_content">
		<div class="d1">
			 <table class="table table-hover">
				    <thead>
				      <tr>
				        <th>번호</th>
				        <th>제목</th>
				        <th>작성일</th>
				        
				      </tr>
				     
				    </thead>
				    <tbody>
				    <c:forEach items="${list.notice }" var="n">
				      <tr>
				        <td>${n.idx }</td>
				        <td><a href="/noticeDetail.do?idx=${n.idx }">${n.noticeTitle }</a></td>
				        <td>${n.noticeDate }</td>
				      </tr>
				    </c:forEach>
				  
				    </tbody>
				  </table>
				  ${list.pageNavi }
			</div>
		</div>
	</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/singsingCampingfooter.jsp"></jsp:include>
</body>
</html>