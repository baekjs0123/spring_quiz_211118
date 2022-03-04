<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배탈의 민족</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="/css/storeList.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<header class="header">
			<div class="header-top d-flex align-items-center bg-info">
				<h1 class="display-4 text-white">배탈의 민족</h1>
			</div>
			<div class="header-bottom d-flex align-items-center">
				<span class="display-3">우리동네 가게</span>
			</div>
		</header>
		<div class="contents">
			<c:forEach items="${storeList}" var="store">
				<a href="">
					<div class="store form-control mb-3">
						<h2 class="font-weight-bold mt-3">${store.name}</h3>
						<h5>전화번호 : ${store.phoneNumber}</h5>
						<h5>주소 : ${store.address}</h5>
					</div>
				</a>
			</c:forEach>
		</div>
		<hr>
		<footer class="footer">
		<h3>(주)우와한형제</h3>
		<h4 class="text-secondary">고객센터 : 1500-1500</h4>
		</footer>
		
	</div>
</body>
</html>