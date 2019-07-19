/**
 * 
 */

$("#cancellation").click(function(event) {
	var num =$("[name='orderNo']:checked").length;
	if(num<=0){
		alert("취소할 제품을 선택해주세요.");
		event.preventDefault();
	}else{		
		var state = $("[name='orderNo']:checked").parent().siblings('td').eq(4).text();
		
		if(state=="결제취소대기중"){
			alert("취소진행중입니다.");
			event.preventDefault();
		}else if(state=="결제완료"){
			alert("결제 완료된 제품입니다.")
			event.preventDefault();
		}else if(state=="결제취소완료"){
			alert("결제 취소 완료된 제품입니다.")
			event.preventDefault();
		}else{
			var result =confirm("결제 취소를 하시겠습니까?");
			if(!result){
				event.preventDefault();
				alert(noarray);
			};
		}
		
	}
});