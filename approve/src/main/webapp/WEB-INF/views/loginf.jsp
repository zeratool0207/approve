<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script type="text/javascript">
	$(function(){
		//login버튼을 눌렀을 때,
		//null여부 체크
		$('#loginBtn').click(function(){
			if($('#id').val() == ''){
				alert('아이디를 입력하세요');
				$('#id').focus();
			}else if($('password').val() == ''){
				alert('비밀번호를 입력하세요');
				$('#password').focus();
			}else{
				$('#loginFrm').attr('action','login').attr('type','post').submit();	
			}
		});
		
		$('#cancelBtn').click(function(){
			location.href="loginf";
		});
		
		//아이디 비밀번호 체크
		var loginChk = '${idCheck}';
		
		if(loginChk == 'idFail'){
			alert('아이디를 확인하세요');
			$('#id').focus();
		}else if(loginChk == 'pwFail'){
			alert('비밀번호를 확인하세요');
			$('#password').focus();
		}
		
	});	

</script>
<title>loginf</title>
</head>
<body>
	<div style="text-align: center; margin-top: 10em">
		<div>
			<form name="loginFrm" id="loginFrm">
				아이디 : <input type="text" name="id" id="id" placeholder="아이디를 입력"><br>
				비밀번호 : <input type="text" name="password" id="password" placeholder="비밀번호를 입력"><br>
				<input type="button" name="loginBtn" id="loginBtn" value="로그인">&nbsp;
				<input type="button" name="cancelBtn" id="cancelBtn" value="취소">
			</form>
		</div>	
	</div>
</body>
</html>