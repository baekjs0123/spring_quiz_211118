<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<section id="contents">
	<div class="text-center">
		<h2 class="mt-3">예약 목록 보기</h2>
	</div>
	<table class="table text-center">
		<thead>
			<tr>
				<th>이름</th>
				<th>예약날짜</th>
				<th>숙박일수</th>
				<th>숙박인원</th>
				<th>전화번호</th>
				<th>예약상태</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${bookingList}" var="booking">
			<tr>
				<td>${booking.name}</td>
				<td><fmt:formatDate value="${booking.date}" pattern="yyyy년 M월 d일" /></td>
				<td>${booking.day}</td>
				<td>${booking.headcount}</td>
				<td>${booking.phoneNumber}</td>
				<td>
					<c:choose>
						<c:when test="${booking.state eq '확정'}">
							<span class="text-success">${booking.state}</span>
						</c:when>
						<c:when test="${booking.state eq '대기중'}">
							<span class="text-info">${booking.state}</span>
						</c:when>
						<c:when test="${booking.state eq '취소'}">
							<span class="text-danger">${booking.state}</span>
						</c:when>
					</c:choose>
				</td>
				<td>
					<button type="button" class="delete-btn btn btn-danger" data-booking-id="${booking.id}">삭제</button>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</section>
<script>
$(document).ready(function() {
	$('.delete-btn').on('click', function() {
		//alert("삭제하기");
		let id = $(this).data("booking-id");
		
		$.ajax({
			// request
			type:"DELETE"
			, url:"/lesson06/quiz03/delete_booking"
			, data: {"id":id}
			
			// response
			, success: function(data) {
				if (data.result_code == 1) {
					alert("삭제되었습니다.");
					location.reload();
				} else {
					alert(data.error_message);
				}
			}
			, error: function(e) {
				alert("삭제하는데 실패했습니다. 관리자에게 문의해주세요.");
			}
		});
	});
});
</script>