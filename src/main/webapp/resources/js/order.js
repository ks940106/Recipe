/**
 * 
 */

$("#cancellation").click(function(event) {
	var num =$("[name='orderNo']:checked").length;
	if(num<=0){
		alert("취소할 제품을 체크해주세요.");
		event.preventDefault();
	}else{		
		var state = $("[name='orderNo']:checked").parent().siblings('td').eq(4).text();
		
		if(state=="결제취소대기중"){
			alert("취소진행중입니다.");
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