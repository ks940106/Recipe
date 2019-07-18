/**
 * 
 */
$("#caravanOption").click(function() {
	var caravan =$("#caravanOption").val();
	if(caravan=="카라반A"){
		$("#caravanName").val("카라반A");
		$("#caravanArea").val("13");
		$("#caravanPeople").val("2");
		$("#caravanMaxPeople").val("3");
		$("#caravanPlusCost").val("10000");
		$("#caravanCost").val("40000");
		$("#caravanInfo").text("입실:15시,퇴실:11시,주차안내:1팀당 1대,바베큐: 2인기준 15000원 1인 추가당 5000원추가 ,구비시설:노래방 등");
	}else if(caravan=="카라반B"){
		$("#caravanName").val("카라반B");
		$("#caravanArea").val("22");
		$("#caravanPeople").val("2");
		$("#caravanMaxPeople").val("4");
		$("#caravanPlusCost").val("10000");
		$("#caravanCost").val("60000");
		$("#caravanInfo").text("입실:15시,퇴실:11시,주차안내:1팀당 1대,바베큐: 2인기준 15000원 1인 추가당 5000원추가 ,구비시설:노래방 등");
	}else if(caravan=="카라반C"){
		$("#caravanName").val("카라반C");
		$("#caravanArea").val("31");
		$("#caravanPeople").val("4");
		$("#caravanMaxPeople").val("8");
		$("#caravanPlusCost").val("10000");
		$("#caravanCost").val("100000");
		$("#caravanInfo").text("입실:15시,퇴실:11시,주차안내:1팀당 1대,바베큐: 2인기준 15000원 1인 추가당 5000원추가 ,구비시설:노래방 등");
	}
});
$("#updateCaravan").click(function(event) {
	var num = $("[name='caravanNo']:checked").length;
	if(num<=0){
		alert("수정할 카라반을 체크해주세요");
		event.preventDefault();
	}else if(num>=2){
		alert("한개만 체크해주세요");
		event.preventDefault();
	}else{
		
		updateCaravan();
	}
});
function updateCaravan() {
	var caravanNo = $("[name='caravanNo']:checked").val();
	location.href="/updateCaravan.do?caravanNo="+caravanNo;
	
}