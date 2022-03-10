package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.BookmarkDAO;
import com.quiz.lesson06.model.Bookmark;

@Service
public class BookmarkBO {

	@Autowired
	private BookmarkDAO bookmarkDAO;
	
	public void addBookmark(String name, String url) {
		bookmarkDAO.insertBookmark(name, url);
	}
	
	public List<Bookmark> getbookmarkList() {
		List<Bookmark> bookmarkList = bookmarkDAO.selectBookmarkList();
		return bookmarkList;
	}
	
	public Bookmark getBookmarkByUrl(String url) {
		return bookmarkDAO.selectBookmarkByUrl(url);
	}
	
	public int deleteBookmarkById(int id) {
		return bookmarkDAO.deleteBookmarkById(id);
	}
	
}
