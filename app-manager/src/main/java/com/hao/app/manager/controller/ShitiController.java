package com.hao.app.manager.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hao.app.commons.entity.Page;
import com.hao.app.commons.entity.result.JsonResult;
import com.hao.app.pojo.Shiti;
import com.hao.app.service.ShitiService;

/**
 * 系统日志
 * 
 * @author haoguowei
 *
 */
@Controller
@RequestMapping
public class ShitiController extends BaseController {
	
	@Autowired
	protected ShitiService shitiService;

	@RequestMapping("/initShiti.do")
	public String initShiti(HttpServletRequest request, HttpServletResponse response) throws IOException {
		return "jsp/shiti";
	}
	
	@RequestMapping("/initShitiUp.do")
	public String initShitiUp(HttpServletRequest request, HttpServletResponse response) throws IOException {
		return "jsp/shitiUp";
	}

	@RequestMapping("/searchShiti.do")
	public void searchShiti(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String key = request.getParameter("key");
		String title = request.getParameter("title");
		String f = request.getParameter("flag");
		Integer flag = StringUtils.isBlank(f) ? null : Integer.parseInt(f);
		
		int start = NumberUtils.toInt(request.getParameter(START));
		int limit = NumberUtils.toInt(request.getParameter(LIMIT), Page.LIMIT);

		JsonResult<Shiti> result = shitiService.searchShiti(key, title, flag, start, limit);
		writeResponse(response, result);
	}

}
