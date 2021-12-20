package com.laptrinhjavaweb.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.CategoryDTO;
import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.util.MessageUtil;

@Controller(value = "categoryControllerOfAdmin")
public class CategoryController {
	
	@Autowired 
	private ICategoryService categoryService;
	
	@Autowired
	private MessageUtil messageUtil;
	
	@RequestMapping(value="/quan-tri/the-loai/danh-sach", method = RequestMethod.GET)
	public ModelAndView showList(@RequestParam("page") int page,
								 @RequestParam("limit")int limit) {
		CategoryDTO model = new CategoryDTO();
		model.setPage(page);
		model.setLimit(limit);
		ModelAndView mav = new ModelAndView("admin/category/list");
		Pageable pageable = new PageRequest(page - 1, limit);
		model.setListResult(categoryService.findAll(pageable));
		model.setTotalItem(categoryService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/quan-tri/the-loai/chinh-sua", method = RequestMethod.GET)
	public ModelAndView editCategory(@RequestParam(value = "id", required = false) Long id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/category/edit");
		CategoryDTO model = new CategoryDTO();
		if(id != null) {
			model = categoryService.findById(id);
		}
		if(request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("categories", categoryService.findAll());
		mav.addObject("model", model);
		return mav;
	}
}
