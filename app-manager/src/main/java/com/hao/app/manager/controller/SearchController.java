package com.hao.app.manager.controller;

import com.hao.app.commons.entity.Page;
import com.hao.app.commons.entity.result.JsonResult;
import com.hao.app.pojo.Shiti;
import com.hao.app.service.ShitiService;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
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
	@RequestMapping("/searchDetail.do")
	public String searchDetail(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String keyword = request.getParameter("keyword");
		
		JsonResult<Shiti> result = null;
		if(StringUtils.isNotBlank(keyword)){
			//		int start = NumberUtils.toInt(request.getParameter(START));
			//		int limit = NumberUtils.toInt(request.getParameter(LIMIT), Page.LIMIT);
			result = shitiService.searchShiti(keyword, null, null, 0, 500);
		}
		
		request.setAttribute("list", result==null?null:result.getResultList());
		request.setAttribute("count", result==null?0:result.getTotal());
		request.setAttribute("keyword", keyword);
		return "jsp/searchDetail";
	}
	

}
