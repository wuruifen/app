package com.hao.app.manager;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.hao.app.commons.entity.result.JsonResultAjax;

/**
 * 统一异常处理
 * 
 * @author haoguowei
 *
 */
public class CustomHandlerExceptionResolver implements HandlerExceptionResolver {

	private final Logger logger = LoggerFactory.getLogger(CustomHandlerExceptionResolver.class);

	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		try {
			if (!(request.getHeader("accept").contains("application/json")
					|| (request.getHeader("X-Requested-With") != null
							&& request.getHeader("X-Requested-With").contains("XMLHttpRequest")))) {

				return new ModelAndView("WEB-INF/error/500");
			} else {
				// json错误请求处理
				String msg = ex.getMessage();
				if (StringUtils.isBlank(msg) || msg.length() > 30) {
					msg = "抱歉，系统出错了！";
				}
				JsonResultAjax result = new JsonResultAjax(false, msg);

				String json = new Gson().toJson(result);
				PrintWriter pw = response.getWriter();
				pw.write(json);
				pw.flush();

				return null;
			}
		} catch (Exception handlerException) {
			logger.warn("Handling of [" + ex.getClass().getName() + "] resulted in Exception", handlerException);
		}
		return null;
	}

}
