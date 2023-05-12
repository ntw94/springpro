<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../common/_include.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <title>회원가입</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
   
    function memberIdCheck(){
       var memberID=$("#member_id").val();
       
       $.ajax({
    	   url : "${contextPath}/memberIdCheck.do",
    	   type : "get",
    	   data : {"member_id":memberID},
    	   success : function(result){
    		   // 중복유무 출력(result=1 : 사용할수있는 아이디, 0 : 사용할수없는 아이디)
    		   if(result==1){
    			  $("#id_result_space").html("사용할 수 있는 아이디입니다.");
    		   }else{
    			  $("#id_result_space").css("color","red");
    			  $("#id_result_space").html("사용할 수 없는 아이디입니다.");
    		   }
    	   },    	   
    	   error : function(){ alert("error"); }    	   
       });    	
    }  
    function passwordCheck(){
    	var memPassword1=$("#member_pwd").val();
    	var memPassword2=$("#member_pwdChk").val();
    	if(memPassword1 != memPassword2){
    		$("#passMessage").html("비밀번호가 서로 일치하지 않습니다.");
    	}else{
    		$("#passMessage").html("");
    		$("#member_pwd").val(memPassword1);
    	}   	
    }
    function goInsert(){
    	document.frm.submit(); // 전송
    }
  </script>
</head>
<body>
<div class="container">
  <jsp:include page="../common/header.jsp"/>
  <div class="panel panel-default">
    <div class="panel-heading">회원가입</div>
    <div class="panel-body">
    
    <!-- 	회원가입 폼 		-->
    
      <form name="frm" action="${contextPath}/memberInsert.do" method="post">
        
         <table class="table table-bordered" style="text-align: center; border: 1px solid #eeeeee;">
           <tr>
             <td style="width: 110px; vertical-align: middle;">아이디</td>
             <td><input id="member_id" name="member_id" class="form-control" type="text" maxlength="20" placeholder="아이디를 입력하세요."/></td>
             <td style="width: 200px;">
             	<button type="button" class="btn btn-primary btn-sm" onclick="memberIdCheck()">중복확인</button>
             	<div id="id_result_space" style="font-size:13px"></div>	
             </td>
           </tr>
           <tr>
             <td style="width: 110px; vertical-align: middle;">비밀번호</td>
             <td colspan="2"><input id="member_pwd" name="member_pwd" onkeyup="passwordCheck()" class="form-control" type="password" maxlength="20" placeholder="비밀번호를 입력하세요."/></td>            
           </tr>
           <tr>
             <td style="width: 110px; vertical-align: middle;">비밀번호확인</td>
             <td colspan="2"><input id="member_pwdChk" name="member_pwdChk" onkeyup="passwordCheck()" class="form-control" type="password" maxlength="20" placeholder="비밀번호를 확인하세요."/></td>            
           </tr>
            <tr>
             <td style="width: 110px; vertical-align: middle;">이름</td>
             <td colspan="2"><input id="member_name" name="member_name" class="form-control" type="text" maxlength="20" placeholder="이름을 입력하세요."/></td>            
           </tr>
           <tr>
             <td style="width: 110px; vertical-align: middle;">이메일</td>
             <td colspan="2"><input id="member_email" name="member_email" class="form-control" type="text" maxlength="50" placeholder="이메일을 입력하세요."/></td>            
           </tr>
           <tr>
             <td colspan="3" style="text-align: left;">
                <span id="passMessage" style="color: red"></span><input type="button" class="btn btn-primary btn-sm pull-right" value="등록" onclick="goInsert()"/>
             </td>             
           </tr>
         </table>   
      </form>    
    </div>
    
    <div class="panel-footer">노태웅</div>
  </div>
</div>
</body>
</html>