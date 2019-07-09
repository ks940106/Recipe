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
		var oneClickSelected = 1; //1번 체크하고 다음다음,전전 달 넘어갈 경우 막기위해
		$(".next").click(function(){
			if(clickState == 1){
				if(oneClickSelected == 2){
					alert("퇴실 날짜를 클릭해주세요.");
					return;
				}
				oneClickSelected = oneClickSelected+1;
			}
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
			if(clickState == 1){
				if(state == 1){
					alert("퇴실날짜는 지난 날짜를 선택할 수 없습니다.");
					return;
				}
				if(oneClickSelected == 0){
					alert("퇴실 날짜를 클릭해주세요.");
					return;
				}
				oneClickSelected = oneClickSelected - 1;
			}
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
			var idPlus = 0; //두개 선택해서 값이 들어왔을 때 마지막 날보다 하루 더 오렌지색 칠해주기위해
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
					$("#"+id).css("background-color","lightgreen");
				}else if(s==1 && i<nowDate){
					$("#"+id).addClass('impossible');
					$("#"+id).css("background-color","lightgray");
				}else if(s==0){
					$("#"+id).addClass('impossible');
					$("#"+id).css("background-color","lightgray");
				}else if(s==2){
					$("#"+id).addClass('possible');
					$("#"+id).css("background-color","lightgreen");
				}
				
				for(var j = 0; j<reservationDate.length; j++){
					if(reservationDate[j]==$("#hidden"+id).val()){
						$("#"+id).css("background-color","orange");
						if(clickState == 0 && j==reservationDate.length-1){ //한개클릭이 아닌 두 개 다 클릭된 상황일 때
							idPlus = id+1;
						}
					}
				}
			}
			if(idPlus != 0){
				$("#"+idPlus).css("background-color","orange");
			}
		}
		
		var clickState = 0; //클릭상태 
		var startId = 0; //시작td id
		var endId = 0; //끝 td id
		var reservationDate = new Array();
		$("#day td").click(function(){
			var className = $(this).attr("class"); //클래스이름을 가져오기 (impossible/possible)
			if(className == 'impossible'){ //클래스이름이 impossible이면 선택불가.
				alert('선택이 불가능한 날짜 입니다.');
			}else if(className == 'possible'){ //클래스이름이 possible이면
				if(clickState == 0){ //클릭상태가 0이면
					$(".possible").css("background-color","lightgreen");
					clickState = clickState + 1;
					$(this).css("background-color","orange"); //누른부분 orange색으로
					startId = $(this).attr('id'); //startId에 누른 곳 Id 값이 시작값으로 들어감.
					reservationDate = [$("#hidden"+startId).val()];
				}else if(clickState == 1){ //한 번 클릭한 뒤 또 클릭하면
					if(startId == $(this).attr('id')){ //만약 startId 와 누른곳의 Id가 같다면
						$(this).css("background-color","lightgreen"); //그곳의 css를 해제하고 
						clickState = 0; //클릭상태 0 으로만듬
						oneClickSelected = 1;
					}else{ //정상적인경우
						if(oneClickSelected == 1){ //같은 달 내에서
						$(this).css("background-color","orange"); //누른곳 orange색으로
						endId = $(this).attr('id'); //endId에 누른곳 Id 값이 끝값으로 들어감
						if(Number(startId)>endId){ //시작Id값은 더 작아야 함. //Number로 해야 이상하게 해당날짜가 포함이 됨...
							var temp = startId;
							startId = endId;
							endId = temp;
						}
						var reservationId = 0;
						reservationDate = new Array(); //DB컬럼용 배열
						for(var i = 0 ; i<endId-startId;i++){// 만약 1~3숙박이면 (3-1) = i= 0,1 두번반복 
							reservationId = Number(startId) + i; // 1,2
							$("#"+reservationId).css("background-color","orange"); //1번째,2번째css바꿈
							reservationDate[i] = $("#hidden"+reservationId).val();
						}
						alert(reservationDate);
						clickState = 0;//클릭상태 0 으로만듬
						oneClickSelected = 1;
						}else if(oneClickSelected == 2){ //다음달에서 선택 시
							var startValue = reservationDate[0];
							var endText = $(this).text();
							var endId = $(this).attr("id");
							var startYear = startValue.substring(0,4);
							var startMonth = startValue.substring(5,7);
							var startDate = startValue.substring(8,10);
							var startLastDate =new Date(startYear,startMonth,0).getDate();
							var index = startLastDate-startDate+1;
							for(var i =0; i<index;i++){
								var plusDate = Number(startDate)+i;
								if(plusDate<10){
									plusDate= "0"+plusDate;
								}
								reservationDate[i] = startYear+"/"+startMonth+"/"+plusDate; 
							}
							for(var i = 0; i<endText-1; i++){
								var plusId = Number(endId) + i -1;
								alert(plusId);
								reservationDate[index+i] = $("#hidden"+plusId).val();
								$("#"+plusId).css("background-color","orange");
							}
							/////
							//endValue 받아서 1일부터 현재일까지 value값 넣고 css변경
							/////
							alert(reservationDate);
							clickState = 0;//클릭상태 0 으로만듬
							oneClickSelected = 1;//한번클릭한곳의 위치를 알기위한 변수
							
							//monthChange - t/f 로 전 달 마지막칸 구분.
							//쿼리고민(누른날부터 끝날까지 다 ,구분자로 가져와서 하나하나 like로 그날짜들에 예약이 되어있는 카라반들을 제외하고 나오게하면 됨)
							//아작스실행 (검색해오기)
						}
					}
				}
			}
		})
		
		
		function init(){ //달 넘어 갈 시 모든 것을 우선 초기화
			$("#day td").html("");
			$("#day td").removeClass("possible");
			$("#day td").removeClass("impossible");
			$("#day td").css("background-color","white");
		}
		function stateNum(y,m){ //과거 현재 미래 판단
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