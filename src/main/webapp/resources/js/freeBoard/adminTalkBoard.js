/**
 * 
 */

function deleteBoard(boardNo,type){
		console.log(type);
		var data = "boardNo="+boardNo+"&boardType="+type;
		$.ajax({
			url : "/adminDeleteTalkBoard.do",
			type : "post",
			data : data,
			success : function(data){
				alert("게시글 삭제 성공");
				location.href="/adminTalkBoard.do?boardType="+data;
			},
			error : function(){
				alert("게시글 삭제 실패");
			}
		});
		
	}

function view(no,nickname,id){
	location.href="/adminBoardView.do?boardNo="+no+"&memberId="+id+"&nickname="+nickname;
}