<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@include file="common/_include.jsp" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>프로젝트</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

  
<div class="container">
	<jsp:include page="common/header.jsp"/>  
	
  <h3>Right Aligned Navbar</h3>
  <p>The .navbar-right class is used to right-align navigation bar buttons.</p>
  
  <table>
  	<tr>
  		<td>번호</td>
  		<td>아이디</td>
  		<td>이름</td>
  		<td>이메일</td>
  		<td>등록일</td>
  	</tr>
  	
	<c:forEach var="list" items="${list }">
  	<tr>
  		<td>${list.member_no }</td>
  		<td>${list.member_id }</td>
  		<td>${list.member_name }</td>
  		<td>${list.member_email }</td>	
  		<td>${list.member_regiDate }</td>	
  	</tr>
  		</c:forEach>
  	
  	
  </table>
  
</div>

</body>
</html>
