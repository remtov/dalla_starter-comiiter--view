
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Login</title>

<style>
h1 {
	margin-top: 50px;
}

.row>p {
	margin-bottom: 100px;
}
</style>

</head>
<body>



	<div class="find-container">
		<div class="container" id="find_container--800">

			<c:choose>
				<c:when test="${not empty sessionScope.userLoginInfo}">
					<!-- 로그인된상태인 사람이 이 페이지를 열었을때 보여지는 영역-->
					<head>
<style>
h1 {
	margin-top: 150px;
}
</style>
					</head>


					<body>
						<div class="row">

							<h1>
								"<b>${sessionScope.userLoginInfo.signupId}</b>"님 반갑습니다.
							</h1>
							<p>
								로그인 된 상태입니다. (이메일 : " <b><c:out
										value="${sessionScope.userLoginInfo.signupEmail}" /></b>") <a
									onclick="history.back()">뒤로가기</a>
							</p>
							<div class="col-md-4">
								<button class="btn btn-default btn-lg btn-block" type="button"
									onclick="logout()">로그아웃</button>
							</div>
							<div class="col-md-4">
								<button class="btn btn-default btn-lg btn-block" type="button"
									onclick="location.href='/url/SignUp:MyPage'">마이페이지</button>
							</div>
							<div class="col-md-4">
								<button class="btn btn-primary btn-lg btn-block" type="button"
									onclick="location.href='#'">판매자 인증하러 가기</button>
							</div>




						</div>

					</body>
					<!-- 로그인된상태인 사람이 이 페이지를 열었을때 보여지는 영역-->
				</c:when>
				<c:otherwise>





					<div>
						<h1>로그인</h1>
						<p>
							아직 가입하지 않으셨습니까? <a onclick="signUp()">회원가입</a>
						</p>

						<p style="color:red;">
							테스트1 - 아이디:관리자,비밀번호:123 _ 로그인하여 관리자 테스트를 할 수 있습니다.<br> 테스트2
							- 아이디:판매자,비밀번호:123 _ 로그인하여 판매자 테스트를 할 수 있습니다.
						</p>
					</div>
					<form id="login" class="form-horizontal">
						<div class="form-group">
							<label for="signupId" class="col-sm-2 control-label">아이디</label>
							<div class="col-sm-10">
								<input type="text" onkeypress="enter(event)" id="signupId"
									data-vali="2" class="form-control" placeholder="아이디를 입력하세요.">
							</div>
						</div>


						<div class="form-group">
							<label for="signupPassword" class="col-sm-2 control-label">비밀번호</label>

							<div class="col-sm-10">
								<input class="form-control" onkeypress="enter(event)"
									type="password" id="signupPassword" data-vali="2"
									placeholder="비밀번호를 입력하세요.">
							</div>
						</div>

						<div class="form-group" id="find-pass_quiz--2">
							<div class="col-sm-offset-2 col-sm-10">
								<p>
									아이디를 잊어버리셨습니까? <a onclick="loosingId()">아이디찾기</a>
								</p>
							</div>
							<div class="col-sm-offset-2 col-sm-10">
								<p>
									비밀번호를 잊어버리셨습니까? <a onclick="forgetPass()">비밀번호 찾기</a>
								</p>
							</div>

						</div>



						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="button" class="btn btn-default btn-lg btn-block"
									onclick="loging()">로그인</button>

							</div>
						</div>
					</form>
				</c:otherwise>
			</c:choose>



		</div>

	</div>


	<script>
		function enter(ent) {
			var code = ent.which ? ent.which : event.keyCode;
			if (code == 13) {
				loging()
			}
		}
		function loging() {
			var signupId = document.querySelector('#signupId').value
			var signupPassword = document.querySelector('#signupPassword').value
			if (signupId != '' && signupPassword != '') {
				var params = {
					signupId : signupId,
					signupPassword : signupPassword
				};
				params = JSON.stringify(params);

				var conf = {
					url : '/dologin',
					method : 'post',
					param : params,
					success : function(res) {
						if (res != '') {
							alert('로그인이 완료되셨습니다.');
							location.href = "/";
						} else {
							logout();
							location.href = "/url/SignUp:login";
							alert('로그인에 실패하였습니다.');

						}
						;
					}
				}
				var au = new AjaxUtil(conf);
				au.send();
			} else {
				alert('아이디와 비밀번호를 입력하세요');
				logout();
			}
		}
		function loosingId() {
			location.href = "/url/SignUp:find"
		}
		function signUp() {
			location.href = "/url/SignUp:SignUp"
		}
		function forgetPass() {
			location.href = "/url/SignUp:FindPass"
		}
	</script>
</body>
</html>




