/**
 * 
 */

function select(no,id,nickname){
	console.log(nickname);
			location.href="/selectTalkBoard.do?boardNo="+no+"&memberId="+id+"&nickname="+nickname;
		}

function insert(){
	var id = $('#sessionId').val();
	if(id == ""){
		alert("로그인해");
	}else{
		$('#go_register_dv').css('display','block');
		$('#go_register_dv').focuse();		
	}
}
