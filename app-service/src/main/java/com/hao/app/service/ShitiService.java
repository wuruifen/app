package com.hao.app.service;

import com.hao.app.commons.entity.result.JsonResult;
import com.hao.app.pojo.Shiti;

/**
 * 系统日志处理
 * 
 * @author haoguowei
 *
 */
public interface ShitiService {

	JsonResult<Shiti> searchShiti(String key, String title, Integer flag, int start, int limit);

	void insert(Shiti shiti);
}
