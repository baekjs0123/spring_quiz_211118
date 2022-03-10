<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 팬션 예약하기</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	
	<!-- datepicker 라이브러리 -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- bootstrap CDN link -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link href="/css/lesson06Quiz03.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp" />
		<jsp:include page="menu.jsp" />
		<jsp:include page="content_2.jsp" />
		<jsp:include page="footer.jsp" />
	</div>
<script>
$(document).ready(function() {
	$('#date').datepicker({
		dateFormat: "yy-mm-dd"
        , minDate: 0
	});

	$('#bookingBtn').on('click', function(e) {
		//alert("예약하기");
		let name = $('#name').val().trim();
		let date = $('#date').val().trim();
		let day = $('#day').val().trim();
		let headcount = $('#headcount').val().trim();
		let phoneNumber = $('#phoneNumber').val().trim();
		
		if (name == '') {
			alert("이름을 입력하세요.");
			return;
		} else if (date == '') {
			alert("예약날짜를 입력하세요.");
			return;
		} else if (day == '') {
			alert("숙박일수를 입력하세요.");
			return;
		} else if (headcount == '') {
			alert("숙박인원을 입력하세요.");
			return;
		} else if (phoneNumber == '') {
			alert("전화번호를 입력하세요.");
			return;
		}
		
		$.ajax({
			type:"post"
			, url:"/lesson06/quiz03/check_duplication_date"
			, data: {"date":date}
			, async : false
			, success: function(data) {
				if (data.result) { 
					// 중복일 때
					let state = "대기중";
					$.ajax({
						type:"post"
						, url:"/lesson06/quiz03/add_booking"
						, data: {
							"name":name,
							"date":date,
							"day":day,
							"headcount":headcount,
							"phoneNumber":phoneNumber,
							"state":state}
						, success: function(data) {
							if(data.result == "success") {
								alert("예약대기가 완료되었습니다.")
								location.reload();
							} else {
								alert(data.errorMessage);
							}
						}
					});
				} else {
					// 중복 아닐 때
					let state = "확정";
					$.ajax({
						type:"post"
						, url:"/lesson06/quiz03/add_booking"
						, data: {
							"name":name,
							"date":date,
							"day":day,
							"headcount":headcount,
							"phoneNumber":phoneNumber,
							"state":state}
						, success: function(data) {
							if(data.result == "success") {
								alert("예약이 완료되었습니다.")
								location.reload();
							} else {
								alert(data.errorMessage);
							}
						}
					});
				}
			}
			, error: function(e) {
				alert("예약날짜 확인에 실패했습니다. 관리자에게 문의해주세요.");
			}
		});
	});
});
</script>
</body>
</html>