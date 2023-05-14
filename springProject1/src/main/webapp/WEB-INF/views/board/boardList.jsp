<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ include file="../common/_include.jsp" %>

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
</head>
<body>

	<div class="container">
	<jsp:include page="../common/header.jsp"/>  
		<div class="panel panel-default">
			<div class="panel-heading">BOARD</div>
			<div class="panel-body">
				<table class="table table-hover">
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>작성일</td>
						<td>조회수</td>
					</tr>
					<c:if test="${fn:length(list) == 0 }">
						<tr  align="center">
							<td colspan=5 align="center"   >
								<div style="widht:100%; height:400px; display:flex;flex-direction: column;justify-content: center">
									<h2 > 게시판 글이 없습니다.</h2>
								</div>
							</td>
						</tr>
					</c:if>
					
					<c:if test="${fn:length(list) != 0 }">
							<c:forEach var="list" items="${list }">
								<tr>
									<td>${list.board_no }</td>
									<td width="40%"><a href="${contextPath }/boardView.do?no=${list.board_no}">${list.board_subject } </a></td>
									<td>${list.board_writer}</td>
									<td>${fn:split(list.board_regiDate," ")[0]}</td>
									<td>${list.board_views }</td>
								</tr>
							</c:forEach>
							
							<tr align="center">
								<td colspan=5 >
									<ul class="pagination">
										<!-- 첫페이지로 가기 -->
										<c:if test="${page != 1 }">
											<li><a href="${contextPath}/boardList.do?page=1">&lt;&lt;</a></li>							
										</c:if>
										
										<!-- 이전버튼 -->
										<c:if test="${boardPage.prvBlock != 0 }">
											<li><a href="${contextPath}/boardList.do?page=${boardPage.prePage}">이전</a></li>
										</c:if>
									
									    <c:forEach var="i" begin="${boardPage.startPage }" end="${boardPage.lastPage}" >
									    	<c:if test="${i == page }">
									    		<li class="active"><a href="#">${i }</a></li>
									    	</c:if>
									    	<c:if test="${i != page }">
									    		<li><a href="${contextPath }/boardList.do?page=${i}">${i }</a></li>
									    	</c:if>
									    </c:forEach>
									    
										<!-- 다음 페이지로  -->
										<c:if test="${boardPage.nowBlock != boardPage.nxtBlock}">
									    	<li><a href="${contextPath}/boardList.do?page=${boardPage.nxtPage}">다음</a></li>
										</c:if>
									
										<!-- 마지막 페이지로 가기 -->
										<c:if test="${boardPage.totalPage != page}">
											<li><a href="${contextPath}/boardList.do?page=${boardPage.totalPage}">&gt;&gt;</a></li>
										</c:if>
								  	</ul> <!-- pager -->
							  	</td> 
							</tr>
						</c:if>
					</table>
				<c:if test="${!empty member}">
					<a href="boardInsertForm.do" class="btn btn-primary btn-sm">글쓰기</a>
				</c:if>
			</div>
			<div class="panel-footer"></div>
		</div>
	</div>
</body>
</html>