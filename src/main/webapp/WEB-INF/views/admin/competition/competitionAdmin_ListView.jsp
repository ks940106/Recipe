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
	<script src="../resources/js/include.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
	<!-- header Fin -->
<section>
<input type="hidden" value="${count }" id="totalCount">
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
						<div id="cp_div_bg1"></div>
						<div id="cp_date">${competition.competitionDate}</div>
						<div class="cp_contentsView">
							<div id="cp_contentsImg">
								<c:if test="${not empty competition.competitionImg  }">
									<img
										src="../../../resources/upload/competition/${competition.competitionImg}"
										width="800px;">
								</c:if>
							</div>
							<div id="cp_contents">
							${competition.competitionContents}
							
							</div>
						</div>
					</div>
					<!--                <img src="../../../resources/img/logo.png" width="200px;">-->
					
					<div class="list_field">
					<h2 class="list_field_h2">참가자 리스트 테이블</h2>
					<div class="pom_div_bg"></div>
						<div class="list_menu">
							</span>
								<button id="checkResult">합격자로 변경</button>
							</span>
						</div>
						<div class="cp_tableWrap">
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
							<c:forEach items="${list}" var="vo">
							<tr>
								<td>
									<label>
										<input type="checkbox" class="checkList" name="chkName" value="${vo.participantNo}">
									</label>
								</td>
								<td>${vo.participantNo}</td>
								<td>${vo.id}</td>
								<td>${vo.name}</td>
								<td>${vo.phone}</td>
								<td>
									${vo.gender}
								</td>
								<td>
									${vo.participantPass}
								</td>
								<td class="viewQna">								
									${vo.participantContent}
								</td>
							</tr>
							</c:forEach>
							</tbody>  
						</table>
					</div>
					</div>
					
					<div class="list_field">
						<h2 class="list_field_h2">합격자 리스트 테이블</h2>
						<div class="pom_div_bg"></div>
						<div class="list_menu">
							</span>
								<button id="checkPass">불합격자로 변경</button>
								<button id="cResult" >우승자등록</button>
							</span>
						</div>
						<div class="cp_tableWrap">
						<table class="list_table1">
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
								<th width="100px;">결과</th>
							</tr>
							</thead>
							<tbody>
							<tr>
								<div style="margin-bottom: 10px;">합격자 수 : ${count }</div>
							</tr>
							<c:forEach items="${passList}" var="pl">
							<tr>
								<td>
									<label>
										<input type="checkbox" class="checkPassList" name="passName" value="${pl.participantNo}">
									</label>
								</td>
								<td>${pl.participantNo}</td>
								<td>${pl.id}</td>
								<td>${pl.name}</td>
								<td>${pl.phone}</td>
								<td>
									${pl.gender}
								</td>
								<td>
									${pl.participantPass}
								</td>
								<td>
									${pl.participantContent}
								</td>
								<td>
									<p class="pResult">${pl.participantResult }</p>
									<%-- <input type="text" value="${pl.participantResult }" class="pResult"> --%>
								</td>
								
							</tr>
							</c:forEach>
							</tbody>  
						</table>
						</div>
					</div>
					<div id="cp_btn">
					
						<button onclick="location.href='/competitionAdminList.do?competitionCheck=Y'">목록으로 가기</button>
					</div>
					
					
			<div class="layer_popup" style="display:none;position:fixed;">
			<div class="popup_wrap">
                <div class="pop_header">
                	<input type="hidden" name="qaNo" class="CommentNo" value="">                    
					<p class="pop_p">사연</p>
                    <button><a href="javascript:void(0);" class="popcencle" style="color:#fff; text-decoration: none;">X</a></button>
                </div>
				<div class="pop_container">
                    <div class="box_l">
                        
                    </div>
                   <div class="qna_p">
				   
			     </div>
				</div>
			</div>
		</div>
		<div class="hostpopupMask"> 
 		</div> 
				</div>
			</div>
		</div>
        </div>
	</section>
	<jsp:include page="/WEB-INF/views/common/singsingRecipefooter.jsp"/>
	 <script>
	 window.onload = function(){
		 totalCount = (Number)($("#totalCount").val());
		/*  alert(totalCount);	 */
		 for(var i = 0;i<$('.pResult').length;i++){
			 if($(".pResult").eq(i).text() == "우승"){
					$(".pResult").eq(i).parent().parent().css("background-color","red");
					$(".pResult").eq(i).parent().parent().css("color","#fff");
					$(".checkPassList").eq(i).prop("checked",true);
				}
		 }		
	 }
	 	
		$("#checkResult").click(function(){
			var checkArr = []; // 배열 초기화
			var selectCount = (Number)($("input[name='chkName']:checked").length);
			console.log("토탈:" + totalCount);
			console.log("선택:"+selectCount);
			var sum = (selectCount+totalCount);
			console.log("합:"+sum);
			if(sum>10){
				alert("최대 10명 까지만 선택 가능합니다.");
				return;
			}
			for(var i = 0; i<selectCount; i++){
				checkArr[i] = $("input[name='chkName']:checked").eq(i).val();
			}
			location.href="/participantCheck.do?checkArr="+checkArr+"&competitionNo=${competition.competitionNo}";
	
			
		});
		$("#checkPass").click(function(){
			var checkPass = [];
			$("input[name='passName']:checked").each(function(i){
				checkPass.push($(this).val());
				/* alert(checkPass); */
				totalCount = totalCount - 1;
			});
			location.href="/participantPassCheck.do?checkPass="+checkPass+"&competitionNo=${competition.competitionNo}";
		});
		$("#cResult").click(function(){
			var checkRes = $("input[name='passName']:checked");	
			var checkResult = checkRes.val();
			/* alert(checkResult); */
			if($("input[name='passName']:checked").length>1){
				alert("1명만 선택해주세요");
				return;
			}
			 for(var i = 0;i<$('.pResult').length;i++){
				 if($(".pResult").eq(i).text() == "우승"){
						$(".pResult").eq(i).parent().parent().css("background-color","#fff");
						$(".checkPassList").eq(i).prop("checked",false);
					}
			 }
			location.href="/participantResult.do?checkResult="+checkResult+"&competitionNo=${competition.competitionNo}";
		});
		   
		$(".viewQna").click(function(){	
			/* var str = $(this).val(); */
			$('.layer_popup').show();
			$('.hostpopupMask').show();
			$('.qna_p').html($(this).html());
			console.log($(this).html());
		});
		$(".popcencle").click(function(){
			$('.layer_popup').hide();
			$('.hostpopupMask').hide();
		});

	</script> 
</body>
</html>