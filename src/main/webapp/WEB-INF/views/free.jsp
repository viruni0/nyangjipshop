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

//이전 버튼 이벤트
function fn_prev(page, range, rangeSize) {      
   var page = ((range - 2) * rangeSize) + 1;      
   var range = range - 1;      
   //var upId = document.getElementById("hidden_upId").value;
   var url = "${contextPath}/board_dto/freelist";      
   url = url + "?page=" + page;      
   url = url + "&range=" + range;            
   location.href = url;  
   alert();
}  

//페이지 번호 클릭   
function fn_pagination(page, range, rangeSize, searchType, keyword) {   
   //var upId = document.getElementById("hidden_upId").value;
   var url = "${contextPath}/board_dto/freelist";         
   url = url + "?page=" + page;      
   url = url + "&range=" + range;      
   location.href = url;      
}   

//다음 버튼 이벤트   
function fn_next(page, range, rangeSize) {      
   var page = parseInt((range * rangeSize)) + 1;      
   var range = parseInt(range) + 1;      
   //var upId = document.getElementById("hidden_upId").value;
   var url = "${contextPath}/board_dto/freelist";         
   url = url + "?page=" + page;      
   url = url + "&range=" + range;            
   location.href = url;
}

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
					<h3 class="box-title" >자유게시판</h3>
				</div>
				<br><br>
				<div class="table-responsive">
					<table class="table" style="width:94%">
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성일</th>
							<th>작성자</th>
							<th>조회수</th>
						</tr>
						<c:forEach var="board" items="${list}">
							<tr>
								<td>${board.b_p_bno}</td>
								<td><a href="fr_detail?b_p_bno=${board.b_p_bno}">${board.b_title}</a></td>
								<td>${board.b_date}</td>
								<td>${board.u_p_id}</td>
								<td>${board.b_v_cnt}</td>
							</tr>
						</c:forEach>
					</table>
					<input type="text" style="width:62px;float:right;background-color:white;opacity:0">
					<button type="button" class="btn_type1 post_write _rosRestrict" onclick="location.href='${contextPath}/board_dto/fr_register'" style="float:right;" >글쓰기</button>
					<!-- pagination{s} -->
					<div id="paginationBox">      
						<ul class="pagination">     
						    <style type="text/css">
								a:hover { color:black; text-decoration: none;}
							</style>
							<c:if test="${pagination.prev}">            
								<li class="page-item">
									<a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a>
								</li>         
							</c:if>                     
							<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">            
								<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
									<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">${idx}</a>
								</li>         
							</c:forEach>                     
							<c:if test="${pagination.next}">            
								<li class="page-item">
									<a class="page-link" href="#" onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')" >Next</a>
								</li>
							</c:if>      
						</ul>   
					</div>
       	<!-- pagination{e} -->  
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