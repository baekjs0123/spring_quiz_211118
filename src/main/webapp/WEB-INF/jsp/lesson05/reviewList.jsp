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
				<span class="display-3">${reviewList.storeName}</span>
			</div>
		</header>
		<div class="contents">
			<c:forEach items="${reviewList}" var="review">
					<div class="store form-control mb-3 border border-3 border-info">
						<span class="font-weight-bold mt-3">${review.userName}</span>
						<c:choose>
							<c:when test="${review.point eq 0}">
								<img src="/image/star_empty.jpg" alt="별점">
								<img src="/image/star_empty.jpg" alt="별점">
								<img src="/image/star_empty.jpg" alt="별점">
								<img src="/image/star_empty.jpg" alt="별점">
								<img src="/image/star_empty.jpg" alt="별점">
							</c:when>
							<c:when test="${review.point eq 0.5}">
								<img src="/image/star_half.jpg" alt="별점">
								<img src="/image/star_empty.jpg" alt="별점">
								<img src="/image/star_empty.jpg" alt="별점">
								<img src="/image/star_empty.jpg" alt="별점">
								<img src="/image/star_empty.jpg" alt="별점">
							</c:when>
							<c:when test="${review.point eq 1}">
								<img src="/image/star_fill.jpg" alt="별점">
								<img src="/image/star_empty.jpg" alt="별점">
								<img src="/image/star_empty.jpg" alt="별점">
								<img src="/image/star_empty.jpg" alt="별점">
								<img src="/image/star_empty.jpg" alt="별점">
							</c:when>
						</c:choose>
						<h6>${review.createdAt}</h6>
						<h5>${review.review}</h5>
						<div class="bg-secondary">
							${review.menu}
						</div>
					</div>
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