<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="zxx">
<!-- head -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<%@ include file="include/head.jsp" %>
<!-- head end -->


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
                <div class="col-lg-12 col-md-12">
                    <div class="box-header">
      		</div>
                 	<div class="box-header">
         				<h3 class="box-title" >멤버십</h3>
     			    </div>
     			    <br>
     			    <br>
     			    <img src="${contextPath}/resources/bootstrap/img/등급표.png" width="980px" alt="">
     			    <br>
     			    <br>
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