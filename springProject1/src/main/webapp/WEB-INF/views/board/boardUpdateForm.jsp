<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../common/_include.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <title>글 수정</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
	  $(document).ready(function(){
	  	if(${!empty msgType}){
	   		$("#messageType").attr("class", "modal-content panel-warning");    
	  		$("#myMessage").modal("show");
	  	}
	  });
  </script>
</head>
<body>
 
  
<div class="container">
  <jsp:include page="../common/header.jsp"/>  
  <div class="panel panel-default">
    <div class="panel-heading">글 수정</div>
    <div class="panel-body">
    	<form action="boardUpdate" method="post">
    		<input type="hidden" name="board_no" value="${boardDTO.board_no }" />
	    	<table class="table">
	    		<tr>
	    			<td>제목</td>
	    			<td><input type="text" name="board_subject" class="form-control" value="${boardDTO.board_subject}"/></td>
	    		</tr>
	    		
	    		<tr>
	    			<td>작성자</td>
	    			<td><input type="text" name="board_writer" class="form-control" value="${boardDTO.member_id }" readonly/></td>
	    		</tr>
	    		<tr>
	    			<td>내용</td>
	    			<td>
	    				<textarea style="resize:none;"rows="7" name="board_content" class="form-control">${boardDTO.board_content}</textarea>
	    			</td>
	    		</tr>
	    		
	    		<tr>
	    			<td colspan="2" align="center">
	    				<button type="submit" class="btn btn-success btn-sm">등록</button>
	    				<a href="${contextPath}/boardList.do" class="btn btn-warning btn-sm">목록</a>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
    </div>
    
 
	
	<!-- 실패 메세지를 출력(modal) -->
	<div id="myMessage" class="modal fade" role="dialog" >
	  <div class="modal-dialog">	
	    <!-- Modal content-->
	    <div id="messageType" class="modal-content panel-info">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">${msgType}</h4>
	      </div>
	      <div class="modal-body">
	        <p>${msg}</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>	
	  </div>
	</div>    
    <div class="panel-footer"></div>
  </div>
</div>



</body>
</html>