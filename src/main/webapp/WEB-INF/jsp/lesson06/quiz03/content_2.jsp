<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section id="contents">
	<div class="text-center mt-3">
		<h2>예약하기</h2>
	</div>
	<div class="booking mt-4">
		<div class="form-group">
			<label for="name">이름</label>
			<input type="text" id="name" class="form-control" placeholder="ex) 홍길동">
		</div>
		<div class="form-group">
			<label for="date">예약날짜</label>
			<input type="text" var="date" id="date" class="form-control">
		</div>
		<div class="form-group">
			<label for="day">숙박일수</label>
			<input type="text" id="day" class="form-control" placeholder="ex) 2박일 경우 : 2">
		</div>
		<div class="form-group">
			<label for="headcount">숙박인원</label>
			<input type="text" id="headcount" class="form-control" placeholder="ex) 2인일 경우 : 2">
		</div>
		<div class="form-group">
			<label for="phoneNumber">전화번호</label>
			<input type="text" id="phoneNumber" class="form-control" placeholder="ex) 010-1234-5678">
		</div>
		<input type="button" id="bookingBtn" class="btn btn-warning w-100" value="예약하기">
	</div>
</section>
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
				alert("예약에 실패했습니다. 관리자에게 문의해주세요.");
			}
		});
	});
});
</script>