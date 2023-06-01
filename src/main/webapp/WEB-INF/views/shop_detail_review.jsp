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
	
	//window.opener.parent.location.href = "${contextPath}/cs/cs";
	alert("후기 남겨 주셔서 감사합니다 :)");
	//window.close()
}

</script>

<body>

   <!-- Product Section Begin -->
   <section class="content container-fluid">
      <form role="form" name="f" method="post" action="${contextPath}/shop_detail_review/review" onsubmit="return pass();">

         <div class="container">
            <div class="row">
               <div class="col-lg-11 col-md-7">
                  <a style="font-weight: bold; font-size: 30px">후기</a> <br> <a
                     style="color: black;">후기작성</a> <br> <br>
                  <a>별점</a>   
                  <div>
                     <select id='r_spoint' name='r_spoint'>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                     </select>
                  </div>
                  <br> <br> <br> <input type="text" id="u_p_id" name="u_p_id" value='${user.u_p_id}' readonly> <br>
                  <input type="hidden" id="b_p_code" name="b_p_code" value='' >
                  <textarea rows="8" id="r_content" name="r_content" cols="70" style="resize: none;" placeholder="상세내용" minlength="1"></textarea>
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
   $("input[name=b_p_code]").attr('value',val1);
</script>
</html>