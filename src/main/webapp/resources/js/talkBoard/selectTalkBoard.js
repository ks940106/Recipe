/**
 * 
 */

		function deleteBoard(boardNo){
			location.href="/deleteTalkBoard.do?boardNo="+boardNo;
		}
		function talklist(){
			var boardType = $("#selectType").val();
			location.href="/mainBoard.do?boardType="+boardType;
		}
		function modifyTalkBoard(boardNo){
			location.href="/modifyTalkBoard.do?boardNo="+boardNo;
		}
		function comment(nickname,boardNo,memberId){
			console.log(nickname);
			console.log(boardNo);
			var boardType = $("#selectType").val();
			var contents = $('#comment_tx').val();
			var level = $('#level').val();
			var data = "commentWriter="+nickname+"&boardNo="+boardNo+"&commentContents="+contents+"&commentLevel="+level+"&boardType="+boardType;
			console.log(nickname);
			console.log(data);
			console.log(contents);
			console.log(level);
			if(nickname == ""){
				alert("로그인해주세요");
			}else{
			$.ajax({
				url : "/insertTalkBoardComment.do",
				type : "post",
				data : data,
				success : function(){
					location.href="/selectTalkBoard.do?boardNo="+boardNo+"&memberId="+memberId+"&nickname="+nickname+"&boardType="+boardType;
					alert("댓글 등록에 성공했습니다");
				},
				error : function(){
					console.log("댓글 등록에 실패했습니다");
				}
			});
			}
		}
		
		function del(nickname,commentNo,boardNo,memberId){
			var boardType = $("#selectType").val();
			var no = commentNo;
			$.ajax({
				url : "/deleteComment.do",
				type : "post",
				data : {no:no},
				success : function(){
					alert("댓글삭제에 성공했습니다");
					location.href="/selectTalkBoard.do?boardNo="+boardNo+"&memberId="+memberId+"&nickname="+nickname+"&boardType="+boardType;
				},
				error : function(){
					alert("댓글삭제에 실패했습니다");
				}
			});
		}
		
		function like(nickname,id,boardNo){
			if(id == ""){
				alert("로그인해주세요");
			}else{
				var boardType = $("#selectType").val();
				var data = "memberId="+id+"&boardNo="+boardNo;
				console.log(data);
				$.ajax({
					url : "/boardLike.do",
					type : "post",
					data : data,
					success : function(data){
						location.href="/selectTalkBoard.do?boardNo="+boardNo+"&memberId="+id+"&nickname="+nickname+"&boardType="+boardType;
						alert("좋아요");
					},
					error : function(){ 
						console.log("좋아요 실패");
					}
				});
			}
		}
		function likeDel(nickname,id,boardNo){
			var boardType = $("#selectType").val();
			var data = "memberId="+id+"&boardNo="+boardNo;
			console.log(data);
			$.ajax({
				url : "/boardLikeDel.do",
				type : "post",
				data : data,
				success : function(data){
					location.href="/selectTalkBoard.do?boardNo="+boardNo+"&memberId="+id+"&nickname="+nickname+"&boardType="+boardType;
					alert("좋아요 취소");
				},
				error : function(){ 
					console.log("좋아요취소 실패");
				}
			});
		}
		
