<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="false" %>
<!DOCTYPE html>

<html lang="zxx">

<!-- head -->
<%@ include file="include/head.jsp" %>
<!-- head end -->
<link href="https://fonts.googleapis.com/css?family=Neucha|Cabin+Sketch&display=swap" rel="stylesheet">
<script>

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
	/*
	$(".btn-info").click(function(){
		
		var u_pw				= document.getElementsByName("u_pw")[0].value;
		var pass1				= document.getElementsByName("pass1")[0].value;
		var exptextPass		= /^(?=.*?[a-zA-Z])(?=.*?[0-9]).{8,16}$/;
		
		if(exptextPass.test(u_pw)==false||exptextPass.test(pass1)==false){
			alert("비밀번호 형식이 올바르지 않습니다./n(영문,숫자 최소 각 1개씩 8~16자리)");
			return false;
		}
		if(u_pw!=pass1){
			alert("비밀번호화, 확인란의 비밀번호가 일치하지 않습니다.");
			return false;
		}
		
		var u_p_id		= document.getElementById("u_p_id").value;
		var u_pw		= document.getElementById("u_pw").value;

		// 값넘기기
		//location.href="pw_s_result?u_p_id="+u_p_id+"&u_pw="+u_pw;
		
     });
*/
})

// 정규화
// 비밀번호 8~16자리, 영문, 숫자 각 최소 1개씩은 필수

function validation(){
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
	
}


</script>
 
<style>
	.login-form{
		border-radius: 5px;
		width: 400px;
		background-color: #eeeff1;
		padding:20px;
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
	.lia{
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
			<div class="header__logo" style="margin : 100px auto;">
				<a href="/nyangjipshop/main"><img src="${contextPath}/resources/bootstrap/img/logoim1.png" alt=""></a>
			</div>
			<h4></h4>
		</div>
		<div class="section-title">
          <h2>비밀번호 변경</h2>
       </div>
		<div class="login-form" >
			<form class="box-body" method="post" action="${contextPath}/login/pw_s_result" style="text-align:center;" onsubmit="return validation();">
				<ul style="list-style:none;">
					<li style="text-align:left;">&emsp;아이디</li>
					<input type="text"  id="u_p_id" name="u_p_id" value="${usersearch.u_p_id}" class="text-field" style="width:337px;" readonly>
					<li style="text-align:left;">&emsp;새 비밀번호</li>
					<input type="text" id="u_pw" name="u_pw" minlength="8" maxlength="16" class="text-field" style="width:337px;">
					<li><font id="pwtest" name="pwtest" size="2"></font></li>
					<li style="text-align:left;">&emsp;새 비밀번호 확인</li>
					<input type="text" id="pass1"name="pass1" minlength="8" maxlength="16" class="text-field" style="width:337px;">
					<li><font id="pwtest1" name="pwtest1" size="2"></font></li>
				</ul>
				<div class="box-footer">
					<a href="${contextPath}/login"><button type="button"class="btn btn-cancel">취소</button></a>
					<button type="submit" class="btn btn-info">저장</button>
				</div>
			</form>
		</div>
	</div>
		
</section>

</div>

<!-- Footer Section Begin -->
<%@ include file="include/footertest.jsp" %>
<!-- Footer Section End -->
<!-- Js Plugins -->
<%@ include file="include/plug_in.jsp" %>

</body>

</html>