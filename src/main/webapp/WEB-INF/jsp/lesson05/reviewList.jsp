<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<span class="display-3">${storeName} - 리뷰</span>
			</div>
		</header>
		<div class="contents">
			<c:if test="${empty reviewList}">
				<div class="display-4 font-weight-bold ml-5">작성된 리뷰가 없습니다.</div>
			</c:if>
			<c:if test="${not empty reviewList}">
				<c:forEach items="${reviewList}" var="review">
						<div class="store form-control mb-3 border border-3 border-info p-3">
							<div class="d-flex">
								<h5 class="font-weight-bold text-dark">${review.userName}</h5>
								<div class="d-inline ml-2">
									<c:set var="point" value="${review.point}" />
									<c:forEach begin="1" end="5">
										<c:choose>
											<c:when test="${point > 0.5}">
												<img src="/image/review/star_fill.png" alt="별 한개" width="20px">
												<c:set var="point" value="${point - 1}"/>
											</c:when>
											<c:when test="${point == 0.5}">
												<img src="/image/review/star_half.png" alt="별 반개" width="20px">
												<c:set var="point" value="${point - 0.5}"/>
											</c:when>
											<c:when test="${point == 0}">
												<img src="/image/review/star_empty.png" alt="빈 별" width="20px">
											</c:when>
										</c:choose>
									</c:forEach>
								</div>
							</div>
							<div class="mt-2 mb-2">
								<h6 class="text-secondary"><fmt:formatDate value="${review.createdAt}" pattern="yyyy년 M월 d일"/></h6>
							</div>
							<h5 class="text-dark mb-3">${review.review}</h5>
							<span class="menu-box rounded p-1">
								${review.menu}
							</span>
						</div>
				</c:forEach>
			</c:if>
		</div>
		<hr>
		<footer class="footer">
		<h3>(주)우와한형제</h3>
		<h4 class="text-secondary">고객센터 : 1500-1500</h4>
		</footer>
	</div>
</body>
</html>