var release	=	{

	orderChk	:	function (idx) {

		if(confirm("작업 확인처리하시겠습니까?")){

			$.ajax({

				url	:	"/release/orderChk",
				data : {idx : idx},
				success:function (data) {

					if(data.trim() == "Y"){
						location.reload();
					}else{
						alert("에러 발생")
					}

				},
				error:function () {

				}
			})

		}

	},

	changeAmount : function (e) {


	},

	releaseGoods : function () {


		var length	=	$('select').length;
		var str		=	new Array();

		for(var i = 0 ; i < length ; i++){

			var place	=	{
				idx		:	$('select').eq(i).val(),
				place	:	$('select').eq(i).find('option:selected').data('place')
			};

			str.push(place);
		}


		for(var i = 0 ; i < str.length ; i++){

			var idx 	=	str[i].idx;
			var name	=	str[i].place;
			var input	=	$('input[data-idx="'+idx+'"][name="'+name+'"]');

			if(input.val() == 0){
				alert('출고되는 상품의 재고가 부족합니다. 확인 후 다시 처리해주세요')
				location.reload();
				return;
			}else{
				input.val(parseInt(input.val())-1)
			}
		}

		var aJson = new Object();
		aJson.place	=	str;
		var sJson	=	JSON.stringify(aJson);

		jQuery.ajaxSettings.traditional = true;	// servlet으로 배열 넘기기

		$.ajax({
			url:"/release/releaseProc",
			method : "post",
			data: {
				releaseList:sJson,
				orderIdx:$('#orderIdx').val()
			},
			// dataType:"json",
			success:function (data) {

				if(data.trim() == "Y"){
					alert("출고처리 완료");
					location.href='/release/listAll';
				}else{
					alert("실패")
				}
			},
			error:function () {
				console.log("에러")
			}
		})

	}

};