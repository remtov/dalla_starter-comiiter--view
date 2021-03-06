<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<style>
div { /* border: 3px solid red; */
	
}

.caption p {
	color: gray;
}
</style>

<script src="/resources/js/AjaxUtil.js"></script>

<script>
	window
			.addEventListener(
					'load',
					function() {
						var au = new AjaxUtil(
								{
									url : '/BProductInfo',
									success : function(res) {
										res = JSON.parse(res);

										var plus = 0;
										var html = '';
										if (res.length % 4 != 0) {
											plus = 1;
										}

										for (var i = 0; i < (res.length / 4)
												+ plus; i++) {
											html = '<div class="row">';
											for (var j = 0; j < 4; j++) {
												if (j + (i * 4) == res.length) {
													break;
												}
												html += '<div class="col-sm-6 col-md-3">';

												html += '<div class="thumbnail">';

												html += '<img style="width:100%;" alt="/resources/img/icon-img.png" src="/resources/img/product/'
														+ res[j + (i * 4)].productImage
														+ '" onclick="goPage('
														+ res[j + (i * 4)].productNumber
														+ ')">';

												html += '<div class="caption">';

												html += '<h3>'
														+ res[j + (i * 4)].productName
														+ '</h3>';

												html += '<h4>시작가격 : '
														+ res[j + (i * 4)].productLowestPrice
														+ ' 원</h4>';
												html += '<h4>현재가격 : '
														+ res[j + (i * 4)].productHopefulPrice
														+ ' 원</h4>';

												html += '<p>제품브랜드 : '
														+ res[j + (i * 4)].productBrand
														+ ' | 제품수량 : '
														+ res[j + (i * 4)].productQuantity
														+ ' | 등록일 : '
														+ res[j + (i * 4)].productDate
														+ '</p>';

												html += '<div style="height:50px;overflow:hidden;">'
												html += '<p>'
														+ res[j + (i * 4)].productCondition
														+ '</p>';
												html += '</div>'

												html += '<div style="height:50px;overflow:hidden;">'
												html += '<p>'
														+ res[j + (i * 4)].productDesc
														+ '</p>';
												html += '</div>'

												html += '<p style="margin-top:10px;"><a href="#" class="btn btn-primary" role="button">입찰하기</a>';
												html += '<a style="margin-right:10px;" href="#" class="btn btn-default" role="button" onclick="goPage('
														+ res[j + (i * 4)].productNumber
														+ ')">더보기</a></p>';

												html += '</div></div></div>';
											}
											html += '</div>';
											document.querySelector(
													'#ATProductBody')
													.insertAdjacentHTML(
															'beforeend', html);
										}

									}
								});
						au.send();
					});
	/* 테이블바디형 로직 
	 html += '<td>'+ product.productNumber+'</td>';
	 html += '<td>'+ product.productName + '</td>';
	 html += '<td>'+ product.productCategory + '</td>';
	 html += '<td>'+ product.productLowestPrice + '</td>';
	 html += '<td>'+ product.productHopefulPrice + '</td>';
	 html += '<td>'+ product.productBrand + '</td>';
	 html += '<td>'+ product.productCondition + '</td>';
	 html += '</tr>'; */
</script>
</head>




<body>



	<c:set var="userid" value="${userLoginInfo.signupId}"></c:set>
	<c:choose>
		<c:when test="${userid=='관리자'||userid=='판매자'}">


			<!-- 관리자만보이는영역 -->
			<!-- 회색바탕 -->
			<div class="view-container">
				<!-- 컨텐츠컨테이너 -->
				<div class="container">
					<!-- 2분할 -->


					<h3>
						나의 달래 : 경매 보기 <small><a href="/url/SignUp:MyPage"
							style="color: gray;"><b>${sessionScope.userLoginInfo.signupName}</b>(${sessionScope.userLoginInfo.signupId})
								<span class="badge">${sessionScope.userLoginInfo.signupNum}</span>
						</a></small>
					</h3>


					<%@ include file="/WEB-INF/views/common/search-bar.jspf"%>

					<div style="width: 100%;">
						<hr>
						<h4>경매 물품정보 보기</h4>

						<div id="ATProductBody"></div>
					</div>
				</div>






			</div>

			<%@ include file="/WEB-INF/views/bproduct/product-bottom.jspf"%>







			<script>
				function goPage(num) {
					location.href = '/BProductInfo/' + num;
				}
			</script>


			<!-- 관리자만보이는영역 -->
		</c:when>
		<c:otherwise>

			<!-- 세션없는 사람에게 보이는 영역 -->
			<%@ include file="/WEB-INF/views/common/no-session.jspf"%>
			<!-- 세션없는 사람에게 보이는 영역 -->



		</c:otherwise>
	</c:choose>






</body>

</html>

















