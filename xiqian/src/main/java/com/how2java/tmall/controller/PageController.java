/**
*  
*   
*   
*/	

package com.how2java.tmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("")
public class PageController {
    @RequestMapping("registerPage")
    public String registerPage() {
        return "fore/register";
    }
    @RequestMapping("registerSuccessPage")
    public String registerSuccessPage() {
        return "fore/registerSuccess";
    }
    @RequestMapping("loginPage")
    public String loginPage() {
        return "fore/login";
    }
    /**
     * 跳转付款页面
     * @return
     */
    @RequestMapping("forealipay")
    public String alipay( Model model){
    	
    	System.out.println("添加产品的信息");
    	System.out.println("-------------------------模拟客户发起付款-----------------------------------------------------------------模拟客户发起付款-------------------------------------模拟客户发起付款-----------------------");
    	
    	
    	
    	
        return "fore/alipay";
    }
}

/**
*  
*   
*   
*/	
