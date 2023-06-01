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
         <div>
            <h3>상세보기</h3>
         </div>
         <div>
            <div>
               <label>제목</label> <input type="text" name="b_title"
                  class="form-control" value="${board.b_title}" readonly="readonly" />
            </div>

            <div>
               <label>내용</label>
               <textarea name="b_content" rows="5" readonly="readonly"
                  class="form-control">${board.b_content}</textarea>
            </div>

            <div>
               <label>작성자</label> <input type="text" name="u_p_id"
                  class="form-control" value="${board.u_p_id}" readonly="readonly" />
            </div>
         </div>


      <div>
         <button type="button" class="btn btn-success">메인</button>
         <button type="button" class="btn btn-warning">수정</button>
         <button type="button" class="btn btn-danger">삭제</button>
         <button type="button" class="btn btn-primary">목록</button>
         <button class="btn btn-info">댓글작성</button>
      </div>

    <!-- Footer Section Begin -->
   <%@ include file="include/footertest.jsp" %>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <%@ include file="include/plug_in.jsp" %>
</body>
</html>