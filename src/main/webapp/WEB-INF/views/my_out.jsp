<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true" %>
<!DOCTYPE html>

<html lang="zxx">
<!-- head -->
<%@ include file="include/head.jsp" %>
<!-- head end -->

<script>

function pass() {
	/*
	// 정규 표현식 확인
	var u_pw				= document.getElementsByName("u_pw")[0].value;
	var pass1				= document.getElementsByName("pass1")[0].value;
	var exptextPass			= /^(?=.*?[a-zA-Z])(?=.*?[0-9]).{8,16}$/;
	
	if(exptextPass.test(u_pw)==false||exptextPass.test(pass1)==false){
		alert("비밀번호 형식이 올바르지 않습니다./n(영문,숫자 최소 각 1개씩 8~16자리)");
		return false;
	}
	if(u_pw!=pass1){
		alert("비밀번호화, 확인란의 비밀번호가 일치하지 않습니다.");
		return false;
	}
	*/
	// 
	var u_pw = document.getElementById("u_pw").value;
	
	if("${usersearch.u_pw}"==u_pw){
		//window.opener.parent.location.href = "${contextPath}/mypageU/my_out";
		alert("비밀번호가 확인되었습니다.");
		alert("회원 탈퇴후 해당 아이디는 30일후 다시 가입 가능합니다!");
		//window.close()
	}else{
		alert("회원 정보의 비밀번호와 일치하지 않습니다.");
		return false;
	}
}

$(function(){
	
	// 비밀번호 확인
	$("input[name=u_pw]").keyup(function () {
		var u_pw		= document.getElementsByName("u_pw")[0].value;
		var pass1		= document.getElementsByName("pass1")[0].value;
		
		if(u_pw.length!=0){
			if(u_pw==pass1){
				$("#pwtest").text("비밀번호가 일치합니다.");
				$("#pwtest").attr('color', '#199894b3');
				$("#pwtest1").text("비밀번호가 일치합니다.");
				$("#pwtest1").attr('color', '#199894b3');
			}else{
				$("#pwtest").text("비밀번호가 일치하지 않습니다.");
				$("#pwtest").attr('color', '#f82a2aa3');
				$("#pwtest1").text("비밀번호가 일치하지 않습니다.");
				$("#pwtest1").attr('color', '#f82a2aa3');
			}
		}else {
			$("#pwtest").text("");
			$("#pwtest1").text("");
		}
	});
	$("input[name=pass1]").keyup(function () {
		var u_pw		= document.getElementsByName("u_pw")[0].value;
		var pass1		= document.getElementsByName("pass1")[0].value;
		
		if(u_pw.length!=0){
			if(u_pw==pass1){
				$("#pwtest").text("비밀번호가 일치합니다.");
				$("#pwtest").attr('color', '#199894b3');
				$("#pwtest1").text("비밀번호가 일치합니다.");
				$("#pwtest1").attr('color', '#199894b3');
			}else{
				$("#pwtest").text("비밀번호가 일치하지 않습니다.");
				$("#pwtest").attr('color', '#f82a2aa3');
				$("#pwtest1").text("비밀번호가 일치하지 않습니다.");
				$("#pwtest1").attr('color', '#f82a2aa3');
			}
		}else {
			$("#pwtest").text("");
			$("#pwtest1").text("");
		}
	});
})

</script>

<style>
	.login-form{
		border-radius: 5px;
		width: 500px;
		background-color: #eeeff1;
		padding:25px;
		margin : 100px auto;
	}
	.text-field{
		font-size: 16px;
        padding : 10px;
        margin-bottom: 10px;
        border-radius: 5px;
        border : none;
        width : 100%;
        box-sizing: border-box;
    }
    lia{
		display:inline;
		padding:0 10px;
    }
	
	.btn-cancel {
		color:#fff;
		bg:#ff7851;
		background-color:#ff7851;
		border-color:#ff7851;
		hover-color:#fff;
		hover-bg:#d96645;
		hover-border-color:#cc6041;
		focus-shadow-rgb:255,140,107;
		active-color:#fff;
		active-bg:#cc6041;
		active-border-color:#bf5a3d;
		active-shadow:inset 0 3px 5px rgba(0, 0, 0, 0.125);
		disabled-color:#fff;
		disabled-bg:#ff7851;
		disabled-border-color:#ff7851;
	}
	
	.btn-info {
		color:#fff;
		bg:#6cc3d5;
		border-color:#6cc3d5;
		hover-color:#fff;
		hover-bg:#5ca6b5;
		hover-border-color:#569caa;
		focus-shadow-rgb:130,204,219;
		active-color:#fff;
		active-bg:#569caa;
		active-border-color:#5192a0;
		active-shadow:inset 0 3px 5px rgba(0, 0, 0, 0.125);
		disabled-color:#fff;
		disabled-bg:#6cc3d5;
		disabled-border-color:#6cc3d5;
	}
	
</style>

<body>
<section class="content container-fluid">
	<div class="container">
		<div class="section-title">
			<br><br>
			<h2>회원 탈퇴</h2>
		</div>
		<div class="login-form" >
			<form class="box-body" style="text-align:center;" method="post" onsubmit="return pass();">
				<ul style="list-style:none;">
					<h5 style="text-align:left;">&emsp;유저 ID명&emsp;:&emsp;${user.u_p_id}</h5><br>
					<input type="hidden" id="u_p_id" name="u_p_id" value="${user.u_p_id}" class="text-field" style="width:420px;">
					<li style="text-align:left;">&emsp;회원 탈퇴를 위해 비밀번호를 입력하여 주세요</li>
					<input type="text" id="u_pw" name="u_pw" placeholder="비밀번호를 입력해 주세요" minlength="8" maxlength="16" class="text-field" style="width:420px;">
					<li><font id="pwtest" name="pwtest" size="2"></font></li>
					<li style="text-align:left;">&emsp;비밀번호 확인</li>
					<input type="password" id="pass1"name="pass1" placeholder="비밀번호를 확인하여 주세요" minlength="8" maxlength="16" class="text-field" style="width:420px;">
					<li><font id="pwtest1" name="pwtest1" size="2"></font></li>
					<br>
					<div class="box-footer">
						<a href="${contextPath}/mypageU/my_user"><button type="button"class="btn btn-cancel" onclick="window.close()">취소</button></a>
						<button type="submit" class="btn btn-info">확인</button>
					</div>
				</ul>
			</form>
		</div>
	</div>
		
</section>

</div>

<!-- Js Plugins -->
<%@ include file="include/plug_in.jsp" %>

</body>

</html>