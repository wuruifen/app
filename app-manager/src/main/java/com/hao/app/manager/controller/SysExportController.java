package com.hao.app.manager.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hao.app.manager.export.ExportDemo;

/**
 * 导出打印文件
 * 
 * @author haoguowei
 *
 */
@Controller
@RequestMapping
public class SysExportController extends BaseController {

	@Autowired
	private ExportDemo exportDemo;

	/**
	 * 获取模板文件全路径地址
	 * 
	 * @param request
	 * @param fileName
	 * @return
	 */
	private String getModelFilePath(HttpServletRequest request, String fileName) {
		return getRealpath(request) + "/" + MODELDIR + "/" + fileName;
	}

	@RequestMapping("/exportDemo.do")
	public void exportDemo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String modelFile = getModelFilePath(request, "demo.xls");
		exportDemo.exportExcel(modelFile, request, response);
	}
}
