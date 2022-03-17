package com.quiz.lesson06;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookingBO;
import com.quiz.lesson06.model.Booking;

@Controller
public class Lesson06Quiz03Controller {

	@Autowired
	private BookingBO bookingBO;
	
	// 예약목록 화면
	@RequestMapping("/lesson06/quiz03/1")
	public String bookingListView(Model model) {
		
		List<Booking> bookingList = bookingBO.getBookingList();
		model.addAttribute("bookingList", bookingList);
		
		String page = "quiz03/1";
		model.addAttribute("page", page);
		
		return "lesson06/quiz03/quiz03_template";
	}
	
	// 예약 삭제하기 - ajax 요청
	@ResponseBody
	@DeleteMapping("/lesson06/quiz03/delete_booking")
	public Map<String, Object> deleteBooking(
			@RequestParam("id") int id) {
		
		Map<String, Object> result = new HashMap<>();
		// delete DB
		int count = bookingBO.deleteBookingById(id);
		
		if (count > 0) {
			result.put("result", "success");
			result.put("result_code", 1);
		} else {
			result.put("result", "error");
			result.put("result_code", 500);
			result.put("error_message", "삭제하는데 실패했습니다.");
			
		}
		return result;
	}
	
	// 예약하기 화면
	@RequestMapping("/lesson06/quiz03/2")
	public String booking(Model model) {
		
		List<Booking> bookingList = bookingBO.getBookingList();
		model.addAttribute("bookingList", bookingList);
		
		String page = "quiz03/2";
		model.addAttribute("page", page);
		
		return "lesson06/quiz03/quiz03_template";
	}
	
	// 예약하기(date 중복확인) - ajax 호출
	@ResponseBody
	@PostMapping("/lesson06/quiz03/check_duplication_date")
	public Map<String, Boolean> checkDuplicationDate(
			@RequestParam("date") String date) {
		
		Map<String, Boolean> result = new HashMap<>();
		Booking bookingDate = bookingBO.getBookingByDate(date);
		
		if (bookingDate == null) { //중복아님
			result.put("result", false);
		} else {
			result.put("result", true);
		}
		
		return result;
	}
	
	// 예약하기 - ajax 호출
	@ResponseBody
	@PostMapping("/lesson06/quiz03/add_booking")
	public Map<String, Object> addBooking(
			@RequestParam("name") String name,
			@RequestParam("date") String date,
			@RequestParam("day") int day,
			@RequestParam("headcount") int headcount,
			@RequestParam("phoneNumber") String phoneNumber,
			@RequestParam("state") String state) {
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		// DB insert
		bookingBO.addBooking(name, date, day, headcount, phoneNumber, state);
		
		return result;
	}
	
	@RequestMapping("/lesson06/quiz03/3")
	public String bookingCheck(Model model) {
		
		List<Booking> bookingList = bookingBO.getBookingList();
		model.addAttribute("bookingList", bookingList);
		
		String page = "quiz03/3";
		model.addAttribute("page", page);
		
		return "lesson06/quiz03/quiz03_template";
	}
	
	// 예약 조회 기능 - ajax
	@ResponseBody
	@PostMapping("/lesson06/quiz03/search_reservation")
	public Map<String, Object> searchReservation(
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber) {
		
		Map<String, Object> result = new HashMap<>();

		// select DB
		Booking bookingCheck = bookingBO.getBookingByNameAndPhoneNumber(name, phoneNumber);
			// {"result":"success", "booking":{"id":13, "name":"예약자"....}}
		if (bookingCheck != null) {
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String date = format.format(bookingCheck.getDate());
			
			result.put("result", "success");
			result.put("bookingCheck", bookingCheck);
			result.put("date", date);
		} else {
			result.put("result", "error");
			result.put("errorMessage", "예약 정보가 없습니다.");
		}
		
		return result;
	}
	
}
