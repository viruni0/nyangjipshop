<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true"%>
<!DOCTYPE html>

<html lang="zxx">

<%@ include file="include/head.jsp"%>

<script>

var user = "${user.u_p_id}";
if(!user){
		window.opener.parent.location.href = "${contextPath}/login";
		alert("로그인 해주세요!");
		window.close()
}

function pass() {
	
	alert("문의해 주셔서 감사합니다 :)");
}

</script>

<style>
	.title {
		position: relative;       
        right:-190px;
        
	}
</style>

<body>

	<!-- Product Section Begin -->
	<section class="product spad">
		<form action="${contextPath}/report/report" role="form" name="f" method="post">
			<div class="container">
			  <div class="row">
              	<div class="col-lg-11 col-md-7">
					<a style="font-weight: bold; font-size: 30px">신고</a> <br> 신고글작성 <br> <br>
					<div>
						<select id="selbtn" name="selbtn">
							<option value="1">게시글 관련</option>
							<option value="2">상품 관련</option>
						</select>
					</div>
					<br> <br> <input type="text" id="u_p_id" name="u_p_id" value='${user.u_p_id}' placeholder="본인 아이디" readonly>
					<input type="text" id='b_title'	name='b_title' class="title" placeholder="상대방 아이디" >
					<br> <br>
					<textarea rows="8" cols="70" id="b_content" name="b_content" style="resize: none;" placeholder="상세하게"></textarea>
					<br> <br>
					<button type="submit" class="btn btn-primary" >작성완료</button>
				</div>
			</div>
		  </div>
		</form>
	</section>
	<!-- Product Section End -->

	<!-- Footer Section Begin -->
	<%@ include file="include/footertest.jsp"%>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<%@ include file="include/plug_in.jsp"%>

</body>

</html>