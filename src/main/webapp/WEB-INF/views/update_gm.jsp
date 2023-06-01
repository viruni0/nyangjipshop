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

// 성별 이벤트
function Gender(event) {
	document.getElementById("u_gender").value = event.target.value;
}

// 정규화
// 비밀번호 8~16자리, 영문, 숫자 각 최소 1개씩은 필수, 전화번호, 인증번호, 이메일 정규화

function validation(){
	var u_pw			= document.getElementsByName("u_pw")[0].value;
	var pass1			= document.getElementsByName("pass1")[0].value;
	var u_phone			= document.getElementsByName("u_phone")[0].value;
	var u_mail			= document.getElementById("u_mail").value;
	
	var exptextPass		= /^(?=.*?[a-zA-Z])(?=.*?[0-9]).{8,16}$/;
	var exptextTel		= /^[0-9]{3}[-\s\.]?[0-9]{3,4}[-\s\.]?[0-9]{4}$/;
	var exptextEmail	= /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	
	if(exptextPass.test(u_pw)==false||exptextPass.test(pass1)==false){
		alert("비밀번호 형식이 올바르지 않습니다./n(영문,숫자 최소 각 1개씩 8~16자리)");
		return false;
	}
	if(u_pw!=pass1){
		alert("비밀번호화, 확인란의 비밀번호가 일치하지 않습니다.");
		return false;
	}
	if(exptextTel.test(u_phone)==false){
		alert("전화번호 형식이 올바르지 않습니다.");
		return false;
	}
	if(exptextEmail.test(u_mail)==false){
		alert("이메일 형식이 올바르지 않습니다.");
		return false;
	}
}

</script>

<style>

	.login-form{
		border-radius: 5px;
		width: 80%;
		background-color: #eeeff1;
		padding:40px;
		margin : 100px auto;
	}
	.text-field{
		font-size: 16px;
        padding : 10px;
        margin-top: 10px;
        margin-bottom: 20px;
        border-radius: 5px;
        border : none;
        box-sizing: border-box;
    }
    input:read-only{background-color:#dedede}
    
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
    
    .btn-btncheck {
		border-radius: 255px 25px 225px 25px / 25px 225px 25px 255px;
		color:#555;
		border-color:#555;
		hover-color:#fff;
		hover-bg:#555;
		hover-border-color:#555;
		focus-shadow-rgb:85,85,85;
		active-color:#fff;
		active-bg:#555;
		active-border-color:#555;
		active-shadow:inset 0 3px 5px rgba(0, 0, 0, 0.125);
		disabled-color:#555;
		disabled-bg:transparent;
		disabled-border-color:#555;
		gradient:none;
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
	
	.box{
		width:95px;
		font-size:16px;
		height:47px;
		margin-top:9px;
	}
	
	.box1{
		width:160px;
		font-size:16px;
		height:47px;
		margin-top:9px;
		margin-right:220px;
		float:right;
	}
	
</style>

<body>
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/hero.jsp" %>
    
    <section class="content container-fluid">
	<div class="container">
		<div class="section-title">
          <h2>유저 개인 정보 수정</h2>
       </div>
		<div class="login-form" >
			<form class="box-body" method="post" action="${contextPath}/mypageGM/update_gm" accept-charset="utf-8" onsubmit="return validation();">
				<ul style="list-style:none;">
					<li>이 름</li>
					<input type="text" class="text-field" value="${usersearch.u_name}" style="width:150px;">
					<li>닉네임</li>
					<input type="text" class="text-field" value="${usersearch.u_nname}" style="width:150px;">
					<li>아이디</li>
					<input type="text" id= "u_p_id" name="u_p_id" class="text-field" value="${usersearch.u_p_id}" style="width:150px;">
					<li>비밀번호</li>
					<li><input type="text" id= "u_pw" name="u_pw" value="${usersearch.u_pw}" class="text-field" placeholder="변경할 새 비밀번호" style="width:200px;"></li>
					<li><font id="pwtest" name="pwtest" size="2"></font></li>
					<li>비밀번호 확인</li>
					<li><input type="text" name="pass1" class="text-field" value="${usersearch.u_pw}" style="width:200px;"></li>
					<li><font id="pwtest1" name="pwtest1" size="2"></font></li>
					<li>전화번호</li>
					<input type="text" id="u_phone" name="u_phone" value="${usersearch.u_phone}" class="text-field" minlength="12" maxlength="13" style="width:337px;">
					<!-- style="list-style:none;"는 점 지우는거 -->
					<li>주 소</li>
					<input type="text" id="u_address" name="u_address" class="text-field" value="${usersearch.u_address}" style="width:450px;">
					<li>성 별</li>
     				<br><input type="radio" id="gender" name="gender" value="male" style="width:30px" onclick="Gender(event)"/>남성
     				<input type="radio" id="gender" name="gender" value="female" style="width:30px" onclick="Gender(event)"/>여성
					<br><input type="text" id="u_gender" name="u_gender" class="text-field" value="${usersearch.u_gender}" style="width:150px;" readonly>
					<li>이메일</li>
					<input type="text" id='u_mail' name='u_mail' value="${usersearch.u_mail}" class="text-field" style="color: red; width:450px">
					<br>
					<li>블랙리스트 카운트</li>
					<input type="text" id="u_b_cnt" name="u_b_cnt" class="text-field" value="${usersearch.u_b_cnt}" style="width:450px;">
					<br>
					<li>사용자 상태값(0=탈퇴/1=정상/2=휴면/3=블랙리스트/4=관리자)</li>
					<input type="text" id="u_state" name="u_state" class="text-field" value="${usersearch.u_state}" style="width:450px;">
					<br>
					<!-- 
					<li>쿠폰 사용 유무(0=사용, 1=미사용)</li>
					<input type="text" id='m_u_coupon' name='m_u_coupon' value="${usersearch.member_user.m_u_coupon}" class="text-field" style="color: red; width:450px">
					<br>
					 -->
				</ul>
		
				<div class="box-footer">
					<a href="${contextPath}/mypageU/my_search"><button type="button"class="btn btn-cancel">취소</button></a>
					<button type="submit"class="btn btn-info">저장</button>
				</div>
			</form>
		</div>
	</div>
    </section>
    
 <!-- Footer Section Begin -->
   <%@ include file="include/footertest.jsp" %>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
   <%@ include file="include/plug_in.jsp" %>


</body>

</html>