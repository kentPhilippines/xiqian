/**
*  
*   
*   
*/	

package com.how2java.tmall.mapper;

import com.how2java.tmall.pojo.Order;
import com.how2java.tmall.pojo.OrderExample;
import java.util.List;

public interface OrderMapper {
	/**
	 * 根据订单号查询订单
	 * @param orderCode
	 * @return
	 */
	Order findOrderByOrderCode(String orderCode);
	
    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);

    List<Order> selectByExample(OrderExample example);

    Order selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
}
/**
*  
*   
*   
*/	