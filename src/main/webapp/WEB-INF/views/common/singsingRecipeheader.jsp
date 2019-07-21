<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script
	src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous">
	</script>
<%--	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">--%>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <header>
        <div>
            <h1>
                <a href="#">
                    <img src="../resources/img/logo.png" />
                </a>
            </h1>
            <nav>
                <label for="mnav" class="mui">
                    <span></span>
                    <span></span>
                    <span></span>
                </label>
                <input type="checkbox" id="mnav" class="mui" />
                <ul>
                    <li><a href="/" class="active">홈</a></li>
                    <li><a href="/recipePage.do">레시피</a></li>
     				<li><a href="/tmr.do">이달의레시피</a></li>

     				<c:choose>
     					<c:when test="${empty sessionScope.member }">
     						<li><a href="/competitionList.do?competitionCheck='Y'&id='null'">요리대회</a></li>
     					</c:when>
     					<c:otherwise>
     						<li><a href="/competitionList.do?competitionCheck='Y'&id=${sessionScope.member.id}">요리대회</a></li>
     					</c:otherwise>
     				</c:choose>
                    <li><a href="/mainBoard.do?boardType=0">토크</a></li>
                    <c:choose>
                    <c:when test="${sessionScope.member==null }">
                    	<li><a href="/loginPage.do" style="color: #1f6054;">로그인</a></li>
                    </c:when>
                    <c:when test="${sessionScope.member.name=='관리자' }">
                  		<li><a href="/orderRegPage.do" style="color: #1f6054;">관리자 페이지</a></li>
                  		<li><a href="/logout.do" style="color: #1f6054;">로그아웃</a></li>
                    </c:when>
                    <c:when test="${sessionScope.member !=null }">
                    	<li><a href="/mypage.do" style="color: #1f6054;">마이페이지</a></li>
                    	<li><a href="/logout.do" style="color: #1f6054;">로그아웃</a></li>
                    </c:when>
                    </c:choose>
                    
                  
                	
                </ul>
                
            </nav>
            <!-- <ul>
                <li>
                    <h2>We Are Awesome Creative Agency</h2>
                    <p>
                        This is Photoshop's version  of Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit.
                    </p>
                    <a href="#" class="btn_more">LEARN MORE</a>
                </li>
            </ul>
            <ol>
                <li><a href="#" class="active">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
            </ol> -->
        </div>
    </header>
</body>
</html>