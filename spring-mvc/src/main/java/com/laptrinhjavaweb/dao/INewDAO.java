package com.laptrinhjavaweb.dao;

import java.util.List;

import com.laptrinhjavaweb.model.NewsModel;

public interface INewDAO extends GenericDAO<NewsModel> {
	List<NewsModel> findAll();
}
