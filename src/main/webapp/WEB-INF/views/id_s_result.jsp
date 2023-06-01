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
          <h2>아이디 찾기 결과</h2>
       </div>
		<div class="login-form" >
			<form class="box-body" method="post" style="text-align:center;" onsubmit="return validation();">
				<ul style="list-style:none;">
					<h4>아이디</h4><br>
					<h5>${usersearch.u_p_id}</h5>
				</ul><br>
				<div class="box-footer">
					<a href="${contextPath}/login"><button type="button"class="btn btn-cancel">로그인</button></a>
					<a href="${contextPath}/login/pwsearch"><button type="button"class="btn btn-info">비밀번호 찾기</button></a>
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