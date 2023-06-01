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
<script>
$(function(){
	
   // 전화번호 이벤트
   $("#tel1").change(function () {
		var tel1	= document.getElementById("tel1").value;
		var tel2	= document.getElementById("tel2").value;
		var tel3	= document.getElementById("tel3").value;
		
		$("input[name=u_phone]").attr('value',tel1+"-"+tel2+"-"+tel3);
		// 인증번호 받은 후, 번호 수정시 인증번호 초기화
		$("input[name=numtest1]").attr('value',"");
		$("#numresult").text("");
	});
	$("input[name=tel2]").keyup(function () {
		var tel1	= document.getElementById("tel1").value;
		var tel2	= document.getElementById("tel2").value;
		var tel3	= document.getElementById("tel3").value;
		
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
		var tel1	= document.getElementById("tel1").value;
		var tel2	= document.getElementById("tel2").value;
		var tel3	= document.getElementById("tel3").value;
		
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
	
	// 인증번호 받기
	$("#numtest").click(function(){
        var a = Math.floor(Math.random() * 99999999) + 00000000;
        $("input[name=numtest1]").attr('value',a);
        alert("인증번호 입니다 : "+a);
	});
	
	// 인증번호 확인
	$("input[name=numtest2]").keyup(function () {
		var numtest1		= document.getElementById("numtest1").value;
		var numtest2		= document.getElementById("numtest2").value;
		
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
         
   //아이디 중복체크
   $(".btn-dupIdbtn").click(function() {
	   var u_p_id = document.getElementById("u_p_id").value;
	   
	   if(u_p_id==""||u_p_id.length < 4){
		   if(u_p_id==""){
			   alert("아이디를 입력해 주세요!");
		   } else {
			   alert("아이디를 4글자 이상 입력해주세요!")
		   }
	   } else {
		   const url = "${contextPath}/login/join_sel";
			var paramData = {
	          "u_p_id"      : u_p_id
	       }
			
			$.ajax({
			      url: url,
			      data:paramData,
			      dataType: 'json',
			      type: 'POST',
			      success:function(result){
			         console.log(result);
			         //alert("성공");
			         if(result != 0){
			        	 //alert("사용불가");
			        	 $('#dupId').attr('value','1');
			        	 dupId1.type="hidden";
			             id1.type= "text";
			         } else {
			        	 //alert("사용가능");
			        	 $('#dupId').attr('value','2');
			             dupId1.type="text";
			         }
			      },
			      error:function(result,status,error){
			         console.log(result);
			         alert("에러가 발생했습니다");
			         alert("code:"+result.status+"\n"+"message:"+result.responseText+"\n"+"error:"+error);
			      }
			});
	   }
   });
   
   //아이디 변경시 경고메세지 히든처리
   $("#u_p_id").keyup(function(){
		   dupId1.type="hidden";
		   id1.type="hidden";
   });
   
   //닉네임 중복체크
   $(".btn-dupNnamebtn").click(function() {
	var u_nname = document.getElementById("u_nname").value;
	   
	   if(u_nname==""||u_nname.length < 4){
		   if(u_nname==""){
			   alert("닉네임을 입력해 주세요!");
		   } else {
			   alert("닉네임을 4글자 이상 입력해주세요!")
		   }
	   } else {
		   const url = "${contextPath}/login/join_nnamesel";
			var paramData = {
	          "u_nname"      : u_nname
	       }
			
			$.ajax({
			      url: url,
			      data:paramData,
			      dataType: 'json',
			      type: 'POST',
			      success:function(result){
			         console.log(result);
			         if(result != 0){
			        	 $('#dupNname').attr('value','1');
			        	 dupNname1.type="hidden";
			        	 nname1.type= "text";
			         } else {
			        	 $('#dupNname').attr('value','2');
			        	 dupNname1.type="text";
			         }
			      },
			      error:function(result,status,error){
			         console.log(result);
			         alert("에러가 발생했습니다");
			         alert("code:"+result.status+"\n"+"message:"+result.responseText+"\n"+"error:"+error);
			      }
			});
	   }
   });
   
   //닉네임 클릭시 경고메세지 히든처리
   $("#u_nname").keyup(function(){
      nname1.type="hidden";
      dupNname1.type="hidden";
   });
   
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
	
	// 주민번호 이벤트
	$("input[name=snumber]").keyup(function () {
		var snumber		= document.getElementsByName("snumber")[0].value;
		var snumber1	= document.getElementsByName("snumber1")[0].value;
		
		$("input[name=u_p_snumber]").attr('value',snumber+"-"+snumber1);
	});
	$("input[name=snumber1]").keyup(function () {
		var snumber		= document.getElementsByName("snumber")[0].value;
		var snumber1	= document.getElementsByName("snumber1")[0].value;
		
		$("input[name=u_p_snumber]").attr('value',snumber+"-"+snumber1);
	});
	
	// 이메일 이벤트
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
	
	// 필수 체크 박스 이벤트
	$("#essential").change(function () {
		
		if($("#essential").is(':checked')){
	        $('#u_personalData').attr('value',"1");
	    } else {
	        $('#u_personalData').attr('value',"0");
	    }
	});
	
	// 선택 체크 박스 이벤트
	$("#choice").change(function () {
		
		if($("#choice").is(':checked')){
	        $('#u_advertising').prop('value',"1");
	        $("#advertising1").prop("checked", true);
        	$("#advertising2").prop("checked", true);
        	$('input[name=choice1]').prop('value',"1");
        	$('input[name=choice2]').prop('value',"2");
	        $('input[name=choice3]').prop('value',"3");
	        $('input[name=u_media]').prop('value',"3");
	    } else {
	    	$('#u_advertising').prop('value',"0");
	        $("#advertising1").prop("checked", false);
        	$("#advertising2").prop("checked", false);
        	$('input[name=choice1]').prop('value',"0");
        	$('input[name=choice2]').prop('value',"0");
	        $('input[name=choice3]').prop('value',"0");
	        $('input[name=u_media]').prop('value',"0");
	    }
	});
	
	$("#advertising1").change(function () {
			
		if($("#advertising1").is(':checked')){
	        if($("#advertising2").is(':checked')==true){
	        	$('input[name=choice1]').prop('value',"1");
	        	$('input[name=choice3]').prop('value',"3");
	        	$('input[name=u_media]').prop('value',"3");
		    } else {
		    	$("#choice").prop("checked", true);
		        $('#u_advertising').prop('value',"1");
		        $('input[name=choice1]').prop('value',"1");
		        $('input[name=u_media]').prop('value',"1");
		    }
	    } else {
	        if($("#advertising2").is(':checked')==false){
	        	$('#u_advertising').prop('value',"0");
		        $("#choice").prop("checked", false);
		        $('input[name=u_media]').prop('value',"0");
		    }
	        $('input[name=choice3]').prop('value',"0");
	        $('input[name=choice1]').prop('value',"0");
	        $('input[name=u_media]').prop('value',document.getElementById("choice2").value);
	    }
	});
	
	$("#advertising2").change(function () {
		
		if($("#advertising2").is(':checked')){
	        if($("#advertising1").is(':checked')==true){
	        	$('input[name=choice2]').prop('value',"2");
	        	$('input[name=choice3]').prop('value',"3");
	        	$('input[name=u_media]').prop('value',"3");
		    } else {
		    	$("#choice").prop("checked", true);
		        $('#u_advertising').prop('value',"1");
		        $('input[name=choice2]').prop('value',"2");
		        $('input[name=u_media]').prop('value',"2");
		    }
	    } else {
	        if($("#advertising1").is(':checked')==false){
	        	$('#u_advertising').prop('value',"0");
		        $("#choice").prop("checked", false);
		        $('input[name=u_media]').prop('value',"0");
		    }
	        $('input[name=choice2]').prop('value',"0");
	        $('input[name=choice3]').prop('value',"0");
	        $('input[name=u_media]').prop('value',document.getElementById("choice1").value);
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

//성별 이벤트
function Gender(event) {
	document.getElementById("u_gender").value = event.target.value;
}

function validation() {
	var exptext         = /^[a-zA-Z]+[a-zA-Z0-9]{3,16}$/;	//영문대소문자,숫자 4~16자리(띄어쓰기X)
	var exptextEmail    = /^([a-zA-Z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
    var exptextNum      = /^[0-9]{3}[-\s\.]?[0-9]{3,4}[-\s\.]?[0-9]{4}$/;
    var exptextPass			= /^(?=.*?[a-zA-Z])(?=.*?[0-9]).{8,16}$/;
    var exptextName         = /^[a-zA-Z가-힣]{1,16}$/;
    var exptextSnum		= /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;
    var exptextNumtest2	= /^[0-9]{8}$/;
    
	var u_p_id            = document.getElementById("u_p_id").value;
	var u_pw				= document.getElementsByName("u_pw")[0].value;
	var pass1				= document.getElementsByName("pass1")[0].value;
	var u_mail         = document.getElementById("u_mail").value;
	var u_phone            = document.getElementById("u_phone").value;
	var u_nname         = document.getElementById("u_nname").value;
	var u_name         = document.getElementById("u_name").value;
	var u_p_snumber         = document.getElementById("u_p_snumber").value;
	var u_gender		= document.getElementById("u_gender").value;
	var numtest1		= document.getElementsByName("numtest1")[0].value;
	var numtest2		= document.getElementsByName("numtest2")[0].value;
	var u_personalData		= document.getElementById("u_personalData").value;
	
	if(exptext.test(u_p_id)==false) {
	   alert("아이디 형식이 올바르지 않습니다.");
	   document.getElementById("u_p_id").focus();
	   return false;
	}
   
	//아이디 중복체크
   if (dupId.value==1) {
      alert("아이디 중복확인을 해주세요");
      document.getElementById("u_p_id").focus();
      return false;
   }
 
   if(exptext.test(u_nname)==false) {
	      alert("닉네임 형식이 올바르지 않습니다.");
	      document.getElementById("u_nname").focus();
	      return false;
	   }
   
 //닉네임 중복체크
   if (dupNname.value==1) {
      alert("닉네임 중복확인을 해주세요");
      document.getElementById("u_nname").focus();
      return false;
   }
   
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
   
   if(exptextName.test(u_name)==false) {
      alert("이름 형식이 올바르지 않습니다.");
      document.getElementById("u_name").focus();
      return false;
	}
   
   if(exptextSnum.test(u_p_snumber)==false) {
      alert("주민번호 형식이 올바르지 않습니다.");
      document.getElementById("snumber").focus();
      return false;
	}
   
   if(u_gender==""){
		alert("성별을 체크해 주세요.");
		document.getElementsByName("gender")[0].focus();
		return false;
   }

   if(exptextNum.test(u_phone)==false) {
      alert("핸드폰 번호가 올바르지 않습니다.");
      document.getElementById("tel2").focus();
      return false;
   }
   
   if(exptextNumtest2.test(numtest2)==false||numtest1!=numtest2){
		alert("인증번호가 일치하지 않습니다.");
		$("#numtest").focus();
		return false;
	}
   
   if(exptextEmail.test(u_mail)==false) {
      alert("이메일형식이 올바르지 않습니다.");
      return false;
	}
   
   if(u_personalData != "1"){
	   alert("필수 동의를 체크하여 주세요!");
	   return false;
   }
   
}

</script>

<style>
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
		
	.box1{
		position:absolute;
		width:160px;
		font-size:16px;
		height:42px;
		right:140px;
		
	}
	
	.lia{
		display:inline;
		padding:0 10px;
    }
	
</style>

<body>
<!-- header -->
<%@ include file="include/header.jsp" %>
<!-- header end -->
<!-- hero -->
<%@ include file="include/hero.jsp" %>
<!-- hero end -->
<!-- Main content -->
    <section class="content container-fluid">
        <div class="container">
            <div class="row">
               <div class="col-lg-3 col-md-5">
                  <input type="hidden" >
               </div>
                <div class="col-lg-9 col-md-7">
                    <div class="box-header">
         <h3 class="box-title" >회원가입</h3>
      </div>
      <br>
      <br>
      <form role="form" method="post" accept-charset="utf-8" onsubmit="return validation();">
     <div class="box-body">
     <div class ="form-group">
     <label style="float:left;width:120px">아이디</label>
     <input type="text" id="u_p_id" name="u_p_id" value="" minlength="4" maxlength="16" style="float:left;width:20%">
     <button type="button" class="btn-dupIdbtn" style="float:left;width:100px" >중복확인</button>
     <input type="hidden" id="dupId" name="dupId" value="1">
     <!-- 
     <input type="hidden" id="user_list" name="user_list" value="0">
     <c:forEach var="user_sel" items="${user_sel}">
     	<c:if test="${user_sel == document.getElementById('u_p_id').value}">
     		<input type="hidden" id="user_list" name="user_list" value="1">
     	</c:if>
     </c:forEach>
      -->
     <input type="hidden" id='id1' name='id1' class="form-control" 
               value="사용 불가능한 아이디 입니다." style="float:left;color: red; width:30%" readonly="readonly" >
     <input type="hidden" id="dupId1" name="dupId1" value="사용 가능한 아이디 입니다." style="float:left;color:red; width:30%" readonly>
     </div><br>
     <br>
     <br>
     <div class ="form-group">
     <label style="float:left;width:120px">닉네임</label>
     <input type="text" id="u_nname" name="u_nname" minlength="4" maxlength="16" style="float:left;width:20%">
     <button type="button" class="btn-dupNnamebtn" style="float:left;width:100px" >중복확인</button>
     <input type="hidden" id="dupNname" name="dupNname" value="1">
     <input type="hidden" id='nname1' name='nname1' class="form-control" 
               value="닉네임 형식이 잘못되었습니다." style="float:left;color: red; width:30%" readonly="readonly" >
     <input type="hidden" id="dupNname1" name="dupNname1" value="사용 가능한 닉네임 입니다." style="float:left;color:red; width:30%">
     </div><br>
     <br>
     <div class="form-group">
     <label style="float:left;width:120px">비밀번호</label>
     <input type="password" id="u_pw" name="u_pw" minlength="8" maxlength="16" class="form-control" style="width:20%" >
     <font id="pwtest" name="pwtest" size="2"></font>
     </div>   
     <br>
     <div class="form-group">
     <label style="float:left;width:120px">비밀번호 확인</label>
     <input type="password" id="pass1"name="pass1" minlength="8" maxlength="16" class="form-control"style="width:20%">
     <font id="pwtest1" name="pwtest1" size="2"></font>
     </div>
     <br>
     <div class="form-group">
     <label style="float:left;width:120px">이름</label>
     <input type="text" id="u_name" name="u_name" class="form-control" style="float:left;width:20%">
     </div>
     <br>
     <br>
     <div class="form-group">
     <label style="float:left;width:120px">주민등록번호</label>
     <input type="text" id="snumber" name="snumber" class="form-control" maxlength="6" style="float:left;width:150px">
     <label style="float:left;width:10px;font-size:1.5em">-</label>
     <input type="password" id="snumber1" name="snumber1" class="form-control" maxlength="7" style="float:left;width:150px">
     <input type="hidden" id="u_p_snumber" name="u_p_snumber" class="form-control" style="width:337px;" value="" readonly>
     </div>
     <br>
     <br>
     <div class="form-group">
     <label style="width:120px">성별</label>
     <input type="radio" name="gender" value="male" style="width:30px" onclick="Gender(event)">남성
     <input type="radio" name="gender" value="famale" style="width:30px" onclick="Gender(event)">여성
     <input type="hidden" id="u_gender" name="u_gender" value="" class="form-control" style="width:150px;" readonly>
     </div>
     <br>
     <div class="form-group">
     <label style="float:left;width:120px">핸드폰번호</label>
     <div style="float:left">
     <select id="tel1" name="tel1" class="form-control" size="5" style="width:60px; height:30px;">
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
     </select>
     </div>
     <label style="float:left;width:10px;font-size:1.5em">-</label>
     <input type="text" id="tel2" name="tel2" class="form-control" maxlength="4" style="float:left;width:100px">
     <label style="float:left;width:10px;font-size:1.5em">-</label>
     <input type="text" id="tel3" name="tel3" class="form-control" maxlength="4" style="float:left;width:100px">
     <input type="hidden" id='u_phone' name='u_phone' class="form-control" value="" >
     <button id="numtest" name="numtest" type="button" disabled="disabled"  class="btn btn-btncheck"><font style="vertical-align: inherit;">인증번호받기</font></button>
	 <input type="hidden" id="numtest1" name="numtest1" class="form-control" style="width:337px;" readonly>
	 </div>
	 <div class="form-group">
	 <label style="float:left;width:120px"></label>
	 <input type="text" id="numtest2" name="numtest2" maxlength="8" placeholder="인증번호를 입력해 주세요." class="form-control" style="width:337px;">
	 <label style="float:left;width:120px"></label>
	 <font id="numresult" name="numresult" size="2"></font>
     </div>
     <div class="form-group">
     <label style="float:left;width:120px">주소</label>
     <input type="text" id="u_address" name="u_address" class="form-control" style="float:left;width:500px">
     </div>
     <br>
     <br>
     <ul>
     <label style="float:left; width:120px;">이메일</label>
     <input type="text" class="form-control" id="email1" name="email1" value="" style="float:left; width:200px">
     <lia style="float:left;">&ensp;@&ensp;</lia>
     <input type="text" class="form-control" id="email2" name="email2" value="" style="float:left; width:200px" readonly>
     <select class="box1" id="email3" name="email3" onchange="Email(event)">
     	<option selected="selected" value="선택하세요">선택하세요</option>
		<option value="naver.com">naver.com</option>
		<option value="gmail.com">gmail.com</option>
        <option value="hanmail.com">hanmail.com</option>
        <option value="">직접입력</option>
     </select>
     </ul>
     <br>
     <br>
     <br>
     <input type="hidden" id='u_mail' name='u_mail' value="" class="form-control" style="color: red;width:450px" readonly="readonly">
     <br>
     <br>
     <br>
     <br>
     <span class="input_chk">
       <input type="checkbox" id="essential" name="essential" class="chk">
       <span class="terms_choice" style="color:red"><필수></span>
       <label for="essential" class="collect_personal">"개인정보 수집 및 이용 동의"</label>
      </span><br>
        <textarea id="personalData1" class="terms_box" rows="7" style="width:500px">
         "개인정보보호법에 따라 냥집샵에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 
         동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
         이용자는 회원가입을 하지 않아도 정보 검색 등 대부분의 냥집샵는 서비스를 회원과 동일하게 이용할 수 있습니다. 
         이용자가 상품구매, 리뷰, 자유게시판 글쓰기,신고/문의 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 
         냥집샵는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다."
     </textarea>
     <input type="hidden" id="u_personalData" name="u_personalData" value="0">
     <br>
     <span class="input_chk">
       <input type="checkbox" id="choice" name="choice">
       <span class="terms_choice" style="color:blue;"><선택></span>
       <label for="choice" class="collect_personal">"광고성 정보 수신동의"</label>
      </span><br>
        <textarea class="terms_box" rows="7" style="width:500px">
         "냥집샵에서 제공하는 이벤트/혜택 등 다양한 정보를 휴대전화(냥집샵의 알림 또는 문자), 이메일로 받아보실 수 있습니다. 
          일부 서비스(별도 회원 체계로 운영하거나 냥집샵 가입 이후 추가 가입하여 이용하는 서비스 등)의 경우, 
          개별 서비스에 대해 별도 수신 동의를 받을 수 있으며, 
            이때에도 수신 동의에 대해 별도로 안내하고 동의를 받습니다."
     </textarea>
     <input type="hidden" id="u_advertising" name="u_advertising" value="0">
     <br>
     <label for="advertising1" class="collect_personal">휴대폰</label>
     <input type="checkbox" id="advertising1" name="advertising1">
     <label for="advertising2" class="collect_personal">이메일</label>
     <input type="checkbox" id="advertising2" name="advertising2">
     <input type="hidden" id="choice1" name="choice1" value="0">
     <input type="hidden" id="choice2" name="choice2" value="0">
     <input type="hidden" id="choice3" name="choice3" value="0">
     <input type="hidden" id="u_media" name="u_media" value="0">
     <br>
      </div>
     <br>
     <div class="box-footer">
     <button type="submit" class="btn btn-primary">회원가입</button>
     <br>
     <br>
     </div>   
     </form>
           </div>
       </div>
    </div>
  
     
    </section>
    <!-- /.content -->
  
    

    <!-- Footer Section Begin -->
   <%@ include file="include/footertest.jsp" %>
    <!-- Footer Section End -->
    <!-- Js Plugins -->
    <%@ include file="include/plug_in.jsp" %>

</body>

</html>