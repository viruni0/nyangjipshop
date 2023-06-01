<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="false"%>
<!DOCTYPE html>

<html lang="zxx">

<%@ include file="include/head.jsp"%>

<script>
	$(function() {
		$(document).ready(function() {
			setTotalInfo();
			
			var c=$(".sum").length;
			cnt.value=c-1;
			

		})
		 $("#setselect").change(function() {
         var set=$("#setselect option:selected").val();
         if(setselect.value=="직접 입력"){
            equl.style="none";
            equl.style="resize:none";
         }else{
            equl.style="display:none";
         }
         
         
         
         
      })
	})

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

	function setTotalInfo() {
		alert("이거?");
		var total = 0; //값
		var totalval = 0; //수량
		var kingval = 0;
		var title = $("#product").val();
		$(".pay-box").each(function(index, element) {

			total += parseInt($(element).find("#price").val());
			totalval += parseInt($(element).find("#num").val());

		});
		alert(total);
		$("#sum").val(total);
		$("#kingnum").val(totalval);
		$("#title").val(title);

	}
	
	
	
	
</script>

<body>
	<!-- Header Section Begin -->
	<%@ include file="include/header.jsp"%>>
	<!-- Header Section End -->

	<!-- Hero Section Begin -->
	<%@ include file="include/hero.jsp"%>
	<!-- Breadcrumb Section End -->


	<!-- Product Section Begin -->
	<section class="product spad">
		<a
			style="font-weight: bold; font-size: 200%; float: left; margin-left: 45%">개인장바구니</a>
		<form role="form" method="get">
			<div class="container">

				<div class="filter__item product__discount__title"
					style="height: 600px;">
					<p id="date"></p>
					<a style="font-weight: bold; font-size: 45px; margin-left: 40%">주문결제창</a>
					<div class="form-buy"
						style="background-color: white; border: 1px solid #000000;">
						<table style="width: 100%">
							<c:forEach var="board" items="${bt}">
								<tr>
									<td class="pay-box"><input type="text" id="product"
										name="product" class="latest-product__item__pic"
										value="${board.b_product}"
										style="border: none; border-bottom: 1px silver black; float: left; width: 28%"
										disabled="disabled"> <input type="text" id="price"
										name="price" value="${board.b_price}" class="sum"
										style="border: none; margin-left: 15%; width: 10%"
										disabled="disabled"> <input type="text" id="num"
										name="num" value="${board.b_num}" class="num"
										style="border: none; margin-left: 10%; width: 5%; text-align: center;"
										disabled="disabled"> <a style="margin-right: 10%">개</a>
									</td>

								</tr>
							</c:forEach>
						</table>
					</div>
					<div
						style="width: 100%; background-color: white; height: 50px; float: left; border: 1px solid #000000;">
						<input type="text" id="title" name="title"
							style="float: left; width: 25%; border: none" disabled="disabled">
						<a>외<input type="text" id="cnt" name="cnt" style="border:none;text-align:center;width:4%  " disabled="disabled">개</a>
						<a style="float: right">원</a><input type="text" id="a"
							name="a" style="border: none; " disabled="disabled"> <input
							type="text" id="sum" name="sum"
							style="float: right; width: 9%; border: none; text-align: center;"
							disabled="disabled"><a style="float:right;">총</a><a
							style="float: right; margin-right: 20%">개</a> <input type="text"
							id="kingnum" name="kingnum"
							style="width: 5%; float: right;; text-align: center; border: none"
							disabled="disabled">
							<a style="float:right">합량</a>
					</div>
					<div
						style="background-color: white; margin-top: 10%; border: 1px solid #000000;">
						<a style="font-weight: bold; font-size: 25px">결제방식</a> <br> <br>
						
						
						
						<input type="radio" id='buy' name='buy' checked="checked">가상계좌
						<input type="radio" id='buy' name='buy'>무통장입금 <br><br>
						<div style="float:left;">
							<select id="sel">
								<option value=1>우리은행</option>
								<option value=2>기업은행</option>
								<option value=3>KB은행</option>
								<option value=4>하나은행</option>
								<option value=5>농협은행</option>
							</select>
						</div>
						<div style="float:left; margin-left: 10%">
							<select id='setselect' name='setselect'>
								<option value="배송시 요청사항을 선택해주세요.">배송시 요청사항을 선택해주세요.</option>
								<option value="직접 수령하겠습니다.">직접 수령하겠습니다.</option>
								<option value="배송 전 연락바랍니다.">배송 전 연락바랍니다.</option>
								<option value="부재 시 경비실에 맡겨주세요.">부재 시 경비실에 맡겨주세요.</option>
								<option value="부재 시 문 앞에 놓아주세요.">부재 시 문 앞에 놓아주세요.</option>
								<option value="부재 시 택배함에 넣어주세요.">부재 시 택배함에 넣어주세요.</option>
								<option value="직접 입력">직접 입력.</option>
							</select>
						</div><textarea id='equl' name='equl' rows="3" cols="40"
							style="display: none; resize: none;"></textarea>
						<br><br>
					</div>
					<br> <br>
					
				</div>



			</div>
			<div>
				<a href="${contextPath}/pay/pay_result?sval=a?"
					style="font-size: 25px; margin-left: 40%; color: black;">
					<button type="button">결제하기</button>
				</a> <a href="${contextPath}/basket/sel_basket"
					style="font-size: 25px; color: black;">
					<button type="button">취소하기</button>
				</a>
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