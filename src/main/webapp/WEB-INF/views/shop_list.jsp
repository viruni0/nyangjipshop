<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true"%>
<!DOCTYPE html>

<html lang="zxx">
<!-- head -->
<%@ include file="include/head.jsp"%>
<!-- head end -->
<meta charset="UTF-8">
<title>top</title>
<style>
.goupbtn {
   top: 90%;
   left: 90%;
   width: 50px;
   height: 50px;
   border-radius: 80%;
   background-color: #ffffff;
   border: black 3px solid;
   position: fixed;
   z-index: 2;
}
</style>

<script>
   
</script>
<body>
   <!-- header -->
   <%@ include file="include/header.jsp"%>
   <!-- header end -->
   <!-- hero -->
   <%@ include file="include/hero.jsp"%>
   <!-- hero end -->
   <input class="goupbtn" type="button" onclick="window.scrollTo(0,0);" value="Top">
   <!-- Product Section Begin -->
   <section class="product spad">
      <div class="container">
         <div class="row">
            <div class="col-lg-3 col-md-5">
               <div class="sidebar">
                  <div class="sidebar__item">
                     <h4>전체(96)</h4>
                     <ul>
                        <li><a href="${contextPath}/board_product/shop_list">&nbsp;&nbsp;&nbsp;모든상품(96)</a></li>
                        <li><a href="${contextPath}/board_product/shop_list_F">&nbsp;&nbsp;&nbsp;식품(18)</a></li>
                        <li><a href="${contextPath}/board_product/shop_list_B">&nbsp;&nbsp;&nbsp;배변용품(12)</a></li>
                        <li><a href="${contextPath}/board_product/shop_list_H">&nbsp;&nbsp;&nbsp;건강/목욕/미용(21)</a></li>
                        <li><a href="${contextPath}/board_product/shop_list_J">&nbsp;&nbsp;&nbsp;잡화(45)</a></li>
                     </ul>
                  </div>
               </div>
            </div>
            <div class="col-lg-9 col-md-7">
               <!-- 여기 분류기준 -->
               <div class="row">
                  <c:forEach var="shop_list" items="${shop_list}">
                     <a href="shop_detail?b_p_code=${shop_list.b_p_code}">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                           <div class="product__item">
                              <div class="product__item__pic set-bg" data-setbg="${contextPath}/resources/bootstrap/img/All/${shop_list.b_p_code}.jpg"></div>
                              <div class="product__item__text">
                                 <ul>
                                    <li style="list-style: none"><a href="shop_detail?b_p_code=${shop_list.b_p_code}" style="color: black;">${shop_list.b_product}</a></li>
                                    <li style="list-style: none; color: Red; float: left; margin-left: 27%;">${shop_list.b_discount}%</li>
                                    <li style="list-style: none; color: gray; margin-right: 32%;"><del>${shop_list.b_price}원</del></li>
                                    <li style="list-style: none; font-weight: bold;">${shop_list.b_sale}원</li>
                                    <c:if test="${shop_list.b_spoint==5}">
                                       <div>
                                          <i class="fa fa-star" style="color: #ffc107;"></i> 
                                          <i class="fa fa-star" style="color: #ffc107;"></i> 
                                          <i class="fa fa-star" style="color: #ffc107;"></i> 
                                          <i class="fa fa-star" style="color: #ffc107;"></i> 
                                          <i class="fa fa-star" style="color: #ffc107;"></i>
                                       </div>
                                    </c:if>
                                    <c:if test="${shop_list.b_spoint==4}">
                                       <div>
                                          <i class="fa fa-star" style="color: #ffc107;"></i> 
                                          <i class="fa fa-star" style="color: #ffc107;"></i> 
                                          <i class="fa fa-star" style="color: #ffc107;"></i> 
                                          <i class="fa fa-star" style="color: #ffc107;"></i> 
                                          <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                       </div>
                                    </c:if>
                                    <c:if test="${shop_list.b_spoint==3}">
                                       <div>
                                          <i class="fa fa-star" style="color: #ffc107;"></i> 
                                          <i class="fa fa-star" style="color: #ffc107;"></i> 
                                          <i class="fa fa-star" style="color: #ffc107;"></i> 
                                          <i class="fa fa-star-o" style="color: #ffc107;"></i> 
                                          <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                       </div>
                                    </c:if>
                                    <c:if test="${shop_list.b_spoint==2}">
                                       <div>
                                          <i class="fa fa-star" style="color: #ffc107;"></i> 
                                          <i class="fa fa-star" style="color: #ffc107;"></i> 
                                          <i class="fa fa-star-o" style="color: #ffc107;"></i> 
                                          <i class="fa fa-star-o" style="color: #ffc107;"></i> 
                                          <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                       </div>
                                    </c:if>
                                    <c:if test="${shop_list.b_spoint==1}">
                                       <div>
                                          <i class="fa fa-star" style="color: #ffc107;"></i> 
                                          <i class="fa fa-star-o" style="color: #ffc107;"></i> 
                                          <i class="fa fa-star-o" style="color: #ffc107;"></i> 
                                          <i class="fa fa-star-o" style="color: #ffc107;"></i> 
                                          <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                       </div>
                                    </c:if>
                                 </ul>
                              </div>
                           </div>
                        </div>
                     </a>
                  </c:forEach>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Product Section End -->
   <!-- Footer Section Begin -->
   <%@ include file="include/footertest.jsp"%>
   <!-- Footer Section End -->
   <!-- Js Plugins -->
   <%@ include file="include/plug_in.jsp"%>

</body>

</html>