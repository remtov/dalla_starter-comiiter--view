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
						
						html += '<div class="col-sm-6 col-md-3">';
						html += '<div class="thumbnail">';
						html += '<img style="width:100%;" alt="/img/icon-img.png" src="/resources/img/product/'+product.productImage+'" onclick="goPage('+product.productNumber+')">';
						html += '<div class="caption">';
															
						html += '<h3>'+product.productName+'</h3>';
						html += '<p>'+product.productDesc+'</p>';
						html += '<p>시작가격:'+product.productLowestPrice+'</p>';
						html += '<p>현재가격:'+product.productHopefulPrice+'</p>';
						html += '<p><a href="#" class="btn btn-primary" role="button">Button</a></p>';
						html += '</div></div></div>';
						
			
						
						/* html += '<td>'+ product.productNumber+'</td>';
						html += '<td>'+ product.productName + '</td>';
						html += '<td>'+ product.productCategory + '</td>';
						html += '<td>'+ product.productLowestPrice + '</td>';
						html += '<td>'+ product.productHopefulPrice + '</td>';
						html += '<td>'+ product.productBrand + '</td>';
						html += '<td>'+ product.productCondition + '</td>';
						html += '</tr>'; */
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

					<div class="row">
						
						<div id="ATProductBody"></div>
					</div>
				</div>
			</div>


			<%@ include file="/WEB-INF/views/bproduct/product-bottom.jspf"%>







			<script>
 

			
			function goPage(num){
				location.href='/BProductInfo/'+num;
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

















