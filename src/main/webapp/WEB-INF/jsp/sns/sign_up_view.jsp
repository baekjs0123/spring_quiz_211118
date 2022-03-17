<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jasongram-회원가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/css/sns.css">
</head>
<body>
	<div id="wrap">
		<header>
			<h1>Jasongram</h1>
		</header>
		<section class="contents">
			<h2 class="mt-3 font-weight-bold">회원가입</h2>
			<div class="sign-up-box">
				<div class="pl-3 pt-3">
					<span>ID</span>
					<div class="d-flex">
						<input type="text" id="userId" class="form-control col-9">
						<button type="button" id="checkDuplicateBtn" class="btn btn-info ml-3">중복확인</button>
					</div>
					<div>
						<small class="text-danger d-none">사용중인 아이디입니다.</small>
					</div>
					<div>
						<small class="text-success d-none">사용가능한 아이디입니다.</small>
					</div>
				</div>	
				<div class="pl-3 pt-3">
					<span>password</span>
					<input type="password" id="password" class="form-control col-9">
				</div>	
				<div class="pl-3 pt-3">
					<span>confirm password</span>
					<input type="password" id="password" class="form-control col-9">
				</div>	
				<div class="pl-3 pt-3">
					<span>이름</span>
					<input type="text" id="name" class="form-control col-9" placeholder="이름을 입력해주세요.">
				</div>	
				<div class="pl-3 pt-3">
					<span>이메일</span>
					<input type="text" id="email" class="form-control col-9" placeholder="이메일을 입력해주세요.">
				</div>	
				<div class="d-flex justify-content-center pt-3">
					<button type="button" id="signUpBtn" class="btn btn-info">가입하기</button>
				</div>	
			</div>
		</section>
	</div>
<script>
$(document).ready(function() {
	$('#checkDuplicateBtn').on('click', function() {
		alert("중복확인 버튼");
	});
	$('#signUpBtn').on('click', function() {
		alert("가입하기 버튼");
	});
});
</script>
</body>
</html>