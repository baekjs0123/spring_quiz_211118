package com.quiz.lesson04.dao;

import com.quiz.lesson04.model.Realtor;

public interface RealtorDAO {

	public void insertRealtor(Realtor realtor);
	
	public Realtor selectRealtorById(int id);
}
