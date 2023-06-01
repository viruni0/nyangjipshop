<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="zxx">
<!-- head -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<%@ include file="include/head.jsp" %>
<!-- head end -->
<script>


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
         				<h3 class="box-title" >GM PAGE</h3>
     			    </div>
   		    <br>
   		    <br>
    		<form role="form" method="post" accept-charset="utf-8" onsubmit="return validation();">
			    <div class="box-body">
			    <div class ="form-group">
			    <!-- 닉네임 -->
			    <label id="nname" style="width:485px">닉네임 : ${user.u_nname}</label>
			    <br>
			    <!-- 아이디 -->
			    <label id="id" style="width:100px">아이디 : ${user.u_p_id} </label>
			   	<br>
			   	<br>
			   	<!-- 구매후기 / 찜목록 / 게시글 END-->
			   	<br>
			   	<br>
			   	<!-- 문의내역 -->
			   	<button type="button" class="btn-product-select" onclick="location.href='${contextPath}/mypageGM/qa_gm'"  
			   						style="color:black;background-color:white;width:700px;height:50px">
			   						<div align="left" style="float:left">문의내역</div><div align="right" >▷</div></button>
				<!-- 신고내역 -->
			   	<button type="button" onclick="location.href='${contextPath}/mypageGM/rp_gm'" 
			   						style="color:black;background-color:white;width:700px;height:50px">
			   						<div align="left" style="float:left">신고내역</div><div align="right" >▷</div></button>
			   	<!-- 유저 전체조회 -->
			   	<button type="button" onclick="location.href='${contextPath}/mypageGM/search_gm'" 
			   						style="color:black;background-color:white;width:700px;height:50px">
			   						<div align="left" style="float:left">유저 전체 조회</div><div align="right" >▷</div></button>
			   	<!-- 상품 문의 내역 조회 -->
			   	<button type="button" onclick="location.href='${contextPath}/mypageGM/shop_inquiry_gm'" 
			   						style="color:black;background-color:white;width:700px;height:50px">
			   						<div align="left" style="float:left">유저 상품문의 조회</div><div align="right" >▷</div></button>
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