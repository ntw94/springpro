<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@include file="_include.jsp" %>
    
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="${contextPath}">홈</a></li>
      <li><a href="${contextPath}/boardList.do">게시판</a></li>
      <li>${prevContextPath }</li>"
    </ul>
  
    <c:if test="${empty member}">
	      <ul class="nav navbar-nav navbar-right">
	            <li><a href="${contextPath}/memberLoginForm.do"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
	            <li><a href="${contextPath}/memberRegisterForm.do"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>            
	      </ul>
      </c:if>
      <c:if test="${!empty member}">
	      <ul class="nav navbar-nav navbar-right">
	            <li><a style="pointer-events: none;">${member.member_id}님 환영합니다!</a></li>
	            <li><a href="${contextPath}/memberLogout.do"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>            
	            <c:if test="${!empty member}">
	            
			    <%-- <c:if test="${empty member.memProfile}">
			      <li><img class="img-circle" src="${contextPath}/resources/images/person.PNG" style="width: 50px; height: 50px"/> ${mvo.memName} 님Welcome.</li>
			    </c:if>
			    <c:if test="${!empty member.memProfile}">
			      <li><img class="img-circle" src="${contextPath}/resources/upload/${mvo.memProfile}" style="width: 50px; height: 50px"/> ${mvo.memName} 님Welcome.</li>
			    </c:if>		 --%>	  
			  </c:if>
	      </ul>
      </c:if>
  </div>
</nav>