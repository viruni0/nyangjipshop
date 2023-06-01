<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true" %>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<!-- head -->
<%@ include file="include/head.jsp" %>
<!-- head end -->

<body>
<!-- Main Header -->
<!-- header -->
<%@ include file="include/header.jsp" %>
<!-- header end -->
<!-- hero -->
<%@ include file="include/hero.jsp" %>
<!-- hero end --> 

  <!-- Main content --> 
	<c:if test="${wish.u_p_id!=null}">
		<button class="heart-icon" type="button" id="btnwish" style="border: none;"><span class="fa fa-heart" ></span></button>
	</c:if>
	<c:if test="${wish.u_p_id==null}">
		<button class="heart-icon" type="button" id="btnwish" style="border: none;"><span class="icon_heart_alt" ></span></button>
	</c:if>
    <!-- Footer Section Begin -->
   <%@ include file="include/footertest.jsp" %>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <%@ include file="include/plug_in.jsp" %>
</body>
</html>