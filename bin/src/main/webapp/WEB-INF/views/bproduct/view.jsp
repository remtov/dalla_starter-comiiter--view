<!-- 코드를 길게 썻을경우 메시지가 안뜨는 문제 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
<style>
</style>
</head>

<body>



	<div class="view-container">
		<div class="container">
			<div class="row">
				<div class="col-md-2" style="background-color: #f6f6f6;">
					
				</div>

				<div class="col-md-10">

					<h3>경매 등록</h3>
					<p>입력과 수정이 동시에 가능합니다.</p>

					<img style="width: 100%;"
						src="/resources/img/product/${product.productImage}">

					<form id="iform" enctype="multipart/form-data" method="POST">

						<table class="table">
							<tbody>
								<tr>
									<td style="width: 30%;">제품번호:</td>
									<td style="width: 70%;">${product.productNumber}</td>

								</tr>
								<tr>
									<td>제품이름 :</td>
									<td><input required data-vc="2,30" class="form-control" type="text"
										name="productName" value="${product.productName}"></td>
								</tr>
								<tr>
									<td>제품분류 :</td>
									<td><input required class="form-control" type="text"
										name="productCategory" value="${product.productCategory}"></td>
								</tr>
								<tr>
									<td>제품코드 :</td>
									<td><input required data-vc="3,10" class="form-control" type="text"
										name="productCode" value="${product.productCode}"></td>
								</tr>
								<tr>
									<td>제품수량 :</td>
									<td><input required data-vc="1,1000" required class="form-control" type="text"
										name="productQuantity" value="${product.productQuantity}"></td>
								</tr>
								<tr>
									<td>제품시간 :</td>
									<td><input required class="form-control" type="text"
										name="productDate" value="${product.productDate}"></td>
								</tr>
								<tr>
									<td>제품상태 :</td>
									<td><input required data-vc="1,30" class="form-control" type="text"
										name="productCondition" value="${product.productCondition}"></td>
								</tr>
								<tr>
									<td>브랜드명 :</td>
									<td><input required data-vc="1,20" class="form-control" type="text"
										name="productBrand" value="${product.productBrand}"></td>
								</tr>
								<tr>
									<td>시작가격 :</td>
									<td><input required data-vc="1,1000000000" class="form-control" type="text"
										name="productLowestPrice"
										value="${product.productLowestPrice}"></td>
								</tr>
								<tr>
									<td>희망가격 :</td>
									<td><input required data-vc="1,1000000000" class="form-control" type="text"
										name="productHopefulPrice"
										value="${product.productHopefulPrice}"></td>
								</tr>
								<tr>
									<td>기타사항 :</td>
									<td><input required data-vc="1,300" class="form-control" type="text"
										name="productDesc" value="${product.productDesc}"></td>
								</tr>
								<tr>
									<td></td>
									<td><button class="btn btn-default btn-lg" type="button"
											onclick="update(${product.productNumber})">수정</button>
										<button class="btn btn-danger btn-lg" type="button"
											onclick="dele(${product.productNumber})">주의! 데이터가
											삭제됩니다.</button></td>
								</tr>
							</tbody>
						</table>
					</form>

				</div>

			</div>
		</div>

	</div>
	<%@ include file="/WEB-INF/views/bproduct/product-bottom.jspf"%>
	<script>
	function dele(dsa){
		$.ajax({
			url : '/BProductInfo/'+${product.productNumber},
			type : 'DELETE',
			success : function(){
				location.href = '/url/bproduct:list';
				alert('성공');
			}
		})
	}
	
		function update(){
		var form = document.querySelector('#iform');
		var formData = new FormData(form);
		if(valicheck() ){
			$.ajax({
				url : '/BProductInfo/'+${product.productNumber},
				contentType : false,//헤더 지우기
				processData : false,//쿼리스트링 형식으로 바꾸지 않기
				data : formData,
				type : 'POST',
				success : function(){
					location.href = '/url/bproduct:list';
					alert('성공');
				}
			});
			}
		}
		
	</script>

</body>
</html>