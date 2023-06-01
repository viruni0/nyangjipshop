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

// 개인정보 수정 넘어가기전 기존 비밀번호 확인
function my_update() {
	
	var width 	= "700";
    var height 	= "600";
 
    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
    var left 	= window.screenLeft + (document.body.clientWidth - width) / 2;
    var top 	= window.screenTop + (document.body.clientHeight - height) / 2;
    
    window.open(
    		"${contextPath}/mypageU/pwtest","pwtest",
      "width="+width+", height="+height+", left="+left+", top="+top);
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
        width : 100%;
        box-sizing: border-box;
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
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/hero.jsp" %>
    
    <section class="content container-fluid">
	<div class="container">
		<div class="section-title">
          <h2>개인 정보</h2>
          <br><br><h5>${msg}</h5>
       </div>
		<div class="login-form" >
			<form class="box-body" >
				<ul style="list-style:none;">
					<li>이 름</li>
					<input type="text" class="text-field" value="${usersearch.u_name}" style="width:150px;" readonly>
					<li>닉네임</li>
					<input type="text" class="text-field" value="${usersearch.u_nname}" style="width:150px;" readonly>
					<li>아이디</li>
					<input type="text" class="text-field" id="u_p_id" name="u_p_id" value="${user.u_p_id}" style="width:150px;" readonly>
					<li>전화번호</li>
					<input type="text" name="tel" value="${usersearch.u_phone}" class="text-field" minlength="12" maxlength="13" style="width:337px;" readonly>
					<li>주 소</li>
					<input type="text" class="text-field" value="${usersearch.u_address}" style="width:450px;" readonly>
					<li>성 별</li>
					<input type="text" class="text-field" value="${usersearch.u_gender}" style="width:150px;" readonly>
					<li>이메일</li>
					<input type="text" class="text-field" value="${usersearch.u_mail}" style="width:337px;" readonly>
				</ul>
		
				<div class="box-footer">
				<!-- 팝업으로 비밀번호 확인으로 기존비밀번호와, 입력된 비밀번호 일치해야 넘어가고 실패시 안넘어가게 해야함 -->
					<button type="button"class="btn btn-info" onclick="javascript:my_update()">개인정보 수정</button>
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