<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true" %>
<!DOCTYPE html>

<html lang="zxx">

<%@ include file="include/head.jsp" %>

<script>
/*
$(document).ready(function(){
	
	wish_del();
	
});
*/
function wishdel(b_p_code){
	
	location.href="wishdel?b_p_code=" + b_p_code;

	//alert("펑션들어옴!");
	/*
 	//$(document).on('click','#wishdel',function(){	
	const url 		= "${contextPath}/mypageU/wishdel";
	var paramData = {
               "u_p_id"      : '${user.u_p_id}',
               "b_p_code"	 : b_p_code
            }
	
	$.ajax({
	      url:url,
	      data:paramData,
	      dataType: 'html',
	      type: 'POST',
	      success:function(result){
	         console.log(result);
	         //wish_del();
	      },
	      error:function(result,status,error){
	         console.log(result);
	         alert("에러가 발생했습니다");
	         alert("code:"+result.status+"\n"+"message:"+result.responseText+"\n"+"error:"+error);
	      }
	   });
	*/
}
/*
//찜목록 삭제 눌렀을때 새로고침
function wish_del(){
	
	const url 			= "${contextPath}/mypageU/wishlist";
	 var paramData = {
             "u_p_id"  		: '${user.u_p_id}',
          }
	 
		 $.ajax({
		      url:url,
		      data:paramData,
		      dataType: 'json',
		      type: 'POST',
		      success:function(result){
		    	  //alert("펑션들어옴!");
					var htmls = "";
					
					htmls = htmls + '<tr>';
					htmls += '<c:forEach var="wish" items="${wish1}">'; 
					htmls += '<tr>';
					htmls += '<td><a href="${contextPath}/board_product/shop_detail?b_p_code=${wish.b_p_code}" class="latest-product__item__pic"><img src="${contextPath}/resources/bootstrap/img/All/${wish.b_p_code}.jpg" alt=""></a></td>';
					htmls += '<td><a href="${contextPath}/board_product/shop_detail?b_p_code=${wish.b_p_code}" style="color:black;" >${wish.b_product}</a></td>';
                	htmls += '<td>${wish.b_price}</td>';
                	htmls += '<td>${wish.b_sale}</td>';
                	htmls += '<td class="shoping__cart__item__close">';
                	htmls += '<button class="icon_close" type="button" onclick="javascript:wishdel(\'${wish.b_p_code}\');" style="border: none;"></button></td>';
					htmls += '</tr>';
                	htmls += '</c:forEach>';
                	htmls += '</tr>';
					
					$("#wish_list").html(htmls);
		      },
		      error:function(result,status,error){
		         console.log(result);
		         alert("code:"+result.status+"\n"+"message:"+result.responseText+"\n"+"error:"+error);
		         alert("실패");
		      }
		   });
 }
 */

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
                   <h2>찜목록</h2>
                   </div>
                      <div class="shoping__cart__table">
                         <div class="shoping__product">
                         <table style="width:94%">
                               <tr style="border-bottom: 1px solid black">
								  <th></th>
                                  <th>상품</th>
                                  <th>가격</th>
                                  <th>할인가</th>
                               </tr>
								<tr id="wish_list">
									<c:forEach var="wish" items="${wish1}">
									<tr>
									<td><a href="${contextPath}/board_product/shop_detail?b_p_code=${wish.b_p_code}" class="latest-product__item__pic"><img src="${contextPath}/resources/bootstrap/img/All/${wish.b_p_code}.jpg" alt=""></a></td>
									<td><a href="${contextPath}/board_product/shop_detail?b_p_code=${wish.b_p_code}" style="color:black;" >${wish.b_product}</a></td>
						            <td>${wish.b_price}</td>
						            <td>${wish.b_sale}</td>
						            <td class="shoping__cart__item__close">
						            <button class="icon_close" type="button" onclick="wishdel('${wish.b_p_code}');" style="border: none;"></button></td>
									</tr>
						            </c:forEach>
                            	</tr>
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