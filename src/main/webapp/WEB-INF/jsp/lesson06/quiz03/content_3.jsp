<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section id="contents">
	<div class="banner">
		<img src="/image/test06_banner1.jpg" alt="배너이미지" width="1110px" height="500px" id="bannerImage">
	</div>
</section>
<section class="reserve bg-primary d-flex">
	<section class="real-time-reserved col-4 d-flex justify-content-center align-items-center">
		<div class="display-4 text-white">
			실시간<br>예약하기
		</div>
	</section>
	<section class="confirm col-4">
		<!-- 예약 확인, 회원 비회원 라디오 버튼 -->
		<div class="m-3">
			<h3 class="reserve-confirm mr-3">예약 확인</h3>
			<div class="d-flex justify-content-end align-items-center mt-3">
				<label for="name" class="text-white">이름: </label>
				<input type="text" id="name" class="form-control input-form">
			</div>
			<div class="d-flex justify-content-end align-items-center mt-2">
				<label for="phoneNumber" class="text-white">전화번호: </label>
				 <input type="text" id="phoneNumber" class="form-control input-form">
			</div>
			<div class="d-flex justify-content-end mt-3">
				<button type="button" id="inquiryBtn" class="btn btn-success">조회하기</button>
			</div>
		</div>
	</section>
	<section
		class="inquiry col-4 d-flex justify-content-center align-items-center">
		<div class="text-white">
			<h4 class="font-weight-bold">예약문의:</h4>
			<h1>
				010-<br>0000-1111
			</h1>
		</div>
	</section>
</section>
<script>
	$(document).ready(function() {
		$('#inquiryBtn').on('click', function() {
			alert("조회하기");
			let name = $('#name').val().trim();
			let phoneNumber = $('#phoneNumber').val().trim();
			
			if (name == '') {
				alert("이름을 입력하세요.");
				return;
			} else if (phoneNumber == '') {
				alert("휴대전화 번호를 입력하세요.");
				return;
			}
			
			$.ajax({
				type:"post"
				, url:"/lesson06/quiz03/check_duplication_name_phoneNumber"
				, data: {"name":name, "phoneNumber":phoneNumber}
				, success: function(data) {
					if (data.result) {
						alert("이름 : " + data.bookingCheck.name + 
								"\n날짜 : " + data.bookingCheck.date +
								"\n일수 : " + data.bookingCheck.day +
								"\n인원 : " + data.bookingCheck.headcount +
								"\n상태 : " + data.bookingCheck.state);
					} else (data.result) {
						alert("예약 내역이 없습니다");
					}
				}
				, error: function(e) {
					alert("예약날짜 확인에 실패했습니다. 관리자에게 문의해주세요.");
				}
			});
		});
		
		var bannerSrcArr = ['/image/test06_banner1.jpg', '/image/test06_banner2.jpg', '/image/test06_banner3.jpg', '/image/test06_banner4.jpg'];
        var currentIndex = 0;
        setInterval(function() {
            $('#bannerImage').attr('src', bannerSrcArr[currentIndex]);
            currentIndex++;

            if (currentIndex > bannerSrcArr.length) {
                currentIndex = 0;
            }
        }, 3000);
	});
</script>