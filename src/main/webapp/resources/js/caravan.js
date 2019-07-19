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
$("#updaterepresentationCaravan").click(function(event) {
	var num =$("[name='caravanNo']:checked").length;
	if(num<=0){
		alert("수정할 카라반을 체크해주세요");
		event.preventDefault();
	}else{
		if(num>=2){
			alert("한개만 체크해주세요");
			event.preventDefault();
		}
	}
});
function loadImg(f){
    if(f.files.length !=0 && f.files[0] !=0){
       //배열형태로 가지고 옴 //파일이 업로드 되면 이라는 조건 배열길이가 0이 아니거나 0번에 크기가 0이아니면
       //JS의 FileReader객체 -> 객체 내부의 result 속성에 파일 컨텐츠가 있음
       var reader = new FileReader();
       reader.readAsDataURL(f.files[0]); //선택한 파일 경로를 읽어옴
       reader.onload=function(e){ //다 읽어 왔으면 실행
          $("#img-view").attr('src', e.target.result);
       }
    }else{
       $("#img-view").attr('src','');
    }
 }
function loadImg1(f){
    if(f.files.length !=0 && f.files[0] !=0){
       //배열형태로 가지고 옴 //파일이 업로드 되면 이라는 조건 배열길이가 0이 아니거나 0번에 크기가 0이아니면
       //JS의 FileReader객체 -> 객체 내부의 result 속성에 파일 컨텐츠가 있음
       var reader = new FileReader();
       reader.readAsDataURL(f.files[0]); //선택한 파일 경로를 읽어옴
       reader.onload=function(e){ //다 읽어 왔으면 실행
          $("#img-view1").attr('src', e.target.result);
       }
    }else{
       $("#img-view1").attr('src','');
    }
 }
function loadImg2(f){
    if(f.files.length !=0 && f.files[0] !=0){
       //배열형태로 가지고 옴 //파일이 업로드 되면 이라는 조건 배열길이가 0이 아니거나 0번에 크기가 0이아니면
       //JS의 FileReader객체 -> 객체 내부의 result 속성에 파일 컨텐츠가 있음
       var reader = new FileReader();
       reader.readAsDataURL(f.files[0]); //선택한 파일 경로를 읽어옴
       reader.onload=function(e){ //다 읽어 왔으면 실행
          $("#img-view2").attr('src', e.target.result);
       }
    }else{
       $("#img-view2").attr('src','');
    }
 }