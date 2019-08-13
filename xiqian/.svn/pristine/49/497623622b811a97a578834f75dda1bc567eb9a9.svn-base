package com.how2java.tmall.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.how2java.tmall.mapper.UrlMapper;
import com.how2java.tmall.pojo.PayEntity;
import com.how2java.tmall.service.PayService;
import com.how2java.tmall.util.payUtil.Encryption;
@Service
public class PayServiceImpl implements PayService{
	@Autowired
	private UrlMapper urlmapping;
	private Map<String, String> map = new HashMap<String, String>();
	private SimpleDateFormat date = new SimpleDateFormat("yyyyMMddHHmmss");
	private Map reqParam = new HashMap();
	
	@Override
	public String fastPay(final PayEntity pay) {
		String url = urlmapping.findUrl(FASTPAY_CMD,APPID,VERSION);
		map.put("cmd", FASTPAY_CMD);
		map.put("version", VERSION);
		map.put("appid", APPID);
		map.put("ordertime", date.format(pay.getOrderTime()));
		map.put("userid", USERID);
		map.put("biztype", BIZTYPE);
		map.put("apporderid",pay.getOrderNo());
		map.put("ordertitle",pay.getOrderTitle());
		map.put("orderbody",pay.getOrderbody());
		map.put("amount",pay.getAmount());
		map.put("notifyurl", NOTIFYURL);
		map.put("pageurl", PAGEURL);//成功之后跳转的地址
		return invoke(map,url,KEY);
	}
	public String invoke(Map<String, String> paramMap, String url, String appInitKey) {
		List list = new ArrayList();
		Map<String, String> resultMap = new HashMap<String, String>();
		String params = Encryption.createParam(paramMap, appInitKey);
		String result = Encryption.Post(url, params);
		if (result == null) {
			return null;
		}
		System.out.println("钱包返回："+result);
		System.out.println("---------");
		String[] split = result.split("&");//分割
		for (int i = 0; i < split.length; i++) {
			String[] temp = split[i].split("=");
			if (temp.length == 1) {
				resultMap.put(temp[0], "");
			}
			if (temp.length > 1) {
				resultMap.put(temp[0], temp[1]);
			}
		}
		return result ;
	}

}
