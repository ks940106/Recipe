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
		<th><button type="button" id="prev"><</button></th>
		<th colspan="5" id="YearMonth"></th>
		<th><button type="button" id="next">></button></th>
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
		var nowYear = 0; //현재 년
		var nowMonth = 0; //현재 월
		var nowDate = 0; //현재 일
		state = 1; //0:과거 1:현재 2:미래
		
		year = 0; //임의의 연 변수 
		month = 0; //임의의 월 변수
		
		window.onload=function(){ //페이지 로드 될 때
			var date = new Date();
			nowYear = date.getFullYear(); //현재 년
			year = nowYear; //
			nowMonth = date.getMonth()+1; //현재 월
			month = nowMonth;
			nowDate = date.getDate();
			state = 1; //0:과거 1:현재 2:미래 
			calender(year,month,state);
			
		}
		var oneClickSelected = 1; //1번 클릭 했을 때, 다음 다음,전 전 달 넘어가는 경우를 막기 위한 변수 (클릭시점 당시:1/이전: 0/다음: 2)
		$("#next").click(function(){
			if(clickState == 1){ //1번 클릭 했을 때
				if(oneClickSelected == 2){ //이미 다음 달을 한번 누른 뒤라면
					alert("퇴실 날짜를 클릭해주세요."); // 안넘어가고 return;
					return;
				}
				oneClickSelected = oneClickSelected+1; //증가(다음 : 2)
			}
			month = month+1; //다음 버튼 클릭 시 월 추가 로직
			if(month>12){
				year= year+1;
				month= 1;
			}
			stateNum(year,month); //0:과거 1:현재 2:미래 
			init();
			calender(year,month,state);
		});
		$("#prev").click(function(){
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
			stateNum(year,month); //0:과거 1:현재 2:미래 
			init();
			calender(year,month,state);
		})
		
		
		var StringMonth=""; //String으로 맞추기 위한 변수
		var StringDate =""; //String으로 맞추기 위한 변수
		var idPlus = 0; //두 개 선택해서 값이 들어왔을 때 마지막 날보다 하루 더 오렌지 색 칠 해주기위해
		function calender(y,m,s){
			var firstDay= new Date(y,m-1,1).getDay(); //첫 요일
			var lastDate= new Date(y,m,0).getDate(); //마지막 날짜
			var id = 0; //td의 id
			var value = ""; //value값 "xxxx/xx/xx" 변수
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
				
				id = firstDay + i; //고유 td ID를 얻어 냄.
				$("#"+id).html(i+"<input type='hidden' id='hidden"+id+"' value='"+value+"'>"); //각 td에 input히든을 삽입함
				
				if(s==1 && i>=nowDate){ //현재, 오늘 포함하여 오늘 보다 높은 날짜(오늘 포함한 미래)
					$("#"+id).addClass('possible');
					$("#"+id).css("background-color","lightgreen");
				}else if(s==1 && i<nowDate){ //현재, 어제부터 이전 날짜
					$("#"+id).addClass('impossible');
					$("#"+id).css("background-color","lightgray");
				}else if(s==0){ //과거, 이전 월
					$("#"+id).addClass('impossible');
					$("#"+id).css("background-color","lightgray");
				}else if(s==2){ //미래, 이후 월
					$("#"+id).addClass('possible');
					$("#"+id).css("background-color","lightgreen");
				}
				
				if(clickState == 0 && changeMonth == true){ //클릭상태는 0 그러나 클릭할 당시, 달이 바뀌면서 '1'일 만을 참조 할 경우,바뀐 월의 데이터가 남지 않으므로~
					if(idPlus == $("#hidden"+id).val()){ //changeMonth가 true로 바뀌면서 idPlus에는 '1'일에 대한 정확한 value가 대입됨
						$("#"+id).css("background-color","orange");
					}
				}
				
				for(var j = 0; j<reservationDate.length; j++){
					if(reservationDate[j]==$("#hidden"+id).val()){
						$("#"+id).css("background-color","orange");
						if(clickState == 0 && j==reservationDate.length-1 && changeMonth==false){ //한개클릭이 아닌 두 개 다 클릭된 상황일 때
							idPlus = id+1;
						}
					}
				}
			}
			if(idPlus != 0 && changeMonth==false){
				$("#"+idPlus).css("background-color","orange");
				idPlus = 0;
			}
			
		}
		
		var clickState = 0; //클릭상태 
		var startId = 0; //시작td id
		var endId = 0; //끝 td id
		var startText = 0; //전을 클릭할 때 마지막 색깔 표시위해
		var reservationDate = new Array();
		var changeMonth = false; //text가 1일 때를 클릭할 경우
		$("#day td").click(function(){
			var className = $(this).attr("class"); //클래스이름을 가져오기 (impossible/possible)
			if(className == 'impossible'){ //클래스이름이 impossible이면 선택불가.
				alert('선택이 불가능한 날짜 입니다.');
			}else if(className == 'possible'){ //클래스이름이 possible이고
				if(clickState == 0){ //클릭상태가 0일 때 클릭할 경우,
					$(".possible").css("background-color","lightgreen"); //이전에 남아있는 오렌지색을 초록색으로 바꿈
					$(this).css("background-color","orange"); //누른부분 orange색으로
					startId = $(this).attr('id'); //누른 곳 Id 값이 들어감.
					startText = $(this).text(); //누른 곳 Text 값이 들어감.
					reservationDate = [$("#hidden"+startId).val()]; //임시로 그 곳 value값 들어감.
					changeMonth = false;
					oneClickSelected = 1; //클릭시점을 현재로 바꿈
					clickState = clickState + 1; //클릭상태 1
				}else if(clickState == 1){ //클릭상태가 1일 때 클릭할 경우,
						if(oneClickSelected == 1){ //같은 달 내에서
							if(startId == $(this).attr('id')){ //만약 startId 와 누른곳의 Id가 같다면
								$(this).css("background-color","lightgreen"); //그곳의 css를 해제하고 
								clickState = 0; //클릭상태 0 으로 만듬
								reservationDate = new Array(); //임시 value값 초기화
								return;
							}
						$(this).css("background-color","orange"); //누른곳 orange색으로
						endId = $(this).attr('id'); //endId에 누른곳 Id 값이 끝값으로 들어감
						if(Number(startId)>endId){ //시작Id값은 더 작아야 함
							var temp = startId;
							startId = endId;
							endId = temp;
						}
						var reservationId = 0;
						reservationDate = new Array(); //DB컬럼용 배열
						for(var i = 0 ; i<endId-startId;i++){
							reservationId = Number(startId) + i; //
							$("#"+reservationId).css("background-color","orange"); //오렌지색으로
							reservationDate[i] = $("#hidden"+reservationId).val(); //데이터넣기
						}
						alert(reservationDate);
						clickState = 0;//클릭상태 0 으로만듬
						}else if(oneClickSelected == 2){ //다음달에서 선택 시
							$(this).css("background-color","orange"); //누른곳 orange색으로
							var startValue = reservationDate[0]; //시작값
							var endText = $(this).text(); //두번째 클릭한 텍스트 값
							if(endText == 1){ //1이면
								changeMonth = true; 
								idPlus = $("#hidden"+$(this).attr("id")).val(); //현재 누른 곳 value를 idPlus로 대입
							}
							var endFirstId = $(this).attr("id")-$(this).text()+1; //두번째 클릭한 곳의 첫번째 아이디
							var startYear = startValue.substring(0,4); //20xx
							var startMonth = startValue.substring(5,7); //07
							var startDate = startValue.substring(8,10); //09
							var startLastDate =new Date(startYear,startMonth,0).getDate(); //31
							var index = startLastDate-startDate+1; 
							for(var i =0; i<index;i++){
								var plusDate = Number(startDate)+i;
								if(plusDate<10){
									plusDate= "0"+plusDate;
								}
								reservationDate[i] = startYear+"/"+startMonth+"/"+plusDate; 
							}
							for(var i = 0; i<endText-1; i++){
								var plusId = Number(endFirstId) + i;
								reservationDate[index+i] = $("#hidden"+plusId).val();
								$("#"+plusId).css("background-color","orange");
							}
							alert(reservationDate);
							clickState = 0;//클릭상태 0 으로만듬
						}else if(oneClickSelected == 0){
							$(this).css("background-color","orange"); //누른곳 orange색으로
							if(startText == 1){
								changeMonth = true;
								idPlus = reservationDate[0];
							}
							var startValue = reservationDate[0];
							
							var index = 0;
							var endId = Number($(this).attr("id")); //누른부분 id
							var endValue = $("#hidden"+endId).val();
							var endYear = endValue.substring(0,4); //20xx
							var endMonth = endValue.substring(5,7); //07
							var endDate = endValue.substring(8,10); //09
							var endLastDate =new Date(endYear,endMonth,0).getDate();
							for(;index<endLastDate-endDate+1;index++){
								reservationDate[index] = $("#hidden"+(endId+index)).val();
								$("#"+(endId+index)).css("background-color","orange");
							}
							
							var startYear = startValue.substring(0,4); //20xx
							var startMonth = startValue.substring(5,7); //07
							var startDate = startValue.substring(8,10);
							for(var i = 0; i<startDate-1;i++ ){
								var change = i+1;
								if(change<10){
									change = "0"+change;
								}
								reservationDate[index+i] = startYear+"/"+startMonth+"/"+change; 
							}
							alert(reservationDate);
							clickState = 0;
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
			if(date.getFullYear()==y){ //현재 연과 입력된 연이 같으면
				if(date.getMonth()+1>m){ //현재 월이 입력된 월보다 크면 
					state = 0; //과거
				}else if(date.getMonth()+1==m){ //현재 월과 입력된 월이 같으면 
					state = 1; //현재
				}else{ //현재 월이 입력된 월보다 작으면 
					state = 2; //미래
				}
			}else if(date.getFullYear()>y){ //현재 연이 입력된 연보다 크면
				state = 0; //과거
			}else{ //현재연이 입력된 연보다 작으면
				state = 2; //미래
			}
		}
		
	</script>
</body>
</html>