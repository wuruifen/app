package com.hao.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hao.app.pojo.Shiti;


public interface ShitiMapper {

	/**
	 * 插入记录
	 * @param sysLogs
	 * @return
	 */
    int insert(Shiti shiti);

    /**
     * 分页查询日志记录
     * @param queryParam
     * @return
     */
    List<Shiti> queryList(@Param("key")String key, @Param("flag")Integer flag, @Param("title")String title, @Param("pageStart")Integer pageStart, @Param("pageLimit")Integer pageLimit);
    
    /**
     * 查询日志记录count
     * @param queryParam
     * @return
     */
    int queryCount(@Param("key")String key, @Param("flag")Integer flag, @Param("title")String title);
}