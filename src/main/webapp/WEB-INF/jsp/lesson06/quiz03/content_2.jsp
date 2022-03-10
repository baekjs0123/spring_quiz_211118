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