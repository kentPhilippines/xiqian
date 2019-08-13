/**
*  
*   
*   
*/	

package com.how2java.tmall.service;

import java.util.List;

import com.how2java.tmall.pojo.Category;
import com.how2java.tmall.pojo.Product;

public interface ProductService {
	/**
	 * 增加一个产品
	 * @param p
	 */
    void add(Product p);
    /**
     * 删除一个产品
     * @param id
     */
    void delete(int id);
    /**
     * 更新产品
     * @param p
     */
    void update(Product p);
    /**
     * 根据产品id获取
     * @param id
     * @return
     */
    Product get(int id);
    
    List list(int cid);
    void setFirstProductImage(Product p);

    void fill(List<Category> cs);

    void fill(Category c);

    void fillByRow(List<Category> cs);

    void setSaleAndReviewNumber(Product p);

    void setSaleAndReviewNumber(List<Product> ps);

    List<Product> search(String keyword);
}
/**
*  
*   
*   
*/	
