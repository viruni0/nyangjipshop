<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true" %>
<!DOCTYPE html>

<html lang="zxx">

<%@ include file="include/head.jsp" %>

<script>
function wishdel(b_p_code){
	
	location.href="wishdel?b_p_code=" + b_p_code;
	
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
     <section class="shoping-cart spad">
        <div class="container" >
           <div class="row">
           <div class="col-lg-11 col-md-7">
                <div class="product__discount">
                <div class="section-title product__discount__title"> 
                   <h2>내 리뷰 목록</h2>
                   </div>
                      <div class="shoping__cart__table">
                         <div class="shoping__product">
	                         <table style="width:100%">
	                               <tr style="border-bottom: 1px solid black">
									  <th style="width:140px">상품</th>
	                                  <th style="width:440px">리뷰내용</th>
	                                  <th style="width:150px">작성자</th>
	                                  <th style="width:140px">별점</th>
	                                  <th style="width:120px">작성일</th>
	                               </tr>
	                               <c:forEach var="review" items="${review}">
	                                  <div class="shoping__cart__table">
	                                     <table>
	                                        <tbody>
	                                           <tr>
	                                           </tr>
	                                           <tr>
	                                              <td class="shoping__cart__item">
	                                              	 <a href="${contextPath}/board_product/shop_detail?b_p_code=${review.b_p_code}"><img src="${contextPath}/resources/bootstrap/img/Reviewimg/${review.b_p_code}-Review${review.r_p_num}.jpg" alt=""></a>
	                                                 <h5>${review.r_content}</h5>
	                                              </td>
	                                              <td class="shoping__cart__price">${review.u_p_id}</td>
	                                              <td><c:if test="${review.r_spoint==5}">
	                                                    <div>
	                                                       <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i>
	                                                    </div>
	                                                 </c:if> <c:if test="${review.r_spoint==4}">
	                                                    <div>
	                                                       <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
	                                                    </div>
	                                                 </c:if> <c:if test="${review.r_spoint==3}">
	                                                    <div>
	                                                       <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
	                                                    </div>
	                                                 </c:if> <c:if test="${review.r_spoint==2}">
	                                                    <div>
	                                                       <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
	                                                    </div>
	                                                 </c:if> <c:if test="${review.r_spoint==1}">
	                                                    <div>
	                                                       <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
	                                                    </div>
	                                                 </c:if></td>
	                                              <td class="shoping__cart__total">${review.r_date}</td>
	                                           </tr>
	                                        </tbody>
	                                     </table>
	                                  </div>
	                               </c:forEach>
	                         </table>
							</div>
						</div>
					</div>
				</div>
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