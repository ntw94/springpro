<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../common/_include.jsp"%>
    <% pageContext.setAttribute("newLineChar", "\n"); %>
    
    
<!DOCTYPE html>
<html lang="ko">
<head>
<title>게시판</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
	var pText;
	
	$(document).ready(function(){
		commentLoadList();
	});
	
	function boardDelete(){
		if(confirm("삭제하시겠습니까?")){
			document.deleteForm.action="${contextPath}/boardDelete";
			document.deleteForm.method="post";
			document.deleteForm.submit();
		}
	}
	
	function commentLoadList(){
		$.ajax({
			url:"comment/listAll/${boardDTO.board_no}",
			type:"get",
			dataType:"json",
			success:commentMakeView,
			error:function(){alert("error");}
		});
	}
	
	function commentMakeView(data){
		var listHtml="";
		
		$.each(data,function(index,obj){
			listHtml +="<table class='table' style='border: 1px solid #eeeeee'>";
			listHtml +=	"<tr style='background-color:#eeeeee'>";
			listHtml +=		"<td>";
			listHtml +=			"작성자 &nbsp;"+obj.member_id;
			listHtml +=			"<span class='pull-right'>"+obj.comment_regiDate+"</span>";
			listHtml +=		"</td>";
			listHtml +=	"</tr>";
			listHtml +=	"<tr>";
			listHtml +=		"<td style='height:60px'>";
			listHtml +=			"<textarea id='noraltt"+obj.comment_no+"' style='width:100%;background-color:white;resize:none;border:none'  rows='5' readonly  >"+obj.comment_content+"</textarea>";
			listHtml +=			"<textarea id='updatett"+obj.comment_no+"' style='width:100%;background-color:white;resize:none;border:none;display:none'  rows='5'   >"+obj.comment_content+"</textarea>";
			listHtml +=		"</td>";
			
			
			if(obj.member_id == '${member.member_id}'){
				listHtml +=	"<tr>";
				listHtml +=			"<td colspan=2 style='border-top:none'>";
				listHtml +=				"<div id='normalForm"+obj.comment_no+"'>";
				listHtml +=					"<button id=''type='button' class='btn btn-sm pull-right' onclick='commentUpdateForm("+obj.comment_no+")'>수정</button>";
				listHtml +=					"<button type='button' class='btn btn-sm pull-right' onclick='commentDelete("+obj.comment_no+")'>삭제</button>";
				listHtml +=				"</div>";
				listHtml +=				"<div id='updateForm"+obj.comment_no+"' style='display:none'>";
				listHtml +=					"<button id=''type='button' class='btn btn-sm pull-right' onclick='commentUpdate("+obj.comment_no+");'>수정</button>";
				listHtml +=					"<button type='button' class='btn btn-sm pull-right' onclick=resetUpdateForm("+obj.comment_no+");>취소</button>";
				listHtml +=				"</div>";
				listHtml +=			"</td>";
				listHtml +=	"</tr>";
			}
			listHtml +=	"</table>";
		});
		
		$("#commentView").html(listHtml);
		
	}

	function commentInsert(){
		
		if(confirm("글 등록하시겠습니까?")){
			
			var fData=$("#commentForm").serialize();
			
			$.ajax({
				url :"comment/insert",
				type: "post",
				data:fData,
				success:commentLoadList,
				error:function(){alert("댓글 작성 오류");}
			});
			
		}
		$("comment_content").val("");  
	}
	
	function commentDelete(comment_no){
		
		if(confirm("글 삭제하시겠습니까?")){
						
			$.ajax({
				url:"comment/delete",
				type:"get",
				data:{
					"comment_no":comment_no,
					"member_id":"${member.member_id}"},
				success:commentLoadList,
				error:function(){alert("댓글 삭제 오류");}
			});
		}
	}
	
	function commentUpdateForm(comment_no){
		 // 1. 댓글 다시 입력할 수 있는 상태로 만든다.
		 $("#noraltt"+comment_no).css("display","none");
		$("#updatett"+comment_no).css("display","block");
		 
		$("#updateForm"+comment_no).css("display","block"); // 버튼 활성화
		$("#normalForm"+comment_no).css("display","none");
	}
	
	function resetUpdateForm(comment_no){

		 $("#noraltt"+comment_no).css("display","block");
		$("#updatett"+comment_no).css("display","none");
			
		$("#updateForm"+comment_no).css("display","none"); // 버튼 활성화
		$("#normalForm"+comment_no).css("display","block");
	}
	
	function commentUpdate(comment_no){
		var content1 = $("#updatett"+comment_no).val();
		var member_id1 = "${member.member_id}";
		
		$.ajax({
			url : "comment/update",
			type : "put",
			contentType:'application/json;charset=utf-8',
			data : JSON.stringify({
				"comment_no":comment_no,
				"member_id": member_id1,
				"comment_content":content1
			}),
			success:commentLoadList,
			error:function(){alert("댓글 업데이트 실패");}
		});
		
		
		
	}

</script>

</head>
<body>
	<div class="container">
		<jsp:include page="../common/header.jsp" />

		<div class="panel panel-default">
			<div class="panel-body">
				<table class="table ">
					<tr style="background-color: #f5f5f5">
						<td>${boardDTO.board_subject }</td>
					</tr>
					<tr>
						<td>
							<div>
								<span style="display:inline-block;width:20%;"> ${boardDTO.board_writer }&nbsp;&nbsp; </span> 
								<span style="display:inline-block;width:79%;text-align:right;">
									좋아요 10 | 싫어요 10 | 댓글수 30 | 조회수 ${boardDTO.board_views} &nbsp;|&nbsp;
									${boardDTO.board_regiDate}
							 	</span>
							</div>
						</td>
					</tr>

					<tr style="border-bottom: 1px solid #ddd; height: 300px">
						<td>${fn:replace(boardDTO.board_content,newLineChar,"<br>")}</td>
					</tr>
				</table>
				
				<c:if
					test="${!(empty member) and member.member_id == boardDTO.member_id}">
					<div style="text-align:right">
						<a href="boardUpdateForm.do?no=${boardDTO.board_no}" class="btn btn-primary btn-sm">수정</a>
						<a onclick="boardDelete()" class="btn btn-primary btn-sm" >삭제</a>
					</div>
					
					<form name="deleteForm">
						<input type="hidden" name="board_no" value="${boardDTO.board_no }">
					</form>
					
				</c:if>
			</div>

				<!-- 댓글 작성하는 곳 -->
				<c:if test="${!(empty member)}">
					<form id="commentForm">
						<input type="hidden" name="member_id" value="${member.member_id}"/>
						<input type="hidden" name="board_no" value="${boardDTO.board_no }"/>
						
						<div class="panel-body" >
							<table class="table" >
								<tr>
									<td >댓글작성&nbsp;&nbsp;${member.member_id }</td>
								</tr>
								<tr>
									<td width="100%" style="border-top:none;">
										<textarea style=" resize:none;"rows="4" 
											name="comment_content" class="form-control" 
												placeholder="내용을 입력해 주세요"></textarea>
									</td>
								</tr>
								<td>
									<button type="button" class="btn-default btn-sm pull-right" onclick="commentInsert();">댓글 작성</button>
								</td>
							</table>
						</div>
					</form>
				</c:if>
					
					<!--   댓글 불러오는 곳       -->
					<div class="panel-body" id="commentView"></div>
					
			<div class="panel-footer"></div>
		</div>
	</div>
</body>
</html>