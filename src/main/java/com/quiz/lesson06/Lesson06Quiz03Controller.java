package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping("/lesson06/quiz03/1")
	public String bookingListView(Model model) {
		
		List<Booking> bookingList = bookingBO.getBookingList();
		model.addAttribute("bookingList", bookingList);
		
		String page = "quiz03/1";
		model.addAttribute("page", page);
		
		return "lesson06/quiz03/quiz03_template";
	}
	
	@ResponseBody
	@PostMapping("/lesson06/quiz03/delete_booking")
	public Map<String, String> deleteBooking(
			@RequestParam("id") int id) {
		
		Map<String, String> result = new HashMap<>();
		
		int row = bookingBO.deleteBookingById(id);
		if (row > 0) {
			result.put("result", "success");
		} else {
			result.put("result", "error");
			result.put("errorMessage", "삭제하는데 실패했습니다.");
			
		}
		return result;
	}
	
	@RequestMapping("/lesson06/quiz03/2")
	public String booking(Model model) {
		
		List<Booking> bookingList = bookingBO.getBookingList();
		model.addAttribute("bookingList", bookingList);
		
		String page = "quiz03/2";
		model.addAttribute("page", page);
		
		return "lesson06/quiz03/quiz03_template";
	}
	
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
	
	@ResponseBody
	@PostMapping("/lesson06/quiz03/add_booking")
	public Map<String, String> addBooking(
			@RequestParam("name") String name,
			@RequestParam("date") String date,
			@RequestParam("day") int day,
			@RequestParam("headcount") int headcount,
			@RequestParam("phoneNumber") String phoneNumber,
			@RequestParam("state") String state) {
		
		bookingBO.addBooking(name, date, day, headcount, phoneNumber, state);
		
		Map<String, String> result = new HashMap<>();
		result.put("result", "success");
		
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
	
	@ResponseBody
	@PostMapping("/lesson06/quiz03/check_duplication_name_phoneNumber")
	public Map<String, Object> checkDuplicationByNameByphoneNumber(
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber) {
		
		Map<String, Object> result = new HashMap<>();
		Booking bookingCheck = bookingBO.getBookingByNameByphoneNumber(name, phoneNumber);
		
		if (bookingCheck == null) { //중복아님
			result.put("result", false);
		} else {
			result.put("result", true);
			result.put("bookingCheck", bookingCheck);
		}
		
		return result;
	}
	
}
