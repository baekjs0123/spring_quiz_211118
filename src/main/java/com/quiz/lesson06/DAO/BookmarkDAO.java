package com.quiz.lesson06.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.Bookmark;

@Repository
public interface BookmarkDAO {

	public String insertBookmark(
			@Param("name") String name,
			@Param("url") String url);
	
	public List<Bookmark> selectBookmarkList();
}
