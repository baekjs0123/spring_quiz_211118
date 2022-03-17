package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.BookingDAO;
import com.quiz.lesson06.model.Booking;

@Service
public class BookingBO {
	
	@Autowired
	private BookingDAO bookingDAO;
	
	public List<Booking> getBookingList() {
		List<Booking> bookingList = bookingDAO.selectBookingList();
		return bookingList;
	}
	
	public int deleteBookingById(int id) {
		return bookingDAO.deleteBookingById(id);
	}
	
	public void addBooking(String name, String date, int day,
			int headcount, String phoneNumber, String state) {
		bookingDAO.insertBooking(name, date, day, headcount, phoneNumber, state);
	}
	
	public Booking getBookingByDate(String date) {
		return bookingDAO.selectBookingByDate(date);
	}
	
	public Booking getBookingByNameAndPhoneNumber(
			String name, String phoneNumber) {
		return bookingDAO.selectBookingByNameAndPhoneNumber(name, phoneNumber);
	}
}
