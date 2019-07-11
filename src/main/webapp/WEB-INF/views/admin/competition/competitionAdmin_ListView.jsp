<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/import.css">
<link rel="stylesheet" type="text/css" href="../resources/css/ui.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/jquery-ui.min.css">
	<script src="../resources/js/jquery-3.1.1.min.js"></script>
	<script src="../resources/js/jquery-ui-1.12.1.js"></script>
	<script src="../resources/js/ui.js"></script>
	<script src="../resources/js/search.js"></script>
	<script src="../resources/js/include.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
	<!-- header Fin -->
<section>
        <div class="wrapper">
            <nav class="lnb_wrap"> 
				<jsp:include	page="/WEB-INF/views/common/competition_nav.jsp" />
			</nav>
            <div class="section_content">
                <!--<div class="cp_nav">
                    <jsp:include page="/WEB-INF/views/common/navPom.jsp"/>
                </div>-->
			<div class="cp_content">
				<div class="cp_content">
					<!--                <img src="../../../resources/img/logo.png" width="200px;">-->
					<!--<h1>요리 대회</h1>
			<p>싱싱레시피의 요리 대회 소식을 확인하실 수 있습니다.</p>-->
					<!--			<div id="cp_div_bg"></div>-->
					<div class="cp_notice">
						<div id="cp_title">${competition.competitionTitle}</div>
						<div id="cp_div_bg"></div>
						<div id="cp_date">${competition.competitionDate}</div>
						<div class="cp_contentsView">
							<div id="cp_contentsImg">
								<c:if test="${not empty competition.competitionImg  }">
									<img
										src="../../../resources/upload/competition/${competition.competitionImg}"
										width="800px;">
								</c:if>
							</div>
							<div id="cp_contents">${competition.competitionContents}</div>
						</div>
					</div>
					<!--                <img src="../../../resources/img/logo.png" width="200px;">-->
							<div class="list_field">
				<div class="list_menu">
					</span>
						<a href="javascript:void(0)" class="btn col_darkGrey f_w">선택변경</a>
					</span>
				</div>
				<table class="list_table">
					<colgroup>
						<col width="40">
						<col width="45">
						<col width="220">
						<col width="100">
						<col width="220">
						<col width="80">
						<col width="80">
						<col width="120">
					</colgroup>
					<thead>
					<tr>
						<th>
							<label>
								<input type="checkbox" name="all_chk">
							</label>
						</th>
						<th>No</th>
						<th>ID</th>
						<th>이름</th>
						<th>연락처</th>
						<th>성별</th>
						<th>상태</th>
						<th>내용</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach items="${participant}" var="p">
					<tr>
						<td>
							<label>
								<input type="checkbox" name="">
							</label>
						</td>
						<td>${p.participantNo}</td>
						<td>${p.id }</td>
						<td>${m.name }</td>
						<td>${m.phone }</td>
						<td>
							${m.gender }
						</td>
						<td>
							${p.participantResult}
						</td>
						<td>
							${p.participantContent}
						</td>
					</tr>
					</c:forEach>
					</tbody>  
				</table>
			</div>
					<div id="cp_btn">
						<button onclick="location.href='/competitionAdmin.do'">목록으로 가기</button>
					</div>
					<!--
			 <button onclick="location.href='/competitionUpdate.do?competitionNo=${competition.competitionNo}'">수정하기</button>   
          <button  onclick="location.href='/competitionDelete.do?competitionNo=${competition.competitionNo}'" >삭제하기</button>
-->
				</div>
			</div>
		</div>
        </div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>