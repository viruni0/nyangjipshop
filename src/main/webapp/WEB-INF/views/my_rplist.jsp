<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ page session="true" %>
<!DOCTYPE html>

<html lang="zxx">
<!-- head -->
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
               <h3 class="box-title" >신고내역</h3>
            </div>
            <br><br>
            <div class="table-responsive">
               <table class="table" style="width:94%">
                  <tr>
                     <th style="text-align:center">글번호</th>
                     <th style="text-align:center">신고한 아이디</th>
                     <th style="text-align:center">작성일</th>
                     <th style="text-align:center">작성자</th>
                     <th style="text-align:center">처리상태</th>
                  </tr>
                  <c:forEach var="my_rplist" items="${my_rplist}">
                     <tr>
                        <style type="text/css">
                           a:hover { color:black; text-decoration: none;}
                        </style>
                        <td style="text-align:center">${my_rplist.b_p_bno}</td>
                        <td style="text-align:center"><a href="${contextPath}/cs/rpdetail?b_p_bno=${my_rplist.b_p_bno}">${my_rplist.b_title}</a></td>
                        <td style="text-align:center">${my_rplist.b_date}</td>
                        <td style="text-align:center">${my_rplist.u_p_id}</td>
                        <c:if test="${my_rplist.b_state==2}">
                           <td style="text-align:center">신고처리중</td>
                        </c:if>
                        <c:if test="${my_rplist.b_state==3}">
                           <td style="text-align:center">완료</td>
                        </c:if>
                     </tr>
                  </c:forEach>
               </table>
               <br>
               <br>
            </div>
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