/**
 * 
 */

function select(no,id,nickname){
	var type = $("#selectType").val();
	console.log(type);
			location.href="/selectTalkBoard.do?boardNo="+no+"&memberId="+id+"&nickname="+nickname+"&boardType="+type;
		}

function insert(){
	var id = $('#sessionId').val();
	if(id == ""){
		alert("로그인해주세요");
	}else{
		$('#go_register_dv').css('display','block');
		$('#go_register_dv').focuse();		
	}
}
