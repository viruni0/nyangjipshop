<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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

<script>
$(function(){
   // location.href : 버튼 클릭 시에 넘어 갈 정보
   // Controller와 연결지어서 찾아가기
   //목록 버튼을 눌렀을 때 처리
   $("#ro").click(function(){
      location.href="${contextPath}/mypageGM/shop_inquiry_gm";
   });
   /*
   //완료 버튼을 눌렀을 때 처리
   $("#ok").click(function(){
      location.href="${contextPath}/shop_inquiry_gm/inquirydetail_result?i_p_num?i_answer" + ${inquirydetail.i_p_num} + ${inquirydetail.i_answer};
   });
   */
})
</script>

<body>
<!-- Main Header -->
<!-- header -->
<%@ include file="include/header.jsp" %>
<!-- header end -->
<!-- hero -->
<%@ include file="include/hero.jsp" %>
<!-- hero end --> 

    <!-- Main content --> 
<section class="content container-fluid">
   <div class="container">
   <form class="box-body" method="post" accept-charset="utf-8">
      <div class="row">
         <div class="col-lg-11 col-md-7">
            <div class="box-header">
               <h3 class="box-title" >상세보기</h3>
            </div>
            <br><br>
            <div class="table-responsive">
               <table class="table" style="width:94%">
                     <div>
                        <label>글번호</label> <input type="text" id="i_p_num" name="i_p_num"
                           class="form-control" value="${inquirydetail.i_p_num}" readonly="readonly"style="width:94%"  />
                     </div>
                     <div>
                        <label>내용</label>
                        <textarea rows="5" readonly="readonly"
                           class="form-control" style="width:94%">${inquirydetail.i_content}</textarea>
                     </div>
                     <div>
                        <label>작성자</label> <input type="text" name="u_p_id"
                           class="form-control" value="${inquirydetail.u_p_id}" readonly="readonly" style="width:94%"/>
                     </div>
                     <div>
                        <label>답변</label>
                        <textarea id="i_answer" name="i_answer" rows="5" 
                           class="form-control" style="width:94%">${inquirydetail.i_answer}</textarea>
                     </div>
                  </div>
                  <br> 
      <div>
         <input type="text" style="width:62px;float:right;background-color:white;opacity:0">   
         <button type="button" id="ro" class="btn btn-primary" style="float:right;">목록</button>
         <button type="submit" class="btn btn-warning" style="float:right;">완료</button>
      </div>
      </table>
      <br>
   </div>
      </div>
      <hr><p></p>
      <div class="col-lg-11 col-md-7">
     </div>
         </div>
      </div>
      </form>
   </div>
</section>
    <!-- Footer Section Begin -->
   <%@ include file="include/footertest.jsp" %>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <%@ include file="include/plug_in.jsp" %>   
    

<!-- ./wrapper -->

</body>
</html>