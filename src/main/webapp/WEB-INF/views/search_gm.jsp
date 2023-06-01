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
                <div class="col-lg-11 col-md-7">
                    <div class="box-header">
                  </div>
                    <div class="box-header">
                     <h3 class="box-title" >전체유저 조회</h3>
                  </div>
                   <br>
                   <br>
             <div class="table-responsive" style="width:94%">
        <table class="table" >
      <tr>
         <th></th>
         <th style="text-align:center">아이디</th>
         <th></th>
         <th style="text-align:center">이름</th>
         <th style="text-align:center">누적신고횟수</th>
         <th></th>
      </tr>
      <c:forEach var="search_gm" items="${searchlist}">
	     <style type="text/css">
			a:hover { color:black; text-decoration: none;}
		 </style>
        <tr>
        	<th></th>
            <td style="text-align:center"><a href="${contextPath}/mypageGM/update_gm?u_p_id=${search_gm.u_p_id}">${search_gm.u_p_id}</a></td>
            <th></th>
            <td style="text-align:center">${search_gm.u_name}</td>
            <td style="text-align:center">${search_gm.u_b_cnt}</td>
            <th></th>
         </tr>
      </c:forEach>
        </table>
          </div>
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