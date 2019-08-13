package com.how2java.tmall.mapper;

import org.apache.ibatis.annotations.Param;

public interface UrlMapper {

	/**
	 * 查询支付接口的url
	 * @param fastpayCmd
	 * @param version 
	 * @param appid 
	 * @return
	 */
	String findUrl(@Param("cmd")String cmd, @Param("appId")String appId, @Param("version")String version);

}
