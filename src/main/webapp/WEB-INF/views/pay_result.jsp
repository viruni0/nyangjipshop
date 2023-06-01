<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="false" %>
<!DOCTYPE html>

<html lang="zxx">

<%@ include file="include/head.jsp" %>

<script>
   $(function() {
     
      $("#numc").click(function() {
         alert("복사되었습니다.");

		
		
      })
      
      $(document).ready(function() {
    	  var today=new Date();
    	  var year=today.getFullYear();
    	  var month=today.getMonth()+1;
    	  var date=today.getDate();
    	  var day=today.getDay(); 
    	  var hours=today.getHours();
    	  var eedate=today.getDate()+1; 
    	  
    	  var nea=((year.toString().slice(-2))+(("00"+month.toString()).slice(-2))+(("00"+date.toString()).slice(-2)));
    	  var ntt=(("0"+day.toString().slice(-2))+(("00"+hours.toString()).slice(-2)));
    	  qunum.value=nea+"-"+ntt;
		  eqdate.value=(("0"+month.toString().slice(-2)))+"."+((""+eedate.toString().slice(-2)))+" "+((+hours.toString().slice(-2)))+"시 까지";

		})

      
   })

function checkfrm() {
	document.frm.submit();
}
	  

</script>

<body>

    <!-- Header Section Begin -->
    <%@ include file="include/header.jsp" %>>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <%@ include file="include/hero.jsp" %>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
     <section class="product spad">
        <form role="form" name="frm" method="get" onsubmit="return validation();" >
                  <div class="container" style=" width:70%">
                    <div class="filter__item product__discount__title" style="height:600px;  ">
                       <a style="font-weight:bold;font-size:45px;margin-left:35%   ">주문완료내역</a>
                       <div class="form-buy" style="background-color:white;height:200px; border:1px solid #000000; ">
                          <a style="font-weight:bold;font-size:20px;margin-left:40%;" >입금계좌번호 : </a>
                          <input type="text" id='qunum' name='qunum' value="" readonly="readonly">
                          <br>
                          <button type="button" id='numc' name='numc' style="font-weight:bold;margin-left:45%  ">계좌번호복사</button>
                          <br>
                          <input type="hidden" id="num1" name="num1" maxlength="6">
                          <input type="hidden" id="num2" name="num2" maxlength="3">
                          <input type="hidden" id="num3" name="num3" maxlength="5">
                          <br>
                          <a style="font-weight:bold;font-size:20px;margin-left:40%;">은행명 :</a>
                          <% String id=request.getParameter("sval");
                          System.out.println(id);
                          %>
                          <div>
                          </div>
                          <input type="hidden" value="기업은행" readonly="readonly" disabled="disabled">
                          <br>
                          <a style="font-weight:bold;font-size:20px;margin-left:40%;">입금기간</a>
                          <input type="text" id="eqdate" name="eqdate" value="" readonly="readonly" disabled="disabled">
                          <a style="font-weight:bold;font-size:20px;margin-left:40%;">입금액 : </a>
                          <% String tt=request.getParameter("kingsum"); %>
                          <div><%=tt %></div>
                          <input type="text" value="12700" readonly="readonly" disabled="disabled">
                       </div>
                          
        <div style="background-color:white;margin-top:10%;height:170px;border:1px solid #000000;    ">
           <a style="font-weight:bold;font-size:20px  ">구매자정보</a>
           <br>
           <c:forEach var="ulist" items="${ulist}">
           <br>
           <a style="float:left">배송지 :</a>
           <textarea style="width:25%;resize:none  " readonly="readonly" disabled="disabled">${ulist.u_address}</textarea>
           <a style="margin-left:10% " >성함 :</a>
           <input type="text" style="width:8% " value="${ulist.u_name}" readonly="readonly" disabled="disabled">
           <a style="margin-left:5% ">전화번호 :</a>
           <input type="text" value="${ulist.u_phone}" readonly="readonly" disabled="disabled">
           <br>
           <br>
           </c:forEach>
           <div style="float:left;margin-left:3%;  ">
          
           </div>
        </div> 
                
        </div>
        <div>
           <button type="submit" style="margin-left:45% " ><a href="${contextPath}/nyangjipshop/main" style="font-size:25px;color:black; ">확인</a></button>
        </div>
        
        </div>
      </form>
    </section>
    <!-- Product Section End -->

    <!-- Footer Section Begin -->
    <%@ include file="include/footertest.jsp" %>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
   <%@ include file="include/plug_in.jsp" %>


</body>


</html>