package com.hao.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hao.app.commons.entity.result.JsonResult;
import com.hao.app.dao.ShitiMapper;
import com.hao.app.pojo.Shiti;
import com.hao.app.service.ShitiService;


@Service
public class ShitiServiceImpl implements ShitiService{
	
	@Autowired
	private ShitiMapper shitiMapper;

	@Override
	public JsonResult<Shiti> searchShiti(String key, String title, Integer flag, int start, int limit) {
		int count = shitiMapper.queryCount(key, flag, title);
		List<Shiti> list = shitiMapper.queryList(key, flag, title, start, limit);
		return new JsonResult<Shiti>(count, list);
	}

	@Override
	public void insert(Shiti shiti) {
		shitiMapper.insert(shiti);
	}

}
