package com.laptrinhjavaweb.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.laptrinhjavaweb.dto.CategoryDTO;
import com.laptrinhjavaweb.dto.NewDTO;

public interface ICategoryService {
	List<CategoryDTO> findAll();
	List<CategoryDTO> findAll(Pageable pageable);
	int getTotalItem();
	CategoryDTO save(CategoryDTO dto);
	void delete(long[] ids);
}
