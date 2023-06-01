<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true" %>
<!DOCTYPE html>

<html lang="zxx">

<%@ include file="include/head.jsp" %>

<script>
function onbtn() {
    window.open(
      "${contextPath}/board/test",
      "Child",
      "width=600, height=500, top=50, left=50"
    );
  }
  
function question() {
	window.open(
		      "${contextPath}/one_qna/qna",
		      "service",
		      "width=700, height=600, top=50, left=50"
		   );
}  
function gowite() {
   window.open(
      "${contextPath}/report/report",
      "say",
      "width=700, height=600, top=50, left=50"
   );
}

</script>

<body>

    <!-- Header Section Begin -->
    <%@ include file="include/header.jsp" %>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <%@ include file="include/hero.jsp" %>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
     <section class="product spad">
        <div class="container" >
           <a style="margin-left:40%;font-size:25px;font-weight:bold;   ">자주 묻는 질문</a>
           <br>
           <br> 
           <br> 
           <br>
           <div style="float:left;margin-left:5%;height:70% ">
           <a style="font-weight:bold; ">고양이에 대해서</a>
           <br>
              <a href="#" style="color:black;">뚱냥이의 기준이 어느정도인가요?</a>
              <br>
              <a href="#" style="color:black;">고양이는 무슨 생각을 할가요?</a>
              <br>
              <a href="#" style="color:black;">집고양이 아픈걸가요?</a>
           </div>
           <div style="float:right;margin-right:7%;height:70% ">
           <a style="font-weight:bold; " >사이트이용에 대해서</a>
           <br>
               <a href="#" style="color:black;">게시판에 이상한 사진이 올라와요</a>
               <br>
               <a href="#" style="color:black;">분양사이트도 있나요?</a>
            </div>
            <div style="float: right;margin-right:17%;height:70%  ">
            <a  style="font-weight:bold ">로그인에 대해서</a>
            <br>
               <a href="#" style="color:black;">로그인이 안돼요</a>
               <br>
               <a href="#" style="color:black;">자꾸 팝업창이 떠요</a>     
         </div>
         <br>
         <br>
         <map name="pg"></map>
         <div style="height:80px ">     
         <br><br><br><br>
             <button type="button" style="float:right" onclick="gowite()">신고하기</button>
           <button type="button" style="float:right" onclick="question()">문의하기</button>
        </div>
        <br>
        <br>
         <div class="container" style="border:1px solid #000000 ; height:170px ">
        <a>고객센터 운영시간  </a>    <a href="#" style="float:right " onclick="bignum()">013-3482-7283</a> <a style="float:right">고객센터 연락처</a>
        <br>
      <a>평일 09:00 ~ 20:00 (12:30 ~ 1:30 점심시간)</a>
      <br>
      <a>휴일(토) 09:00 ~ 15:00 (토요일은 점심시간 없음)</a>
      <br>
      <br>
      <a>상담원에게 욕설과 모욕적인 언행은 자제해주시길 바랍니다.</a>
      <br>
        </div>
         
       
        </div>
       
    </section>
    <!-- Product Section End -->

    <!-- Footer Section Begin -->
    <%@ include file="include/footertest.jsp" %>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
   <%@ include file="include/plug_in.jsp" %>

</body>

</html>