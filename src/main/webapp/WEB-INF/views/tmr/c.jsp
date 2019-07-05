<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
<title>Insert title here</title>
<style>
	table * {border:1px solid black; width:100px;height:100px;}
	table td{text-align: center;}
	.possible{background-color: lightgreen;}
	.impossible{background-color: lightgray;}
</style>
</head>
<body>

	<table>
	<tr>
		<th><button type="button" id="prev" class="prev"><</button></th>
		<th colspan="5" id="YearMonth"></th>
		<th><button type="button" id="next" class="next">></button></th>
	</tr>
	<tr>
		<th style="color:red;">일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th style="color:blue;">토</th>
	</tr>
	<c:forEach var="i" begin="1" end="6">
		<tr id="day">
			<td id="${7*(i-1)+1 }" style="color:red;"></td>
			<td id="${7*(i-1)+2 }"></td>
			<td id="${7*(i-1)+3 }"></td>
			<td id="${7*(i-1)+4 }"></td>
			<td id="${7*(i-1)+5 }"></td>
			<td id="${7*(i-1)+6 }"></td>
			<td id="${7*(i-1)+7 }" style="color:blue;"></td>
		</tr>
	</c:forEach>
	</table>
	
	<script>
		nowYear = 0; //현재 연
		nowMonth = 0; //현재 월
		nowDate = 0; //현재 일
		state = 1; //0:과거 1:현재 2:미래
		
		year = 0; //임의의 연 변수 
		month = 0; //임의의 월 변수
		StringMonth=""; //input(hidden)의 value값을 String으로 맞추기 위한 변수
		StringDate =""; //input(hidden)의 value값을 String으로 맞추기 위한 변수
		
		
		window.onload=function(){
			var date = new Date();
			nowYear = date.getFullYear();
			year = nowYear;
			nowMonth = date.getMonth()+1;
			month = nowMonth;
			nowDate = date.getDate();
			state = 1;
			calender(year,month,state);
			
		}
		$(".next").click(function(){
			month = month+1; //다음 버튼 클릭 시 월 추가 로직
			if(month>12){
				year= year+1;
				month= 1;
			}
			stateNum(year,month);
			init();
			calender(year,month,state);
		});
		$(".prev").click(function(){
			month = month-1; //이전 버튼 클릭 시 월 감소 로직
			if(month<1){
				year=year-1;
				month=12;
			}
			stateNum(year,month);
			init();
			calender(year,month,state);
		})
		function calender(y,m,s){
			var firstDay= new Date(y,m-1,1).getDay(); //첫 요일
			var lastDate= new Date(y,m,0).getDate(); //마지막 날짜
			var id = 0; //td 아이디 얻기위한 용도
			var value = ""; //td안의 input(hidden) value값을 주기 위해
			$("#YearMonth").text(y+"년 "+m+"월");
			for(var i = 1; i<=lastDate;i++){
				
				if(m<10){
					StringMonth="0"+m;
				}else{
					StringMonth=m;
				}
				if(i<10){
					StringDate="0"+i;
				}else{
					StringDate=i;
				}
				value= y+"/"+StringMonth+"/"+StringDate;
				
				id = firstDay + i;
				$("#"+id).html(i+"<input type='hidden' id='hidden"+id+"' value='"+value+"'>");
				
				if(s==1 && i>=nowDate){
					$("#"+id).addClass('possible');
				}else if(s==1 && i<nowDate){
					$("#"+id).addClass('impossible');
				}else if(s==0){
					$("#"+id).addClass('impossible');
				}else if(s==2){
					$("#"+id).addClass('possible');
				}
			}
		}
		
		var clickState = 0; //클릭상태 
		var startId = 0; //시작td id
		var endId = 0; //끝 td id
		var startDate = 0; // 시작 날
		var endDate = 0; // 끝 날
		$("#day td").click(function(){
			var className = $(this).attr("class"); //클래스이름을 가져오기 (impossible/possible)
			if(className == 'impossible'){ //클래스이름이 impossible이면 선택불가.
				alert('선택이 불가능한 날짜 입니다.');
			}else if(className == 'possible'){ //클래스이름이 possible이면
				if(clickState == 0){ //클릭상태가 0이면
					if(startId !=0){ //제일 첫 선택이 아니면 
						for(var i = startId; i<Number(endId)+1; i++){ //기존의 선택한 startId,endId 사이의 css를 해제함.
							$("#"+i).css("background-color","lightgreen");
						}
					}
					clickState = clickState + 1;
					$(this).css("background-color","orange"); //누른부분 orange색으로
					startId = $(this).attr('id'); //startId에 누른 곳 Id 값이 시작값으로 들어감.
				}else if(clickState == 1){ //한 번 클릭한 뒤 또 클릭하면
					if(startId == $(this).attr('id')){ //만약 startId 와 누른곳의 Id가 같다면
						$(this).css("background-color","lightgreen"); //그곳의 css를 해제하고 
						clickState = 0; //클릭상태0으로만듬
					}else{ //정상적인경우
						$(this).css("background-color","orange"); //누른곳 orange색으로
						endId = $(this).attr('id'); //endId에 누른곳 Id 값이 끝값으로 들어감
						if(startId>endId){ //시작Id값은 더 작아야 함.
							var temp = startId;
							startId = endId;
							endId = temp;
						}
						for(var i = 0 ; i<endId-startId;i++){// 만약 1~3숙박이면 (3-1) = i= 0,1 두번반복 
							var startDayId = Number(startId) + i; // 1,2
							$("#"+startDayId).css("background-color","orange"); //1번째,2번째css바꿈
							if(i==0){ //첫번째 아이디 val값을 startDate에 대입
								startDate = $("#hidden"+startDayId).val();
							}
							if(endId-startId == 1){ //반복횟수가 1인경우 endDate 에도 첫번째 아이디 val값을 대입
								endDate = $("#hidden"+startDayId).val();
							}
							if(endId-startId > 1 && i == endId-startId-1){ // 반복횟수가 1이상인경우 2번이상반복하는 것이며(2박3일이상), 동시에 i가 최대반복 전이면 마지막 날이므로 endDate에 대입
								endDate = $("#hidden"+startDayId).val();
							}
							
						}
						//현재 조금 불확실함 이유는 모름 -> 이것부터 확인
						//다음 달 전 달로 넘어갈 시 로직(전 달)
						//쿼리고민
						//아작스실행 (검색해오기)
						alert(startDate);
						alert(endDate);
						clickState = 0;
					}
				}
			}
		})
		
		
		function init(){
			$("#day td").html("");
			$("#day td").removeClass("possible");
			$("#day td").removeClass("impossible");
			for(var i = startId; i<Number(endId)+1; i++){
				$("#"+i).css("background-color","lightgreen");
			}
		}
		function stateNum(y,m){
			var date = new Date();
			if(date.getFullYear()==y){
				if(date.getMonth()+1>m){
					state = 0;
				}else if(date.getMonth()+1==m){
					state = 1;
				}else{
					state = 2;
				}
			}else if(date.getFullYear()>y){
				state = 0;
			}else{
				state = 2;
			}
		}
		
	</script>
</body>
</html>