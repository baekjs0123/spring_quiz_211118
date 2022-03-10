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
		<c:forEach items="${bookingList}" var="bookingList">
			<tr>
				<td>${bookingList.name}</td>
				<td><fmt:formatDate value="${bookingList.date}" pattern="yyyy년 M월 d일" /> </td>
				<td>${bookingList.day}</td>
				<td>${bookingList.headcount}</td>
				<td>${bookingList.phoneNumber}</td>
				<td>
					<c:choose>
						<c:when test="${bookingList.state eq '대기중'}">
							<span class="text-info">${bookingList.state}</span>
						</c:when>
						<c:when test="${bookingList.state eq '확정'}">
							<span class="text-success">${bookingList.state}</span>
						</c:when>
					</c:choose>
				</td>
				<td><button type="button" class="delete-btn btn btn-danger" data-booking-id="${bookingList.id}">삭제</button></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</section>