


$( function() {
	$( "#dateS,#dateE").datepicker({
		changeMonth: true,
		changeYear: true,
		dateFormat: 'yy-mm-dd',
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear: true,
		// yearSuffix: '년',
		maxDate:0 // 오늘 이전 날짜 선택 불가
	});

	$( "#bDateS,#bDateE").datepicker({
		changeMonth: true,
		changeYear: true,
		dateFormat: 'yy-mm-dd',
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear: true
		// yearSuffix: '년',
	});
} );



// 기간조회

function setSearchDate(start){

	var num = start.substring(0,1);
	var str = start.substring(1,2);

	var today = new Date();
	var year = today.getYear()+1900;

	//var year = today.getFullYear();
	//var month = today.getMonth() + 1;
	//var day = today.getDate();

	var endDate = $.datepicker.formatDate('yy-mm-dd', today);
	$('#dateE').val(endDate);

	if(str == 'd'){
		today.setDate(today.getDate() - num);
	}else if (str == 'w'){
		today.setDate(today.getDate() - (num*7));
	}else if (str == 'm'){
		today.setMonth(today.getMonth() - num);
		today.setDate(today.getDate() + 1);
	}else if (str == 'y'){
		today.setMonth(today.getYear() - num);
		today.setDate(today.getDate() + 1);
	}

	var startDate = $.datepicker.formatDate('yy-mm-dd', today);
	$('#dateS').val(startDate);

	// 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
	$("#dateE").datepicker( "option", "minDate", startDate );

	// 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
	$("#dateS").datepicker( "option", "maxDate", endDate );

}


// 체크박스 전체선택, 전체해제 이벤트

$(document).ready(function () {

	var chk = $('#payAll').parent().siblings().find('input');
	var chk2 = $('#stateAll').parent().siblings().find('input');
	var payAll = $('#payAll');
	var stateAll = $('#stateAll');

	chk.on('change',function () {

		if(payAll.prop('checked') == true){
			if($(this).prop('checked',true)){
				$('#payAll').prop('checked',false);
			}
		}
	});

	payAll.on('change',function () {
		if(payAll.prop('checked') == true){
			chk.prop('checked',false);
		}
	});

	chk2.on('change',function () {

		if(stateAll.prop('checked') == true){
			if($(this).prop('checked',true)){
				$('#stateAll').prop('checked',false);
			}
		}
	});

	stateAll.on('change',function () {
		if(stateAll.prop('checked') == true){
			chk2.prop('checked',false);
		}
	});

});
