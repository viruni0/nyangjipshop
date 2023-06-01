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

function pass() {
	
	var u_pw = document.getElementById("u_pw").value;
	if("${usersearch.u_pw}"==u_pw){
		window.opener.parent.location.href = "${contextPath}/mypageU/my_update";
		alert("비밀번호가 확인되었습니다.");
		window.close()
	}else{
		alert("비밀번호가 일치하지 않습니다.");
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
    lia{
		display:inline;
		border-left:1px solid #999; 
		padding:0 10px;
    }
	lia:first-child{border-left:none;}
	
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
		<div class="login-form" >
			<form class="box-body" style="text-align:center;" onsubmit="return pass();">
				<h5>개인정보 수정을 위해</h5>
				<h5>비밀번호를 입력해 주세요.</h5>
				<br>
				<input type="password" id="u_pw" name="u_pw" value="" class="text-field" placeholder="비밀번호를 입력해 주세요">
				<br>
				<div class="box-footer">
					<a href="${contextPath}/login"><button type="button"class="btn btn-cancel" onclick="window.close()">취소</button></a>
					<button type="submit" class="btn btn-info">확인</button>
				</div>
			</form>
		</div>
	</div>
		
</section>

</div>

<!-- Js Plugins -->
<%@ include file="include/plug_in.jsp" %>

</body>

</html>