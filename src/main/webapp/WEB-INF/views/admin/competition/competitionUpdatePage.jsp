<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Fresh 요리 대회</title>
<link rel="stylesheet" type="text/css"
	href="../resources/css/import.css">
<link rel="stylesheet" type="text/css" href="../resources/css/ui.css">
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
<link rel="stylesheet" type="text/css"
	href="../resources/css/jquery-ui.min.css">
<script src="../resources/js/jquery-3.1.1.min.js"></script>
<script src="../resources/js/jquery-ui-1.12.1.js"></script>
<script src="../resources/js/ui.js"></script>
<script src="../resources/js/search.js"></script>
<script src="../resources/js/include.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
	<section>
	<div class="wrapper">
		<nav class="lnb_wrap"> 
		<jsp:include	page="/WEB-INF/views/common/competition_nav.jsp" /> </nav>
		<div class="section_content">
			<div class="table-wrapper"
				style="text-align: center; width: 1160px; margin: 0 auto; margin-top: 100px;">
				<h2 class="list_field_h2">요리 대회 정보 수정</h2>
						<div class="pom_div_bg"></div>
				<form action="/competitionUpdate.do" method="post"
					enctype="multipart/form-data">
					<table class="competitionWrite">
						<tbody>
						<input type="hidden" name="competitionNo" value="${competition.competitionNo }">
						<tr>		
							<th class="ess">제목</th>
							<td><input type="text" class="competitionWriteInput" name="competitionTitle" style="width:600px;" value="${competition.competitionTitle }"></td>
						</tr>
						<tr>
							<div id="cp_th">
                            	<th class="ess">대회 진행 여부</th>
                       		  </div>
							<td id="cp_table_td" style="font-size: 16px;">
								<input type="radio" value="Y" name="competitionCheck" checked="checked">진행중
								<input type="radio" value="N" name="competitionCheck">진행완료
							</td>
						</tr>
						<tr>
							<th class="ess" >첨부파일</th>
							<td><input type="hidden" id="status" name="status"	value="stay">
								<div class="placeholder">
									<span style="color: black; font-size: 14px;">*파일유형 jpg,
										jpeg, png, gif 최대파일크기 10MB</span>
								</div>
								<div class="file_box">
									<label for="hostFile" style="width: 100%;">
										<span style="color: white;">파일첨부</span> 
										<c:if test="${not empty competition.competitionImg}">
											<img src="resources/upload/competition/${competition.competitionImg}" style="width: 300px; height: 300px;" class="file_img">
										</c:if> 
										<input type="hidden" name="oldFilename"	value="${competition.competitionImg}"> <!--예전파일명 --> 
										<input type="file" name="fileUpload" id="competitionFile" accept="image/*" onchange="loadImg(this)" value="${competition.competitionImg}" style="margin-left: 10px;">
										<button type="button" id="imgdelete">삭제하기</button>
									</label>
								</div></td>
						</tr>
						<tr>
							<th class="ess">내용</th>
							<td><textarea name="competitionContents" class="full" rows="20" cols="50">${competition.competitionContents }</textarea>
							</td>

						</tr>
						<tr>
							<th colspan="2" style="text-align: center;">
								<button type="submit" id="cp_update">수정하기</button>
							</th>
						</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/freshfooter.jsp"/>
	<script>
      function loadImg(event){
         if(event.files.length!=0 && event.files[0] != 0){
            var reader = new FileReader();
            reader.readAsDataURL(event.files[0]);
            reader.onload = function(e){
               $(".file_img").attr("src",e.target.result);
               $(".file_img").show();
            }
         }else{
            $(".file_img").attr("style","background-image:url(/img/logo.png)");
            
         }
      }
       $("#imgdelete").click(function(){
          $("#competitionFile").val("");
          console.log( $("#competitionFile").val());
          $(".file_img").hide();
       });
       
       $(document).ready(function(){
    	      $("#imgdelete").click(function(){
    	         if(confirm("첨부파일을 삭제하시겠습니까?")){
    	            $(".delFile").hide();
    	            $("#file").show();
    	            $("#status").val("delete");
    	         }
    	      });
    	   });
      </script>
</body>
</html>