<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 입력</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
		  
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<link href="/css/add_weather_history.css" rel="stylesheet" type="text/css" />
		

</head>
<body>
	<div class="container">
		<div class="content d-flex">
			<menu class="menu bg-primary col-2">
				<div class="d-flex justify-content-center">
					<img class="mt-3" src="/image/정부로고.png" alt="로고" width="25px" height="25px">
					<h5 class="mt-3 ml-2 text-white font-weight-bold">기상청</h5>
				</div>
				<nav class="mt-4">
					<ul class="nav flex-column">
						<h5><li class="nav-item"><a href="/lesson05/weather_history" class="nav-link font-weight-bold text-white">날씨</a></li></h5>
						<h5><li class="nav-item"><a href="/lesson05/add_weather_view" class="nav-link font-weight-bold text-white">날씨입력</a></li></h5>
						<h5><li class="nav-item"><a href="#" class="nav-link font-weight-bold text-white">테마날씨</a></li></h5>
						<h5><li class="nav-item"><a href="#" class="nav-link font-weight-bold text-white">관측기후</a></li></h5>
					</ul>
				</nav>
			</menu>
			<section class="main mt-4 ml-3 col-10">
				<h3>날씨 입력</h3>
				<form method="post" action="/lesson05/add_weather">
					<div class="mt-5">
						<div class="d-flex align-items-center justify-content-between ml-5">
							<div class="input-group d-flex align-items-center col-5">
								<span>날짜</span>
								<input type="text" name="date" id="date" class="form-control ml-2">
							</div>
							<div class="input-group d-flex align-items-center col-3">
								<span>날씨</span>
								<select name="weather" class="form-control ml-2">
									<option>맑음</option>
									<option>구름조금</option>
									<option>흐림</option>
									<option>비</option>
								</select>
							</div>
							<div class="input-group d-flex align-items-center col-3">
								<span>미세먼지</span>
								<select name="microDust" class="form-control ml-2">
									<option value="좋음">좋음</option>
									<option value="보통">보통</option>
									<option value="나쁨">나쁨</option>
									<option value="최악">최악</option>
								</select>
							</div>
						</div>
						<div class="d-flex align-items-center justify-content-between ml-5 mt-5">
							<div class="input-group d-flex align-items-center col-4">
								기온
								<input type="text" name="temperatures" class="form-control ml-2">
								<div class="input-group-append">
								    <span class="input-group-text">℃</span>
								</div>
							</div>
							<div class="input-group d-flex align-items-center col-4">
								강수량
								<input type="text"  name="precipitation" class="form-control ml-2">
								<div class="input-group-append">
								    <span class="input-group-text">mm</span>
								</div>
							</div>
							<div class="input-group d-flex align-items-center col-4">
								풍속
								<input type="text" name="windSpeed" class="form-control ml-2">
								<div class="input-group-append">
								    <span class="input-group-text">km/h</span>
								</div>
							</div>
						</div>
					</div>
					<div class="d-flex justify-content-end mt-4 mr-3">
						<input type="submit" class="btn btn-success" value="저장">
					</div>
				</form>
			</section>
		</div>
		<hr>
		<footer class="footer d-flex">
			<div class="footer-logo">
				<img src="/image/기상청 로고.jpg" alt="로고" width="200px";>
			</div>
			<div class="mt-3">
				<span class="text-secondary">(07062) 서울시 동작구 여의대방로16길 61</span><br>
				<span class="text-secondary">Copyright@2020 KMA. All Rights RESERVED.</span>
			</div>
		</footer>		
	</div>
	
<script type="text/javascript">
	$(document).ready(function() {
	       $.datepicker.setDefaults({
	           dayNamesMin: ['일', '월', '화', '수', '목', '금', '토']
	            , dateFormat: 'yy-mm-dd'
	        });
	
	        $.datepicker._gotoToday = function(id) {
	            $(id).datepicker('setDate', new Date()).datepicker('hide').blur();
	        };
	
	        $('#date').datepicker({
	            showButtonPanel: true 
	            , changeYear: true
	            , changeMonth: true
	        });
	    });
	</script>
</body>
</html>