package com.quiz.lesson07;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SnsController {
	
	@RequestMapping("/lesson07/sns/login_view")
	public String loginView() {
		return "sns/login_view";
	}
	@RequestMapping("/lesson07/sns/sign_up_view")
	public String signUpView() {
		return "sns/sign_up_view";
	}
}
