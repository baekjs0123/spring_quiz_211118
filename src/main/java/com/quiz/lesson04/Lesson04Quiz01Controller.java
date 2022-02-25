package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.model.Seller;

@RequestMapping("/lesson04/quiz01")
@Controller
public class Lesson04Quiz01Controller {
	
	@Autowired
	private SellerBO sellerBO;
	
	// seller 추가
	// 입력 form URL : http://localhost/lesson04/quiz01/1
	@RequestMapping("/1")
	public String quiz01_1() {
		// add_seller.jsp
		return "lesson04/add_seller";
	}
	
	// 요청 URL : http://localhost/lesson04/quiz01/add_seller
	@PostMapping("/add_seller")
	public String addSeller(
			@RequestParam("nickname") String nickname,
			@RequestParam(value="profileImageUrl", required=false) String profileImageUrl,
			@RequestParam("temperature") double temperature) {
		
		// DB insert
		sellerBO.addSeller(nickname, profileImageUrl, temperature);
		
		// response: view 경로
		return "lesson04/after_add_seller";
	}
	
	// 요청 URL : http://localhost/lesson04/quiz01/seller_info
	// 요청 URL : http://localhost/lesson04/quiz01/seller_info?id=1
	@RequestMapping("/seller_info")
	public String sellerInfo(
			@RequestParam(value="id", required=false) Integer id,
			Model model) {
		Seller seller = null;
		if (id == null) {
			seller = sellerBO.getLastSeller();
		} else {
			seller = sellerBO.getSellerById(id);
		}
		model.addAttribute("seller", seller);
		model.addAttribute("subject", "판매자 정보");
		
		return "lesson04/seller_info";
	}
}
