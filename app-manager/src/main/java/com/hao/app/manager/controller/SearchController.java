package com.hao.app.manager.controller;

import com.hao.app.service.ShitiService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Controller
@RequestMapping
public class SearchController extends BaseController {
	
	@Autowired
	protected ShitiService shitiService;

	@RequestMapping("/initSearch.do")
	public String initSearch(HttpServletRequest request, HttpServletResponse response) throws IOException {
		return "jsp/search";
	}
	@RequestMapping("/searchKeyWord.do")
	public String searchKeyWord(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String keyword = request.getParameter("keyword");
		
		return "jsp/searchKeyWord";
	}
	

}
