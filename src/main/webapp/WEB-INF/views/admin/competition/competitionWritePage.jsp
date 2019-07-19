<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Fresh 요리대회</title>
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
			<jsp:include page="/WEB-INF/views/common/competition_nav.jsp" />
		</nav>
		<div class="section_content">
            <div class="set_field">
					<h1>요리대회 등록하기</h1>
					<div id="cp_div_bg"></div>
				</div>
			<form action="/competitionWritePage.do" method="post" enctype="multipart/form-data">
				<table class="competitionWrite">
						<tbody>
						<tr>			
							<th class="ess">제목</th>
                        	<td><input type="text" name="competitionTitle" style="width:600px;" class="competitionWriteInput"></td>
						</tr>
						<tr>	
							<th class="ess">첨부파일</th>
	                        <td><input type="file" name="fileUpload" style="width:220px;" class="competitionWriteInput"></td>						
						</tr>
						<tr>
							  <div id="cp_th">
                            	<th class="ess">대회 진행 여부</th>
                       		  </div>
                        <td id="cp_table_td">
                            <input type="checkbox" value="Y" name="competitionCheck" checked="checked">진행중
                            <input type="checkbox" value="N" name="competitionCheck" disabled="disabled">진행완료
                        </td>
						</tr>
						<tr>
							<div id="cp_th">
                            <th class="ess" style="padding-top: 50px;">내용</th>
                        </div>    
                        <td><textarea  class="full"  rows="20" cols="50" name="competitionContents"></textarea> </td>
						</tr>
						</tbody>
					</table>
					<div style="text-align: center; margin-top: 30px; margin-left: 80px;">
					<button type="submit" id="cp_write_btn">등록하기</button>
					</div>
			</form>
		</div>
	</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/freshfooter.jsp"/>
</body>
</html>