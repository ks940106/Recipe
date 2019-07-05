<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous">
	</script>
<title>Insert title here</title>
<style>
	table * {border:1px solid black; width:100px;height:100px;}
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
		year = 0;
		month = 0;
		window.onload=function(){
			var date = new Date();
			var nowYear = date.getFullYear();
			year = nowYear;
			var nowMonth = date.getMonth()+1;
			month = nowMonth;
			//var nowDate = date.getDate();
			calender(year,month);
		}
		$("#next").click(function(){
			month = month+1;
			if(month==13){
				year= year+1;
				month= 1;
			}
			init();
			calender(year,month);
		});
		$("#prev").click(function(){
			month = month-1;
			if(month==1){
				year=year-1;
				month=12;
			}
			init();
			calender(year,month);
			//var date = new Date();
			//if(date.getFullYear()==year && date.getMonth()==month){
			//}
			///////////////////////////////////////////////////////
		})
		function calender(y,m){
			var firstDay= new Date(y,m-1,1).getDay(); //첫 요일
			var lastDate= new Date(y,m,0).getDate(); //마지막 날짜
			var id = 0; 
			$("#YearMonth").text(y+"년 "+m+"월");
			for(var i = 1; i<=lastDate;i++){
				id = firstDay + i ;
				$("#"+id).text(i);
			}
		}
		function init(){
			$("#day td").text("");
		}
	</script>
</body>
</html>