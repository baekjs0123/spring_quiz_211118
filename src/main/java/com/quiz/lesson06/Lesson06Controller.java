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

import com.quiz.lesson06.bo.BookmarkBO;
import com.quiz.lesson06.model.Bookmark;

@Controller
public class Lesson06Controller {

	@Autowired
	private BookmarkBO bookmarkBO;
	
	// 즐겨찾기 추가하는 화면
	// 요청 URL: http://localhost/lesson06/quiz01/add_bookmark_view
	@RequestMapping("/lesson06/quiz01/add_bookmark_view")
	public String addBookmarkView() {
		return "lesson06/add_bookmark";
	}
	
	// 즐겨찾기 추가 수행 - AJAX가 요청하는 API
	@ResponseBody
	@PostMapping("/lesson06/quiz01/add_bookmark")
	public Map<String, String> addBookmark(
			@RequestParam("name") String name,
			@RequestParam("url") String url) {
		
		// DB insert 
		bookmarkBO.addBookmark(name, url);
		
		// 응답값 구성(map -> json string)
		Map<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		// return 응답값
		return result;
	}
	
	// 즐겨찾기 목록 화면
	// 요청 URL: http://localhost/lesson06/quiz01/bookmark_list_view
	@RequestMapping("/lesson06/quiz01/bookmark_list_view")
	public String bookmarkListView(Model model) {
		// db select
		List<Bookmark> bookmarkList = bookmarkBO.getbookmarkList();
		
		// model에 담는다.
		model.addAttribute("bookmarkList", bookmarkList);
		
		return "lesson06/bookmark_list";
	}
	
	// 주소의 중복확인 - AJAX를 통해 오는 요청
	@ResponseBody
	@PostMapping("/lesson06/quiz02/check_duplication_url")
	public Map<String, Boolean> checkDuplicationUrl(
			@RequestParam("url") String url) {
		
		Map<String, Boolean> result = new HashMap<>();
		Bookmark bookmark = bookmarkBO.getBookmarkByUrl(url);
		
		if (bookmark == null) { //중복아님
			result.put("result", false);
		} else {
			result.put("result", true);
		}
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/lesson06/quiz02/delete_bookmark")
	public Map<String, String> deleteBookmark(
			@RequestParam("id") int id) {
				
		Map<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		// TODO delete DB
		int row = bookmarkBO.deleteBookmarkById(id);
		if (row > 0) {
			result.put("result", "success");
		} else {
			result.put("result", "error");
			result.put("errorMessage", "삭제하는데 실패했습니다.");
			
		}
		return result;
	}
}
