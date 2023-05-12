<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../common/_include.jsp" %>


<!DOCTYPE html>
<html lang="ko">
<head>
  <title>로그인</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  	
  	function login(){
  		var id = $("#member_id").val();
  		var pwd = $("#member_pwd").val();
  		
  		if(id == ''){
  			alert("아이디를 입력해주세요");
  			return ;
  		}
  		if(pwd == ''){
  			alert("비밀번호를 입력해주세요");
  			return ;
  		}
  		
  		
  		document.form.submit();
  		
  	}
  </script>
</head>
<body>
<div class="container">
  <jsp:include page="../common/header.jsp"/> 
    <div class="panel-body" >
    <h2 style="text-align:center;">로그인</h2>
      <form name="form" action="${contextPath}/memberLogin.do" method="post">
         <table class="table table-bordered" align="center" style="width:50%; text-align: center; border: 1px solid #dddddd;">
           <tr>
             <td style="width: 110px; vertical-align: middle;">아이디</td>
             <td><input id="member_id" name="member_id" class="form-control" type="text" maxlength="20" placeholder="아이디를 입력하세요."/></td>
           </tr>
           <tr>
             <td style="width: 110px; vertical-align: middle;">비밀번호</td>
             <td colspan="2"><input id="member_pwd" name="member_pwd" class="form-control" type="password" maxlength="20" placeholder="비밀번호를 입력하세요."/></td>            
           </tr>      
           <tr>
             <td colspan="2" style="text-align: center;">
                <input type="button" style="width:70%"class="btn btn-primary btn-lg" onclick= "login();" value="로그인"/>
             </td>             
           </tr>
         </table> 
      </form> 
    </div>
</div>

</body>
</html>