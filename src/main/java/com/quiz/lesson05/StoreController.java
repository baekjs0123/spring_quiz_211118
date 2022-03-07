package com.quiz.lesson05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.model.Store;
import com.quiz.lesson05.bo.ReviewBO;
import com.quiz.lesson05.model.Review;

@RequestMapping("/lesson05")
@Controller
public class StoreController {

	@Autowired
	private StoreBO storeBO;
	private ReviewBO reviewBO;
	
	@RequestMapping("/storeList")
	public String storeList(Model model) {
		List<Store> storeList = storeBO.getStoreList();
		model.addAttribute("storeList", storeList);
		return "lesson05/storeList";
	}
	
	@RequestMapping("/reviews")
	public String reviewList(@RequestParam("storeName") String storeName, Model model) {
		List<Review> reviewList = reviewBO.getReviewList();
		model.addAttribute("reviewList", reviewList);
		return "lesson05/reviewList";
	}
}
