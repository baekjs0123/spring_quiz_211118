<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 정보</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link href="/css/weather_style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="wrap">
		<div class="contents d-flex">
			<menu class="menu bg-primary col-2">
				<div class="d-flex justify-content-center">
					<img class="mt-3" src="/image/정부로고.png" alt="로고" width="25px" height="25px">
					<h5 class="mt-3 ml-2 text-white font-weight-bold">기상청</h5>
				</div>
				<nav>
					<ul class="nav flex-column mt-4">
						<h5><li class="nav-item"><a href="/lesson05/weather_history" class="nav-link font-weight-bold text-white">날씨</a></li></h5>
						<h5><li class="nav-item"><a href="/lesson05/add_weather_view" class="nav-link font-weight-bold text-white">날씨입력</a></li></h5>
						<h5><li class="nav-item"><a href="#" class="nav-link font-weight-bold text-white">테마날씨</a></li></h5>
						<h5><li class="nav-item"><a href="#" class="nav-link font-weight-bold text-white">관측기후</a></li></h5>
					</ul>
				</nav>
			</menu>
			<section class="main mt-4 ml-3 col-10">
				<h3>과거 날씨</h3>
				<table class="table text-center">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${weatherHistory}" var="weather">
						<tr>
							<td><fmt:formatDate value="${weather.date}" pattern="yyyy년 M월 d일" /></td>
							<td>
								<c:choose>
									<c:when test="${weather.weather eq '맑음'}">
										<img src="/image/sunny.jpg" alt="맑음">
									</c:when>
									<c:when test="${weather.weather eq '구름조금'}">
										<img src="/image/partlyCloudy.jpg" alt="구름조금">
									</c:when>
									<c:when test="${weather.weather eq '흐림'}">
										<img src="/image/cloudy.jpg" alt="흐림">
									</c:when>
									<c:when test="${weather.weather eq '비'}">
										<img src="/image/rainy.jpg" alt="비">
									</c:when>
									<c:otherwise>
										${weather.weather}
									</c:otherwise>
								</c:choose>
							</td>
							<td>${weather.temperatures}℃</td>
							<td>${weather.precipitation}mm</td>
							<td>${weather.microDust}</td>
							<td>${weather.windSpeed}km/h</td>
						</tr>
					</c:forEach>					
					</tbody>
				</table>
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
</body>
</html>