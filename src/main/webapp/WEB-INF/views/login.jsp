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
	
	
</style>
<body>
<section class="content container-fluid">
	<div class="container">
		<div class="section-title">
			<div class="header__logo" style="margin : 100px auto;">
				<a href="/nyangjipshop/main"><img src="${contextPath}/resources/bootstrap/img/logoim1.png" alt=""></a>
			</div>
			<div class="section-title">
				<c:if test="${user==null }">
					<h3>로그인</h3>
				</c:if>
	          <br><h4>${msg}</h4>
			</div>
			${user.u_nname }
			<c:if test="${user!=null }">
				${user.u_nname }님 환영합니다. <br>
				<a href="${contextPath}/logOut"> <h3 class="box-title">로그아웃</h3></a>
			</c:if>
		</div>
		<div class="login-form" >
			<form class="box-body" method="post" style="text-align:center;">
				<input type="text" id="u_p_id" name="u_p_id" class="text-field" placeholder="아이디">
				<input type="password" id="u_pw" name="u_pw" class="text-field" placeholder="비밀번호">
				<ul style="list-style:none;">
					<lia><a href="${contextPath}/login/join">회원가입</a></lia>
					<lia><a href="${contextPath}/login/idsearch">아이디찾기</a></lia>
					<lia><a href="${contextPath}/login/pwsearch">비밀번호찾기</a></lia>
				</ul>
				<br>
				<div class="box-footer">
					<button type="submit"class="btn btn-primary">로그인</button>
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