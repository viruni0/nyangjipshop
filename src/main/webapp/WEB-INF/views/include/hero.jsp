<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

    <!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>모든 카테고리</span>
                        </div>
                        <ul>
							<li><a href="${contextPath}/board_product/shop_list_F">식품</a></li>
                            <li><a href="${contextPath}/board_product/shop_list_B">배변용품</a></li>
                            <li><a href="${contextPath}/board_product/shop_list_H">건강/목욕/미용</a></li>
                            <li><a href="${contextPath}/board_product/shop_list_J">잡화</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form id="frm_search" name="frm_search" method="get" action="${contextPath}/nyangjipshop/search">
                                <input type="text" class="form-control" id="keyWord" name="keyWord" placeholder="찾고 싶은 상품을 검색해보세요!" maxlength="100">
								<button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->