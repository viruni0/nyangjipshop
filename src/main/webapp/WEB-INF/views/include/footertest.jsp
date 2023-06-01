<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!-- Footer Section Begin -->
    <footer class="footer spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <a href="/nyangjipshop"><img src="${contextPath}/resources/bootstrap/img/logoim.png" title="냥집샵" alt=""></a>
                        </div>
                        <ul>
                            <li>(주)냥집샵&nbsp;&nbsp;|&nbsp;&nbsp;대표 : 세라쌤</li>
                            <li>대표번호 : +82 010-1234-5678</li>
                            <li>이메일 : nyangjipshop@naver.com</li>
                            <li>인천광역시 부평구 부평동 546-64</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6 offset-lg-1">
                    <div class="footer__widget" style="margin-top:30px;">
                        <h6>우리 정예 멤버</h6>
                        <ul>
                            <li><a href="#">노시온</a></li>
                            <li><a href="#">박성진</a></li>
                            <li><a href="#">김수빈</a></li>
                        </ul>
                        <ul>
                            <li><a href="#">세라쌤</a></li>
                            <li><a href="#">박진희</a></li>
                            <li><a href="#">이현규</a></li>
                            <li><a href="#">고재영</a></li>
                            <li><a href="#">김성길</a></li>
                        </ul>
                    </div>
                </div>
                <!-- 
                <div class="col-lg-4 col-md-12">
                    <div class="footer__widget" style="margin-top:30px;">
                        <h6>Join Our Newsletter Now</h6>
                        <p>Get E-mail updates about our latest shop and special offers.</p>
                        <form action="#">
                            <input type="text" placeholder="Enter your mail">
                            <button type="submit" class="site-btn">Subscribe</button>
                        </form>
                        <div class="footer__widget__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
                 -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                        <div class="footer__copyright__text"><p>
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
 </p></div>
                        <div class="footer__copyright__payment"><img src="${contextPath}/resources/bootstrap/img/payment-item.png" alt=""></div>
                    </div>
                </div>
            </div>
             
        </div>
    </footer>
    <!-- Footer Section End -->