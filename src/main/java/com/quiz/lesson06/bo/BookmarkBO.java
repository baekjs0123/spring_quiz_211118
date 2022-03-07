package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.DAO.BookmarkDAO;
import com.quiz.lesson06.model.Bookmark;

@Service
public class BookmarkBO {

	
	@Autowired
	private BookmarkDAO bookmarkDAO;
	
	public String addBookmark(String name, String url) {
		return bookmarkDAO.insertBookmark(name, url);
	}
	
	public List<Bookmark> getBookmarkList() {
		List<Bookmark> bookmarkList = bookmarkDAO.selectBookmarkList();
		return bookmarkList;
	}
	
}
