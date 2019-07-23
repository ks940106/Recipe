/**
 * 
 */

	function deleteFreeBoard(no){
			location.href="/deleteFreeBoard.do?boardNo="+no;
		}
		function modifyFreeBoard(no){
			location.href="/modifyFreeBoard.do?boardNo="+no;
		}
		function freeComment(nickname,no){
			console.log("닉네임 : "+nickname);
			if(nickname == ""){
				alert("로그인해 주세요");
			}else{
			var level = $('#level').val();
			var contents = $('#comment_tx').val();
			console.log(nickname);
			console.log(no);
			console.log(level);
			console.log(contents);
			var data = "nickname="+nickname+"&boardNo="+no+"&level="+level+"&contents="+contents;
			$.ajax({
				url : "/freeBoardCommentInset.do",
				type : "post",
				data : data,
				success : function(data){
					alert("댓글등록 성공");
					location.href="/selectFreeBoard.do?boardNo="+no;
				},
				error : function(){
					alert("댓글등록 실패");
				}
			});
			}
			
		}
		
		function del(commentNo,boardNo,memberId){
			var no = commentNo;
			$.ajax({
				url : "/freeBoardDeleteComment.do",
				type : "post",
				data : {no:no},
				success : function(data){
					alert("댓글 삭제에 성공했습니다.");
					location.href="/selectFreeBoard.do?boardNo="+boardNo+"&memberId="+memberId;
				},
				error : function(){
					alert("댓글 삭제에 실패했습니다.");
				}
			});
		}