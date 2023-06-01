<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true"%>
<!DOCTYPE html>

<html lang="zxx">

<%@ include file="include/head.jsp"%>

<script>
/* 왜 여기선 인식 못하니...
// - 버튼
function minuson(b_p_code){

	var sum = document.getElementById("sum"+b_p_code).value;
	var b_price = document.getElementById("prnum"+b_p_code).value;
	
	$("input[name=sum"+b_p_code+"]").attr('value', sum - 1);
	$("input[id=val"+b_p_code+"]").attr('value', sum * b_price);
	
}

// + 버튼
function addon(b_p_code){

	 var sum = document.getElementById("sum"+b_p_code).value;
	 var b_price = document.getElementById("prnum"+b_p_code).value;
		
	$("input[name=sum"+b_p_code+"]").attr('value', sum + 1);
	$("input[id=val"+b_p_code+"]").attr('value', sum * b_price);
	
}
*/
$(function() {
	/*
		// 상품들 수량기능
		$("#minusF"+b).click(function() {
			var minus = $("#prnumF"+b).val();
			i--
			$("input[name=sumF"+b+"]").attr('value', i);
			minus = i * minus;
			$("input[name=valF"+b+"]").attr('value', minus);
			$("input[name=anss]").attr('value', minus);
			
			total += parseInt($(element).find("#val").val());
			$("#val").text(total.toLocalString());
		})
		
		$("#addF"+b).click(function() {
			var sum = $("#prnumF"+b).val();
			i++
			$("input[name=sumF"+b+"]").attr('value', i);
			sum = i * sum;
			$("input[name=valF"+b+"]").attr('value', sum);
			$("input[name=anss]").attr('value', sum);
			
			total += parseInt($(element).find("#val").val());
			$("#val").text(total.toLocalString());
		})
		*/
	}
		
		
		
		$("#btnto").click(function() {
			var num = $("#nt option:selected").val();
			var sum = 0;
			var val = $("#val").val();
			var add = 0;
			if (num == 2) {
				alert("헤이 유~");
				sum = val * (5 / 100);
				add = val - sum;
				$("input[name=val]").attr('value', add);
			}
			if (num == 3) {
				alert("헤이 유~");
				sum = val * (10 / 100);
				add = val - sum;
				$("input[name=val]").attr('value', add);
			}
			if (num == 4) {
				alert("헤이 유~");
				sum = val * (15 / 100);
				add = val - sum;
				$("input[name=val]").attr('value', add);
			}
			if (num == 5) {
				alert("헤이 유~");
				sum = val * (20 / 100);
				add = val - sum;
				$("input[name=val]").attr('value', add);
			}
			if (num == 6) {
				alert("헤이 유~");
				sum = val * (25 / 100);
				add = val - sum;
				$("input[name=val]").attr('value', add);
			}
		})

})
/*
	function getTime() {
		var d = new Date(); // 현재 날짜와 시간
		var hur = d.getHours(); // 시
		var min = d.getMinutes(); //분
		var sec = d.getSeconds(); //초
		var kingsum = $()

		var timeBoard = document.getElementById("date"); // 값이 입력될 공간

		var time = "현재 시간 : " + hur + "시 " + min + "분 " + sec + "초" // 형식 지정

		timeBoard.innerHTML = time; // 출력
		setTimeout(getTime, 1000);

	}

	function loed() {
		setTimeout('location.reload()', 1000);
	}
*/
</script>

<body id="bd">

	<!-- Header Section Begin -->
	<%@ include file="include/header.jsp"%>>
	<!-- Header Section End -->

	<!-- Hero Section Begin -->
	<%@ include file="include/hero.jsp"%>
	<!-- Breadcrumb Section End -->

	<!-- Product Section Begin -->
	<section class="shoping-cart spad">
		<form role="form" action="${contextPath}/basket/del_basket">
			<div class="container">
				<div class="row">
					<div class="col-lg12 col-md-12" style="text-align:center;">
						<div class="product__discount">
							<div class="section-title product__discount__title">
								<p id="date"></p>
								<h2>장바구니</h2>
							</div>
							<div class="col-lg-12">
								<div class="shoping__cart__table">
									<br>
									<table onload="loed()">
										<tr class="shoping__product"
											style="border-bottom: 1px solid silver;">
										</tr>
										<input type="checkbox" id='checkbtn' onclick='selectAll(this)' checked="checked" style="float:left;">
										<c:forEach var="board" items="${blist}">
											<tr>
												<td>
													<a href="${contextPath}/board_product/shop_detail?b_p_code=${board.b_p_code}" class="latest-product__item__pic"><img src="${contextPath}/resources/bootstrap/img/All/${board.b_p_code}.jpg" alt=""></a>
												</td>
												<td class="form-box">
													<input type="checkbox" id='ked${board.b_p_code}' name="ked" value="${board.b_price * board.b_num}" onclick="totalsum('${board.b_p_code}')" class="cla" style="float: left" checked="checked">
													<span style="visibility:hidden">
													<input type="checkbox" id='sumcheck${board.b_p_code}' name="sumcheck" value="${board.b_num}" style="float: left" checked="checked">
													</span>
													<td><a href="${contextPath}/board_product/shop_detail?b_p_code=${board.b_p_code}" style="color: black;">
														${board.b_product}</a>
													</td>
													<td>
														<input type="text" class="shoping__cart__price" id='prnum${board.b_p_code}' name='prnum${board.b_p_code}'
														value="${board.b_price}" style="float: left; border: none; color: black; width: 100px; text-align: center;"	readonly>
													<td class="quantity" style="margin-left: 5%">
														<button type="button" id="minus${board.b_p_code}" onclick="minuson('${board.b_p_code}')">-</button>
														<input type="text" id='sum${board.b_p_code}' name='sum' value="${board.b_num}"
															style="width: 50px; text-align: center;" readonly>
														<button type="button" id="add${board.b_p_code}"	onclick="addon('${board.b_p_code}')">+</button>
														<input type="number" id='val${board.b_p_code}' name='val${board.b_p_code}' value="${board.b_price * board.b_num}"
															style="width: 300px; text-align: center; border: none" readonly>
													</td>
													</td>
												</td>
												<td class="shoping__cart__item__close">
													<!-- 선택삭제 --> 
													<button class="subbtn" type="button" onclick="basketdel('${board.b_p_code}');" style="border: none;">X</button>
												</td>
											</tr>
										</c:forEach>
										<script>
											
											$(document).ready(function(){
												totalsum();
											});
										
											// - 버튼
											function minuson(b_p_code){
											
												var sum = document.getElementById("sum"+b_p_code).value;
												var b_price = document.getElementById("prnum"+b_p_code).value;
												
												sum = parseInt(sum) - 1;
												if(sum==0){
													$("input[id=sum"+b_p_code+"]").attr('value', 1);
													$("input[id=sumcheck"+b_p_code+"]").attr('value', 1);
													$("input[id=val"+b_p_code+"]").attr('value', b_price);
													$("input[id=ked"+b_p_code+"]").attr('value', b_price);
													alert("수량은 0개가 될 수 없습니다. 해당 상품을 원치 않으시면 X표시를 눌러 삭제해주세요 :)");
													$("input[id=ked"+b_p_code+"]").prop("checked", true);
													$("input[id=sumcheck"+b_p_code+"]").prop("checked", true);
													sum=1;
												} else {
													$("input[id=sum"+b_p_code+"]").attr('value', sum);
													$("input[id=sumcheck"+b_p_code+"]").attr('value', sum);
													$("input[id=val"+b_p_code+"]").attr('value', sum * b_price);
													$("input[id=ked"+b_p_code+"]").attr('value', sum * b_price);
													$("input[id=ked"+b_p_code+"]").prop('checked', true);
													$("input[id=sumcheck"+b_p_code+"]").prop("checked", true);
													totalsum();
												}
												
												// 수량 변경 동작시..
												const url = "${contextPath}/basket/upd_basket";
												var paramData = {
									               "u_p_id"      : '${user.u_p_id}',
									               "b_num"      : sum,
									               "b_p_code"	 : b_p_code
									            }
												
												$.ajax({
												      url: url,
												      data:paramData,
												      dataType: 'json',
												      type: 'POST',
												      success:function(result){
												         console.log(result);
												         //alert("성공");
												      },
												      error:function(result,status,error){
												         console.log(result);
												         alert("에러가 발생했습니다");
												         alert("code:"+result.status+"\n"+"message:"+result.responseText+"\n"+"error:"+error);
												      }
												});
												
											}
											
											// + 버튼
											function addon(b_p_code){
											
												 var sum = document.getElementById("sum"+b_p_code).value;
												 var b_price = document.getElementById("prnum"+b_p_code).value;
												 
												 sum = parseInt(sum) + 1;
												 
												$("input[id=sum"+b_p_code+"]").attr('value', sum);
												$("input[id=sumcheck"+b_p_code+"]").attr('value', sum);
												$("input[id=val"+b_p_code+"]").attr('value', sum * b_price);
												$("input[id=ked"+b_p_code+"]").attr('value', sum * b_price);
												$("input[id=ked"+b_p_code+"]").prop("checked", true);
												$("input[id=sumcheck"+b_p_code+"]").prop("checked", true);
												totalsum();
												
												// 수량 변경 동작시..
												const url = "${contextPath}/basket/upd_basket";
												var paramData = {
									               "u_p_id"      : '${user.u_p_id}',
									               "b_num"      : sum,
									               "b_p_code"	 : b_p_code
									            }
												
												$.ajax({
												      url: url,
												      data:paramData,
												      dataType: 'json',
												      type: 'POST',
												      success:function(result){
												         console.log(result);
												         //alert("성공");
												      },
												      error:function(result,status,error){
												         console.log(result);
												         alert("에러가 발생했습니다");
												         alert("code:"+result.status+"\n"+"message:"+result.responseText+"\n"+"error:"+error);
												      }
												});
											}
											
											// 삭제 버튼
											function basketdel(b_p_code){
												location.href="del_basket?b_p_code=" + b_p_code;
											}
											
											// 장바구니 총 개수, 총 합
											function totalsum(b_p_code){
												
												// 전체 체크확인
												const Allcheck = document.querySelectorAll('input[name="ked"]');
												// 선택 체크박스
												const Onecheck = document.querySelectorAll('input[name="ked"]:checked');
												//const sumcheck = document.querySelectorAll('input[name="sumcheck"]:checked');
												// 전체 체크박스
												const checkbtn = document.querySelector('input[id="checkbtn"]');
												const checkCnt = Onecheck.length;
												
												// 총 갯수
											    var resultsum = "0";
											    var resultsum_t = "0";
											    
												if($("input[id=ked"+b_p_code+"]").is(":checked")){
													$("input[id=sumcheck"+b_p_code+"]").prop("checked", true);
												} else {
													$("input[id=sumcheck"+b_p_code+"]").prop("checked", false);
												}
											    
											 	// 체크된 것의 총 개수 계산 반복문
											 	const sumcheck = document.querySelectorAll('input[name="sumcheck"]:checked');
											    sumcheck.forEach((el) => {
											    	resultsum_t = parseInt(resultsum_t) + parseInt(el.value);
											    });
											    
												// 체크된 것의 총합 계산 반복문
												Onecheck.forEach((el) => {
											    	resultsum = parseInt(resultsum) + parseInt(el.value);
											    	// 아래꺼 넣으면 그냥 총 수량 나옴..
											    	//resultsum_t = parseInt(resultsum_t) + parseInt($(Onecheck).find(".test").val());
											    });
												
												// 모두 체크 클릭시 동작
												if(Allcheck.length === checkCnt)  {
													checkbtn.checked = true;
												  } else {
													checkbtn.checked = false;
												}
												//const result = 'input[name="ked"]:checked';
											    //const check = document.querySelectorAll(Onecheck);
											    //const checkCnt = Onecheck.length;
											    
											    // 총 개수 입력
											    $("input[id=nss]").attr('value', resultsum_t);
											    // 총 합 입력
											    $("input[id=anss]").attr('value', resultsum);
											}
											
											// 전체 체크박스
											function selectAll(All)  {
												  const checks = document.getElementsByName('ked');
												  const sumchecks = document.getElementsByName('sumcheck');
												  
												  var resultsum = "0";
												  var resultsum_t = "0";
												  // 숨겨진 총 개수 체크박스 모두활성화
												  sumchecks.forEach((check) => {
													    check.checked = All.checked
												  })
													// 체크박스의 값으로 총값 계산
												  checks.forEach((el) => {
												    	resultsum = parseInt(resultsum) + parseInt(el.value);
												  });
												  
												  const sumcheck = document.querySelectorAll('input[name="sumcheck"]:checked');
											    	// 체크된 총 개수 표시
											    	sumcheck.forEach((el) => {
											    		resultsum_t = parseInt(resultsum_t) + parseInt(el.value);
											    	});
												  
												  // 전체 체크 동작
												  checks.forEach((check) => {
												    check.checked = All.checked
												    if($('#checkbtn').is(':checked')){
												    	// 전체 체크 활성화(if), 비활성화시(else)
												    	const Onecheck = document.querySelectorAll('input[name="ked"]:checked');
												    	
												    	$("input[id=nss]").attr('value', resultsum_t);
												    	$("input[id=anss]").attr('value', resultsum);
												    } else {
												    	$("input[id=nss]").attr('value', "0");
												    	$("input[id=anss]").attr('value', "0");
												    }
												  })
											}
											
										</script>
									</table>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="shoping__cart__btns">
									<a href="${contextPath}/board_product/shop_list" class="primary-btn cart-btn" style="float:left;">쇼핑 계속하기</a> 
									<a href="${contextPath}/basket/sel_basket" class="primary-btn cart-btn cart-btn-right">
										<span class="icon_loading"></span> <font _mstmutation="1">장바구니 새로고침</font></a>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="shoping__continue">
								<!-- 
									<div class="shoping__discount">
										<h5>쿠폰코드</h5>
										<select id="nt" name="nt">
											<option value="1">무적용</option>
											<option value="2">5%할인</option>
											<option value="3">10%할인</option>
											<option value="4">15%할인</option>
											<option value="5">20%할인</option>
											<option value="6">25%할인</option>
										</select>
									</div>
									<div>
										<button type="button" id="btnto" name="btnto" onclick="ont()" class="site-btn">코드 적용</button>
										<br> <br> <a style="font-weight: bold;">쿠폰 적용할 상품</a>
										<div>
											<select>
												<c:forEach var="board" items="${blist}">
													<option>${board.b_product}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									 -->
								</div>
							</div>
							<div class="col-lg-6">
								<div class="shoping__checkout">
									<h5>총합계</h5>
									<ul>
										<li><span></span><font _mstmutation="1">소계 : <input
												type="text" id='nss' name='nss' style="border: none; color: red; font-weight: bold; text-align:center;"
												value="0" readonly></font>
										</li>
										<li><span></span><font _mstmutation="1">총값 : <input
												type="text" id='anss' name='anss' style="border: none; color: red; font-weight: bold; text-align:center;"
												value="0" readonly></font>
										</li>
									</ul>
									<a href="#" class="primary-btn">구매하기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</section>
	<!-- Product Section End -->

	<!-- Footer Section Begin -->
	<%@ include file="include/footertest.jsp"%>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<%@ include file="include/plug_in.jsp"%>


</body>
</html>