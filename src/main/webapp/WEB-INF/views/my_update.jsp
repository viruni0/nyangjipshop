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
	
	// 비밀번호 변경 버튼
	$("#passchange").click(function(){
		var u_pw	= document.getElementsByName("u_pw")[0].value;
		var pass1	= document.getElementsByName("pass1")[0].value;
		// 새 비밀번호 입력란 활성화, 비활성화
		$("input[name=u_pw]").attr('type',"text");
		$("input[name=u_pw]").attr('value',"");
		$("input[name=pass1]").attr('type',"text");
		$("input[name=pass1]").attr('value',"");
		$("#passchange").attr('disabled',"disabled");
	});
	
	// 인증번호 받기
	$("#numtest").click(function(){
        var a = Math.floor(Math.random() * 99999999) + 00000000;
        $("input[name=numtest1]").attr('value',a);
        alert("인증번호 입니다 : "+a);
	});
	
	// 인증번호 확인
	$("input[name=numtest2]").keyup(function () {
		var numtest1		= document.getElementsByName("numtest1")[0].value;
		var numtest2		= document.getElementsByName("numtest2")[0].value;
		
		if(numtest2.length>7){
			if(numtest1==numtest2){
				$("#numresult").text("인증번호가 일치합니다.");
				$("#numresult").attr('color', '#199894b3');
			}else{
				$("#numresult").text("인증번호가 일치하지 않습니다.");
				$("#numresult").attr('color', '#f82a2aa3');
			}
		}else{
			$("#numresult").text("");
		}
	});
	
	// 전화번호 이벤트
	$("#tel1").change(function () {
		var tel1	= document.getElementsByName("tel1")[0].value;
		var tel2	= document.getElementsByName("tel2")[0].value;
		var tel3	= document.getElementsByName("tel3")[0].value;
		
		$("input[name=u_phone]").attr('value',tel1+"-"+tel2+"-"+tel3);
		// 인증번호 받은 후, 번호 수정시 인증번호 초기화
		$("input[name=numtest1]").attr('value',"");
		$("#numresult").text("");
	});
	$("input[name=tel2]").keyup(function () {
		var tel1	= document.getElementsByName("tel1")[0].value;
		var tel2	= document.getElementsByName("tel2")[0].value;
		var tel3	= document.getElementsByName("tel3")[0].value;
		
		$("input[name=u_phone]").attr('value',tel1+"-"+tel2+"-"+tel3);
		var u_phone		= document.getElementsByName("u_phone")[0].value;
		$("input[name=numtest1]").attr('value',"");
		$("#numresult").text("");
		// 인증번호활성화, 비활성화
		if(u_phone.length>=12&&u_phone.length<=13){
			numtest.disabled = false;
		}else{
			numtest.disabled = true;
		}
	});
	$("input[name=tel3]").keyup(function () {
		var tel1	= document.getElementsByName("tel1")[0].value;
		var tel2	= document.getElementsByName("tel2")[0].value;
		var tel3	= document.getElementsByName("tel3")[0].value;
		
		$("input[name=u_phone]").attr('value',tel1+"-"+tel2+"-"+tel3);
		var u_phone		= document.getElementsByName("u_phone")[0].value;
		$("input[name=numtest1]").attr('value',"");
		$("#numresult").text("");
		if(u_phone.length>=12&&u_phone.length<=13){
			numtest.disabled = false;
		}else{
			numtest.disabled = true;
		}
	});
	/*
	// 이메일 이벤트 안됨.. 이건 왜안되지
	$("#email3").change(function(){
		//alert("test");
		var email	= document.getElementById("email").value;
		var email1	= document.getElementById("email1").value;
		var email2	= document.getElementById("email2").value;
		var email3	= document.getElementById("email3").value;
		
	    if(email3==""){
	    	$("input[name=email2]").attr("value","");
	    	$("input[name=email2]").attr("readonly", false);
	        $("input[name=email]").attr("value",email1+"@"+email2);
	    }
	    else if(email3=="1"){
	    	$("input[name=email2]").attr("value","");
	    	$("input[name=email2]").attr("readonly", true);
	        $("input[name=email]").attr("value",email1+"@"+email2);
	    }else{
	    	$("input[name=email2]").attr("value",email3);
	    	$("input[name=email2]").attr("readonly", true);
	        $("input[name=email]").attr("value",email1+"@"+email3);
	    }
	});
	*/
	$("input[id=email1]").keyup(function () {
		var email1	= document.getElementById("email1").value;
		var email2	= document.getElementById("email2").value;
		var email3	= document.getElementById("email3").value;
		
		if(email3 == ""){
	        $('input[name=u_mail]').attr('value',email1+"@"+email2);
	    } else {
	        $('input[name=u_mail]').attr('value',email1+"@"+email3);
	    }
	});
	
	$("input[id=email2]").keyup(function () {
		var email1	= document.getElementById("email1").value;
		var email2	= document.getElementById("email2").value;
		var email3	= document.getElementById("email3").value;
		
		if(email3 == ""){
	        $('input[name=u_mail]').attr('value',email1+"@"+email2);
	    } else {
	        $('input[name=u_mail]').attr('value',email1+"@"+email3);
	    }
	});
	
})

// 이메일 이벤트

function Email(event) {
	var email1	= document.getElementById("email1").value;
	var email3	= document.getElementById("email3").value;
	
    if(email3==""){
    	email2.value = "";
    	$("input[name=email2]").attr("readonly", false);
    }
    else if(email3=="선택하세요"){
    	email2.value = "";
    	email3 = "";
    	$("input[name=email2]").attr("readonly", true);
    }else{
    	email2.value = email3;
    	$("input[name=email2]").attr("readonly", true);
    }
	$("input[name=u_mail]").attr("value",email1+"@"+email3);
}

// 이메일 이벤트 됨(강사님이 알려준거)
/*
function Email(event) {
	var email3 				= document.getElementById("email3");
	var email1				= document.getElementById("email1").value;
	var selectValue 		= email3.options[email3.selectedIndex].value;
	email2.value = selectValue;
   
	if(selectValue == "") {
      $('input[name=email2]').attr('readonly',false);
	}else if(selectValue == "1"){
		email2.value = "";
    	selectValue = email2.value;
    	$("input[name=email2]").attr("readonly", true);
	}else {
		$('input[name=email2]').attr('readonly',true);
	}
	$('input[name=email]').attr('value',email1+"@"+selectValue);
}
*/

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
	var numtest1		= document.getElementsByName("numtest1")[0].value;
	var numtest2		= document.getElementsByName("numtest2")[0].value;
	var u_mail			= document.getElementById("u_mail").value;
	
	var exptextPass		= /^(?=.*?[a-zA-Z])(?=.*?[0-9]).{8,16}$/;
	var exptextTel		= /^[0-9]{3}[-\s\.]?[0-9]{3,4}[-\s\.]?[0-9]{4}$/;
	var exptextNumtest2	= /^[0-9]{8}$/;
	var exptextEmail	= /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	
	if(exptextPass.test(u_pw)==false||exptextPass.test(pass1)==false){
		alert("비밀번호 형식이 올바르지 않습니다./n(영문,숫자 최소 각 1개씩 8~16자리)");
		document.getElementById("u_pw").focus();
		return false;
	}
	if(u_pw!=pass1){
		alert("비밀번호화, 확인란의 비밀번호가 일치하지 않습니다.");
		document.getElementById("u_pw").focus();
		return false;
	}
	if(exptextTel.test(u_phone)==false){
		alert("전화번호 형식이 올바르지 않습니다.");
		document.getElementById("tel2").focus();
		return false;
	}
	
	if(exptextNumtest2.test(numtest2)==false||numtest1!=numtest2){
		alert("인증번호가 일치하지 않습니다.");
		$("#numtest").focus();
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
          <h2>개인 정보 수정</h2>
       </div>
		<div class="login-form" >
			<form class="box-body" method="post" accept-charset="utf-8" onsubmit="return validation();">
				<ul style="list-style:none;">
					<li>이 름</li>
					<input type="text" class="text-field" value="${usersearch.u_name}" style="width:150px;" readonly>
					<li>닉네임</li>
					<input type="text" class="text-field" value="${usersearch.u_nname}" style="width:150px;" readonly>
					<li>아이디</li>
					<input type="text" id= "u_p_id" name="u_p_id" class="text-field" value="${usersearch.u_p_id}" style="width:150px;" readonly>
					<br><button id="passchange" name="passchange" type="button" class="btn btn-btncheck" style="margin-bottom:10px;"><font style="vertical-align: inherit;">비밀번호 번경</font></button>
					<li><input type="hidden" id= "u_pw" name="u_pw" value="${usersearch.u_pw}" class="text-field" placeholder="변경할 새 비밀번호" style="width:200px;"></li>
					<li><font id="pwtest" name="pwtest" size="2"></font></li>
					<li><input type="hidden" name="pass1" class="text-field" value="${usersearch.u_pw}" placeholder="변경할 새 비밀번호 확인" value="" style="width:200px;"></li>
					<li><font id="pwtest1" name="pwtest1" size="2"></font></li>
					<li>전화번호</li>
					<select id="tel1" name="tel1" class="box" size="5">
						<option selected="selected">010</option>
						<option value="011">011</option>
						<option value="012">012</option>
						<option value="013">013</option>
						<option value="014">014</option>
						<option value="015">015</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>&ensp;-&ensp;
					<input type="text" id="tel2"name="tel2" class="text-field" minlength="3" maxlength="4" style="width:98px;">&ensp;-&ensp;
					<input type="text" name="tel3" class="text-field" minlength="4" maxlength="4" style="width:98px;">
					<input type="hidden" id="u_phone" name="u_phone" value="${usersearch.u_phone}" class="text-field" minlength="12" maxlength="13" style="width:337px;" readonly>
					<button id="numtest" name="numtest" type="button" disabled="disabled"  class="btn btn-btncheck"><font style="vertical-align: inherit;">인증번호받기</font></button>
					<input type="hidden" name="numtest1" class="text-field" style="width:337px;" readonly>
					<!-- style="list-style:none;"는 점 지우는거 -->
					<li><input type="text" name="numtest2" maxlength="8" placeholder="인증번호를 입력해 주세요." class="text-field" style="width:337px;"></li>
					<font id="numresult" name="numresult" size="2"></font>
					<li>주 소</li>
					<input type="text" id="u_address" name="u_address" class="text-field" value="${usersearch.u_address}" style="width:450px;">
					<li>성 별</li>
     				<br><input type="radio" id="gender" name="gender" value="male" style="width:30px" onclick="Gender(event)"/>남성
     				<input type="radio" id="gender" name="gender" value="female" style="width:30px" onclick="Gender(event)"/>여성
					<br><input type="text" id="u_gender" name="u_gender" class="text-field" value="${usersearch.u_gender}" style="width:150px;" readonly>
					<li>이메일</li>
						<input type="text" class="text-field" id="email1" name="email1" value="" style="width:200px"><lia>&ensp;@&ensp;</lia> 
						<input type="text" class="text-field" id="email2" name="email2" value="" style="width:200px" >
						<select class="box1" id="email3" name="email3" onchange="Email(event)">
							<option selected="selected" value="선택하세요">선택하세요</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
					        <option value="hanmail.com">hanmail.com</option>
					        <option value="">직접입력</option>
						</select>
					<input type="hidden" id='u_mail' name='u_mail' value="${usersearch.u_mail}" class="text-field" style="color: red; width:450px" readonly="readonly">
					<br>
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