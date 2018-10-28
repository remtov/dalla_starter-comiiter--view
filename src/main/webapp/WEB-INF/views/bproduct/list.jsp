<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
div { /* border: 3px solid red; */
	
}
</style>

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
						<div class="col-md-10">
							<table class="table">
								<thead>
									<tr>
										<th>제품 번호</th>
										<th>제품 명</th>
										<th>제품 분류</th>
										<th>제품 최저가</th>
										<th>제품 희망가</th>
										<th>제품 브랜드</th>
										<th>제품 상태</th>
									</tr>
								</thead>
								<tbody id="ATProductBody">

								</tbody>
							</table>

						</div>
					</div>
					<%@ include file="/WEB-INF/views/bproduct/product-bottom.jspf"%>



					<div class="col-md-6">
						<h3>경매 목록</h3>
						<p>이곳에서 경매 목록을 관리하세요.</p>
					</div>

					<!-- 상단광고 -->
					<div class="col-md-6">
						<img style="margin-top: 20px;" class="pull-right"
							src="http://www.koitt.com/data/file/right_banner/3547767421_JgukId0s_rb04.jpg">

					</div>

					<!-- 상단광고 -->




					<div style="max-width: 700px;">

						<%@ include file="/WEB-INF/views/bproduct/product-bottom.jspf"%>
					</div>
					<div class="pull-right">

						<img src="http://www.koitt.com/img/m11_img01.png">
					</div>

				</div>


				<!-- 우측컨텐츠 -->
			</div>


		

			<script>
 

			
			function goPage(num){
				location.href='/BProductInfo/'+num;
			}
			 
 
 
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