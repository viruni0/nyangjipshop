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
		window.close();
}

function pass() {
	
	alert("상품 문의 남겨 주셔서 감사합니다 :)");
}
		
</script>

<body>

   <!-- Product Section Begin -->
   <section class="content container-fluid">
      <form role="form" name="f" method="post" action="${contextPath}/shop_detail_inquiry/inquiry" onsubmit="return pass();">

         <div class="container">
            <div class="row">
               <div class="col-lg-11 col-md-7">
                  <a style="font-weight: bold; font-size: 30px">상품 문의</a> <br> <a
                     style="color: black;">상품 문의 작성</a> <br> <br>
                  <br> <br> <br> <input type="text" id="u_p_id" name="u_p_id" value='${user.u_p_id}' readonly> <br>
                  <input type="hidden" id="b_p_code" name="b_p_code" value='' >
                  <input type="hidden" id="b_product" name="b_product" value='' >
                  <textarea rows="8" id="i_content" name="i_content" cols="70" style="resize: none;" placeholder="상세내용" minlength="1"></textarea>
                  <input type="hidden" id="i_answer" name="i_answer" value="1">
                  <br> <br>
                  <button type="submit" class="btn btn-primary">작성완료</button>
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

<script>
   var val1 = opener.$("#b_p_code1").val();
   var val2 = opener.$("#b_product1").val();
   $("input[name=b_p_code]").attr('value',val1);
   $("input[name=b_product]").attr('value',val2);
</script>
</html>