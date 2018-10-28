<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
div {
	/* border: 3px solid red; */
	
}
</style>
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
					<div class="row">
						<!-- 좌측메뉴 -->
						<div class="col-md-2" style="background-color: #f6f6f6;">
							<%@ include file="/WEB-INF/views/bproduct/product-left.jspf"%>
						</div>



						<!-- 우측컨텐츠 -->
						<div class="col-md-10" style="background-color: #f6f6f6;">


							<div class="col-md-6">
								<h3>경매 등록</h3>
								<p>팔고 싶은 물건이 있다면 이 곳에 올려 주세요.</p>
							</div>

							<!-- 상단광고 -->
							<div class="col-md-6">
								<img style="margin-top: 20px;" class="pull-right"
									src="http://www.koitt.com/data/file/right_banner/3547767421_JgukId0s_rb04.jpg">

							</div>

							<!-- 상단광고 -->



							
							<div style="max-width:700px;">
								<form id="myform" enctype="multipart/form-data" method="POST">

									<table class="table">

										<tr>
											<td style="width: 30%;">제품 명</td>
											<td style="width: 70%;"><input class="form-control"
												type="text" id="productName" name="productName"
												placeholder="제품명을 입력해 주세요" data-vc="2,30"></td>
										</tr>
										<tr>
											<td>제품 코드</td>
											<td><input class="form-control" type="text"
												id="productCode" name="productCode" placeholder="제품코드"
												data-vc="3,10"></td>
										</tr>
										<tr>
											<td>제품 수량</td>
											<td><input class="form-control" type="text"
												id="productQuantity" name="productQuantity"
												placeholder="판매 수량 (숫자)" data-vc="1,1000" required></td>
										</tr>
										<tr>
											<td>제품 최저가</td>
											<td><input class="form-control" type="text"
												id="productLowestPrice" name="productLowestPrice"
												placeholder="제품의 최저가" data-vc="1,1000000000"></td>
										</tr>
										<tr>
											<td>제품 희망가</td>
											<td><input class="form-control" type="text"
												id="productHopefulPrice" name="productHopefulPrice"
												placeholder="제품 희망가(즉시 구매가)" data-vc="1,1000000000"></td>
										</tr>
										<tr>
											<td>제품 설명</td>
											<td><input class="form-control" type="text"
												id="productDesc" name="productDesc" placeholder="제품의 설명"
												data-vc="1,300"></td>
										</tr>
										<tr>
											<td>제품 브랜드</td>
											<td><input class="form-control" type="text"
												id="productBrand" name="productBrand" placeholder="제품명의 브랜드"
												data-vc="1,20"></td>
										</tr>
										<tr>
											<td>제품 상태</td>
											<td><input class="form-control" type="text"
												id="productCondition" name="productCondition"
												placeholder="제품의 상태(자세히)" data-vc="1,30"></td>
										</tr>
										<tr>
											<td>제품 분류</td>
											<td><select id="productCategory" name="productCategory">
													<option value="austdalia">의류</option>
													<option value="canada">가전제품</option>
													<option value="usa">뭐가 있을까</option>
											</select></td>
										</tr>
										<tr>
											<td colspan="2">제품사진 선택</td>
										</tr>
										<tr>
											<td colspan="2"><input class="form-control" type="file"
												name="productImage"></td>
										</tr>

										<tr>
											<td colspan="2"><div
													style="width: 100%; overflow: auto;">
													<img style="width: 100%" src="" id="preview">
												</div></td>
										</tr>
										<tr>
											<td colspan="2"><input class="form-control" type="file"
												accept="image/*">(비활성화중)</td>
										</tr>
										<tr>
											<td colspan="2"><button class="form-control"
													type="button" name="ATProductInfo" onclick="insert()">업로드하기</button></td>
										</tr>
									</table>


								</form>
								<%@ include file="/WEB-INF/views/bproduct/product-bottom.jspf"%>
							</div>
							<div class="pull-right">

								<img src="http://www.koitt.com/img/m11_img01.png">
							</div>

						</div>


						<!-- 우측컨텐츠 -->
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


