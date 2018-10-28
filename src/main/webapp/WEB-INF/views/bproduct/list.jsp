<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<style>
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
	<div class="view-container">
		<div class="container">
			<div class="row">
				<div class="col-md-2" style="background-color: #f6f6f6;">

					<%@ include file="/WEB-INF/views/bproduct/product-left.jspf"%>


				</div>

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
		</div>
	</div>



	<script>
	function goPage(num){
		location.href='/BProductInfo/'+num;
	}
	</script>

</body>
</html>