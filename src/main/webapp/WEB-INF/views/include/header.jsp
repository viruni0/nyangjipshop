<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
    
        <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="#"><img src="${contextPath}/resources/bootstrap/img/logoim.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="img/language.png" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="#">Spanis</a></li>
                    <li><a href="#">English</a></li>
                </ul>
            </div>
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="./index.html">Home</a></li>
                <li><a href="./shop-grid.html">Shop</a></li>
                <li><a href="#">Pages</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="./shop-details.html">Shop Details</a></li>
                        <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                        <li><a href="./checkout.html">Check Out</a></li>
                        <li><a href="./blog-details.html">Blog Details</a></li>
                    </ul>
                </li>
                <li><a href="./blog.html">Blog</a></li>
                <li><a href="./contact.html">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> </li>
                                <li></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest-p"></i></a>
                            </div>
                            <div class="header__top__right__language">
                                <img src="img/language.png" alt="">
                                <div>한국어</div>
                            </div>
                            <c:choose>
								<c:when test="${user!=null&&user.u_state==1||user.u_state==3}">
									<div class="header__top__right__auth">
	                                	<a href="${contextPath}/mypageU/my_user"><img src="${contextPath}/resources/bootstrap/img/프로필.jpg" alt="" ></a>
	                                	<!-- <i class="fa fa-user"></i> --> 
	                            	</div>
	                            	<div class="header__top__right__auth">
	                                	<a href="${contextPath}/logOut" ><i></i>로그아웃</a>
	                        		</div>
								</c:when>
								<c:when test="${user.u_state==4}">
									<div class="header__top__right__auth">
	                                	<a href="${contextPath}/mypageGM/my_gm"><img src="${contextPath}/resources/bootstrap/img/프로필.jpg" alt="" >관리자</a>
	                                	<!-- <i class="fa fa-user"></i> --> 
	                            	</div>
	                            	<div class="header__top__right__auth">
	                                	<a href="${contextPath}/logOut" ><i></i>로그아웃</a>
	                        		</div>
								</c:when>
								<c:when test="${user==null }">
					        		<div class="header__top__right__auth">
	                                	<a href="${contextPath}/login"><i class="fa fa-user"></i>로그인</a>
	                            	</div>
	                            	<div class="header__top__right__auth">
	                                	<a href="${contextPath}/login/join" ><i></i>회원가입</a>
	                            	</div>
					        	</c:when>
							</c:choose>
						</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo" style="text-align:center;">
                        <a href="/nyangjipshop/main"><img src="${contextPath}/resources/bootstrap/img/logoim.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-7" style="margin-top:50px;">
                    <nav class="header__menu" style="text-align:center;">
                        <ul>
                            <li><a href="/nyangjipshop/main">메인</a></li>
                            <li><a href="${contextPath}/board_product/shop_list">상품목록</a></li>
                            <li><a href="${contextPath}/board_dto/freelist">자유게시판</a></li>
                            <!-- <li><a href="${contextPath}/mypageU/my_member">멤버쉽</a></li> -->
                            <li><a href="${contextPath}/cs/cs">고객센터</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-2">
                    <div class="header__cart">
                        <ul>
							<li><a href="${contextPath}/mypageU/my_wish"><img src="${contextPath}/resources/bootstrap/img/wish.png" width="40" height="40"></a></li>
							<li><a href="${contextPath}/basket/sel_basket"><img src="${contextPath}/resources/bootstrap/img/basket.png" width="35" height="35"></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->