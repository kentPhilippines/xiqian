package com.how2java.tmall.util.payUtil;

import java.util.Arrays;
import java.util.Map;

public class Params extends HttpPost{
	/**
	 * 组合请求参数(a=b&c=d的形式)
	 * 
	 * @param map
	 *            请求参数
	 * @param appInitKey
	 *            钱包分配给商家的密钥
	 * @return
	 */
	public static String createParam(Map<String, String> map, String appInitKey) {
		try {
			if (map == null || map.isEmpty()) {
				return null;
			}

			//对参数名按照ASCII升序排序
			Object[] key = map.keySet().toArray();
			Arrays.sort(key);

			//生成加密原串  
			StringBuffer res = new StringBuffer(128);
			for (int i = 0; i < key.length; i++) {
				res.append(key[i] + "=" + map.get(key[i]) + "&");
			}

			String rStr = res.substring(0, res.length() - 1);
			System.out.println("请求接口加密原串 = " + rStr);
			if (appInitKey == null) {
				return rStr + "&hmac=" + Encryption.getKeyedDigest(rStr, "");
			}

			return rStr + "&hmac=" + Encryption.getKeyedDigestUTF8(rStr, appInitKey);                                                                                                                                                                                                                                
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	

}
