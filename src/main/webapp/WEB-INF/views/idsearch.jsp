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
	
	// 전화번호 입력
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
		$("input[name=numtest1]").attr('value',"");u_name
		$("#numresult").text("");
		if(u_phone.length>=12&&u_phone.length<=13){
			numtest.disabled = false;
		}else{
			numtest.disabled = true;
		}
	});
	
	// 주민번호 이벤트
	$("input[name=snum1]").keyup(function () {
		var snum1	= document.getElementsByName("snum1")[0].value;
		var snum2	= document.getElementsByName("snum2")[0].value;
		
		$("input[name=u_p_snumber]").attr('value',snum1+"-"+snum2);
	});
	$("input[name=snum2]").keyup(function () {
		var snum1	= document.getElementsByName("snum1")[0].value;
		var snum2	= document.getElementsByName("snum2")[0].value;
		
		$("input[name=u_p_snumber]").attr('value',snum1+"-"+snum2);
	});
	
   // 인증번호 버튼
   $(".btn-numtest").click(function(){
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
})

// 정규화
// 1."tel" 이 12~13 자리이며, 앞의 3자리가 01~인지, 가운데가 3~4자리인지, 뒤가4자리인지
// 2. 인증번호"numtest2"가 8자리인지, 1과2가(발급된 인증번호화 적은 번호) 일치한지

function validation(){
	var u_phone			= document.getElementsByName("u_phone")[0].value;
	var numtest1		= document.getElementsByName("numtest1")[0].value;
	var numtest2		= document.getElementsByName("numtest2")[0].value;
	var u_p_snumber     = document.getElementById("u_p_snumber").value;
	
	var exptextTel		= /^[0-9]{3}[-\s\.]?[0-9]{3,4}[-\s\.]?[0-9]{4}$/;
	var exptextNumtest2	= /^[0-9]{8}$/;
	var exptextSnum		= /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;
	//var exptextSnum		= /^[0-9]{6}[-]?[0-9]{7}$/;
	
	if(exptextTel.test(u_phone)==false){
		alert("전화번호 형식이 올바르지 않습니다.");
		return false;
	}
	if(exptextNumtest2.test(numtest2)==false||numtest1!=numtest2){
		alert("인증번호가 일치하지 않습니다.");
		return false;
	}
	
	if(exptextSnum.test(u_p_snumber)==false) {
      alert("주민번호 형식이 올바르지 않습니다.");
      document.getElementById("snum1").focus();
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
    
    .btn-numtest2 {
		color: #343a40;
		border-color: #343a40;
		hover-color: #fff;
		hover-bg: #343a40;
		hover-border-color: #343a40;
		focus-shadow-rgb: 52, 58, 64;
		active-color: #fff;
		active-bg: #343a40;
		active-border-color: #343a40;
		active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
		disabled-color: #343a40;
		disabled-bg: transparent;
		disabled-border-color: #343a40;
		gradient: none;
	}
	
	.btn-numtest {
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
	
	.box{
		width:95px;
		font-size:16px;
		height:47px;
		margin-left:10px;
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
          <h2>아이디 찾기</h2>
          <br><br><h5>${msg}</h5>
       </div>
		<div class="login-form" >
			<form class="box-body" action="${contextPath}/login/id_s_result" method="post" style="text-align:center;" onsubmit="return validation();" >
				<ul style="list-style:none;">
					<li style="text-align:left;">&emsp;이 름</li>
					<input type="text" id="u_name" name="u_name" value="" class="text-field" style="width:337px;" minlength="2">
					<li style="text-align:left;">&emsp;주민등록번호</li>
					<lia><input type="text" id="snum1" name="snum1" class="text-field" style="width:158px;" minlength="6" maxlength="6">&ensp;-&ensp;<input type="password" id="snum2" name="snum2" class="text-field" style="width:158px;" minlength="7" maxlength="7"></lia>
					<input type="hidden" id="u_p_snumber" name="u_p_snumber" class="text-field" style="width:337px;" value="" readonly>
					<li style="text-align:left;">&emsp;전화번호</li>
					<lia>
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
						<input type="text" name="tel2" class="text-field" minlength="3" maxlength="4" style="width:98px;">&ensp;-&ensp;
						<input type="text" name="tel3" class="text-field" minlength="4" maxlength="4" style="width:98px;">
						<input type="hidden" id="u_phone" name="u_phone" value="" class="text-field" minlength="12" maxlength="13" style="width:337px;" readonly>
					</lia>
				</ul>
				<div style="float:left;">
					&emsp;<button id="numtest" name="numtest" type="button" disabled="disabled"  class="btn btn-numtest"><font style="vertical-align: inherit;">인증번호받기</font></button>
				</div>
				<div style="margin : 50px auto;">
				<input type="hidden" name="numtest1" class="text-field" style="width:337px;" readonly>
				<!-- style="list-style:none;"는 점 지우는거 -->
				<li style="list-style:none;"><input type="text" name="numtest2" maxlength="8" class="text-field" style="width:337px;"></li>
				<font id="numresult" name="numresult" size="2"></font>
				</div>
				<div class="box-footer">
					<a href="${contextPath}/login"><button type="button"class="btn btn-cancel">취소</button></a>
					<button type="submit"class="btn btn-info">아이디 찾기</button>
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