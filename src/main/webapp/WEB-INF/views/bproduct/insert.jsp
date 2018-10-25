<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>판매자 페이지</title>

<script src="/resources/js/AjaxUtil.js"></script>
<script> 
window.addEventListener('load',function(){
		var au = new AjaxUtil( {
			url : '/BProductInfo',
			success : function(res){
				res = JSON.parse(res);
				var html = '';
				
			
					for(var product of res) {
						html += '<tr onclick="goPage('+product.productNumber+')">';
						html += '<td>'+ product.productNumber+'</td>';
						html += '<td>'+ product.productName + '</td>';
						html += '<td>'+ product.productCategory + '</td>';
						html += '<td>'+ product.productLowestPrice + '</td>';
						html += '<td>'+ product.productHopefulPrice + '</td>';
						html += '<td>'+ product.productBrand + '</td>';
						html += '<td>'+ product.productCondition + '</td>';
						html += '</tr>';
					}
					document.querySelector('#ATProductBody').insertAdjacentHTML('beforeend',html);
			}
		});
		au.send();
	});

</script>

</head>

<body>
	<div class="product-container">


		<c:set var="userid" value="${userLoginInfo.signupId}"></c:set>
		<c:choose>
			<c:when test="${userid=='판매자'}">
				<div class="container">
					<!-- 상단광고 -->
					<div class="pull-right">
						<img
							src="http://www.koitt.com/data/file/right_banner/3547767421_JgukId0s_rb04.jpg">
					</div>
					<!-- 상단광고 -->
					<!-- 상단탭 -->
					<h2 style="clear: both">
						판매자 <small>| 나의 Dallae Auction</small>
					</h2>
					<ul class="nav nav-tabs">
						<li role="presentation" class="active"><a href="#">메뉴</a></li>
						<li role="presentation"><a href="#">메시지</a></li>
						<li role="presentation"><a href="#">계정</a></li>
					</ul>
					<!-- 상단탭 -->

					<!-- 오른쪽링크 -->
					<span class="admin-right_link-span"><a href="#">고객센터</a> | <a
						href="#">도움말</a> |<a href="#">${userLoginInfo.signupName}(15)</a></span>
					<!-- 오른쪽링크 -->




					<!-- 컨테이너 -->
					<div class="row">
						<div class="col-md-2">




							<div class="btn-group-vertical" role="group" aria-label="...">

								<button id="admin-left_button-active" type="button"
									class="btn btn-default btn-lg btn-block">경매관리</button>

								<button type="button" class="btn btn-default btn-lg btn-block">경매등록</button>
								<button type="button" class="btn btn-default btn-lg btn-block">test1</button>
								<button type="button" class="btn btn-default btn-lg btn-block">test2</button>
								<button type="button" class="btn btn-default btn-lg btn-block">test3</button>


								<div class="btn-group" role="group">
									<button type="button"
										class="btn btn-default btn-lg btn-block dropdown-toggle"
										data-toggle="dropdown" aria-expanded="false">
										dropdown-test-1 <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu">
										<li><a href="#">test1</a></li>
										<li><a href="#">test2</a></li>
										<li><a href="#">test3</a></li>



									</ul>
								</div>
							</div>
							<!-- 공지사항팝업영역 -->
							<h4>
								<strong>공지사항</strong>
							</h4>
							<a data-toggle="modal" data-target="#myModal">공지사항 보기</a>
							<!-- Modal -->
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
								aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<h4 class="modal-title" id="myModalLabel">Dallae 판매팀 최신
												공지</h4>
										</div>
										<div class="modal-body">
											<p>2018 년 10 월 9 일 12:31:34 PM</p>

											<p>Summer Seller 업데이트에 발표 된 바와 같이 , 우리는 최근 markdown sale
												이벤트를 만들기 전에 판매자가 동일한 가격으로 14 일 동안 항목을 나열하도록 요구하는 변경 작업을
												수행했습니다. 이 정책은 가격 인하 기능을 악용하는 일부 판매자로부터 고객이 겪고있는 부정적인 경험을 줄이기
												위해 제정되었습니다. 이것이 판매자 커뮤니티 전체를 대표하지 않는다는 것을 알고 있습니다. 우리는 귀하의
												의견을 듣고 그리고 우리는 집행 기관이 고객에게 가치를 제공하는 판매자를위한 도전이었다 알고 있습니다. 즉시
												시작하여 상장 직후에 다시 markdown 이벤트를 작성할 수 있습니다. 우리가 휴일로 이사 할 때, 우리의
												가장 큰 우선 순위는 쉽고 성공적인 판매 시즌을 보장하는 것입니다. 우리는 2019 년에이 기능의 변경이
												필요한지 계속 평가할 것입니다. 항상 그렇듯이 Dallae에서 판매 해 주셔서 감사합니다. 달래
												(Dallae) 팀</p>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">닫기</button>
											<button type="button" class="btn btn-primary">공지사항
												페이지로</button>
										</div>
									</div>
								</div>
							</div>

							<!-- 공지사항팝업영역 -->

							<div class="admin-left_ad">
								<img
									src="https://creative.mathads.com/0001/78/d9/a7/df/53a237f3c1e60b88c5596641ba181524.jpg">
							</div>



							<div class="admin-left_download">
								<button class="btn btn-default btn-lg btn-block">
									<img src="/img/logo.png"> &nbsp;앱 다운로드
								</button>

							</div>








						</div>

						<!-- 사이드메뉴 -->





						<div class="col-md-10">

							<!-- 검색창영역 -->
							<h3>
								경매관리 <small>원하시는 경매정보를 검색하시고 클릭하여 편집하세요.</small>
							</h3>
							<hr>

							<div class="admi-main_search-line">


								<div class="col-md-3">
									<select class="form-control input" id="serch">
										<option value="productNumber">선택하세요</option>
										<option value="productNumber">제품 번호</option>
										<option value="productName">제품명</option>
										<option value="productCategory">제품 분류</option>
										<option value="productLowestPrice">제품 최저가</option>
										<option value="productHopefulPrice">제품 희망가</option>
										<option value="productBrand">제품 브랜드</option>
										<option value="productCondition">제품 상태</option>

									</select>
								</div>

								<div class="col-md-7">
									<input class="form-control input" type="text" id="serchEx">
								</div>


								<div class="col-md-2">
									<button class="btn btn-default btn btn-block" type="button"
										onclick="search()">검색</button>
								</div>
							</div>

							<!-- 검색창영역 -->
							&nbsp;


							<div class="admin-right_table-member">

								<h3>제품 등록 란</h3>

								<h1 class="page-header">제품 수정</h1>
								<h2 class="sub-header">바로 입력하고 수정하면됨</h2>

								<form id="myform" enctype="multipart/form-data" method="POST">
									<table border="1" class="table table-hover">

										<tr>
											<td align="center">제품 명</td>
											<td align="center"><input type="text" id="productName"
												name="productName" placeholder="제품명을 입력해 주세요" data-vc="2,30"></td>
										</tr>
										<tr>
											<td align="center">제품 코드</td>
											<td align="center"><input type="text" id="productCode"
												name="productCode" placeholder="제품코드" data-vc="3,10"></td>
										</tr>
										<tr>
											<td align="center">제품 수량</td>
											<td align="center"><input type="text"
												id="productQuantity" name="productQuantity"
												placeholder="판매 수량 (숫자)" data-vc="1,1000" required></td>
										</tr>
										<tr>
											<td align="center">제품 최저가</td>
											<td align="center"><input type="text"
												id="productLowestPrice" name="productLowestPrice"
												placeholder="제품의 최저가" data-vc="1,1000000000"></td>
										</tr>
										<tr>
											<td align="center">제품 희망가</td>
											<td align="center"><input type="text"
												id="productHopefulPrice" name="productHopefulPrice"
												placeholder="제품 희망가(즉시 구매가)" data-vc="1,1000000000"></td>
										</tr>
										<tr>
											<td align="center">제품 설명</td>
											<td align="center"><input type="text" id="productDesc"
												name="productDesc" placeholder="제품의 설명" data-vc="1,300"></td>
										</tr>
										<tr>
											<td align="center">제품 브랜드</td>
											<td align="center"><input type="text" id="productBrand"
												name="productBrand" placeholder="제품명의 브랜드" data-vc="1,20"></td>
										</tr>
										<tr>
											<td align="center">제품 상태</td>
											<td align="center"><input type="text"
												id="productCondition" name="productCondition"
												placeholder="제품의 상태(자세히)" data-vc="1,30"></td>
										</tr>
										<tr>
											<td align="center">제품 분류</td>
											<td align="center"><select id="productCategory"
												name="productCategory">
													<option value="austdalia">의류</option>
													<option value="canada">가전제품</option>
													<option value="usa">뭐가 있을까</option>
											</select></td>
										</tr>
										<tr>
											<td colspan="2" align="center">제품사진 선택</td>
										</tr>
										<tr>
											<td colspan="2"><input type="file" name="productImage"></td>
										</tr>
										<tr>
											<td colspan="2" align="center"><button type="button"
													name="ATProductInfo" onclick="insert()">업로드하기</button></td>
										</tr>
										<tr>
									</table>

									<img src="" id="preview"> <input type="file"
										accept="image/*">

								</form>
							</div>
							<hr>


							<div class="admin-main_grid-div--h400">인포1</div>

							<div class="admin-main_grid-div--h300">인포2</div>

							<div class="pull-right">

								<img src="http://www.koitt.com/img/m11_img01.png">
							</div>



						</div>







					</div>
				</div>


				<script>
 
				var fileInput = document.querySelector('input[type="file"]');
				var preview = document.getElementById('preview');

				fileInput.addEventListener('change', function(e) {
					var url = URL.createObjectURL(e.target.files[0]);
					preview.setAttribute('src', url);
				});
				function imgvali() {
					var img = document.querySelector('input[type="file"]');

					img = img.value.substring(img.value.lastIndexOf('.') + 1);
					if (img.toUpperCase() != 'JPG' && img.toUpperCase() != 'PNG') {
						alert("jpg 나 png파일을 넣어주세요");
						return false;
					}
					return true;
				}

				function insert() {
					var form = document.querySelector('#myform');
					var formData = new FormData(form);

					if (valicheck()) {
						if (imgvali()) {

							$.ajax({
								url : '/BProductInfo',
								contentType : false,//헤더 지우기
								processData : false,//쿼리스트링 형식으로 바꾸지 않기
								data : formData,
								type : 'POST',
								success : function() {
									location.href = '/url/bproduct:list';
									alert('성공');
								}
							});
						}
					}
				}
 
</script>
				<!-- 세션없는 사람에게 보이는 영역 -->
			</c:when>



			<c:otherwise>


				<div class="find-container">
					<div id="session-less">

						<img src="/img/icon_login.png">

						<h3>
							<a href="/url/SignUp:login">판매자 ID로 <b>로그인</b></a> 부탁드립니다. <small><a
								href="/">| <b>홈으로</b></a> <a href="/">| <b>판매자 인증 받으러 가기</b></a></small>
						</h3>
						<p>
							권한 에러 : 페이지에 대한 <b>권한</b>이 없으십니다.
						</p>

					</div>
				</div>


			</c:otherwise>

		</c:choose>
		<!-- 세션없는 사람에게 보이는 영역 -->
	</div>
</body>
</html>



