package com.quiz.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.dao.RealEstateDAO;
import com.quiz.lesson03.model.RealEstate;

@Service
public class RealEstateBO {

	@Autowired
	private RealEstateDAO realEstateDAO;
	
	public RealEstate getRealEstateById(int id) {
		return realEstateDAO.selectRealEstateById(id);
	}
	
	public List<RealEstate> getRealEstateListByRentPrice(int rentPrice) {
		List<RealEstate> realEstateListByRentPrice = realEstateDAO.selectRealEstateListByRentPrice(rentPrice);
		return realEstateListByRentPrice;
	}
	
	public List<RealEstate> getRealEstateList(int price, int area) {
		List<RealEstate> realEstateList = realEstateDAO.selectRealEstateList(price, area);
		return realEstateList;
	}
}
