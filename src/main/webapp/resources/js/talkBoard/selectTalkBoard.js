/**
 * 
 */


		function deleteBoard(boardNo){
			location.href="/deleteTalkBoard.do?boardNo="+boardNo;
		}
		function modifyTalkBoard(boardNo){
			location.href="/modifyTalkBoard.do?boardNo="+boardNo;
		}
		function comment(nickname,boardNo,memberId){
			console.log(nickname);
			console.log(boardNo);
			var contents = $('#comment_tx').val();
			var level = $('#level').val();
			var data = "commentWriter="+nickname+"&boardNo="+boardNo+"&commentContents="+contents+"&commentLevel="+level;
			console.log(nickname);
			console.log(data);
			console.log(contents);
			console.log(level);
			if(nickname == ""){
				alert("로그인해");
			}else{
			$.ajax({
				url : "/insertTalkBoardComment.do",
				type : "post",
				data : data,
				success : function(str){
					location.href="/selectTalkBoard.do?boardNo="+boardNo+"&memberId="+memberId;
					alret(str);
				},
				error : function(){
					console.log("시발 실패해따");
				}
			});
			}
		}
		
		function del(commentNo,boardNo,memberId){
			var no = commentNo;
			$.ajax({
				url : "/deleteComment.do",
				type : "post",
				data : {no:no},
				success : function(data){
					location.href="/selectTalkBoard.do?boardNo="+boardNo+"&memberId="+memberId;
				},
				error : function(){
					console.log("댓글삭제 실패해따");
				}
			});
		}
		
		function like(id,boardNo){
			if(id == ""){
				alert("로그인해라");
			}else{
				var data = "memberId="+id+"&boardNo="+boardNo;
				console.log(data);
				$.ajax({
					url : "/boardLike.do",
					type : "post",
					data : data,
					success : function(data){
						location.href="/selectTalkBoard.do?boardNo="+boardNo+"&memberId="+id;
						alert("성공해따"+data);
					},
					error : function(){ 
						console.log("좋아요 실패해따");
					}
				});
			}
		}
		function likeDel(id,boardNo){
			var data = "memberId="+id+"&boardNo="+boardNo;
			console.log(data);
			$.ajax({
				url : "/boardLikeDel.do",
				type : "post",
				data : data,
				success : function(data){
					location.href="/selectTalkBoard.do?boardNo="+boardNo+"&memberId="+id;
					alert("좋아요 취소해따"+data);
				},
				error : function(){ 
					console.log("좋아요취소 실패해따");
				}
			});
		}
		
