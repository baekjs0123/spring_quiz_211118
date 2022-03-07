package com.quiz.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookmarkBO;
import com.quiz.lesson06.model.Bookmark;

@RequestMapping("/lesson06/quiz01")
@Controller
public class Lesson06Controller {

	@Autowired
	private BookmarkBO bookmarkBO;
	
	// 요청 URL: http://localhost/lesson06/quiz01/add_bookmark_view
	@RequestMapping("/add_bookmark_view")
	public String addBookmarkView() {
		return "lesson06/add_bookmark";
	}
	
	@ResponseBody
	@PostMapping("/add_bookmark")
	public String addBookmark(
			@RequestParam("name") String name,
			@RequestParam("url") String url) {
		bookmarkBO.addBookmark(name, url);
		
		return "성공";
	}
	
	// 요청 URL: http://localhost/lesson06/quiz01/get_bookmark_view
	@RequestMapping("get_bookmark_view")
	public String getBookmarkList(Model model) {
		List<Bookmark> bookmarkList = bookmarkBO.getBookmarkList();
		model.addAttribute("bookmarkList", bookmarkList);
		
		return "lesson06/get_bookmark";
	}
}
