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
		window.close()
}

function pass() {
	
	//window.opener.parent.location.href = "${contextPath}/cs/cs";
	alert("문의해 주셔서 감사합니다 :)");
	//window.close()
}

</script>

<body>

   <!-- Product Section Begin -->
   <section class="content container-fluid">
      <form role="form" name="f" method="post" action="${contextPath}/one_qna/qna" onsubmit="return pass();">
         <div class="container">
            <div class="row">
               <div class="col-lg-11 col-md-7">
                  <a style="font-weight: bold; font-size: 30px">문의</a> <br> <a
                     href="$" style="color: black;">문의글작성</a> <br> <br>
                  <div>
                     <select id='user' name='user'>
                        <option>사용자 관련</option>
                        <option>사이트 이용 관련</option>
                        <option>로그인 관련</option>
                        <option>기타 문의 사항</option>
                     </select>
                  </div>
                  <br> <br> <br> <input type="text" id="u_p_id" name="u_p_id" value='${user.u_p_id}' readonly> <br>
                  <br> <input type="text" id="b_title" name="b_title" value='' placeholder="제목을 입력하세요." minlength="1"> <br> <br>
                  <textarea rows="8" id="b_content" name="b_content" cols="70" style="resize: none;" placeholder="상세내용" minlength="1"></textarea>
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

</html>