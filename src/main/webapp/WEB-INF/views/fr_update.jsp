<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="false" %>
<!DOCTYPE html>

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
<section class="content container-fluid">
	<div class="container">
		<div class="row">
			<div class="col-lg-11 col-md-7">
				<div class="box-header">
				</div>
				<div>
					<h3>게시판 글수정</h3>
				</div><br>
				<form role="form" method="post">
					<div>
						<div class="form-group">
							<label>제목</label> <input type="text" name="b_title" id="b_title" class="form-control"  value="${board.b_title}" style="width:94%">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" name="b_content" id="b_content" rows="5" style="width:94%">${board.b_content}</textarea>
						</div>
						<div class="form-group">
							<label>작성자</label> <input type="text" name="u_p_id" id="u_p_id" class="form-control" readonly="readonly"  value="${board.u_p_id}" style="width:94%">
						</div>
						<!-- 수정에 사용할 글번호 -->
						<input type="hidden" name="b_p_bno" id="b_p_bno" value="${board.b_p_bno}" />
					</div>
					<div>
						<input type="text" style="width:62px;float:right;background-color:white;opacity:0">
						<button type="submit" class="btn btn-primary" style="float:right">수정완료</button>
					</div><br><br><br>
				</form>
			</div>
		</div>
	</div>
</section>
<!-- /.content -->

<!-- Footer Section Begin -->
<%@ include file="include/footertest.jsp" %>
<!-- Footer Section End -->

<!-- Js Plugins -->
<%@ include file="include/plug_in.jsp" %>   

</body>
</html>