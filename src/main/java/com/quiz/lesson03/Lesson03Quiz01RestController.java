package com.quiz.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.RealEstate;

@RequestMapping("/lesson03/quiz01")
@RestController
public class Lesson03Quiz01RestController {

	@Autowired
	private RealEstateBO realEstateBO;
	
	// 요청 URL: http://localhost/lesson03/quiz01/1?id=20
	@RequestMapping("/1")
	public RealEstate quiz01_1(
			@RequestParam(value="id", defaultValue="1") int id) {
		return realEstateBO.getRealEstateById(id);
	}
	
	// 요청 URL: http://localhost/lesson03/quiz01/2?rent_price=90
	@RequestMapping("/2")
	public List<RealEstate> quiz01_2(
			@RequestParam(value="rent_price", defaultValue="80") int rentPrice) {
		List<RealEstate> realEstateListByRentPrice = realEstateBO.getRealEstateListByRentPrice(rentPrice);
		return realEstateListByRentPrice;
	}
	
	// 요청 URL: http://localhost/lesson03/quiz01/3?area=90&price=130000
	@RequestMapping("/3")
	public List<RealEstate> quiz01_3(
			@RequestParam(value="price", defaultValue="100000") int price,
			@RequestParam(value="area", defaultValue="100") int area) {
		List<RealEstate> realEstateList = realEstateBO.getRealEstateList(price, area);
		return realEstateList;
	}
	
}
