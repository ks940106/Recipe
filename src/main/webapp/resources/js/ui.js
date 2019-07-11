/** ******************************** **/
/************** HDHY 최희수 ***********/
/******* 절대수정금지 필요시 추가 *****/
/** ******************************** **/

/**
 * 중복서브밋 방지
 *
 * @returns {Boolean}
 */
var doubleSubmitFlag = false;

function doubleSubmitCheck() {
	if (doubleSubmitFlag) {
		return doubleSubmitFlag;
	} else {
		doubleSubmitFlag = true;
		return false;
	}
}

// 전체 카테고리
$(document).ready(function () {

	$('header .menu_box li:first-child a').on('click',function () {

		var all_menu = $('.all_menu_group');

		if(all_menu.hasClass('on')){

			all_menu.removeClass('on');
			all_menu.stop().slideUp();
		}else{
			all_menu.addClass('on');
			all_menu.stop().slideDown();

		}

	});

});


$(document).on('click','.lnb_menu .menu_name',function () {

	if($(this).hasClass('off')){
		$(this).removeClass('off')

	}else{
		$(this).addClass('off')
	}

});


// lnb 작동 스크립트

// $('.menu > a').on('click',function () {
//     $(this).parent().removeClass('active');
//     $(this).parent().toggleClass('on');
//     $(this).siblings('.submenu').slideToggle();
// });
// $('.menu ul li a').on('click',function () {
//     $('.menu ul li a').removeClass('active');
//     $(this).addClass('active');
// });


$(document).on('click', '.menu > a', function () {
	$(this).parent().removeClass('active');
	$(this).parent().toggleClass('on');
	$(this).siblings('.submenu').slideToggle();
});

$(document).on('click', '.menu ul li a', function () {
	$('.menu ul li a').removeClass('active');
	$(this).addClass('active');
});


// input 숫자만 입력

$('.onlyNum').on('keyup change', function () {
	this.value = this.value.replace(/[^0-9]/g, '');
});

// input 콤마

$('.onlyComma').on('keyup change', function () {
	var str = this.value = this.value.replace(/[^0-9]/g, '');
	this.value = str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
});


// input 숫자 + '-' 입력

$('.onlyAc').on('keyup change', function () {
	this.value = this.value.replace(/[^0-9^-]/g, '');
});


// 페이징 클릭 효과

$('.pageGroup .num').on('click', function () {
	$('.pageGroup .num').removeClass('active');
	$(this).addClass('active');
});


// 검색 초기화

$('.reset').on('click', function () {
	$('.searchGroup input').val('');
	$(".searchGroup select").each(function () {
		$(this).find('option:eq(0)').prop('selected', true);
	});
	$('.searchGroup input:radio[name=state]').removeAttr('checked');
	$('.searchGroup .rbox:first-child input').prop('checked', true);
	$('.searchGroup .cbox input').prop('checked', false);
	$('.searchGroup .cbox:first-child input').prop('checked', true);
});


// 팝업 닫기

// $(document).mouseup(function (e) {
// 	var overlay = $('.content');
// 	var popup = $('.popup');
//
// 	if (!popup.is(e.target) && popup.has(e.target).length === 0){
// 		popup.hide();
// 		overlay.removeClass('overlay');
// 	}
// });


/* 인풋박스 아이콘호버 및 삭제버튼 표시 */

// $(document).ready(function () {
//
//
// 	var input_box = $('.input_box');
// 	var tbox = $('.input_box .tbox');
//
//
// 	input_box.on('focusin', function () {
//
// 		$(this).addClass('focus');
// 		input_remove_show($(this).find('.tbox'));
//
// 	});
//
//
// 	input_box.on('focusout', function () {
//
// 		$(this).removeClass('focus');
// 		// $(this).find('.input_remove').hide();
//
// 	});
//
// 	tbox.on('change keyup', function () {
//
//
// 		input_remove_show(this);
//
// 	});

//
// // 내용삭제 표시
// 	function input_remove_show(e) {
//
//
// 		if ($(e).val().length >= 1) {
// 			$(e).siblings('.input_remove').show();
// 		} else {
// 			$(e).siblings('.input_remove').hide();
//
// 		}
// 	}
//
// 	$('.input_remove').on('click', function () {
// 		$(this).siblings('.tbox').val("");
//
// 		$(this).hide();
//
// 	});
//
//
// 	$('.input_box.top , .input_box.bottom').focusin(function () {
//
// 		$(this).css({
// 			zIndex: '5',
// 		})
// 	});
//
// 	$('.input_box').focusout(function () {
//
// 		$(this).css({
// 			zIndex: '1',
// 		})
// 	});

// });


/** 테이블 **/

$(document).on('change','input[name="all_chk"]',function () {
	if($(this).prop("checked")){
		$(this).parents('table').find('tbody input[type="checkbox"]').prop("checked",true);
	}else{
		$(this).parents('table').find('tbody input[type="checkbox"]').prop("checked",false);
	}
});




function all_chk(state) {

	if(state == 'y'){

		$('.list_table input[type="checkbox"]').prop("checked",true);

	}else if(state == 'n'){

		$('.list_table input[type="checkbox"]').prop("checked",false);

	}

}




/* 페이징 */
$(document).on('click','.page_box a',function () {

	var target = $(this).parent();

	if(target.hasClass('arrow'))
		return false;

	$('.page_box li').removeClass('on');
	target.addClass('on');

});









/* 팝업관리 */

/** 팝업 시 스크롤 고정 **/

// 팝업 내 스크롤이 있을 경우

function scroll_in_disabled() {


	$('.contents').on('scroll touchmove mousewheel DOMMouseScroll', function (event) {
		event.preventDefault();
		event.stopPropagation();
		return false;
	});

	$('.popup').off('scroll touchmove mousewheel DOMMouseScroll');  // 팝업 스크롤은 해제

}

function scroll_in_able() {
	$('.contents').off('scroll touchmove mousewheel DOMMouseScroll');
}

// 팝업 내 스크롤이 없을 경우


function scroll_disabled() {
	$('body').on('scroll touchmove mousewheel DOMMouseScroll', function (event) {
		event.preventDefault();
		event.stopPropagation();
		return false;
	});
}

function scroll_able() {
	$('body').off('scroll touchmove mousewheel DOMMouseScroll');
}

function scroll_set() {
	$('body').css('overflow', 'auto');
	$('html').css('overflow', 'auto');

}

// 팝업 끄기
function closePop() {
	$('.popup').fadeOut(400);
	$('.contents').removeClass('overlay');
	scroll_in_able();
	scroll_able();
}



