<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
	
<div class="aliPayPageDiv">
	<div class="aliPayPageLogo">
		<img class="pull-left" src="http://www.xiqianj.cn/themes/haoimg.cn/images/logo.gif">
		<div style="clear:both"></div>
	</div>
	 <div>
		<span class="confirmMoneyText">快捷付款（元）</span>
		<span class="confirmMoney">
		￥<fmt:formatNumber type="number" value="${param.total}" minFractionDigits="2"/></span>
		
	</div>
	
	<!-- <div>//这里需要一张快捷支付的logo
		<img class="aliPayImg" src="img/site/alipay2wei.png">
	</div> -->
	<div>
		<a href="forepayed?oid=${param.oid}&total=${param.total}"><button class="confirmPay">确认支付</button></a>
	</div> 

</div>