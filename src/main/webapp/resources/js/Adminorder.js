 /**
 * 
 */
function getState(orderState){
	if(orderState==1) {
		return "결제진행중";
	}else if(orderState==2) {
		return "결제완료";
	}else if(orderState==3) {
		return "결제취소대기중";
	}else if(orderState==4) {
		return "결제취소완료";
	}else {
		return "결제 실패";
	}
}
$("document").ready(function() {
	seletecancelAdminList(1);
	seletepaymentAdminList(1);
	seletepaymentSuccessAdminList(1);
	seletecancelsuccessAdminList(1);
});
function seletecancelsuccessAdminList(pageNo) {
	$.ajax({
		url: "/seletecancelsuccessAdminList",
		type : 'POST',
		data : {pageNo:pageNo},
		dateType:"json",
		success:function(data){
			var list = data.Orderlist;
			$("#payment3").empty();
			$(".paymentCount3").empty();
			for(var i=0;i<list.length;i++){
				var td1 = $('<td>'+list[i].orderCode+'</td>');
				var td2 = $('<td>'+list[i].name+'</td>');
				var td3 = $('<td>'+list[i].phone+'</td>');
				var td4 = $('<td>'+list[i].orderCount+'</td>');
				var td5 = $('<td>'+list[i].orderPrice+'</td>');
				var tr = $('<tr>').append(td1).append(td2).append(td3).append(td4).append(td5);
				$("#payment3").append(tr);
			}
			$(".paymentCount3").append(data.pageNavi);
		}
	});
}
function seletepaymentSuccessAdminList(pageNo) {
	$.ajax({
		url: "/seletepaymentSuccessAdminList",
		type : 'POST',
		data : {pageNo:pageNo},
		dateType:"json",
		success:function(data){
			var list = data.Orderlist;
			console.log(data.Orderlist);
			console.log(data.pageNavi);
			$("#payment2").empty();
			$(".paymentCount2").empty();
			for(var i=0;i<list.length;i++){
				console.log(list[i].addr1);

				var td1 = $('<td>'+list[i].orderCode+'</td>');
				var td2 = $('<td>'+list[i].name+'</td>');
				var td3 = $('<td>'+list[i].phone+'</td>');
				var td4 = $('<td>'+list[i].orderCount+'</td>');
				var td5 = $('<td>'+list[i].orderPrice+'</td>');
				var tr = $('<tr>').append(td1).append(td2).append(td3).append(td4).append(td5);
				$("#payment2").append(tr);
			}
			$(".paymentCount2").append(data.pageNavi);
		}
	});
}
function seletepaymentAdminList(pageNo) {
	$.ajax({
		url: "/seletepaymentAdminList",
		type : 'POST',
		data : {pageNo:pageNo},
		dateType:"json",
		success:function(data){
			var list = data.Orderlist;
			console.log(data.Orderlist);
			console.log(data.pageNavi);
			$("#payment1").empty();
			$(".paymentCount1").empty();
			for(var i=0;i<list.length;i++){
				console.log(list[i].addr1);
				var td = $('<td><input type="checkbox" name="orderNo" value="'+list[i].orderNo+'"></td>');
				var td1 = $('<td>'+list[i].orderCode+'</td>');
				var td2 = $('<td>'+list[i].name+'</td>');
				var td3 = $('<td>'+list[i].phone+'</td>');
				var td4 = $('<td>'+list[i].orderCount+'</td>');
				var td5 = $('<td>'+list[i].orderPrice+'</td>');
				var tr = $('<tr>').append(td).append(td1).append(td2).append(td3).append(td4).append(td5);
				$("#payment1").append(tr);
			}
			$(".paymentCount1").append(data.pageNavi);
		}
	});
}
function seletecancelAdminList(pageNo) {
	$.ajax({
		url: "/seletecancelAdminList",
		type : 'POST',
		data : {pageNo:pageNo},
		dateType:"json",
		success:function(data){
			var list = data.Orderlist;
			console.log(data.Orderlist);
			console.log(data.pageNavi);
			$("#payment").empty();
			$(".paymentCount").empty();
			for(var i=0;i<list.length;i++){
				console.log(list[i].addr1);
				var td = $('<td><input type="checkbox" name="orderNo" value="'+list[i].orderNo+'"></td>');
				var hidden = $('<input type="hidden" name="orderCode" value="'+list[i].orderCode+'">')
				var hidden1 = $('<input type="hidden" name="orderPrice" value="'+list[i].orderPrice+'"> ')
				var td1 = $('<td>'+list[i].orderCode+'</td>');
				var td2 = $('<td>'+list[i].name+'</td>');
				var td3 = $('<td>'+list[i].phone+'</td>');
				var td4 = $('<td>'+list[i].orderCount+'</td>');
				var td5 = $('<td>'+list[i].orderPrice+'</td>');
				var tr = $('<tr>').append(hidden1).append(hidden).append(td).append(td1).append(td2).append(td3).append(td4).append(td5);
				$("#payment").append(tr);
			}
			$(".paymentCount").append(data.pageNavi);
		}
	});
}
$("#cancellation").click(function() {
	var orderNo = $("[name='orderNo']:checked");
	var noarray1 = new Array();
	for(var i=0;i<orderNo.length;i++){
		noarray1[i] = orderNo.eq(i).val();
	}
	location.href="/successAdminOrder.do?orderNo="+noarray1;
});