<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

			<!-- 관리자, 판매자만 보이는 영역 -->

			<!-- 회색바탕 -->
			<div class="view-container">
				<!-- 컨텐츠컨테이너 -->
				<div class="container">
					<!-- 2분할 -->

					<!-- 좌측메뉴 -->



					<!-- 우측컨텐츠 -->

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


					<div class="row">
						<div class="col-sm-6 col-md-3">
							<div class="thumbnail">
								<img src="/img/new01.jpg" alt="...">
								<div class="caption">
									<h3>Thumbnail label</h3>
									<p>adsf sadfasdfa dfasdf asd fasdfasdf asdf asdfasdf sdfas
										d.</p>
									<p>
										<a href="#" class="btn btn-primary" role="button">Button</a> <a
											href="#" class="btn btn-default" role="button">Button</a>
									</p>
								</div>
							</div>
						</div>

						<div class="col-sm-6 col-md-3">
							<div class="thumbnail">
								<img src="/img/new02.jpg" alt="...">
								<div class="caption">
									<h3>Thumbnail label</h3>
									<p>..asdfasdf asdf sdfadsdf asdfa sdf asdf asdfasdf asdfs
										df.</p>
									<p>
										<a href="#" class="btn btn-primary" role="button">Button</a> <a
											href="#" class="btn btn-default" role="button">Button</a>
									</p>
								</div>
							</div>
						</div>

						<div class="col-sm-6 col-md-3">
							<div class="thumbnail">
								<img src="/img/new03.jpg" alt="...">
								<div class="caption">
									<h3>Thumbnail label</h3>
									<p>..asdfasdfasdfa sdfasdf asdfasdfa sdfasf asdfasd f.</p>
									<p>
										<a href="#" class="btn btn-primary" role="button">Button</a> <a
											href="#" class="btn btn-default" role="button">Button</a>
									</p>
								</div>
							</div>
						</div>

						<div class="col-sm-6 col-md-3">
							<div class="thumbnail">
								<img src="/img/new04.jpg" alt="...">
								<div class="caption">
									<h3>Thumbanail label</h3>
									<p>.sdfasdfa sdfsd fasdfasdfasdfasdf asdfsdaf adsf asd
										fasdfasdf asd fa sdfas..</p>
									<p>
										<a href="#" class="btn btn-primary" role="button">Button</a> <a
											href="#" class="btn btn-default" role="button">Button</a>
									</p>
								</div>
							</div>
						</div>



					</div>


					<div class="row">
						<div class="col-sm-6 col-md-3">
							<div class="thumbnail">
								<img src="/img/new05.jpg" alt="...">
								<div class="caption">
									<h3>Thumbnail label</h3>
									<p>adsf sadfasdfa dfasdf asd fasdfasdf asdf asdfasdf sdfas
										d.</p>
									<p>
										<a href="#" class="btn btn-primary" role="button">Button</a> <a
											href="#" class="btn btn-default" role="button">Button</a>
									</p>
								</div>
							</div>
						</div>

						<div class="col-sm-6 col-md-3">
							<div class="thumbnail">
								<img src="/img/new06.jpg" alt="...">
								<div class="caption">
									<h3>Thumbnail label</h3>
									<p>..asdfasdf asdf sdfadsdf asdfa sdf asdf asdfasdf asdfs
										df.</p>
									<p>
										<a href="#" class="btn btn-primary" role="button">Button</a> <a
											href="#" class="btn btn-default" role="button">Button</a>
									</p>
								</div>
							</div>
						</div>

						<div class="col-sm-6 col-md-3">
							<div class="thumbnail">
								<img src="/img/new07.jpg" alt="...">
								<div class="caption">
									<h3>Thumbnail label</h3>
									<p>..asdfasdfasdfa sdfasdf asdfasdfa sdfasf asdfasd f.</p>
									<p>
										<a href="#" class="btn btn-primary" role="button">Button</a> <a
											href="#" class="btn btn-default" role="button">Button</a>
									</p>
								</div>
							</div>
						</div>

						<div class="col-sm-6 col-md-3">
							<div class="thumbnail">
								<img src="/img/new08.jpg" alt="...">
								<div class="caption">
									<h3>Thumbanail label</h3>
									<p>.sdfasdfa sdfsd fasdfasdfasdfasdf asdfsdaf adsf asd
										fasdfasdf asd fa sdfas..</p>
									<p>
										<a href="#" class="btn btn-primary" role="button">Button</a> <a
											href="#" class="btn btn-default" role="button">Button</a>
									</p>
								</div>
							</div>
						</div>



					</div>


				</div>
			</div>




			<%@ include file="/WEB-INF/views/bproduct/product-bottom.jspf"%>







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

















