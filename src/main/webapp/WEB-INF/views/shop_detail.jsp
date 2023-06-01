<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true"%>
<!DOCTYPE html>

<html lang="zxx">
<!-- head -->
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
<!-- head end -->
<script>

// 후기 작성하기
function review() {
	
	let openWin;
	openWin = window.open(
      "${contextPath}/shop_detail_review/review",
      "review",
      "width=700, height=600, top=50, left=50"
    );

}

// 상품 문의 작성하기
function inquiry() {
	
	var width 	= "700";
    var height 	= "600";
 
    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
    var left 	= window.screenLeft + (document.body.clientWidth - width) / 2;
    var top 	= window.screenTop + (document.body.clientHeight - height) / 2;
	
	let openWin;
	openWin = window.open(
      "${contextPath}/shop_detail_inquiry/inquiry",
      "inquiry",
      "width="+width+", height="+height+", left="+left+", top="+top
    );

}

//찜 추가하기
$(document).on('click','#wish_like',function(){
   
   const url = "${pageContext.request.contextPath}/shop_detail/wish_like";
   var paramData = {
               "u_p_id"      : '${user.u_p_id}',
               "b_p_code"      : '${product.b_p_code}'
            }
   
   $.ajax({
         url:url,
         data:paramData,
         dataType: 'json',
         type: 'POST',
         success:function(result){
            console.log(result);
            wishbtn_like();
         },
         error:function(result){
            console.log(result);
            alert("에러가 발생했습니다");
         }
      });
});

// 삭제되는 찜버튼(찜취소)
$(document).on('click','#wish_un',function(){
   
   const url = "${pageContext.request.contextPath}/shop_detail/wish_un";
   var paramData = {
               "u_p_id"      : '${user.u_p_id}',
               "b_p_code"      : '${product.b_p_code}'
            }
   
   $.ajax({
         url:url,
         data:paramData,
         dataType: 'json',
         type: 'POST',
         success:function(result){
            console.log(result);
            wishbtn_un();
         },
         error:function(result){
            console.log(result);
            alert("에러가 발생했습니다");
         }
      });
});

// 찜 추가눌렀을때 새로고침
function wishbtn_like(){
    
    const url = "${pageContext.request.contextPath}/shop_detail/wish_check";
    var paramData = {
            "u_p_id"        : '${user.u_p_id}',
            "b_p_code"     : '${product.b_p_code}'
         }
    
       $.ajax({
            url:url,
            data:paramData,
            dataType: 'html',
            type: 'POST',
            success:function(result){
               
               var htmls = "";
               // 찜 안되어있어서 찜 추가 후, 하트 활성화 -
               htmls = htmls + '<button href="javascript:void(0)" class="heart-icon" onclick="wish_un" type="button" id="wish_un" style="border: none;"><span class="fa fa-heart" ></span></button>';
               $("#wish").html(htmls);
               
            },
            error:function(result,status,error){
               console.log(result);
               alert("code:"+result.status+"\n"+"message:"+result.responseText+"\n"+"error:"+error);
               alert("실패");
            }
         });
}

// 찜 삭제 눌렀을때 새로고침
function wishbtn_un(){
    
    const url = "${pageContext.request.contextPath}/shop_detail/wish_check";
    var paramData = {
             "u_p_id"        : '${user.u_p_id}',
             "b_p_code"     : '${product.b_p_code}'
          }
    
       $.ajax({
            url:url,
            data:paramData,
            dataType: 'html',
            type: 'POST',
            success:function(result){
               
               var htmls = "";
               // 찜 추가 되어있어서 찜 삭제 후, 하트 비활성화
               htmls = htmls + '<button href="javascript:void(0)" class="heart-icon" onclick="wish_like" type="button" id="wish_like" style="border: none;"><span class="icon_heart_alt" ></span></button>';
               $("#wish").html(htmls);
               
            },
            error:function(result,status,error){
               console.log(result);
               alert("code:"+result.status+"\n"+"message:"+result.responseText+"\n"+"error:"+error);
               alert("실패");
            }
         });
 }
//장바구니 새로고침...
function detailsel_basket(){
	location.href="${contextPath}/board_product/shop_detail?b_p_code=${product.b_p_code}";
}
 /*
// 장바구니 재조회 (자꾸 처음 들어온 ${basket.b_num} 값유지되고, 재조회한 값이 적용되지 않음..)
function detailsel_basket(){
	
	const url = "${contextPath}/basket/detailsel_basket";
	var paramData = {
       "u_p_id"      : '${user.u_p_id}',
       "b_p_code"	 : '${product.b_p_code}'
    }
	
	$.ajax({
	      url: url,
	      data:paramData,
	      dataType: 'html',
	      type: 'POST',
	      success:function(result){
	         console.log(result);
	         alert("재조회성공");
	      },
	      error:function(result,status,error){
	         console.log(result);
	         alert("재조회 에러");
	         alert("code:"+result.status+"\n"+"message:"+result.responseText+"\n"+"error:"+error);
	      }
	});
}
 */
// 장바구니 담기
function upbasket(){
	 
	 var usertest = '${user.u_p_id}';
	 
	 if(usertest==null||usertest==""){
		 location.href="${contextPath}/login";
	 } else {
		 
		 var id = "${basket.u_p_id}";
			
			if(id != ""){
				const url = "${contextPath}/basket/upd_basket";
				var num = document.getElementById("b_num").value;
				var b_num = '${basket.b_num}';
				var sum = parseInt(num) + parseInt(b_num);
				var paramData = {
					       "u_p_id"      : '${user.u_p_id}',
					       "b_num"      : sum,
					       "b_p_code"	 : '${product.b_p_code}'
				}
				
				$.ajax({
				      url: url,
				      data:paramData,
				      dataType: 'json',
				      type: 'POST',
				      success:function(result){
				         console.log(result);
				         alert("장바구니에 추가하였습니다!");
				         detailsel_basket();
				      },
				      error:function(result,status,error){
				         console.log(result);
				         alert("upd에러");
				         alert("code:"+result.status+"\n"+"message:"+result.responseText+"\n"+"error:"+error);
				      }
				});
			} else {
				const url = "${contextPath}/basket/ins_basket";
				var num = document.getElementById("b_num").value;
				var paramData = {
			       "u_p_id"      : '${user.u_p_id}',
			       "b_num"      : num,
			       "b_p_code"	 : '${product.b_p_code}'
			    }
				
				$.ajax({
				      url: url,
				      data:paramData,
				      dataType: 'json',
				      type: 'POST',
				      success:function(result){
				         console.log(result);
				         alert("장바구니에 추가하였습니다!");
				         detailsel_basket();
				      },
				      error:function(result,status,error){
				         console.log(result);
				         alert("ins에러");
				         alert("code:"+result.status+"\n"+"message:"+result.responseText+"\n"+"error:"+error);
				      }
				});
			}
	 }
}
 
</script>
<body>
   <input class="goupbtn" type="button" onclick="window.scrollTo(0,0);" value="Top">
   <!-- header -->
   <%@ include file="include/header.jsp"%>
   <!-- header end -->
   <!-- hero -->
   <%@ include file="include/hero.jsp"%>
   <!-- hero end -->

   <!-- Product Details Section Begin -->
   <section class="product-details spad">
      <div class="container">
         <div class="row">
            <div class="col-lg-6 col-md-6">
               <div class="product__details__pic">
                  <div class="product__details__pic__item">
                     <img class="product__details__pic__item--large" src="${contextPath}/resources/bootstrap/img/All/${product.b_p_code}.jpg" alt="">
                  </div>
				<input type="hidden" id="b_p_code1" name="b_p_code1" value="${product.b_p_code}">
				<input type="hidden" id="b_product1" name="b_product1" value="${product.b_product}">
               </div>
            </div>
            <div class="col-lg-6 col-md-6">
               <div class="product__details__text">
                  <br>
                  <h3>${product.b_product}</h3>
                  <c:if test="${product.b_spoint==5}">
                     <div>
                        <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i>
                     </div>
                  </c:if>
                  <c:if test="${product.b_spoint==4}">
                     <div>
                        <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                     </div>
                  </c:if>
                  <c:if test="${product.b_spoint==3}">
                     <div>
                        <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                     </div>
                  </c:if>
                  <c:if test="${product.b_spoint==2}">
                     <div>
                        <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                     </div>
                  </c:if>
                  <c:if test="${product.b_spoint==1}">
                     <div>
                        <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                     </div>
                  </c:if>
                  <ul>
                     <li><b>판매가</b> <td-lt-1>${product.b_price}원</td-lt-1></li>
                     <li><b>할인가</b><span style="color: red; font-size: 25px;">${product.b_sale}원</span></li>
                     <li><b>상품수량</b>${product.b_num}개</li>
                  </ul>

                  <div style="margin-top: 30px; color: gray">수량</div>
                  <div class="product__details__quantity">
                     <div class="quantity">
                        <div class="pro-qty">
                           <input type="text" id="b_num" value="1">
                        </div>
                     </div>
                  </div>
                  		<button class="primary-btn" onclick="upbasket()"title="장바구니 담기" style="border: none;">장바구니 담기</button>
                        <a href="${contextPath}/basket/sel_basket" class="primary-btn" title="바로구매">바로구매</a>
                        <span id="wish" >
                        <!-- 찜목록 추가된 유저 -->
                        <c:if test="${wish.u_p_id!=null}">
                           <button class="heart-icon" type="button" id="wish_un" style="border: none;"><span class="fa fa-heart" ></span></button>
                        </c:if>
                        <c:if test="${wish.u_p_id==null}">
                           <!-- 로그인은 했으나, 찜목록 추가 안함 -->
                     <c:if test="${user!=null}">
                        <button class="heart-icon" type="button" id="wish_like" style="border: none;"><span class="icon_heart_alt" ></span></button>
                     </c:if> 
                     <c:if test="${user==null}">
                        <!-- 로그인 안되어있는 상태 -->
                        <a href="${contextPath}/login"><button class="heart-icon" type="button" style="border: none;"><span class="icon_heart_alt" ></span></button></a>
                     </c:if>
                        </c:if>
                        </span>
                  <ul>
                     <li><b>배송</b> <span>30,000원 이상 구매 시 무료배송</span></li>
                     <li><b>출고</b> <span>업체 별 배송기간 1~3일 추가 소요</span></li>
                     <li><b>공유</b>
                        <div class="share">
                           <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-instagram"></i></a> <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div></li>
                  </ul>
               </div>
            </div>
            <div class="col-lg-12">
               <div class="product__details__tab">
                  <ul class="nav nav-tabs" role="tablist">
                     <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true" title="상품정보">상품정보</a></li>
                     <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab" aria-selected="false" title="상품후기">상품후기 <span>(${shop_review_cnt})</span></a></li>
                     <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab" aria-selected="false" title="상품문의">상품문의 <span>(${shop_inquiry_cnt})</span></a></li>
                     <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tabs-4" role="tab" aria-selected="false" title="구매 확인사항">구매 확인사항</a></li>
                  </ul>
                  <!-- 상품 정보 start -->
                  <div class="tab-content">
                     <div class="tab-pane active" id="tabs-1" role="tabpanel">
                        <div class="product__details__tab__desc">
                           <h6 style="text-decoration: underline; margin-top: 25px;">상품설명</h6>
                           <div style="text-align: center;">
                              <c:forEach var="i" begin="1" end="7">
                                 <img src="${contextPath}/resources/bootstrap/img/All-1/${product.b_p_code}-${i}.jpg" alt="">
                              </c:forEach>
                           </div>
                        </div>
                     </div>
                     <!-- 상품 정보 end -->
                     <!-- 상품 후기 start -->
                     <div class="tab-pane" id="tabs-2" role="tabpanel">
                        <div class="product__details__tab__desc">
                           <button type="button" id="btn btn-review" onclick="review()" style="float: right;">후기작성하기</button>
                           <section class="shoping-cart spad">
                              <div class="container">
                                 <div class="row">
                                    <c:forEach var="shop_review" items="${shop_review}" varStatus="i">
                                       <div class="shoping__cart__table">
                                          <table>
                                             <tbody>
                                                <tr>
                                                </tr>
                                                <tr>
                                                   <td class="shoping__cart__item"><img src="${contextPath}/resources/bootstrap/img/Reviewimg/${shop_review.b_p_code}-Review${i.count}.jpg" alt="">
                                                      <h5>${shop_review.r_content}</h5></td>
                                                   <td class="shoping__cart__price">${shop_review.u_p_id}</td>
                                                   <td><c:if test="${shop_review.r_spoint==5}">
                                                         <div>
                                                            <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i>
                                                         </div>
                                                      </c:if> <c:if test="${shop_review.r_spoint==4}">
                                                         <div>
                                                            <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                                         </div>
                                                      </c:if> <c:if test="${shop_review.r_spoint==3}">
                                                         <div>
                                                            <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                                         </div>
                                                      </c:if> <c:if test="${shop_review.r_spoint==2}">
                                                         <div>
                                                            <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                                         </div>
                                                      </c:if> <c:if test="${shop_review.r_spoint==1}">
                                                         <div>
                                                            <i class="fa fa-star" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i> <i class="fa fa-star-o" style="color: #ffc107;"></i>
                                                         </div>
                                                      </c:if></td>
                                                   <td class="shoping__cart__total">${shop_review.r_date}</td>
                                                </tr>
                                             </tbody>
                                          </table>
                                       </div>
                                    </c:forEach>
                                 </div>
                              </div>
                           </section>
                        </div>
                     </div>
                     <!-- 상품 후기 end -->
                     <!-- 상품 문의 start -->
                     <div class="tab-pane" id="tabs-3" role="tabpanel">
                        <div class="product__details__tab__desc">
                           <button type="button" id="btn btn-inquiry" onclick="inquiry()" style="float: right;">상품문의하기</button>
                           <h6 style="text-decoration: underline;">상품문의</h6>
                           <p style="margin-bottom: 50px">상품에 대해 궁금한 점을 물어보세요.</p>
                        </div>
                        <c:forEach var="shop_inquiry" items="${shop_inquiry}">
                           <h6 style="margin-bottom: 20px;">
                              <strong>${shop_inquiry.u_p_id}****</strong>
                           </h6>
                           <span style="float: right;">${shop_inquiry.i_date}</span>
                           <h6 style="margin-bottom: 20px;">${shop_inquiry.i_content}</h6>
                           <c:if test="${shop_inquiry.i_answer != '1'}">
                           <div style="background-color: #D3D3D3; width: 100%">
                              <div>
                                 <strong>냥집샵</strong>
                              </div>
                              <dd>${shop_inquiry.i_answer}</dd>
                              <dd>더 궁금하신 사항은 언제든지 고객센터로 연락주시면 친절히 안내해드리겠습니다.</dd>
                              <dd>고객센터 업무시간</dd>
                              <dd>평일 AM 10:00 ~ PM 05:30</dd>
                              <dd>☏ 1588-3010</dd>
                           </div>
                           </c:if>
                           <br>
                        </c:forEach>
                     </div>
                     <!-- 상품 문의 end -->
                     <!-- 구매 확인사항 start -->
                     <div class="tab-pane" id="tabs-4" role="tabpanel">
                        <div class="product__details__tab__desc">
                           <h6 style="text-decoration: underline;">배송정보</h6>
                           <li>3만원 이상 구매 시 무료배송됩니다.(부피, 무게 무관)</li>
                           <li>제주, 도서산간 지역은 3,000원 택배비 추가됩니다.</li>
                           <li>냥집샵 출고상품 경우 [평일 오후 5시 까지, 토요일 낮 12시 결제건] 까지 당일출고 됩니다.</li>
                           <li>택배 업체 상황에 따라 [CJ대한통운, 롯태택배] 로 출고될수 있습니다.</li>
                           <li>업체 배송에 경우 1~3일가량 추가로 소요될 수 있습니다.</li>
                           <li>천재지변, 물량 수급 변동 등 예외적인 사유 발생 시, 지연될 수 있는 점 양해 부탁드립니다.</li>
                           <h6 style="text-decoration: underline; margin-top: 25px;">교환,반품 안내</h6>
                           <li>단순변심에 의한 환불은 제품 수령후 7일이내에 신청 가능합니다. (왕복배송비 고객부담)</li>
                           <li>단순변심에 의한 반품시 배송박스 수량에 따라 반품 택배비가 추가됩니다.</li>
                           <li>포장개봉, 조립, 사용 등으로 인해 재판매가 불가능할 경우 반품이 불가능 할 수 있습니다.</li>
                           <li>제품 하자의 경우 물품 수령 후 30일이내 반품 가능합니다.</li>
                        </div>
                     </div>
                     <!-- 구매 확인사항 end -->
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Product Details Section End -->

   <!-- Footer Section Begin -->
   <%@ include file="include/footertest.jsp"%>
   <!-- Footer Section End -->
   <!-- Js Plugins -->
   <%@ include file="include/plug_in.jsp"%>

</body>

</html>