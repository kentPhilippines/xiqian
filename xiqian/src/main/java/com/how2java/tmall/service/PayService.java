package com.how2java.tmall.service;

import java.util.List;
import java.util.Map;

import com.how2java.tmall.pojo.PayEntity;

public interface PayService {
	final String FASTPAY_CMD = "FASTPAY";
	final String VERSION = "2.0";//版本号
	final String APPID = "mx_shop04";//平台统一分配的appid
	final String USERID = "CAT201906200909280005";//平台统一分配用户id
	final String BIZTYPE = "1";
	final String KEY = "tBCR0kjOLbUbgofWTzMUiJit2ED2gyS1hvfESFJa4J5qXGRtAIdohbTmXYJi3DhLHQF42Y05fh5DKUOMKrkrFGjuBjGre8wHwt0z7YtxD86alFYucMzJmYk4Mfjj1DJ2";//平台统一分配
	final String DESKEY = "nCuQr6uh3vTxOPe0tNmslzZt1VEuHBjQ";//平台统一分配
	final String NOTIFYURL = "forepaySucceed";//notifyurl异步通知地址
	final String PAGEURL = "forepaySucceed";//pageurl成功跳转地址
	/**
	 * 快捷支付接口
	 * @param pay
	 * @Data 2019/6/20/11/21
	 */
	String fastPay(final PayEntity pay);
}
