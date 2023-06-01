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

// 회원탈퇴 페이지 팝업 비밀번호 확인
function my_out() {
	
	var width 	= "700";
    var height 	= "600";
 
    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
    var left 	= window.screenLeft + (document.body.clientWidth - width) / 2;
    var top 	= window.screenTop + (document.body.clientHeight - height) / 2;
    
    window.open(
      "${contextPath}/mypageU/my_out","my_out",
      "width="+width+", height="+height+", left="+left+", top="+top);
}

</script>
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
      		</div>
                 	<div class="box-header">
         				<h3 class="box-title" >MY PAGE</h3>
     			    </div>
   		    <br>
   		    <br>
    		<form role="form" accept-charset="utf-8" onsubmit="return validation();">
			    <div class="box-body">
			    <div class ="form-group">
			    <!-- 닉네임 -->
			    <label id="nname" style="width:485px">닉네임 : ${user.u_nname}</label>
			    <br>
			    <!-- 아이디 -->
			    <label id="id" style="width:100px">아이디 : ${user.u_p_id} </label>
			   	<br>
			   	<br>
			   	<!-- 구매후기 / 찜목록 / 게시글 -->
			   	<a style="display:block">
			   		<input type="button" disabled='disabled' style="color:black;border:none;background-color:white;width:200px;">
			   		<button type="button" onclick="location.href='${contextPath}/mypageU/my_review'" style="color:black;border:none;background-color:white;width:100px;">${my_review_count}</button>
			   		<button type="button" onclick="location.href='${contextPath}/mypageU/my_wish'" style="color:black;border:none;background-color:white;width:100px;">${wish_cnt}</button>
			   		<button type="button" onclick="location.href='${contextPath}/board_dto/freelist'" 
			   				style="color:black;border:none;background-color:white;width:100px;">${user_board_count}</button>
			   	</a>
			   	<a style="display:block" >
			   	<input type="button" disabled='disabled' style="color:black;border:none;background-color:white;width:200px;">
			   	<button type="button" onclick="location.href='${contextPath}/mypageU/my_review'" style="color:black;border:none;background-color:white;width:100px;">구매후기</button>
			   	<button type="button" onclick="location.href='${contextPath}/mypageU/my_wish'" style="color:black;border:none;background-color:white;width:100px;">찜목록</button>
			   	<button type="button" onclick="location.href='${contextPath}/board_dto/freelist'" 
			   				style="color:black;border:none;background-color:white;width:100px;">게시글</button>
			   	</a>
			   	<!-- 구매후기 / 찜목록 / 게시글 END-->
			   	<br>
			   	<br>
			   	<!-- 개인정보 -->
			   	<button type="button" class="btn-product-select" onclick="location.href='${contextPath}/mypageU/my_search'"  
			   						style="color:black;background-color:white;width:700px;height:50px">
			   						<div align="left" style="float:left">개인정보수정</div><div align="right" >▷</div></button>
			   	<!-- 장바구니 -->					
			   	<button type="button" onclick="location.href='${contextPath}/basket/sel_basket'" 
			   						style="color:black;background-color:white;width:700px;height:50px">
			   						<div align="left" style="float:left">장바구니</div><div align="right" >▷</div></button>
			   	<!-- 상품리뷰관리 -->					
			   	<button type="button" onclick="location.href='${contextPath}/mypageU/my_review'" 
			   						style="color:black;background-color:white;width:700px;height:50px">
			   						<div align="left" style="float:left">상품리뷰관리</div><div align="right" >▷</div></button>
			   	<!-- 고객센터 -->					
			   	<button type="button" onclick="location.href='${contextPath}/report/my_rplist'" 
			   						style="color:black;background-color:white;width:700px;height:50px">
			   						<div align="left" style="float:left">신고내역</div><div align="right" >▷</div></button>
			   	<!-- 고객센터 -->					
			   	<button type="button" onclick="location.href='${contextPath}/cs/my_qalist'" 
			   						style="color:black;background-color:white;width:700px;height:50px">
			   						<div align="left" style="float:left">문의내역</div><div align="right" >▷</div></button>
			   	<!-- 상품문의 -->					
			   	<button type="button" onclick="location.href='${contextPath}/mypageU/my_inquirylist'" 
			   						style="color:black;background-color:white;width:700px;height:50px">
			   						<div align="left" style="float:left">상품문의내역</div><div align="right" >▷</div></button>
			   	<!-- 회원탈퇴 -->					
			   	<button type="button" onclick="javascript:my_out()" 
			   						style="color:black;background-color:white;width:700px;height:50px">
			   						<div align="left" style="float:left">회원탈퇴</div><div align="right" >▷</div></button>
			   	<br>
			   	<br>
			   	<br>
			    </div>
			    </div>
    		</form>	
    		</div>
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