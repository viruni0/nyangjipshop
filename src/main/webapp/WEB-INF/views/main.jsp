<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="True"%>

<!DOCTYPE html>
<html lang="zxx">
<%@ include file="include/head.jsp"%>

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

<body>
   <%@ include file="include/header.jsp"%>
   <%@ include file="include/hero.jsp"%>
   <!-- Categories Section Begin -->
   <input class="goupbtn" type="button" onclick="window.scrollTo(0,0);" value="Top">
   <section class="categories">
      <div class="section-title">
         <img src="${contextPath}/resources/bootstrap/img/popnyang.gif" align="middle">
         <h2>실시간 인기 상품</h2>
      </div>
      <div class="container">
         <div class="row">
            <div class="categories__slider owl-carousel">
               <c:forEach var="main" items="${main}">
                  <c:if test="${main.b_p_code eq 'F1' or main.b_p_code eq 'F2' or main.b_p_code eq 'H1' or main.b_p_code eq 'J26' or main.b_p_code eq 'J43' or main.b_p_code eq 'J44'}">
                     <div class="col-lg-3">
                        <a href="board_product/shop_detail?b_p_code=${main.b_p_code}">
                           <div class="categories__item set-bg" data-setbg="${contextPath}/resources/bootstrap/img/All/${main.b_p_code}.jpg"></div>
                           <div>
                              <h5>
                                 <div style="color: black; text-align: center; margin-top: 10px;">${main.b_product}</div>
                              </h5>
                              <span style="color: red">${main.b_discount}%</span>
                              <td-lt>${main.b_price}원</td-lt>
                              <h5>
                                 <strong>${main.b_sale}원</strong>
                              </h5>
                              <c:if test="${main.b_spoint==5}">
                                 <div>
                                    <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i>
                                 </div>
                              </c:if>
                              <c:if test="${main.b_spoint==4}">
                                 <div>
                                    <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                 </div>
                              </c:if>
                              <c:if test="${main.b_spoint==3}">
                                 <div>
                                    <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                 </div>
                              </c:if>
                              <c:if test="${main.b_spoint==2}">
                                 <div>
                                    <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                 </div>
                              </c:if>
                              <c:if test="${main.b_spoint==1}">
                                 <div>
                                    <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                 </div>
                              </c:if>
                           </div>
                        </a>
                     </div>
                  </c:if>
               </c:forEach>
            </div>
         </div>
      </div>
   </section>
   <!-- Categories Section End -->

   <!-- Featured Section Begin -->
   <section class="featured spad">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="section-title">
                  <img src="${contextPath}/resources/bootstrap/img/soldnyang.gif" align="middle">
                  <h2>매진임박 상품</h2>
               </div>
               <div class="featured__controls">
                  <ul>
                     <li class="active" data-filter="*" title="전체">전체</li>
                     <li data-filter=".F" title="식품">식품</li>
                     <li data-filter=".B" title="배변용품">배변용품</li>
                     <li data-filter=".H" title="건강/미용">건강/미용</li>
                     <li data-filter=".J" title="잡화">잡화</li>
                  </ul>
               </div>
            </div>
         </div>
         <div class="row featured__filter">
            <c:forEach var="main" items="${main}">
               <c:if test="${main.b_p_code eq 'F3' or main.b_p_code eq 'F8'}">
                  <div class="col-lg-3 col-md-4 col-sm-6 mix F">
                     <div class="featured__item" onclick="location.href='${contextPath}/board_product/shop_detail?b_p_code=${main.b_p_code}'" style="cursor: pointer">
                        <div class="featured__item__pic set-bg" data-setbg="${contextPath}/resources/bootstrap/img/All/${main.b_p_code}.jpg"></div>
                        <div class="featured__item__text">
                           <h6>${main.b_product}</h6>
                           <span style="color: red">${main.b_discount}%</span>
                           <td-lt>${main.b_price}원</td-lt>
                           <h5>${main.b_sale}원</h5>
                           <div>
                              <c:if test="${main.b_spoint==5}">
                                 <div>
                                    <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i>
                                 </div>
                              </c:if>
                              <c:if test="${main.b_spoint==4}">
                                 <div>
                                    <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                 </div>
                              </c:if>
                              <c:if test="${main.b_spoint==3}">
                                 <div>
                                    <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                 </div>
                              </c:if>
                              <c:if test="${main.b_spoint==2}">
                                 <div>
                                    <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                 </div>
                              </c:if>
                              <c:if test="${main.b_spoint==1}">
                                 <div>
                                    <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                 </div>
                              </c:if>
                           </div>
                        </div>
                     </div>
                  </div>
               </c:if>
            </c:forEach>
            <c:forEach var="main" items="${main}">
               <c:if test="${main.b_p_code eq 'B1' or main.b_p_code eq 'B4'}">
                  <div class="col-lg-3 col-md-4 col-sm-6 mix B">
                     <div class="featured__item" onclick="location.href='${contextPath}/board_product/shop_detail?b_p_code=${main.b_p_code}'" style="cursor: pointer">
                        <div class="featured__item__pic set-bg" data-setbg="${contextPath}/resources/bootstrap/img/All/${main.b_p_code}.jpg"></div>
                        <div class="featured__item__text">
                           <h6>${main.b_product}</h6>
                           <span style="color: red">${main.b_discount}%</span>
                           <td-lt>${main.b_price}원</td-lt>
                           <h5>${main.b_sale}원</h5>
                           <div>
                              <c:if test="${main.b_spoint==5}">
                                 <div>
                                    <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i>
                                 </div>
                              </c:if>
                              <c:if test="${main.b_spoint==4}">
                                 <div>
                                    <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                 </div>
                              </c:if>
                              <c:if test="${main.b_spoint==3}">
                                 <div>
                                    <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                 </div>
                              </c:if>
                              <c:if test="${main.b_spoint==2}">
                                 <div>
                                    <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                 </div>
                              </c:if>
                              <c:if test="${main.b_spoint==1}">
                                 <div>
                                    <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                 </div>
                              </c:if>
                           </div>
                        </div>
                     </div>
                  </div>
               </c:if>
            </c:forEach>
            <c:forEach var="main" items="${main}">
               <c:if test="${main.b_p_code eq 'H4' or main.b_p_code eq 'H13'}">
                  <div class="col-lg-3 col-md-4 col-sm-6 mix H">
                     <div class="featured__item" onclick="location.href='${contextPath}/board_product/shop_detail?b_p_code=${main.b_p_code}'" style="cursor: pointer">
                        <div class="featured__item__pic set-bg" data-setbg="${contextPath}/resources/bootstrap/img/All/${main.b_p_code}.jpg"></div>
                        <div class="featured__item__text">
                           <h6>${main.b_product}</h6>
                           <span style="color: red">${main.b_discount}%</span>
                           <td-lt>${main.b_price}원</td-lt>
                           <h5>${main.b_sale}원</h5>
                           <div>
                              <c:if test="${main.b_spoint==5}">
                                 <div>
                                    <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i>
                                 </div>
                              </c:if>
                              <c:if test="${main.b_spoint==4}">
                                 <div>
                                    <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                 </div>
                              </c:if>
                              <c:if test="${main.b_spoint==3}">
                                 <div>
                                    <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                 </div>
                              </c:if>
                              <c:if test="${main.b_spoint==2}">
                                 <div>
                                    <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                 </div>
                              </c:if>
                              <c:if test="${main.b_spoint==1}">
                                 <div>
                                    <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                 </div>
                              </c:if>
                           </div>
                        </div>
                     </div>
                  </div>
               </c:if>
            </c:forEach>
            <c:forEach var="main" items="${main}">
               <c:if test="${main.b_p_code eq 'J24' or main.b_p_code eq 'J30'}">
                  <div class="col-lg-3 col-md-4 col-sm-6 mix J">
                     <div class="featured__item" onclick="location.href='${contextPath}/board_product/shop_detail?b_p_code=${main.b_p_code}'" style="cursor: pointer">
                        <div class="featured__item__pic set-bg" data-setbg="${contextPath}/resources/bootstrap/img/All/${main.b_p_code}.jpg"></div>
                        <div class="featured__item__text">
                           <h6>${main.b_product}</h6>
                           <span style="color: red">${main.b_discount}%</span>
                           <td-lt>${main.b_price}원</td-lt>
                           <h5>${main.b_sale}원</h5>
                           <div>
                              <c:if test="${main.b_spoint==5}">
                                 <div>
                                    <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i>
                                 </div>
                              </c:if>
                              <c:if test="${main.b_spoint==4}">
                                 <div>
                                    <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                 </div>
                              </c:if>
                              <c:if test="${main.b_spoint==3}">
                                 <div>
                                    <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                 </div>
                              </c:if>
                              <c:if test="${main.b_spoint==2}">
                                 <div>
                                    <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                 </div>
                              </c:if>
                              <c:if test="${main.b_spoint==1}">
                                 <div>
                                    <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                 </div>
                              </c:if>
                           </div>
                        </div>
                     </div>
                  </div>
               </c:if>
            </c:forEach>
         </div>
   </section>
   <!-- Featured Section End -->

   <!-- Latest Product Section Begin -->
   <section class="latest-product spad">
      <div class="container">
         <div class="row">
            <div class="col-lg-4 col-md-6">
               <div class="latest-product__text">
                  <img src="${contextPath}/resources/bootstrap/img/newnyang.gif">
                  <h4>최신 상품</h4>
                  <div class="latest-product__slider owl-carousel">
                     <div class="latest-prdouct__slider__item">
                        <c:forEach var="main" items="${main}">
                           <c:if test="${main.b_p_code eq 'J23' or main.b_p_code eq 'J33' or main.b_p_code eq 'J27'}">
                              <a href="${contextPath}/board_product/shop_detail?b_p_code=${main.b_p_code}" class="latest-product__item">
                                 <div class="latest-product__item__pic">
                                    <img src="${contextPath}/resources/bootstrap/img/All/${main.b_p_code}.jpg" alt="">
                                 </div>
                                 <div class="latest-product__item__text">
                                    <h6>${main.b_product}</h6>
                                    <span style="color: red">${main.b_discount}%</span>
                                    <td-lt-1>${main.b_price}원</td-lt-1>
                                    <span><strong>${main.b_sale}원</strong></span>
                                    <div>
                                       <c:if test="${main.b_spoint==5}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                       <c:if test="${main.b_spoint==4}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                       <c:if test="${main.b_spoint==3}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                       <c:if test="${main.b_spoint==2}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                       <c:if test="${main.b_spoint==1}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                    </div>
                                 </div>
                              </a>
                           </c:if>
                        </c:forEach>
                     </div>
                     <div class="latest-prdouct__slider__item">
                        <c:forEach var="main" items="${main}">
                           <c:if test="${main.b_p_code eq 'F7' or main.b_p_code eq 'H11' or main.b_p_code eq 'J19'}">
                              <a href="${contextPath}/board_product/shop_detail?b_p_code=${main.b_p_code}" class="latest-product__item">
                                 <div class="latest-product__item__pic">
                                    <img src="${contextPath}/resources/bootstrap/img/All/${main.b_p_code}.jpg" alt="">
                                 </div>
                                 <div class="latest-product__item__text">
                                    <h6>${main.b_product}</h6>
                                    <span style="color: red">${main.b_discount}%</span>
                                    <td-lt-1>${main.b_price}원</td-lt-1>
                                    <span><strong>${main.b_sale}원</strong></span>
                                    <div>
                                       <c:if test="${main.b_spoint==5}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                       <c:if test="${main.b_spoint==4}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                       <c:if test="${main.b_spoint==3}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                       <c:if test="${main.b_spoint==2}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                       <c:if test="${main.b_spoint==1}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                    </div>
                                 </div>
                              </a>
                           </c:if>
                        </c:forEach>
                     </div>
                  </div>
               </div>
            </div>
            <div class="col-lg-4 col-md-6">
               <div class="latest-product__text">
                  <img src="${contextPath}/resources/bootstrap/img/suggestnyang.gif">
                  <h4>추천 상품</h4>
                  <div class="latest-product__slider owl-carousel">
                     <div class="latest-prdouct__slider__item">
                        <c:forEach var="main" items="${main}">
                           <c:if test="${main.b_p_code eq 'F4' or main.b_p_code eq 'H12' or main.b_p_code eq 'J20'}">
                              <a href="${contextPath}/board_product/shop_detail?b_p_code=${main.b_p_code}" class="latest-product__item">
                                 <div class="latest-product__item__pic">
                                    <img src="${contextPath}/resources/bootstrap/img/All/${main.b_p_code}.jpg" alt="">
                                 </div>
                                 <div class="latest-product__item__text">
                                    <h6>${main.b_product}</h6>
                                    <span style="color: red">${main.b_discount}%</span>
                                    <td-lt-1>${main.b_price}원</td-lt-1>
                                    <span><strong>${main.b_sale}원</strong></span>
                                    <div>
                                       <c:if test="${main.b_spoint==5}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                       <c:if test="${main.b_spoint==4}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                       <c:if test="${main.b_spoint==3}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                       <c:if test="${main.b_spoint==2}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                       <c:if test="${main.b_spoint==1}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                    </div>
                                 </div>
                              </a>
                           </c:if>
                        </c:forEach>
                     </div>
                     <div class="latest-prdouct__slider__item">
                        <c:forEach var="main" items="${main}">
                           <c:if test="${main.b_p_code eq 'F5' or main.b_p_code eq 'H5' or main.b_p_code eq 'J5'}">
                              <a href="${contextPath}/board_product/shop_detail?b_p_code=${main.b_p_code}" class="latest-product__item">
                                 <div class="latest-product__item__pic">
                                    <img src="${contextPath}/resources/bootstrap/img/All/${main.b_p_code}.jpg" alt="">
                                 </div>
                                 <div class="latest-product__item__text">
                                    <h6>${main.b_product}</h6>
                                    <span style="color: red">${main.b_discount}%</span>
                                    <td-lt-1>${main.b_price}원</td-lt-1>
                                    <span><strong>${main.b_sale}원</strong></span>
                                    <div>
                                       <c:if test="${main.b_spoint==5}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                       <c:if test="${main.b_spoint==4}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                       <c:if test="${main.b_spoint==3}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                       <c:if test="${main.b_spoint==2}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                       <c:if test="${main.b_spoint==1}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                    </div>
                                 </div>
                              </a>
                           </c:if>
                        </c:forEach>
                     </div>
                  </div>
               </div>
            </div>
            <div class="col-lg-4 col-md-6">
               <div class="latest-product__text">
                  <img src="${contextPath}/resources/bootstrap/img/disnyang.gif">
                  <h4>한정 상품</h4>
                  <div class="latest-product__slider owl-carousel">
                     <div class="latest-prdouct__slider__item">
                        <c:forEach var="main" items="${main}">
                           <c:if test="${main.b_p_code eq 'F10' or main.b_p_code eq 'B2' or main.b_p_code eq 'B7'}">
                              <a href="${contextPath}/board_product/shop_detail?b_p_code=${main.b_p_code}" class="latest-product__item">
                                 <div class="latest-product__item__pic">
                                    <img src="${contextPath}/resources/bootstrap/img/All/${main.b_p_code}.jpg" alt="">
                                 </div>
                                 <div class="latest-product__item__text">
                                    <h6>${main.b_product}</h6>
                                    <span style="color: red">${main.b_discount}%</span>
                                    <td-lt-1>${main.b_price}원</td-lt-1>
                                    <span><strong>${main.b_sale}원</strong></span>
                                    <div>
                                       <c:if test="${main.b_spoint==5}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                       <c:if test="${main.b_spoint==4}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                       <c:if test="${main.b_spoint==3}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                       <c:if test="${main.b_spoint==2}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                       <c:if test="${main.b_spoint==1}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                    </div>
                                 </div>
                              </a>
                           </c:if>
                        </c:forEach>
                     </div>
                     <div class="latest-prdouct__slider__item">
                        <c:forEach var="main" items="${main}">
                           <c:if test="${main.b_p_code eq 'J6' or main.b_p_code eq 'F18' or main.b_p_code eq 'J5'}">
                              <a href="${contextPath}/board_product/shop_detail?b_p_code=${main.b_p_code}" class="latest-product__item">
                                 <div class="latest-product__item__pic">
                                    <img src="${contextPath}/resources/bootstrap/img/All/${main.b_p_code}.jpg" alt="">
                                 </div>
                                 <div class="latest-product__item__text">
                                    <h6>${main.b_product}</h6>
                                    <span style="color: red">${main.b_discount}%</span>
                                    <td-lt-1>${main.b_price}원</td-lt-1>
                                    <span><strong>${main.b_sale}원</strong></span>
                                    <div>
                                       <c:if test="${main.b_spoint==5}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                       <c:if test="${main.b_spoint==4}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                       <c:if test="${main.b_spoint==3}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                       <c:if test="${main.b_spoint==2}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                       <c:if test="${main.b_spoint==1}">
                                          <div>
                                             <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                          </div>
                                       </c:if>
                                    </div>
                                 </div>
                              </a>
                           </c:if>
                        </c:forEach>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Latest Product Section End -->

   

   <!-- Footer Section Begin -->
   <%@ include file="include/footertest.jsp"%>
   <!-- Footer Section End -->

   <!-- Js Plugins -->
   <%@ include file="include/plug_in.jsp"%>


</body>

</html>