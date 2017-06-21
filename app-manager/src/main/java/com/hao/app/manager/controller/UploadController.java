package com.hao.app.manager.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
public class UploadController extends BaseController {
	
	@Autowired
	protected ShitiService shitiService;
	
	@RequestMapping(value = "/upload.do")  
    public String upload(@RequestParam(value = "uploadFile", required = false) MultipartFile file, HttpServletRequest request, ModelMap model) throws Exception {  
		String title = file.getOriginalFilename();
		System.out.println("读取文件：" + title);
		readExl(title, file);
		return successResult(request, "试题管理", "initShiti.do");  
    }  
	
	private void readExl(String title, MultipartFile file) throws Exception{
        Workbook workbook = WorkbookFactory.create(file.getInputStream());
        Sheet sheet = workbook.getSheetAt(0);
        
        Iterator<Row> rows = sheet.rowIterator();
        while (rows.hasNext()) {
            Row row = (Row) rows.next();
            if(row.getRowNum() == 0 || row.getCell(0) == null){
            	continue;
            }
           
            
            
            Double numbD = row.getCell(0).getNumericCellValue();
            Integer numb = numbD.intValue();
            
            String type = row.getCell(1).getStringCellValue();
            String question = row.getCell(2).getStringCellValue();
            String answer = row.getCell(3).getStringCellValue();
//            String answer = row.getCell(4).get
            
            System.out.println(
            				"RowIndex:" + row.getRowNum() + ";" + 
            				"numb:" + numb + ";" + 
            				"type:" + type + ";" + 
            				"question:" + question + ";" + 
            				"answer:" + answer + ";" 
            ); 
            
            int flag = 100; //其他
            if(StringUtils.isNotBlank(type)){
            	//1 判断题，2 填空题，3 选择题，4 解答题
            	type = type.trim();
            	if(type.equals("判断题")){
            		flag = 1;
            	}else if(type.equals("填空题")){
            		flag = 2;
            	}else if(type.equals("选择题")){
            		flag = 3;
            	}else if(type.equals("解答题")){
            		flag = 4;
            	}else{
            		flag = 100;
            	}
            }
            
            Shiti shiti = new Shiti();
            shiti.setNumb(numb);
            shiti.setFlag(flag);
            shiti.setTitle(title);
            shiti.setQuestion(question);
            shiti.setAnswer(answer);
            shiti.setPic("");
            shitiService.insert(shiti);
            
        }
        
        
	}

}
