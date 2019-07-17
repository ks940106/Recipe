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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>싱싱캠핑</title>
<style type="text/css">
	body{
		font-family: 'Arita-dotum-Medium';
	}
</style>
</head>
<body>
   <header>
        <div>
            <h1>
                <a href="/views/singsingCampingIndex.jsp">
                    <img src="../resources/img/camping/campinglogo4.png" alt="싱싱캠핑" style="width:250px;"/>
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
                    <li><a href="/index.jsp" class="active">홈</a></li>
                    <li><a href="/campingAbout.do">캠핑장소개</a></li>
                    <li><a href="/campingTravel.do">주변관광지</a>
                    <li><a href="/caravanIntroduce.do">카라반소개</a></li>
       				<li><a href="/calendar.do">예약</a></li>
                    <li><a href="/freeBoard.do">커뮤니티</a></li>

                    <c:choose>
                    <c:when test="${sessionScope.member==null }">
                    	<li><a href="/loginPageCamping.do" style="color: #1f6054;">로그인</a></li>
                    </c:when>
                    <c:when test="${sessionScope.member.name=='관리자' }">
                  		<li><a href="/adminPage.do" style="color: #1f6054;">관리자 페이지</a></li>
                  		<li><a href="/logout.do" style="color: #1f6054;">로그아웃</a></li>
                    </c:when>
                    <c:when test="${sessionScope.member !=null }">
                    	<li><a href="/mypageCamping.do" style="color: #1f6054;">마이페이지</a></li>
                    	<li><a href="/logout.do" style="color: #1f6054;">로그아웃</a></li>
                    </c:when>
                    </c:choose>
                    
                  
                	
                </ul>
                
            </nav>
        </div>
    </header>
</body>
</html>