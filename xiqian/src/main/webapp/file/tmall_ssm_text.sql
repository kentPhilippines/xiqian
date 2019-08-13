/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.7.17-log : Database - tmall_ssm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tmall_ssm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `tmall_ssm`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '列表id',
  `name` varchar(255) DEFAULT NULL COMMENT '列表名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`name`) values 
(60,'安全座椅'),
(64,'太阳镜'),
(68,'品牌女装'),
(69,'时尚男鞋'),
(71,'男士西服'),
(72,'男士手拿包 '),
(73,'男表'),
(74,'女表'),
(75,'空调'),
(76,'冰箱'),
(77,'原汁机'),
(78,'扫地机器人 '),
(79,'平衡车'),
(80,'电热水器'),
(81,'沙发'),
(82,'马桶'),
(83,'平板电视'),
(84,'男童套装');

/*Table structure for table `order_` */

DROP TABLE IF EXISTS `order_`;

CREATE TABLE `order_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderCode` varchar(255) DEFAULT NULL COMMENT '订单编号',
  `address` varchar(255) DEFAULT NULL COMMENT '邮寄地址',
  `post` varchar(255) DEFAULT NULL,
  `receiver` varchar(255) DEFAULT NULL COMMENT '收货人姓名',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `userMessage` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `payDate` datetime DEFAULT NULL COMMENT '支付时间',
  `deliveryDate` datetime DEFAULT NULL,
  `confirmDate` datetime DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `fk_order_user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

/*Data for the table `order_` */

/*Table structure for table `orderitem` */

DROP TABLE IF EXISTS `orderitem`;

CREATE TABLE `orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orderitem_user` (`uid`),
  KEY `fk_orderitem_product` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

/*Data for the table `orderitem` */

insert  into `orderitem`(`id`,`pid`,`oid`,`uid`,`number`) values 
(1,150,1,1,1),
(2,375,NULL,2,1),
(3,89,2,2,1),
(4,963,NULL,2,2),
(5,963,4,5,6),
(6,89,5,5,1),
(7,150,7,5,1),
(8,205,9,5,1),
(9,149,13,5,1),
(10,149,25,5,1),
(11,149,36,5,1),
(12,205,37,5,1),
(13,963,38,5,1),
(14,963,39,5,1),
(15,963,40,5,1),
(16,965,41,5,2),
(17,965,43,5,1),
(18,965,44,5,1),
(19,965,45,5,1),
(20,966,46,5,1),
(21,966,47,5,1),
(22,966,49,5,1),
(23,966,50,5,2),
(24,966,51,5,1),
(25,966,52,5,1),
(26,966,53,5,1),
(27,966,54,5,1),
(28,966,55,5,1),
(29,966,56,5,1),
(30,966,57,5,1),
(31,966,58,5,1),
(32,966,59,5,1),
(33,966,60,5,1),
(34,966,61,5,1),
(35,966,62,5,1),
(36,966,63,5,1),
(37,966,64,5,1),
(38,966,65,5,1);

/*Table structure for table `payurl` */

DROP TABLE IF EXISTS `payurl`;

CREATE TABLE `payurl` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `url` varchar(255) NOT NULL COMMENT '付款路径',
  `version` varchar(20) NOT NULL COMMENT '付款路径版本号',
  `cmd` varchar(255) NOT NULL COMMENT '付款路径接口命令字',
  `appId` varchar(255) NOT NULL COMMENT '付款商家号',
  `sumbitDete` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `payurl` */

insert  into `payurl`(`id`,`url`,`version`,`cmd`,`appId`,`sumbitDete`) values 
(2,'http://zs.qilijiakeji.com:18000/GW/fastpay.do','2.0','FASTPAY','mx_shop04','2019-06-20');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `subTitle` varchar(255) DEFAULT NULL,
  `originalPrice` float DEFAULT NULL,
  `promotePrice` float DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=967 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`id`,`name`,`subTitle`,`originalPrice`,`promotePrice`,`stock`,`cid`,`createDate`) values 
(87,'Konka/康佳 LED32S1卧室32吋安卓智能无线WIFI网络液晶平板电视机','32吋电视机 8核智能 网络 全国联保 送货上门',1699,1104.35,98,83,'2016-08-13 16:43:32'),
(88,'Hisense/海信 LED49EC320A 49吋led液晶电视机智能网络平板电视50','新品特惠 十核智能 内置WiFi 咨询有惊喜',2799,1679.4,90,83,'2016-07-28 16:43:38'),
(89,'Hisense/海信 LED40EC520UA 40英寸4K智能平板液晶电视机WIFI网络','周末 特惠 2189 元还送 精美礼品',2399,1439.4,82,83,'2016-07-28 16:44:18'),
(90,'Changhong/长虹 65S1安卓智能12核65英寸网络平板LED液晶电视机70','屏大影院 高配12核 安卓智能',4499.01,3824.16,84,83,'2016-08-13 16:44:39'),
(91,'夏普屏PANDA/熊猫 LE39D71S 39英寸智能WiFi液晶平板电视40 42 43','',2499,1874.25,75,83,'2016-07-18 16:45:05'),
(147,'乐洁士智能马桶高品质全自动遥控感应一体式智能坐便器座便器','全国联保 清洗烘干 气泡按摩 座圈加热 断电冲水',8960,8512,62,82,'2016-08-15 00:37:21'),
(148,'箭牌马桶/ARROW AB1118脲醛盖板连体喷射虹吸式坐便器座便器正品','领券更优惠 品质脲醛盖 千城送装 送安装配件',1976,1482,65,82,'2016-07-29 00:37:23'),
(149,'纳蒂兰卡1066卫浴漩冲虹吸式马桶350坑距坐便器可配智能盖座便器','盖板易拆 送全套配件 500区县 送货入户安装',1670,1503,93,82,'2016-07-20 00:37:25'),
(150,'德国DGPOSY超漩式彩色马桶缓降坐便器静音节水抽水马桶连体座便器','纳米自洁釉 漩涡排污 静音节水 净重50kg',2399,1799.25,79,82,'2016-07-31 00:37:27'),
(151,'纳蒂兰卡 1082卫浴洁具 钻石切边 坐便器 虹吸式抽水马桶 座便器','高性价比 造型新颖 钻石品质 时尚尊贵 好评如潮',1900,1710,64,82,'2016-08-03 00:37:29'),
(202,'新款布艺沙发 可拆洗大小户型客厅简约家居贵妃组合L型转角布沙发','',5198,3638.6,94,81,'2016-08-20 00:45:28'),
(203,'凯米蒂亚欧式真皮沙发组合客厅奢华转角皮艺蓝色沙发美式实木家具','匠心独运 欧式美式设计 头层真皮 三包到家',18398,11038.8,27,81,'2016-08-19 00:45:32'),
(204,'南台布艺沙发组合可拆洗简约现代客厅整装家具布艺沙发组合大户型','16CM坐垫 16CM坐垫 重要的 事情 说三遍',6576,4274.4,63,81,'2016-08-16 00:45:36'),
(205,'依然美佳欧式布艺沙发组合可拆洗新款实木雕花大户型奢华别墅家具','高档户型客厅 精湛雕花工艺 实木框架 经典款式',10012,7008.4,51,81,'2016-08-08 00:45:39'),
(206,'雅居汇欧式沙发组合实木雕花客厅高档奢华大户型住宅家具布艺沙发','热卖推荐 端庄大气 四色可选 五年质保 品质服务',32450,22715,51,81,'2016-08-02 00:45:44'),
(262,'Vatti/华帝 DDF60-i14007 60升遥控电储水式电热水器家用速热洗澡','热水器狂欢 专享特价 送货入户 免费安装',2399,1439.4,80,80,'2016-08-01 00:52:47'),
(263,'Haier/海尔 EC6005-T+  60升电热水器  洗澡淋浴 防电墙 送装同步','3D速热 即用即洗 遥控智能控制 预约洗',1999,1299.35,37,80,'2016-08-10 00:52:49'),
(264,'哆啦A梦weber I2-80 威博电热水器80升储水式智能速热洗澡淋浴60','阿里智能 每天限送 20份大礼包 全国联保 包邮',1799,1079.4,79,80,'2016-08-10 00:52:52'),
(265,'Vanward/万和 DSCF50-C32双盾电热水器速热联保安装 洗澡 50L省电','搪瓷超强内胆 高效节能 迅电速热 双盾保护',999,699.3,17,80,'2016-07-31 00:52:54'),
(266,'Haier/海尔 EC8003-I/80升洗澡淋浴/储热电热水器防电墙/送货入户','机控遥控 一级节能 自动关机 触摸智能控制',1799,1169.35,71,80,'2016-07-14 00:52:56'),
(317,'乐行天下R1N智能电动平衡车双轮成人思维体感车两轮儿童代步车','12期免息 智能显示屏 APP遥控 双轮平衡',15960,11970,15,79,'2016-07-09 00:59:24'),
(318,'乐途智能电动悬浮滑板车太空轮平行车蓝牙自平衡独轮代步车','电动平衡 独轮滑板 蓝牙播放 新潮代步车',3885,3690.75,70,79,'2016-07-08 00:59:25'),
(319,'瑞士米高micro g-bike+ chopper儿童平衡车二轮自行车','',899,809.1,13,79,'2016-07-12 00:59:27'),
(320,'力达康成人电动滑板车折叠锂电池迷你型可折叠两轮代步车','可折叠 退货赔运费 续航50 公里更轻更远',4160,2912,82,79,'2016-08-19 00:59:28'),
(321,'两轮平衡车双轮儿童思维漂移电动扭扭车智能滑板车成人体感代步车','',889,755.65,64,79,'2016-08-09 00:59:29'),
(373,'洁霸BF522多功能洗地机刷地机酒店家用地毯清洗机 擦地机抛光机','纯铜电机 厂家直销 售后无忧',1900,1235,39,78,'2016-07-21 01:06:32'),
(374,'Proscenic Swan天鹅扫地机器人 智能家用擦地机拖地全自动吸尘器','非常夏日 直降300元 WIFI智控 卷吸互换',6580,4935,65,78,'2016-07-08 01:06:34'),
(375,'海尔拖地机器人家用全自动擦地机湿拖扫洗地电动智能懒人无线超薄','仿人跪式 干湿两拖 自动充电 精准导航 规划清洁',3999,2999.25,30,78,'2016-07-21 01:06:37'),
(376,'莱克扫地吸尘器 家用超薄拖地机器人WR10智能静音全自动','新品上市 3000pa 大吸力 无惧毛发缠绕',1299,974.25,11,78,'2016-07-18 01:06:39'),
(377,'公众智能扫地机器人家用全自动电动清洁地毯擦拖地一体机吸尘器','扫拖一体 纤薄高效锂电 限时疯抢 不缠毛发',2499,2124.15,88,78,'2016-07-19 01:06:41'),
(429,'Philips/飞利浦榨汁机原汁家用HR1884多功能水果冰淇淋机慢汁机','',2899,1884.35,40,77,'2016-07-14 01:14:03'),
(430,'Whirlpool/惠而浦WJU-VP152B原汁机多功能家用大口径料理榨果汁机','整投整榨 原汁无氧化 纯铜电机 三挡压榨',1099,824.25,22,77,'2016-08-24 01:14:05'),
(431,'Ranbem/瑞本611原汁机大口径低慢速榨汁家用水果汁迷你豆浆机电动','新款上市 96mm口径 45慢磨转速 出汁率高',2680,2278,35,77,'2016-07-21 01:14:08'),
(432,'AUX/奥克斯 AUX-Y3802原汁机低速 慢磨水果榨汁机果汁机','',999,799.2,50,77,'2016-07-15 01:14:12'),
(433,'惠而浦WJU-VS208J原汁机家用慢榨多功能榨汁机果汁机豆浆机炸汁机','大功率慢榨 浓度调节 噪音小 易清洗 快捷清洗',1499,1124.25,35,77,'2016-08-12 01:14:14'),
(449,'MeiLing/美菱 BCD-560WUCX对开门电冰箱家用冰箱WIFI智能风冷无霜','家用冰箱 WIFI智能 风冷无霜',3399,3059.1,54,76,'2016-08-14 01:19:59'),
(450,'FRESTECH/新飞 BCD-286WDKSM阿里云智能wifi风冷无霜智控两门冰箱','阿里云智能 远程WIFI 智控 风冷无霜',3599,2879.2,68,76,'2016-08-05 01:20:00'),
(451,'Konka/康佳 BCD-558WEGY5SWT对开冰箱家用一级节能风冷无霜电冰箱','阿里云智能 风冷无霜 大容量 一级能效节能',3000,1800,74,76,'2016-07-24 01:20:03'),
(452,'【阿里智能】Galanz/格兰仕 BCD-251WTHG(T) 三门电冰箱251升风冷','风冷无霜 一级能效 智能控温 菱格面板 立体风',3299,2474.25,63,76,'2016-07-27 01:20:05'),
(453,'Haier/海尔 BCD-618WDVGU1海尔变频对开门风冷智能控温双门电冰箱','手机智能控制 玫瑰金外观 杀菌净味系统 变频',6999,5949.15,22,76,'2016-08-11 01:20:07'),
(509,'AUX/奥克斯 KFR-26GW/BpTYC19+1大1匹高端智能云变频冷暖挂机空调','30秒速冷 一级能效 ECO节能 阿里智能 除湿',3799,2659.3,15,75,'2016-08-01 01:27:18'),
(510,'Kelon/科龙 KFR-26GW/EFQRA2(1N20) 大1匹二级变频智能冷暖挂机','二级变频 阿里智能 高效除甲醛 快速制冷暖',2599,1559.4,78,75,'2016-08-08 01:27:20'),
(511,'TCL KFRd-35GW/EP13 大1.5匹冷暖电辅空调1.5P挂机定频壁挂式包邮','快速冷暖 四重静音 每日前5名 好礼2选1',2399,1679.3,64,75,'2016-07-21 01:27:22'),
(512,'Panasonic/松下 KFR-36GW/BpSJ1S大1.5匹直流变频冷暖挂式空调','原装变频压缩 机静音除雾霾 送货入户 0元分期',3999,3599.1,59,75,'2016-07-16 01:27:25'),
(513,'Panasonic/松下 KFR-36GW/SH2-1大1.5匹二级能效静音空调挂机','原装压缩机 品质保证 二级能效',3399,3059.1,71,75,'2016-07-12 01:27:27'),
(565,'正品雷克斯韩版简约时尚潮流真皮石英情侣表女士手表女表皮带防水','时尚之选 做精致女人 精美包装 支持货到付款',1280,896,82,74,'2016-08-22 01:34:54'),
(566,'正港手表女四叶草防水手链表简约潮流学生女表韩版时尚石英表正品','热销万只 4.9分好评 代写贺卡 质保一年',143.71,114.968,23,74,'2016-08-25 01:34:57'),
(567,'罗宾 钢带女表 女士腕表 水钻夜光防水石英表 潮流时尚复古手表女','正品 水钻刻度 钢带女表 买一送三 赠送运费险',990,792,54,74,'2016-07-11 01:34:59'),
(568,'浪铂正品长方形手表女表皮带时尚潮流石英表防水真皮学生休闲腕表','今日拍下 自动减30 送真皮表带 石榴石手链',998,598.8,81,74,'2016-07-26 01:35:02'),
(569,'宾格手表正品女式精钢腕表大表盘全自动机械表防水情侣表女表真皮','陈小春代言 宾格正品 情侣手表 同款还有男表',488,341.6,16,74,'2016-07-19 01:35:05'),
(620,'依伦新款超薄手表 男表真皮带休闲时尚男士腕表潮流防水石英表','简约两针 深度防水 进口机芯 送真皮表带 运费险',1280,1024,64,73,'2016-08-11 01:42:48'),
(621,'【入门】西铁城CITIZEN新品超值体验机械手表男表NH8350-59AB/EB','全国联保 3期0利息 大气简约 新品',1700,1445,60,73,'2016-08-13 01:42:51'),
(622,'正品手表男精钢商务休闲男士手表石英表时尚潮流夜光超薄男表防水','机构质检 防水夜光 赠送皮表带 特价抢购',699,489.3,34,73,'2016-08-25 01:42:54'),
(623,'正品名仕爵手表男机械表夜光精钢防水大表盘 全自动时尚潮流男表','终身保修 正品 全自动 机械表 镂空机械表',1900,1140,85,73,'2016-08-25 01:42:57'),
(624,'飞克手表 男表皮带手表 防水商务休闲男士手表 腕表 石英表手表','正品进口机芯 蓝宝石镜面 指针星期显示',1999,1199.4,82,73,'2016-08-05 01:43:00'),
(673,'劳迪莱斯男士手包休闲手拿包牛皮大容量钱包男包软面小包包手抓包','牛皮手包 耐磨耐用 多卡位设计',185,157.25,24,72,'2016-07-21 01:50:46'),
(674,'英伦邦纹男士手包牛皮大容量真皮手拿包手抓包双拉链商务正品软皮','意大利牛皮 纹路自然漂亮 更耐用更尊贵 手感棒',588,411.6,42,72,'2016-08-23 01:50:48'),
(675,'唯美诺新款男士手包男包真皮大容量小羊皮手拿包信封包软皮夹包潮','优质羊皮 大容量 品牌做工 超软手感 终身包保修',498,448.2,84,72,'2016-07-30 01:50:52'),
(676,'宾度 男士手包真皮大容量手拿包牛皮个性潮男包手抓包软皮信封包','专注品质领卷 顺丰包邮 头层牛皮 大容量 软皮',568,511.2,79,72,'2016-08-04 01:50:54'),
(677,'MAXFEEL休闲男士手包真皮手拿包大容量信封包手抓包夹包软韩版潮','无理由退换货 赠退货运费险',888,799.2,98,72,'2016-07-21 01:50:58'),
(729,'【新】罗蒙羊毛西服套装男修身商务职业装2016年秋季新款#1S51126','',2199,1759.2,96,71,'2016-08-04 01:57:55'),
(730,'男士西服套装修身英伦竖条纹休闲西装男套装三件套新郎结婚礼服春','今赠马甲衬衫 精致竖条纹 奢华品质 精细做工',729,437.4,30,71,'2016-07-20 01:57:57'),
(731,'西服套装男夏季新郎结婚礼服三件套伴郎服薄款西服大码西装男套装','亮眼帅气 优雅休闲 格调气质 时尚格子 结婚首选',1988,1491,10,71,'2016-08-10 01:57:59'),
(732,'三件套Actionmates新款韩版修身休闲格子西服套装男士小西装礼服','韩国进口面料 韩版立体裁剪 版型好 送领结领带',799,479.4,56,71,'2016-07-16 01:58:02'),
(733,'Action mates韩版修身男士西服套装发型师休闲小西装结婚礼服潮','包邮申通 韩版修身 版型好 不容错过',699,419.4,79,71,'2016-07-07 01:58:04'),
(784,'DOGEXI透气真皮男鞋子雕花男士休闲鞋反绒皮英伦低帮板鞋男潮鞋秋','牛皮鞋面 猪皮内里 标准运动鞋码',289,202.3,21,69,'2016-08-13 02:06:10'),
(785,'花花公子男鞋夏季小白鞋男士休闲鞋白鞋板鞋白色平底百搭鞋子男潮','天猫正品 百搭小白鞋 顺丰包邮',330,313.5,44,69,'2016-08-20 02:06:14'),
(786,'花花公子皮鞋男士商务休闲男鞋夏季英伦真皮系带休闲鞋男板鞋子','高端大气 商务休闲 时尚潮流 全国包邮 赠运费险',368,294.4,23,69,'2016-08-11 02:06:17'),
(787,'酷队秋季运动鞋情侣鞋跑步鞋潮男鞋子透气休闲鞋飞织低帮潮鞋系带','',328,229.6,73,69,'2016-08-04 02:06:20'),
(788,'木林森夏季男鞋休闲鞋男英伦真皮男士休闲皮鞋圆头系带青年潮鞋子','头层牛皮 时尚休闲 韩版潮流 型男必备',326,293.4,96,69,'2016-08-17 02:06:24'),
(844,'拉夏贝尔puella普埃拉2016休闲修身五分袖一字领收腰套装20007986','',369,350.55,71,68,'2016-08-14 02:13:28'),
(845,'拉夏贝尔 7m莫丽菲尔2016秋新款条纹五分袖连衣裙套装女70006522','8月3日 新品',399,299.25,79,68,'2016-07-10 02:13:30'),
(846,'女巫2016欧洲站夏季新品欧美时尚绣花衬衣上衣九分裤两件套装高端','女巫高端定制 欧美时尚 两件套',928,835.2,29,68,'2016-08-10 02:13:32'),
(847,'妖精的口袋P360度漂浮秋装欧美半身裙短款外套时尚套装女两件套','口袋特殊材质 拼接 品质扣子 水洗色 套装',399,319.2,73,68,'2016-08-18 02:13:35'),
(848,'妖精的口袋P几枚礼物秋装甜美连帽短外套印花休闲裤时尚套装女','帽里撞色 植绒抽绳装饰 质感吊钟 图案印花 套装',339,322.05,87,68,'2016-08-15 02:13:37'),
(899,'新款男士偏光太阳镜日夜两用墨镜潮运动开车专用驾驶偏光镜夜视镜','时尚新款 铝镁纤维镜架 科技动感',580,551,91,64,'2016-08-06 02:21:07'),
(900,'变色眼镜男女款半框太阳镜大框潮流防辐射防紫外防蓝光近视镜护目','',200,170,77,64,'2016-07-27 02:21:10'),
(901,'帕莎Prsr太阳镜女偏光镜潮范冰冰同款女士眼镜可配近视墨镜T60017','镜片 防紫外线 超轻材质 记忆材质',780,624,86,64,'2016-08-16 02:21:13'),
(902,'陌森太阳眼镜男女2016偏光定制驾驶近视墨镜有带度数的莫森MS8006','加拍镜片可配 近视： 原装无度数！ 顺丰包邮',798,518.7,45,64,'2016-08-03 02:21:17'),
(903,'好先生同款墨镜孙红雷偏光男士太阳镜韩明星女款圆脸方框金属近视','偏光 圆脸 方框',150,97.5,84,64,'2016-08-12 02:21:20'),
(958,'惠尔顿儿童安全座椅isofix硬接口汽车用安全坐椅9个月-12岁酷睿宝','双接口固定 夏克立推荐 好评如潮',2848,1993.6,52,60,'2016-07-25 02:29:07'),
(959,'好孩子汽车儿童安全座椅goodbaby9个月－12岁宝宝座椅cs668侧碰王','开团3秒半价 475元 提前购买 咨询客服',1999,1199.4,89,60,'2016-07-17 02:29:10'),
(960,'REEBABY儿童安全座椅9个月-12岁宝宝婴儿汽车用坐椅车载 3C认证','睿睿熊定制款 合金钢骨架 全国包邮',1280,1216,71,60,'2016-07-26 02:29:13'),
(961,'REEBABY汽车儿童安全座椅ISOFIX 0-4-6-12岁婴儿宝宝新生儿可躺','165度超大 躺角 0-12岁 正反双向 安装',1680,1344,59,60,'2016-08-21 02:29:16'),
(962,'新生儿婴儿提篮式安全座椅汽车用车载儿童安全坐椅宝宝摇篮便携式','法国畅销品牌 ITW卡扣 环保针织面料',980,882,16,60,'2016-08-09 02:29:19'),
(963,'男童装秋冬款套装婴儿小童衣服宝宝冬装0-1-2岁半加厚棉衣外套潮','秋冬款套装婴儿小童衣服宝宝冬装',99.98,19.98,99,84,NULL);

/*Table structure for table `product_attribute` */

DROP TABLE IF EXISTS `product_attribute`;

CREATE TABLE `product_attribute` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `productid` int(10) NOT NULL COMMENT '商品id',
  `attributeNameId` varchar(62) DEFAULT NULL COMMENT '商品属性值分类id',
  `attributeName` varchar(50) NOT NULL COMMENT '属性名',
  `attributeValue` varchar(255) NOT NULL COMMENT '属性值',
  `sunbitDate` date DEFAULT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `product_attribute` */

/*Table structure for table `productimage` */

DROP TABLE IF EXISTS `productimage`;

CREATE TABLE `productimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_productimage_product` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=10228 DEFAULT CHARSET=utf8;

/*Data for the table `productimage` */

insert  into `productimage`(`id`,`pid`,`type`) values 
(629,87,'type_single'),
(630,87,'type_single'),
(631,87,'type_single'),
(632,87,'type_single'),
(633,87,'type_detail'),
(634,87,'type_detail'),
(635,87,'type_detail'),
(636,87,'type_detail'),
(637,87,'type_detail'),
(638,87,'type_detail'),
(639,88,'type_single'),
(640,88,'type_single'),
(641,88,'type_single'),
(642,88,'type_single'),
(643,88,'type_single'),
(644,88,'type_detail'),
(645,88,'type_detail'),
(646,88,'type_detail'),
(647,88,'type_detail'),
(648,88,'type_detail'),
(649,88,'type_detail'),
(650,89,'type_single'),
(651,89,'type_single'),
(652,89,'type_single'),
(653,89,'type_single'),
(654,89,'type_single'),
(655,89,'type_detail'),
(656,89,'type_detail'),
(657,89,'type_detail'),
(658,89,'type_detail'),
(659,89,'type_detail'),
(660,89,'type_detail'),
(661,90,'type_single'),
(662,90,'type_single'),
(663,90,'type_single'),
(664,90,'type_single'),
(665,90,'type_single'),
(666,90,'type_detail'),
(667,90,'type_detail'),
(668,90,'type_detail'),
(669,90,'type_detail'),
(670,90,'type_detail'),
(671,90,'type_detail'),
(672,91,'type_single'),
(673,91,'type_single'),
(674,91,'type_single'),
(675,91,'type_single'),
(676,91,'type_single'),
(677,91,'type_detail'),
(678,91,'type_detail'),
(679,91,'type_detail'),
(680,91,'type_detail'),
(681,91,'type_detail'),
(682,91,'type_detail'),
(1276,147,'type_single'),
(1277,147,'type_single'),
(1278,147,'type_single'),
(1279,147,'type_single'),
(1280,147,'type_single'),
(1281,147,'type_detail'),
(1282,147,'type_detail'),
(1283,147,'type_detail'),
(1284,147,'type_detail'),
(1285,147,'type_detail'),
(1286,147,'type_detail'),
(1287,148,'type_single'),
(1288,148,'type_single'),
(1289,148,'type_single'),
(1290,148,'type_single'),
(1291,148,'type_single'),
(1292,148,'type_detail'),
(1293,148,'type_detail'),
(1294,148,'type_detail'),
(1295,148,'type_detail'),
(1296,148,'type_detail'),
(1297,148,'type_detail'),
(1298,149,'type_single'),
(1299,149,'type_single'),
(1300,149,'type_single'),
(1301,149,'type_single'),
(1302,149,'type_single'),
(1303,149,'type_detail'),
(1304,149,'type_detail'),
(1305,149,'type_detail'),
(1306,149,'type_detail'),
(1307,149,'type_detail'),
(1308,149,'type_detail'),
(1309,150,'type_single'),
(1310,150,'type_single'),
(1311,150,'type_single'),
(1312,150,'type_single'),
(1313,150,'type_single'),
(1314,150,'type_detail'),
(1315,150,'type_detail'),
(1316,150,'type_detail'),
(1317,150,'type_detail'),
(1318,150,'type_detail'),
(1319,150,'type_detail'),
(1320,151,'type_single'),
(1321,151,'type_single'),
(1322,151,'type_single'),
(1323,151,'type_single'),
(1324,151,'type_single'),
(1325,151,'type_detail'),
(1326,151,'type_detail'),
(1327,151,'type_detail'),
(1328,151,'type_detail'),
(1329,151,'type_detail'),
(1330,151,'type_detail'),
(1880,202,'type_single'),
(1881,202,'type_single'),
(1882,202,'type_single'),
(1883,202,'type_single'),
(1884,202,'type_single'),
(1885,202,'type_detail'),
(1886,202,'type_detail'),
(1887,202,'type_detail'),
(1888,202,'type_detail'),
(1889,202,'type_detail'),
(1890,202,'type_detail'),
(1891,203,'type_single'),
(1892,203,'type_single'),
(1893,203,'type_single'),
(1894,203,'type_single'),
(1895,203,'type_single'),
(1896,203,'type_detail'),
(1897,203,'type_detail'),
(1898,203,'type_detail'),
(1899,203,'type_detail'),
(1900,203,'type_detail'),
(1901,203,'type_detail'),
(1902,204,'type_single'),
(1903,204,'type_single'),
(1904,204,'type_single'),
(1905,204,'type_single'),
(1906,204,'type_single'),
(1907,204,'type_detail'),
(1908,204,'type_detail'),
(1909,204,'type_detail'),
(1910,204,'type_detail'),
(1911,204,'type_detail'),
(1912,204,'type_detail'),
(1913,205,'type_single'),
(1914,205,'type_single'),
(1915,205,'type_single'),
(1916,205,'type_single'),
(1917,205,'type_single'),
(1918,205,'type_detail'),
(1919,205,'type_detail'),
(1920,205,'type_detail'),
(1921,205,'type_detail'),
(1922,205,'type_detail'),
(1923,205,'type_detail'),
(1924,206,'type_single'),
(1925,206,'type_single'),
(1926,206,'type_single'),
(1927,206,'type_single'),
(1928,206,'type_single'),
(1929,206,'type_detail'),
(1930,206,'type_detail'),
(1931,206,'type_detail'),
(1932,206,'type_detail'),
(1933,206,'type_detail'),
(1934,206,'type_detail'),
(2533,262,'type_single'),
(2534,262,'type_single'),
(2535,262,'type_single'),
(2536,262,'type_single'),
(2537,262,'type_single'),
(2538,262,'type_detail'),
(2539,262,'type_detail'),
(2540,262,'type_detail'),
(2541,262,'type_detail'),
(2542,262,'type_detail'),
(2543,262,'type_detail'),
(2544,263,'type_single'),
(2545,263,'type_single'),
(2546,263,'type_single'),
(2547,263,'type_single'),
(2548,263,'type_single'),
(2549,263,'type_detail'),
(2550,263,'type_detail'),
(2551,263,'type_detail'),
(2552,263,'type_detail'),
(2553,263,'type_detail'),
(2554,263,'type_detail'),
(2555,264,'type_single'),
(2556,264,'type_single'),
(2557,264,'type_single'),
(2558,264,'type_single'),
(2559,264,'type_single'),
(2560,264,'type_detail'),
(2561,264,'type_detail'),
(2562,264,'type_detail'),
(2563,264,'type_detail'),
(2564,264,'type_detail'),
(2565,264,'type_detail'),
(2566,265,'type_single'),
(2567,265,'type_single'),
(2568,265,'type_single'),
(2569,265,'type_single'),
(2570,265,'type_single'),
(2571,265,'type_detail'),
(2572,265,'type_detail'),
(2573,265,'type_detail'),
(2574,265,'type_detail'),
(2575,265,'type_detail'),
(2576,265,'type_detail'),
(2577,266,'type_single'),
(2578,266,'type_single'),
(2579,266,'type_single'),
(2580,266,'type_single'),
(2581,266,'type_single'),
(2582,266,'type_detail'),
(2583,266,'type_detail'),
(2584,266,'type_detail'),
(2585,266,'type_detail'),
(2586,266,'type_detail'),
(2587,266,'type_detail'),
(3134,317,'type_single'),
(3135,317,'type_single'),
(3136,317,'type_single'),
(3137,317,'type_single'),
(3138,317,'type_single'),
(3139,317,'type_detail'),
(3140,317,'type_detail'),
(3141,317,'type_detail'),
(3142,317,'type_detail'),
(3143,317,'type_detail'),
(3144,317,'type_detail'),
(3145,318,'type_single'),
(3146,318,'type_single'),
(3147,318,'type_single'),
(3148,318,'type_single'),
(3149,318,'type_single'),
(3150,318,'type_detail'),
(3151,318,'type_detail'),
(3152,318,'type_detail'),
(3153,318,'type_detail'),
(3154,318,'type_detail'),
(3155,318,'type_detail'),
(3156,319,'type_single'),
(3157,319,'type_single'),
(3158,319,'type_single'),
(3159,319,'type_single'),
(3160,319,'type_single'),
(3161,319,'type_detail'),
(3162,319,'type_detail'),
(3163,319,'type_detail'),
(3164,319,'type_detail'),
(3165,319,'type_detail'),
(3166,319,'type_detail'),
(3167,320,'type_single'),
(3168,320,'type_single'),
(3169,320,'type_single'),
(3170,320,'type_single'),
(3171,320,'type_single'),
(3172,320,'type_detail'),
(3173,320,'type_detail'),
(3174,320,'type_detail'),
(3175,320,'type_detail'),
(3176,320,'type_detail'),
(3177,320,'type_detail'),
(3178,321,'type_single'),
(3179,321,'type_single'),
(3180,321,'type_single'),
(3181,321,'type_single'),
(3182,321,'type_single'),
(3183,321,'type_detail'),
(3184,321,'type_detail'),
(3185,321,'type_detail'),
(3186,321,'type_detail'),
(3187,321,'type_detail'),
(3188,321,'type_detail'),
(3748,373,'type_single'),
(3749,373,'type_single'),
(3750,373,'type_single'),
(3751,373,'type_single'),
(3752,373,'type_single'),
(3753,373,'type_detail'),
(3754,373,'type_detail'),
(3755,373,'type_detail'),
(3756,373,'type_detail'),
(3757,373,'type_detail'),
(3758,373,'type_detail'),
(3759,374,'type_single'),
(3760,374,'type_single'),
(3761,374,'type_single'),
(3762,374,'type_single'),
(3763,374,'type_single'),
(3764,374,'type_detail'),
(3765,374,'type_detail'),
(3766,374,'type_detail'),
(3767,374,'type_detail'),
(3768,374,'type_detail'),
(3769,374,'type_detail'),
(3770,375,'type_single'),
(3771,375,'type_single'),
(3772,375,'type_single'),
(3773,375,'type_single'),
(3774,375,'type_single'),
(3775,375,'type_detail'),
(3776,375,'type_detail'),
(3777,375,'type_detail'),
(3778,375,'type_detail'),
(3779,375,'type_detail'),
(3780,375,'type_detail'),
(3781,376,'type_single'),
(3782,376,'type_single'),
(3783,376,'type_single'),
(3784,376,'type_single'),
(3785,376,'type_single'),
(3786,376,'type_detail'),
(3787,376,'type_detail'),
(3788,376,'type_detail'),
(3789,376,'type_detail'),
(3790,376,'type_detail'),
(3791,376,'type_detail'),
(3792,377,'type_single'),
(3793,377,'type_single'),
(3794,377,'type_single'),
(3795,377,'type_single'),
(3796,377,'type_single'),
(3797,377,'type_detail'),
(3798,377,'type_detail'),
(3799,377,'type_detail'),
(3800,377,'type_detail'),
(3801,377,'type_detail'),
(3802,377,'type_detail'),
(4354,429,'type_single'),
(4355,429,'type_single'),
(4356,429,'type_single'),
(4357,429,'type_single'),
(4358,429,'type_single'),
(4359,429,'type_detail'),
(4360,429,'type_detail'),
(4361,429,'type_detail'),
(4362,429,'type_detail'),
(4363,429,'type_detail'),
(4364,429,'type_detail'),
(4365,430,'type_single'),
(4366,430,'type_single'),
(4367,430,'type_single'),
(4368,430,'type_single'),
(4369,430,'type_single'),
(4370,430,'type_detail'),
(4371,430,'type_detail'),
(4372,430,'type_detail'),
(4373,430,'type_detail'),
(4374,430,'type_detail'),
(4375,430,'type_detail'),
(4376,431,'type_single'),
(4377,431,'type_single'),
(4378,431,'type_single'),
(4379,431,'type_single'),
(4380,431,'type_single'),
(4381,431,'type_detail'),
(4382,431,'type_detail'),
(4383,431,'type_detail'),
(4384,431,'type_detail'),
(4385,431,'type_detail'),
(4386,431,'type_detail'),
(4387,432,'type_single'),
(4388,432,'type_single'),
(4389,432,'type_single'),
(4390,432,'type_single'),
(4391,432,'type_detail'),
(4392,432,'type_detail'),
(4393,432,'type_detail'),
(4394,432,'type_detail'),
(4395,432,'type_detail'),
(4396,432,'type_detail'),
(4397,433,'type_single'),
(4398,433,'type_single'),
(4399,433,'type_single'),
(4400,433,'type_single'),
(4401,433,'type_single'),
(4402,433,'type_detail'),
(4403,433,'type_detail'),
(4404,433,'type_detail'),
(4405,433,'type_detail'),
(4406,433,'type_detail'),
(4407,433,'type_detail'),
(4573,449,'type_single'),
(4574,449,'type_single'),
(4575,449,'type_single'),
(4576,449,'type_single'),
(4577,449,'type_detail'),
(4578,449,'type_detail'),
(4579,449,'type_detail'),
(4580,449,'type_detail'),
(4581,449,'type_detail'),
(4582,449,'type_detail'),
(4583,450,'type_single'),
(4584,450,'type_single'),
(4585,450,'type_single'),
(4586,450,'type_single'),
(4587,450,'type_single'),
(4588,450,'type_detail'),
(4589,450,'type_detail'),
(4590,450,'type_detail'),
(4591,450,'type_detail'),
(4592,450,'type_detail'),
(4593,450,'type_detail'),
(4594,451,'type_single'),
(4595,451,'type_single'),
(4596,451,'type_single'),
(4597,451,'type_single'),
(4598,451,'type_single'),
(4599,451,'type_detail'),
(4600,451,'type_detail'),
(4601,451,'type_detail'),
(4602,451,'type_detail'),
(4603,451,'type_detail'),
(4604,451,'type_detail'),
(4605,452,'type_single'),
(4606,452,'type_single'),
(4607,452,'type_single'),
(4608,452,'type_single'),
(4609,452,'type_detail'),
(4610,452,'type_detail'),
(4611,452,'type_detail'),
(4612,452,'type_detail'),
(4613,452,'type_detail'),
(4614,452,'type_detail'),
(4615,453,'type_single'),
(4616,453,'type_single'),
(4617,453,'type_single'),
(4618,453,'type_single'),
(4619,453,'type_single'),
(4620,453,'type_detail'),
(4621,453,'type_detail'),
(4622,453,'type_detail'),
(4623,453,'type_detail'),
(4624,453,'type_detail'),
(4625,453,'type_detail'),
(5208,509,'type_single'),
(5209,509,'type_single'),
(5210,509,'type_single'),
(5211,509,'type_single'),
(5212,509,'type_detail'),
(5213,509,'type_detail'),
(5214,509,'type_detail'),
(5215,509,'type_detail'),
(5216,509,'type_detail'),
(5217,509,'type_detail'),
(5218,510,'type_single'),
(5219,510,'type_single'),
(5220,510,'type_single'),
(5221,510,'type_single'),
(5222,510,'type_single'),
(5223,510,'type_detail'),
(5224,510,'type_detail'),
(5225,510,'type_detail'),
(5226,510,'type_detail'),
(5227,510,'type_detail'),
(5228,510,'type_detail'),
(5229,511,'type_single'),
(5230,511,'type_single'),
(5231,511,'type_single'),
(5232,511,'type_single'),
(5233,511,'type_single'),
(5234,511,'type_detail'),
(5235,511,'type_detail'),
(5236,511,'type_detail'),
(5237,511,'type_detail'),
(5238,511,'type_detail'),
(5239,511,'type_detail'),
(5240,512,'type_single'),
(5241,512,'type_single'),
(5242,512,'type_single'),
(5243,512,'type_single'),
(5244,512,'type_single'),
(5245,512,'type_detail'),
(5246,512,'type_detail'),
(5247,512,'type_detail'),
(5248,512,'type_detail'),
(5249,512,'type_detail'),
(5250,512,'type_detail'),
(5251,513,'type_single'),
(5252,513,'type_single'),
(5253,513,'type_single'),
(5254,513,'type_single'),
(5255,513,'type_single'),
(5256,513,'type_detail'),
(5257,513,'type_detail'),
(5258,513,'type_detail'),
(5259,513,'type_detail'),
(5260,513,'type_detail'),
(5261,513,'type_detail'),
(5823,565,'type_single'),
(5824,565,'type_single'),
(5825,565,'type_single'),
(5826,565,'type_single'),
(5827,565,'type_single'),
(5828,565,'type_detail'),
(5829,565,'type_detail'),
(5830,565,'type_detail'),
(5831,565,'type_detail'),
(5832,565,'type_detail'),
(5833,565,'type_detail'),
(5834,566,'type_single'),
(5835,566,'type_single'),
(5836,566,'type_single'),
(5837,566,'type_single'),
(5838,566,'type_single'),
(5839,566,'type_detail'),
(5840,566,'type_detail'),
(5841,566,'type_detail'),
(5842,566,'type_detail'),
(5843,566,'type_detail'),
(5844,566,'type_detail'),
(5845,567,'type_single'),
(5846,567,'type_single'),
(5847,567,'type_single'),
(5848,567,'type_single'),
(5849,567,'type_detail'),
(5850,567,'type_detail'),
(5851,567,'type_detail'),
(5852,567,'type_detail'),
(5853,567,'type_detail'),
(5854,567,'type_detail'),
(5855,568,'type_single'),
(5856,568,'type_single'),
(5857,568,'type_single'),
(5858,568,'type_single'),
(5859,568,'type_single'),
(5860,568,'type_detail'),
(5861,568,'type_detail'),
(5862,568,'type_detail'),
(5863,568,'type_detail'),
(5864,568,'type_detail'),
(5865,568,'type_detail'),
(5866,569,'type_single'),
(5867,569,'type_single'),
(5868,569,'type_single'),
(5869,569,'type_single'),
(5870,569,'type_single'),
(5871,569,'type_detail'),
(5872,569,'type_detail'),
(5873,569,'type_detail'),
(5874,569,'type_detail'),
(5875,569,'type_detail'),
(5876,569,'type_detail'),
(6427,620,'type_single'),
(6428,620,'type_single'),
(6429,620,'type_single'),
(6430,620,'type_single'),
(6431,620,'type_single'),
(6432,620,'type_detail'),
(6433,620,'type_detail'),
(6434,620,'type_detail'),
(6435,620,'type_detail'),
(6436,620,'type_detail'),
(6437,620,'type_detail'),
(6438,621,'type_single'),
(6439,621,'type_single'),
(6440,621,'type_single'),
(6441,621,'type_single'),
(6442,621,'type_single'),
(6443,621,'type_detail'),
(6444,621,'type_detail'),
(6445,621,'type_detail'),
(6446,621,'type_detail'),
(6447,621,'type_detail'),
(6448,621,'type_detail'),
(6449,622,'type_single'),
(6450,622,'type_single'),
(6451,622,'type_single'),
(6452,622,'type_single'),
(6453,622,'type_single'),
(6454,622,'type_detail'),
(6455,622,'type_detail'),
(6456,622,'type_detail'),
(6457,622,'type_detail'),
(6458,622,'type_detail'),
(6459,622,'type_detail'),
(6460,623,'type_single'),
(6461,623,'type_single'),
(6462,623,'type_single'),
(6463,623,'type_single'),
(6464,623,'type_single'),
(6465,623,'type_detail'),
(6466,623,'type_detail'),
(6467,623,'type_detail'),
(6468,623,'type_detail'),
(6469,623,'type_detail'),
(6470,623,'type_detail'),
(6471,624,'type_single'),
(6472,624,'type_single'),
(6473,624,'type_single'),
(6474,624,'type_single'),
(6475,624,'type_single'),
(6476,624,'type_detail'),
(6477,624,'type_detail'),
(6478,624,'type_detail'),
(6479,624,'type_detail'),
(6480,624,'type_detail'),
(6481,624,'type_detail'),
(7010,673,'type_single'),
(7011,673,'type_single'),
(7012,673,'type_single'),
(7013,673,'type_single'),
(7014,673,'type_single'),
(7015,673,'type_detail'),
(7016,673,'type_detail'),
(7017,673,'type_detail'),
(7018,673,'type_detail'),
(7019,673,'type_detail'),
(7020,673,'type_detail'),
(7021,674,'type_single'),
(7022,674,'type_single'),
(7023,674,'type_single'),
(7024,674,'type_single'),
(7025,674,'type_single'),
(7026,674,'type_detail'),
(7027,674,'type_detail'),
(7028,674,'type_detail'),
(7029,674,'type_detail'),
(7030,674,'type_detail'),
(7031,674,'type_detail'),
(7032,675,'type_single'),
(7033,675,'type_single'),
(7034,675,'type_single'),
(7035,675,'type_single'),
(7036,675,'type_single'),
(7037,675,'type_detail'),
(7038,675,'type_detail'),
(7039,675,'type_detail'),
(7040,675,'type_detail'),
(7041,675,'type_detail'),
(7042,675,'type_detail'),
(7043,676,'type_single'),
(7044,676,'type_single'),
(7045,676,'type_single'),
(7046,676,'type_single'),
(7047,676,'type_single'),
(7048,676,'type_detail'),
(7049,676,'type_detail'),
(7050,676,'type_detail'),
(7051,676,'type_detail'),
(7052,676,'type_detail'),
(7053,676,'type_detail'),
(7054,677,'type_single'),
(7055,677,'type_single'),
(7056,677,'type_single'),
(7057,677,'type_single'),
(7058,677,'type_single'),
(7059,677,'type_detail'),
(7060,677,'type_detail'),
(7061,677,'type_detail'),
(7062,677,'type_detail'),
(7063,677,'type_detail'),
(7064,677,'type_detail'),
(7626,729,'type_single'),
(7627,729,'type_single'),
(7628,729,'type_single'),
(7629,729,'type_single'),
(7630,729,'type_single'),
(7631,729,'type_detail'),
(7632,729,'type_detail'),
(7633,729,'type_detail'),
(7634,729,'type_detail'),
(7635,729,'type_detail'),
(7636,729,'type_detail'),
(7637,730,'type_single'),
(7638,730,'type_single'),
(7639,730,'type_single'),
(7640,730,'type_single'),
(7641,730,'type_single'),
(7642,730,'type_detail'),
(7643,730,'type_detail'),
(7644,730,'type_detail'),
(7645,730,'type_detail'),
(7646,730,'type_detail'),
(7647,730,'type_detail'),
(7648,731,'type_single'),
(7649,731,'type_single'),
(7650,731,'type_single'),
(7651,731,'type_single'),
(7652,731,'type_single'),
(7653,731,'type_detail'),
(7654,731,'type_detail'),
(7655,731,'type_detail'),
(7656,731,'type_detail'),
(7657,731,'type_detail'),
(7658,731,'type_detail'),
(7659,732,'type_single'),
(7660,732,'type_single'),
(7661,732,'type_single'),
(7662,732,'type_single'),
(7663,732,'type_single'),
(7664,732,'type_detail'),
(7665,732,'type_detail'),
(7666,732,'type_detail'),
(7667,732,'type_detail'),
(7668,732,'type_detail'),
(7669,732,'type_detail'),
(7670,733,'type_single'),
(7671,733,'type_single'),
(7672,733,'type_single'),
(7673,733,'type_single'),
(7674,733,'type_single'),
(7675,733,'type_detail'),
(7676,733,'type_detail'),
(7677,733,'type_detail'),
(7678,733,'type_detail'),
(7679,733,'type_detail'),
(7680,733,'type_detail'),
(8231,784,'type_single'),
(8232,784,'type_single'),
(8233,784,'type_single'),
(8234,784,'type_single'),
(8235,784,'type_single'),
(8236,784,'type_detail'),
(8237,784,'type_detail'),
(8238,784,'type_detail'),
(8239,784,'type_detail'),
(8240,784,'type_detail'),
(8241,784,'type_detail'),
(8242,785,'type_single'),
(8243,785,'type_single'),
(8244,785,'type_single'),
(8245,785,'type_single'),
(8246,785,'type_single'),
(8247,785,'type_detail'),
(8248,785,'type_detail'),
(8249,785,'type_detail'),
(8250,785,'type_detail'),
(8251,785,'type_detail'),
(8252,785,'type_detail'),
(8253,786,'type_single'),
(8254,786,'type_single'),
(8255,786,'type_single'),
(8256,786,'type_single'),
(8257,786,'type_single'),
(8258,786,'type_detail'),
(8259,786,'type_detail'),
(8260,786,'type_detail'),
(8261,786,'type_detail'),
(8262,786,'type_detail'),
(8263,786,'type_detail'),
(8264,787,'type_single'),
(8265,787,'type_single'),
(8266,787,'type_single'),
(8267,787,'type_single'),
(8268,787,'type_single'),
(8269,787,'type_detail'),
(8270,787,'type_detail'),
(8271,787,'type_detail'),
(8272,787,'type_detail'),
(8273,787,'type_detail'),
(8274,787,'type_detail'),
(8275,788,'type_single'),
(8276,788,'type_single'),
(8277,788,'type_single'),
(8278,788,'type_single'),
(8279,788,'type_single'),
(8280,788,'type_detail'),
(8281,788,'type_detail'),
(8282,788,'type_detail'),
(8283,788,'type_detail'),
(8284,788,'type_detail'),
(8285,788,'type_detail'),
(8891,844,'type_single'),
(8892,844,'type_single'),
(8893,844,'type_single'),
(8894,844,'type_single'),
(8895,844,'type_single'),
(8896,844,'type_detail'),
(8897,844,'type_detail'),
(8898,844,'type_detail'),
(8899,844,'type_detail'),
(8900,844,'type_detail'),
(8901,844,'type_detail'),
(8902,845,'type_single'),
(8903,845,'type_single'),
(8904,845,'type_single'),
(8905,845,'type_single'),
(8906,845,'type_single'),
(8907,845,'type_detail'),
(8908,845,'type_detail'),
(8909,845,'type_detail'),
(8910,845,'type_detail'),
(8911,845,'type_detail'),
(8912,845,'type_detail'),
(8913,846,'type_single'),
(8914,846,'type_single'),
(8915,846,'type_single'),
(8916,846,'type_single'),
(8917,846,'type_single'),
(8918,846,'type_detail'),
(8919,846,'type_detail'),
(8920,846,'type_detail'),
(8921,846,'type_detail'),
(8922,846,'type_detail'),
(8923,846,'type_detail'),
(8924,847,'type_single'),
(8925,847,'type_single'),
(8926,847,'type_single'),
(8927,847,'type_single'),
(8928,847,'type_single'),
(8929,847,'type_detail'),
(8930,847,'type_detail'),
(8931,847,'type_detail'),
(8932,847,'type_detail'),
(8933,847,'type_detail'),
(8934,847,'type_detail'),
(8935,848,'type_single'),
(8936,848,'type_single'),
(8937,848,'type_single'),
(8938,848,'type_single'),
(8939,848,'type_single'),
(8940,848,'type_detail'),
(8941,848,'type_detail'),
(8942,848,'type_detail'),
(8943,848,'type_detail'),
(8944,848,'type_detail'),
(8945,848,'type_detail'),
(9495,899,'type_single'),
(9496,899,'type_single'),
(9497,899,'type_single'),
(9498,899,'type_single'),
(9499,899,'type_single'),
(9500,899,'type_detail'),
(9501,899,'type_detail'),
(9502,899,'type_detail'),
(9503,899,'type_detail'),
(9504,899,'type_detail'),
(9505,899,'type_detail'),
(9506,900,'type_single'),
(9507,900,'type_single'),
(9508,900,'type_single'),
(9509,900,'type_single'),
(9510,900,'type_single'),
(9511,900,'type_detail'),
(9512,900,'type_detail'),
(9513,900,'type_detail'),
(9514,900,'type_detail'),
(9515,900,'type_detail'),
(9516,900,'type_detail'),
(9517,901,'type_single'),
(9518,901,'type_single'),
(9519,901,'type_single'),
(9520,901,'type_single'),
(9521,901,'type_single'),
(9522,901,'type_detail'),
(9523,901,'type_detail'),
(9524,901,'type_detail'),
(9525,901,'type_detail'),
(9526,901,'type_detail'),
(9527,901,'type_detail'),
(9528,902,'type_single'),
(9529,902,'type_single'),
(9530,902,'type_single'),
(9531,902,'type_single'),
(9532,902,'type_single'),
(9533,902,'type_detail'),
(9534,902,'type_detail'),
(9535,902,'type_detail'),
(9536,902,'type_detail'),
(9537,902,'type_detail'),
(9538,902,'type_detail'),
(9539,903,'type_single'),
(9540,903,'type_single'),
(9541,903,'type_single'),
(9542,903,'type_single'),
(9543,903,'type_single'),
(9544,903,'type_detail'),
(9545,903,'type_detail'),
(9546,903,'type_detail'),
(9547,903,'type_detail'),
(9548,903,'type_detail'),
(9549,903,'type_detail'),
(10144,958,'type_single'),
(10145,958,'type_single'),
(10146,958,'type_single'),
(10147,958,'type_single'),
(10148,958,'type_single'),
(10149,958,'type_detail'),
(10150,958,'type_detail'),
(10151,958,'type_detail'),
(10152,958,'type_detail'),
(10153,958,'type_detail'),
(10154,958,'type_detail'),
(10155,959,'type_single'),
(10156,959,'type_single'),
(10157,959,'type_single'),
(10158,959,'type_single'),
(10159,959,'type_single'),
(10160,959,'type_detail'),
(10161,959,'type_detail'),
(10162,959,'type_detail'),
(10163,959,'type_detail'),
(10164,959,'type_detail'),
(10165,959,'type_detail'),
(10166,960,'type_single'),
(10167,960,'type_single'),
(10168,960,'type_single'),
(10169,960,'type_single'),
(10170,960,'type_single'),
(10171,960,'type_detail'),
(10172,960,'type_detail'),
(10173,960,'type_detail'),
(10174,960,'type_detail'),
(10175,960,'type_detail'),
(10176,960,'type_detail'),
(10177,961,'type_single'),
(10178,961,'type_single'),
(10179,961,'type_single'),
(10180,961,'type_single'),
(10181,961,'type_single'),
(10182,961,'type_detail'),
(10183,961,'type_detail'),
(10184,961,'type_detail'),
(10185,961,'type_detail'),
(10186,961,'type_detail'),
(10187,961,'type_detail'),
(10188,962,'type_single'),
(10189,962,'type_single'),
(10190,962,'type_single'),
(10191,962,'type_single'),
(10192,962,'type_single'),
(10193,962,'type_detail'),
(10194,962,'type_detail'),
(10195,962,'type_detail'),
(10196,962,'type_detail'),
(10197,962,'type_detail'),
(10198,962,'type_detail'),
(10211,963,'type_single'),
(10213,963,'type_single'),
(10214,963,'type_detail'),
(10215,963,'type_detail'),
(10216,963,'type_detail'),
(10217,963,'type_detail'),
(10218,963,'type_detail'),
(10219,963,'type_detail'),
(10220,963,'type_single'),
(10221,964,'type_single'),
(10222,964,'type_single'),
(10223,964,'type_detail'),
(10224,964,'type_detail'),
(10225,963,'type_single'),
(10226,965,'type_single'),
(10227,966,'type_single');

/*Table structure for table `property` */

DROP TABLE IF EXISTS `property`;

CREATE TABLE `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_property_category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8;

/*Data for the table `property` */

insert  into `property`(`id`,`cid`,`name`) values 
(1,83,'品牌'),
(2,83,'证书状态'),
(3,83,'3C产品型号'),
(4,83,'申请人名称'),
(5,83,'证书编号'),
(6,83,'分辨率'),
(7,83,'型号'),
(8,83,'制造商名称'),
(9,83,'网络连接方式'),
(10,83,'产品名称'),
(11,83,'能效等级'),
(12,83,'3D类型'),
(13,83,'操作系统'),
(14,82,'品牌'),
(15,82,'冲水按键类型'),
(16,82,'坐便器类型'),
(17,82,'盖板是否缓冲'),
(18,82,'型号'),
(19,82,'坐便器冲水方式'),
(20,82,'排水方式'),
(21,82,'材质'),
(22,82,'最小坑距'),
(23,82,'承重'),
(24,82,'颜色分类'),
(25,82,'坐便冲水量'),
(26,82,'同城服务'),
(27,81,'风格'),
(28,81,'城市'),
(29,81,'面料饰面工艺'),
(30,81,'是否带储物空间'),
(31,81,'包装体积'),
(32,81,'颜色分类'),
(33,81,'附加功能'),
(34,81,'是否可拆洗'),
(35,81,'结构工艺'),
(36,81,'设计元素'),
(37,81,'几人坐'),
(38,81,'图案'),
(39,81,'是否组装'),
(40,81,'面料'),
(41,81,'可送货/安装'),
(42,81,'木质结构工艺'),
(43,81,'沙发组合形式'),
(44,81,'产地'),
(45,81,'是否可定制'),
(46,81,'品牌'),
(47,81,'适用对象'),
(48,81,'材质'),
(49,81,'款式定位'),
(50,81,'填充物'),
(51,81,'填充物硬度'),
(52,81,'出租车是否可运输'),
(53,81,'型号'),
(54,81,'木质材质'),
(55,81,'是否可预售'),
(56,81,'安装说明详情'),
(57,80,'品牌'),
(58,80,'证书状态'),
(59,80,'3C产品型号'),
(60,80,'申请人名称'),
(61,80,'证书编号'),
(62,80,'型号'),
(63,80,'控制方式'),
(64,80,'制造商名称'),
(65,80,'款式'),
(66,80,'产品名称'),
(67,80,'能效等级'),
(68,79,'上市时间'),
(69,79,'款式'),
(70,79,'是否商场同款'),
(71,79,'货号'),
(72,79,'品牌'),
(73,78,'液晶显示'),
(74,78,'尘盒容量'),
(75,78,'外观造型'),
(76,78,'功能'),
(77,78,'最高高度'),
(78,78,'碰撞保护'),
(79,78,'是否自动充电'),
(80,78,'电池容量'),
(81,78,'有无虚拟墙'),
(82,78,'是否有定时预约功能'),
(83,78,'货号'),
(84,78,'颜色分类'),
(85,78,'清扫路线'),
(86,78,'是否带遥控器'),
(87,77,'品牌'),
(88,77,'转速'),
(89,77,'证书状态'),
(90,77,'3C产品型号'),
(91,77,'申请人名称'),
(92,77,'额定功率'),
(93,77,'证书编号'),
(94,77,'型号'),
(95,77,'制造商名称'),
(96,77,'附加功能'),
(97,77,'采购地'),
(98,77,'机身材质'),
(99,77,'颜色分类'),
(100,77,'产品名称'),
(101,77,'操作方式'),
(102,76,'冰箱冷柜机型'),
(103,76,'证书状态'),
(104,76,'箱门结构'),
(105,76,'美菱冰箱型号'),
(106,76,'3C产品型号'),
(107,76,'申请人名称'),
(108,76,'证书编号'),
(109,76,'制造商名称'),
(110,76,'制冷方式'),
(111,76,'产品名称'),
(112,76,'能效等级'),
(113,75,'空调类型'),
(114,75,'证书状态'),
(115,75,'证书编号'),
(116,75,'海信空调型号'),
(117,75,'工作方式'),
(118,75,'冷暖类型'),
(119,75,'产品名称'),
(120,75,'能效等级'),
(121,75,'空调功率'),
(122,75,'适用面积'),
(123,74,'风格'),
(124,74,'颜色分类'),
(125,74,'显示方式'),
(126,74,'表壳材质'),
(127,74,'机芯类型'),
(128,74,'手表镜面材质'),
(129,74,'机芯产地'),
(130,74,'表盘厚度'),
(131,74,'品牌产地'),
(132,74,'成色'),
(133,74,'表盘直径'),
(134,74,'上市时间'),
(135,74,'表带材质'),
(136,74,'保修'),
(137,74,'品牌'),
(138,74,'形状'),
(139,74,'防水深度'),
(140,74,'流行元素'),
(141,74,'手表种类'),
(142,74,'型号'),
(143,73,'风格'),
(144,73,'颜色分类'),
(145,73,'显示方式'),
(146,73,'表壳材质'),
(147,73,'机芯类型'),
(148,73,'手表镜面材质'),
(149,73,'表扣款式'),
(150,73,'表盘厚度'),
(151,73,'品牌产地'),
(152,73,'表盘直径'),
(153,73,'成色'),
(154,73,'上市时间'),
(155,73,'表带材质'),
(156,73,'保修'),
(157,73,'品牌'),
(158,73,'形状'),
(159,73,'防水深度'),
(160,73,'表底类型'),
(161,73,'表冠类型'),
(162,73,'流行元素'),
(163,73,'手表种类'),
(164,73,'型号'),
(165,72,'风格'),
(166,72,'大小'),
(167,72,'内部结构'),
(168,72,'颜色分类'),
(169,72,'箱包硬度'),
(170,72,'款式'),
(171,72,'图案'),
(172,72,'成色'),
(173,72,'里料材质'),
(174,72,'上市时间'),
(175,72,'品牌'),
(176,72,'形状'),
(177,72,'箱包外袋种类'),
(178,72,'适用对象'),
(179,72,'质地'),
(180,72,'拿包方式'),
(181,72,'适用场景'),
(182,72,'提拎部件类型'),
(183,72,'闭合方式'),
(184,72,'是否可折叠'),
(185,72,'有无夹层'),
(186,72,'货号'),
(187,72,'皮革材质'),
(188,71,'销售渠道类型'),
(189,71,'面料分类'),
(190,71,'上市年份季节'),
(191,71,'品牌'),
(192,71,'货号'),
(193,71,'基础风格'),
(194,71,'材质成分'),
(195,71,'厚薄'),
(196,69,'风格'),
(197,69,'鞋面材质'),
(198,69,'低帮鞋品名'),
(199,69,'鞋底材质'),
(200,69,'颜色分类'),
(201,69,'上市年份季节'),
(202,69,'款式'),
(203,69,'图案'),
(204,69,'鞋面内里材质'),
(205,69,'季节'),
(206,69,'细分风格'),
(207,69,'鞋跟高'),
(208,69,'品牌'),
(209,69,'适用对象'),
(210,69,'销售渠道类型'),
(211,69,'功能'),
(212,69,'鞋制作工艺'),
(213,69,'尺码'),
(214,69,'闭合方式'),
(215,69,'流行元素'),
(216,69,'跟底款式'),
(217,69,'货号'),
(218,69,'鞋头款式'),
(219,69,'鞋垫材质'),
(220,69,'场合'),
(221,68,'适用年龄'),
(222,68,'颜色分类'),
(223,68,'上市年份季节'),
(224,68,'尺码'),
(225,68,'货号'),
(226,68,'品牌'),
(227,68,'材质成分'),
(228,64,'品牌'),
(229,64,'产地'),
(230,64,'上市时间'),
(231,64,'型号'),
(232,64,'功能'),
(233,64,'适用性别'),
(234,64,'风格'),
(235,64,'价格区间'),
(236,64,'眼镜配件类型'),
(237,64,'是否商场同款'),
(238,64,'镜片材质'),
(239,64,'货号'),
(240,64,'颜色分类'),
(241,64,'是否可调'),
(242,64,'适合脸型'),
(243,60,'产地'),
(244,60,'证书状态'),
(245,60,'3C产品型号'),
(246,60,'申请人名称'),
(247,60,'安装接口'),
(248,60,'适合体重'),
(249,60,'证书编号'),
(250,60,'型号'),
(251,60,'制造商名称'),
(252,60,'颜色分类'),
(253,60,'款式'),
(254,60,'产品名称'),
(255,60,'人体固定方式'),
(256,60,'安全座椅品牌'),
(257,60,'适用年龄'),
(269,84,'品牌'),
(270,84,'安全等级'),
(271,84,'材质成分'),
(272,84,'适用性别'),
(273,84,'颜色分类'),
(274,84,'参考身高'),
(275,84,'模特实拍'),
(276,84,'适用场景'),
(277,84,'是否有帽子'),
(278,84,'面料'),
(279,84,'风格'),
(280,84,'适用季节'),
(281,84,'件数'),
(282,85,'SIZE'),
(283,85,'急急急');

/*Table structure for table `propertyvalue` */

DROP TABLE IF EXISTS `propertyvalue`;

CREATE TABLE `propertyvalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `ptid` int(11) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_propertyvalue_property` (`ptid`)
) ENGINE=InnoDB AUTO_INCREMENT=14129 DEFAULT CHARSET=utf8;

/*Data for the table `propertyvalue` */

insert  into `propertyvalue`(`id`,`pid`,`ptid`,`value`) values 
(716,87,13,'VIDAA'),
(717,87,12,'无'),
(718,87,11,'一级'),
(719,87,10,'Hisense/海信 LED60EC660...'),
(720,87,9,'全部支持'),
(721,87,8,'青岛海信电器股份有限公司'),
(722,87,7,'LED60EC660US'),
(723,87,6,'3840x2160'),
(724,87,5,'2016010808835313'),
(725,87,4,'青岛海信电器股份有限公司'),
(726,87,3,'LED60K5500U、LED60EC660US'),
(727,87,2,'有效'),
(728,87,1,'Hisense/海信'),
(729,88,13,'VIDAA'),
(730,88,12,'无'),
(731,88,11,'一级'),
(732,88,10,'Hisense/海信 LED60EC660...'),
(733,88,9,'全部支持'),
(734,88,8,'青岛海信电器股份有限公司'),
(735,88,7,'LED60EC660US'),
(736,88,6,'3840x2160'),
(737,88,5,'2016010808835313'),
(738,88,4,'青岛海信电器股份有限公司'),
(739,88,3,'LED60K5500U、LED60EC660US'),
(740,88,2,'有效'),
(741,88,1,'Hisense/海信'),
(742,89,13,'VIDAA'),
(743,89,12,'无'),
(744,89,11,'一级'),
(745,89,10,'Hisense/海信 LED60EC660...'),
(746,89,9,'全部支持'),
(747,89,8,'青岛海信电器股份有限公司'),
(748,89,7,'LED60EC660US'),
(749,89,6,'3840x2160'),
(750,89,5,'2016010808835313'),
(751,89,4,'青岛海信电器股份有限公司'),
(752,89,3,'LED60K5500U、LED60EC660US'),
(753,89,2,'有效'),
(754,89,1,'Hisense/海信'),
(755,90,13,'VIDAA'),
(756,90,12,'无'),
(757,90,11,'一级'),
(758,90,10,'Hisense/海信 LED60EC660...'),
(759,90,9,'全部支持'),
(760,90,8,'青岛海信电器股份有限公司'),
(761,90,7,'LED60EC660US'),
(762,90,6,'3840x2160'),
(763,90,5,'2016010808835313'),
(764,90,4,'青岛海信电器股份有限公司'),
(765,90,3,'LED60K5500U、LED60EC660US'),
(766,90,2,'有效'),
(767,90,1,'Hisense/海信'),
(768,91,13,'VIDAA'),
(769,91,12,'无'),
(770,91,11,'一级'),
(771,91,10,'Hisense/海信 LED60EC660...'),
(772,91,9,'全部支持'),
(773,91,8,'青岛海信电器股份有限公司'),
(774,91,7,'LED60EC660US'),
(775,91,6,'3840x2160'),
(776,91,5,'2016010808835313'),
(777,91,4,'青岛海信电器股份有限公司'),
(778,91,3,'LED60K5500U、LED60EC660US'),
(779,91,2,'有效'),
(780,91,1,'Hisense/海信'),
(781,92,26,'同城物流送货上门'),
(782,92,25,'3/6L'),
(783,92,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(784,92,23,'70kg及以上'),
(785,92,22,'305mm 400mm'),
(786,92,21,'PP板'),
(787,92,20,'地排水'),
(788,92,19,'喷射虹吸式'),
(789,92,18,'AB1116'),
(790,92,17,'缓冲'),
(791,92,16,'连体式'),
(792,92,15,'上按两端式'),
(793,92,14,'ARROW/箭牌'),
(794,93,26,'同城物流送货上门'),
(795,93,25,'3/6L'),
(796,93,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(797,93,23,'70kg及以上'),
(798,93,22,'305mm 400mm'),
(799,93,21,'PP板'),
(800,93,20,'地排水'),
(801,93,19,'喷射虹吸式'),
(802,93,18,'AB1116'),
(803,93,17,'缓冲'),
(804,93,16,'连体式'),
(805,93,15,'上按两端式'),
(806,93,14,'ARROW/箭牌'),
(807,94,26,'同城物流送货上门'),
(808,94,25,'3/6L'),
(809,94,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(810,94,23,'70kg及以上'),
(811,94,22,'305mm 400mm'),
(812,94,21,'PP板'),
(813,94,20,'地排水'),
(814,94,19,'喷射虹吸式'),
(815,94,18,'AB1116'),
(816,94,17,'缓冲'),
(817,94,16,'连体式'),
(818,94,15,'上按两端式'),
(819,94,14,'ARROW/箭牌'),
(820,95,26,'同城物流送货上门'),
(821,95,25,'3/6L'),
(822,95,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(823,95,23,'70kg及以上'),
(824,95,22,'305mm 400mm'),
(825,95,21,'PP板'),
(826,95,20,'地排水'),
(827,95,19,'喷射虹吸式'),
(828,95,18,'AB1116'),
(829,95,17,'缓冲'),
(830,95,16,'连体式'),
(831,95,15,'上按两端式'),
(832,95,14,'ARROW/箭牌'),
(833,96,26,'同城物流送货上门'),
(834,96,25,'3/6L'),
(835,96,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(836,96,23,'70kg及以上'),
(837,96,22,'305mm 400mm'),
(838,96,21,'PP板'),
(839,96,20,'地排水'),
(840,96,19,'喷射虹吸式'),
(841,96,18,'AB1116'),
(842,96,17,'缓冲'),
(843,96,16,'连体式'),
(844,96,15,'上按两端式'),
(845,96,14,'ARROW/箭牌'),
(846,97,26,'同城物流送货上门'),
(847,97,25,'3/6L'),
(848,97,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(849,97,23,'70kg及以上'),
(850,97,22,'305mm 400mm'),
(851,97,21,'PP板'),
(852,97,20,'地排水'),
(853,97,19,'喷射虹吸式'),
(854,97,18,'AB1116'),
(855,97,17,'缓冲'),
(856,97,16,'连体式'),
(857,97,15,'上按两端式'),
(858,97,14,'ARROW/箭牌'),
(859,98,26,'同城物流送货上门'),
(860,98,25,'3/6L'),
(861,98,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(862,98,23,'70kg及以上'),
(863,98,22,'305mm 400mm'),
(864,98,21,'PP板'),
(865,98,20,'地排水'),
(866,98,19,'喷射虹吸式'),
(867,98,18,'AB1116'),
(868,98,17,'缓冲'),
(869,98,16,'连体式'),
(870,98,15,'上按两端式'),
(871,98,14,'ARROW/箭牌'),
(872,99,26,'同城物流送货上门'),
(873,99,25,'3/6L'),
(874,99,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(875,99,23,'70kg及以上'),
(876,99,22,'305mm 400mm'),
(877,99,21,'PP板'),
(878,99,20,'地排水'),
(879,99,19,'喷射虹吸式'),
(880,99,18,'AB1116'),
(881,99,17,'缓冲'),
(882,99,16,'连体式'),
(883,99,15,'上按两端式'),
(884,99,14,'ARROW/箭牌'),
(885,100,26,'同城物流送货上门'),
(886,100,25,'3/6L'),
(887,100,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(888,100,23,'70kg及以上'),
(889,100,22,'305mm 400mm'),
(890,100,21,'PP板'),
(891,100,20,'地排水'),
(892,100,19,'喷射虹吸式'),
(893,100,18,'AB1116'),
(894,100,17,'缓冲'),
(895,100,16,'连体式'),
(896,100,15,'上按两端式'),
(897,100,14,'ARROW/箭牌'),
(898,101,26,'同城物流送货上门'),
(899,101,25,'3/6L'),
(900,101,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(901,101,23,'70kg及以上'),
(902,101,22,'305mm 400mm'),
(903,101,21,'PP板'),
(904,101,20,'地排水'),
(905,101,19,'喷射虹吸式'),
(906,101,18,'AB1116'),
(907,101,17,'缓冲'),
(908,101,16,'连体式'),
(909,101,15,'上按两端式'),
(910,101,14,'ARROW/箭牌'),
(911,102,26,'同城物流送货上门'),
(912,102,25,'3/6L'),
(913,102,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(914,102,23,'70kg及以上'),
(915,102,22,'305mm 400mm'),
(916,102,21,'PP板'),
(917,102,20,'地排水'),
(918,102,19,'喷射虹吸式'),
(919,102,18,'AB1116'),
(920,102,17,'缓冲'),
(921,102,16,'连体式'),
(922,102,15,'上按两端式'),
(923,102,14,'ARROW/箭牌'),
(924,103,26,'同城物流送货上门'),
(925,103,25,'3/6L'),
(926,103,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(927,103,23,'70kg及以上'),
(928,103,22,'305mm 400mm'),
(929,103,21,'PP板'),
(930,103,20,'地排水'),
(931,103,19,'喷射虹吸式'),
(932,103,18,'AB1116'),
(933,103,17,'缓冲'),
(934,103,16,'连体式'),
(935,103,15,'上按两端式'),
(936,103,14,'ARROW/箭牌'),
(937,104,26,'同城物流送货上门'),
(938,104,25,'3/6L'),
(939,104,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(940,104,23,'70kg及以上'),
(941,104,22,'305mm 400mm'),
(942,104,21,'PP板'),
(943,104,20,'地排水'),
(944,104,19,'喷射虹吸式'),
(945,104,18,'AB1116'),
(946,104,17,'缓冲'),
(947,104,16,'连体式'),
(948,104,15,'上按两端式'),
(949,104,14,'ARROW/箭牌'),
(950,105,26,'同城物流送货上门'),
(951,105,25,'3/6L'),
(952,105,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(953,105,23,'70kg及以上'),
(954,105,22,'305mm 400mm'),
(955,105,21,'PP板'),
(956,105,20,'地排水'),
(957,105,19,'喷射虹吸式'),
(958,105,18,'AB1116'),
(959,105,17,'缓冲'),
(960,105,16,'连体式'),
(961,105,15,'上按两端式'),
(962,105,14,'ARROW/箭牌'),
(963,106,26,'同城物流送货上门'),
(964,106,25,'3/6L'),
(965,106,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(966,106,23,'70kg及以上'),
(967,106,22,'305mm 400mm'),
(968,106,21,'PP板'),
(969,106,20,'地排水'),
(970,106,19,'喷射虹吸式'),
(971,106,18,'AB1116'),
(972,106,17,'缓冲'),
(973,106,16,'连体式'),
(974,106,15,'上按两端式'),
(975,106,14,'ARROW/箭牌'),
(976,107,26,'同城物流送货上门'),
(977,107,25,'3/6L'),
(978,107,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(979,107,23,'70kg及以上'),
(980,107,22,'305mm 400mm'),
(981,107,21,'PP板'),
(982,107,20,'地排水'),
(983,107,19,'喷射虹吸式'),
(984,107,18,'AB1116'),
(985,107,17,'缓冲'),
(986,107,16,'连体式'),
(987,107,15,'上按两端式'),
(988,107,14,'ARROW/箭牌'),
(989,108,26,'同城物流送货上门'),
(990,108,25,'3/6L'),
(991,108,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(992,108,23,'70kg及以上'),
(993,108,22,'305mm 400mm'),
(994,108,21,'PP板'),
(995,108,20,'地排水'),
(996,108,19,'喷射虹吸式'),
(997,108,18,'AB1116'),
(998,108,17,'缓冲'),
(999,108,16,'连体式'),
(1000,108,15,'上按两端式'),
(1001,108,14,'ARROW/箭牌'),
(1002,109,26,'同城物流送货上门'),
(1003,109,25,'3/6L'),
(1004,109,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1005,109,23,'70kg及以上'),
(1006,109,22,'305mm 400mm'),
(1007,109,21,'PP板'),
(1008,109,20,'地排水'),
(1009,109,19,'喷射虹吸式'),
(1010,109,18,'AB1116'),
(1011,109,17,'缓冲'),
(1012,109,16,'连体式'),
(1013,109,15,'上按两端式'),
(1014,109,14,'ARROW/箭牌'),
(1015,110,26,'同城物流送货上门'),
(1016,110,25,'3/6L'),
(1017,110,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1018,110,23,'70kg及以上'),
(1019,110,22,'305mm 400mm'),
(1020,110,21,'PP板'),
(1021,110,20,'地排水'),
(1022,110,19,'喷射虹吸式'),
(1023,110,18,'AB1116'),
(1024,110,17,'缓冲'),
(1025,110,16,'连体式'),
(1026,110,15,'上按两端式'),
(1027,110,14,'ARROW/箭牌'),
(1028,111,26,'同城物流送货上门'),
(1029,111,25,'3/6L'),
(1030,111,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1031,111,23,'70kg及以上'),
(1032,111,22,'305mm 400mm'),
(1033,111,21,'PP板'),
(1034,111,20,'地排水'),
(1035,111,19,'喷射虹吸式'),
(1036,111,18,'AB1116'),
(1037,111,17,'缓冲'),
(1038,111,16,'连体式'),
(1039,111,15,'上按两端式'),
(1040,111,14,'ARROW/箭牌'),
(1041,112,26,'同城物流送货上门'),
(1042,112,25,'3/6L'),
(1043,112,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1044,112,23,'70kg及以上'),
(1045,112,22,'305mm 400mm'),
(1046,112,21,'PP板'),
(1047,112,20,'地排水'),
(1048,112,19,'喷射虹吸式'),
(1049,112,18,'AB1116'),
(1050,112,17,'缓冲'),
(1051,112,16,'连体式'),
(1052,112,15,'上按两端式'),
(1053,112,14,'ARROW/箭牌'),
(1054,113,26,'同城物流送货上门'),
(1055,113,25,'3/6L'),
(1056,113,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1057,113,23,'70kg及以上'),
(1058,113,22,'305mm 400mm'),
(1059,113,21,'PP板'),
(1060,113,20,'地排水'),
(1061,113,19,'喷射虹吸式'),
(1062,113,18,'AB1116'),
(1063,113,17,'缓冲'),
(1064,113,16,'连体式'),
(1065,113,15,'上按两端式'),
(1066,113,14,'ARROW/箭牌'),
(1067,114,26,'同城物流送货上门'),
(1068,114,25,'3/6L'),
(1069,114,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1070,114,23,'70kg及以上'),
(1071,114,22,'305mm 400mm'),
(1072,114,21,'PP板'),
(1073,114,20,'地排水'),
(1074,114,19,'喷射虹吸式'),
(1075,114,18,'AB1116'),
(1076,114,17,'缓冲'),
(1077,114,16,'连体式'),
(1078,114,15,'上按两端式'),
(1079,114,14,'ARROW/箭牌'),
(1080,115,26,'同城物流送货上门'),
(1081,115,25,'3/6L'),
(1082,115,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1083,115,23,'70kg及以上'),
(1084,115,22,'305mm 400mm'),
(1085,115,21,'PP板'),
(1086,115,20,'地排水'),
(1087,115,19,'喷射虹吸式'),
(1088,115,18,'AB1116'),
(1089,115,17,'缓冲'),
(1090,115,16,'连体式'),
(1091,115,15,'上按两端式'),
(1092,115,14,'ARROW/箭牌'),
(1093,116,26,'同城物流送货上门'),
(1094,116,25,'3/6L'),
(1095,116,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1096,116,23,'70kg及以上'),
(1097,116,22,'305mm 400mm'),
(1098,116,21,'PP板'),
(1099,116,20,'地排水'),
(1100,116,19,'喷射虹吸式'),
(1101,116,18,'AB1116'),
(1102,116,17,'缓冲'),
(1103,116,16,'连体式'),
(1104,116,15,'上按两端式'),
(1105,116,14,'ARROW/箭牌'),
(1106,117,26,'同城物流送货上门'),
(1107,117,25,'3/6L'),
(1108,117,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1109,117,23,'70kg及以上'),
(1110,117,22,'305mm 400mm'),
(1111,117,21,'PP板'),
(1112,117,20,'地排水'),
(1113,117,19,'喷射虹吸式'),
(1114,117,18,'AB1116'),
(1115,117,17,'缓冲'),
(1116,117,16,'连体式'),
(1117,117,15,'上按两端式'),
(1118,117,14,'ARROW/箭牌'),
(1119,118,26,'同城物流送货上门'),
(1120,118,25,'3/6L'),
(1121,118,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1122,118,23,'70kg及以上'),
(1123,118,22,'305mm 400mm'),
(1124,118,21,'PP板'),
(1125,118,20,'地排水'),
(1126,118,19,'喷射虹吸式'),
(1127,118,18,'AB1116'),
(1128,118,17,'缓冲'),
(1129,118,16,'连体式'),
(1130,118,15,'上按两端式'),
(1131,118,14,'ARROW/箭牌'),
(1132,119,26,'同城物流送货上门'),
(1133,119,25,'3/6L'),
(1134,119,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1135,119,23,'70kg及以上'),
(1136,119,22,'305mm 400mm'),
(1137,119,21,'PP板'),
(1138,119,20,'地排水'),
(1139,119,19,'喷射虹吸式'),
(1140,119,18,'AB1116'),
(1141,119,17,'缓冲'),
(1142,119,16,'连体式'),
(1143,119,15,'上按两端式'),
(1144,119,14,'ARROW/箭牌'),
(1145,120,26,'同城物流送货上门'),
(1146,120,25,'3/6L'),
(1147,120,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1148,120,23,'70kg及以上'),
(1149,120,22,'305mm 400mm'),
(1150,120,21,'PP板'),
(1151,120,20,'地排水'),
(1152,120,19,'喷射虹吸式'),
(1153,120,18,'AB1116'),
(1154,120,17,'缓冲'),
(1155,120,16,'连体式'),
(1156,120,15,'上按两端式'),
(1157,120,14,'ARROW/箭牌'),
(1158,121,26,'同城物流送货上门'),
(1159,121,25,'3/6L'),
(1160,121,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1161,121,23,'70kg及以上'),
(1162,121,22,'305mm 400mm'),
(1163,121,21,'PP板'),
(1164,121,20,'地排水'),
(1165,121,19,'喷射虹吸式'),
(1166,121,18,'AB1116'),
(1167,121,17,'缓冲'),
(1168,121,16,'连体式'),
(1169,121,15,'上按两端式'),
(1170,121,14,'ARROW/箭牌'),
(1171,122,26,'同城物流送货上门'),
(1172,122,25,'3/6L'),
(1173,122,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1174,122,23,'70kg及以上'),
(1175,122,22,'305mm 400mm'),
(1176,122,21,'PP板'),
(1177,122,20,'地排水'),
(1178,122,19,'喷射虹吸式'),
(1179,122,18,'AB1116'),
(1180,122,17,'缓冲'),
(1181,122,16,'连体式'),
(1182,122,15,'上按两端式'),
(1183,122,14,'ARROW/箭牌'),
(1184,123,26,'同城物流送货上门'),
(1185,123,25,'3/6L'),
(1186,123,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1187,123,23,'70kg及以上'),
(1188,123,22,'305mm 400mm'),
(1189,123,21,'PP板'),
(1190,123,20,'地排水'),
(1191,123,19,'喷射虹吸式'),
(1192,123,18,'AB1116'),
(1193,123,17,'缓冲'),
(1194,123,16,'连体式'),
(1195,123,15,'上按两端式'),
(1196,123,14,'ARROW/箭牌'),
(1197,124,26,'同城物流送货上门'),
(1198,124,25,'3/6L'),
(1199,124,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1200,124,23,'70kg及以上'),
(1201,124,22,'305mm 400mm'),
(1202,124,21,'PP板'),
(1203,124,20,'地排水'),
(1204,124,19,'喷射虹吸式'),
(1205,124,18,'AB1116'),
(1206,124,17,'缓冲'),
(1207,124,16,'连体式'),
(1208,124,15,'上按两端式'),
(1209,124,14,'ARROW/箭牌'),
(1210,125,26,'同城物流送货上门'),
(1211,125,25,'3/6L'),
(1212,125,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1213,125,23,'70kg及以上'),
(1214,125,22,'305mm 400mm'),
(1215,125,21,'PP板'),
(1216,125,20,'地排水'),
(1217,125,19,'喷射虹吸式'),
(1218,125,18,'AB1116'),
(1219,125,17,'缓冲'),
(1220,125,16,'连体式'),
(1221,125,15,'上按两端式'),
(1222,125,14,'ARROW/箭牌'),
(1223,126,26,'同城物流送货上门'),
(1224,126,25,'3/6L'),
(1225,126,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1226,126,23,'70kg及以上'),
(1227,126,22,'305mm 400mm'),
(1228,126,21,'PP板'),
(1229,126,20,'地排水'),
(1230,126,19,'喷射虹吸式'),
(1231,126,18,'AB1116'),
(1232,126,17,'缓冲'),
(1233,126,16,'连体式'),
(1234,126,15,'上按两端式'),
(1235,126,14,'ARROW/箭牌'),
(1236,127,26,'同城物流送货上门'),
(1237,127,25,'3/6L'),
(1238,127,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1239,127,23,'70kg及以上'),
(1240,127,22,'305mm 400mm'),
(1241,127,21,'PP板'),
(1242,127,20,'地排水'),
(1243,127,19,'喷射虹吸式'),
(1244,127,18,'AB1116'),
(1245,127,17,'缓冲'),
(1246,127,16,'连体式'),
(1247,127,15,'上按两端式'),
(1248,127,14,'ARROW/箭牌'),
(1249,128,26,'同城物流送货上门'),
(1250,128,25,'3/6L'),
(1251,128,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1252,128,23,'70kg及以上'),
(1253,128,22,'305mm 400mm'),
(1254,128,21,'PP板'),
(1255,128,20,'地排水'),
(1256,128,19,'喷射虹吸式'),
(1257,128,18,'AB1116'),
(1258,128,17,'缓冲'),
(1259,128,16,'连体式'),
(1260,128,15,'上按两端式'),
(1261,128,14,'ARROW/箭牌'),
(1262,129,26,'同城物流送货上门'),
(1263,129,25,'3/6L'),
(1264,129,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1265,129,23,'70kg及以上'),
(1266,129,22,'305mm 400mm'),
(1267,129,21,'PP板'),
(1268,129,20,'地排水'),
(1269,129,19,'喷射虹吸式'),
(1270,129,18,'AB1116'),
(1271,129,17,'缓冲'),
(1272,129,16,'连体式'),
(1273,129,15,'上按两端式'),
(1274,129,14,'ARROW/箭牌'),
(1275,130,26,'同城物流送货上门'),
(1276,130,25,'3/6L'),
(1277,130,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1278,130,23,'70kg及以上'),
(1279,130,22,'305mm 400mm'),
(1280,130,21,'PP板'),
(1281,130,20,'地排水'),
(1282,130,19,'喷射虹吸式'),
(1283,130,18,'AB1116'),
(1284,130,17,'缓冲'),
(1285,130,16,'连体式'),
(1286,130,15,'上按两端式'),
(1287,130,14,'ARROW/箭牌'),
(1288,131,26,'同城物流送货上门'),
(1289,131,25,'3/6L'),
(1290,131,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1291,131,23,'70kg及以上'),
(1292,131,22,'305mm 400mm'),
(1293,131,21,'PP板'),
(1294,131,20,'地排水'),
(1295,131,19,'喷射虹吸式'),
(1296,131,18,'AB1116'),
(1297,131,17,'缓冲'),
(1298,131,16,'连体式'),
(1299,131,15,'上按两端式'),
(1300,131,14,'ARROW/箭牌'),
(1301,132,26,'同城物流送货上门'),
(1302,132,25,'3/6L'),
(1303,132,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1304,132,23,'70kg及以上'),
(1305,132,22,'305mm 400mm'),
(1306,132,21,'PP板'),
(1307,132,20,'地排水'),
(1308,132,19,'喷射虹吸式'),
(1309,132,18,'AB1116'),
(1310,132,17,'缓冲'),
(1311,132,16,'连体式'),
(1312,132,15,'上按两端式'),
(1313,132,14,'ARROW/箭牌'),
(1314,133,26,'同城物流送货上门'),
(1315,133,25,'3/6L'),
(1316,133,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1317,133,23,'70kg及以上'),
(1318,133,22,'305mm 400mm'),
(1319,133,21,'PP板'),
(1320,133,20,'地排水'),
(1321,133,19,'喷射虹吸式'),
(1322,133,18,'AB1116'),
(1323,133,17,'缓冲'),
(1324,133,16,'连体式'),
(1325,133,15,'上按两端式'),
(1326,133,14,'ARROW/箭牌'),
(1327,134,26,'同城物流送货上门'),
(1328,134,25,'3/6L'),
(1329,134,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1330,134,23,'70kg及以上'),
(1331,134,22,'305mm 400mm'),
(1332,134,21,'PP板'),
(1333,134,20,'地排水'),
(1334,134,19,'喷射虹吸式'),
(1335,134,18,'AB1116'),
(1336,134,17,'缓冲'),
(1337,134,16,'连体式'),
(1338,134,15,'上按两端式'),
(1339,134,14,'ARROW/箭牌'),
(1340,135,26,'同城物流送货上门'),
(1341,135,25,'3/6L'),
(1342,135,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1343,135,23,'70kg及以上'),
(1344,135,22,'305mm 400mm'),
(1345,135,21,'PP板'),
(1346,135,20,'地排水'),
(1347,135,19,'喷射虹吸式'),
(1348,135,18,'AB1116'),
(1349,135,17,'缓冲'),
(1350,135,16,'连体式'),
(1351,135,15,'上按两端式'),
(1352,135,14,'ARROW/箭牌'),
(1353,136,26,'同城物流送货上门'),
(1354,136,25,'3/6L'),
(1355,136,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1356,136,23,'70kg及以上'),
(1357,136,22,'305mm 400mm'),
(1358,136,21,'PP板'),
(1359,136,20,'地排水'),
(1360,136,19,'喷射虹吸式'),
(1361,136,18,'AB1116'),
(1362,136,17,'缓冲'),
(1363,136,16,'连体式'),
(1364,136,15,'上按两端式'),
(1365,136,14,'ARROW/箭牌'),
(1366,138,26,'同城物流送货上门'),
(1367,138,25,'3/6L'),
(1368,138,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1369,138,23,'70kg及以上'),
(1370,138,22,'305mm 400mm'),
(1371,138,21,'PP板'),
(1372,138,20,'地排水'),
(1373,138,19,'喷射虹吸式'),
(1374,138,18,'AB1116'),
(1375,138,17,'缓冲'),
(1376,138,16,'连体式'),
(1377,138,15,'上按两端式'),
(1378,138,14,'ARROW/箭牌'),
(1379,139,26,'同城物流送货上门'),
(1380,139,25,'3/6L'),
(1381,139,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1382,139,23,'70kg及以上'),
(1383,139,22,'305mm 400mm'),
(1384,139,21,'PP板'),
(1385,139,20,'地排水'),
(1386,139,19,'喷射虹吸式'),
(1387,139,18,'AB1116'),
(1388,139,17,'缓冲'),
(1389,139,16,'连体式'),
(1390,139,15,'上按两端式'),
(1391,139,14,'ARROW/箭牌'),
(1392,140,26,'同城物流送货上门'),
(1393,140,25,'3/6L'),
(1394,140,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1395,140,23,'70kg及以上'),
(1396,140,22,'305mm 400mm'),
(1397,140,21,'PP板'),
(1398,140,20,'地排水'),
(1399,140,19,'喷射虹吸式'),
(1400,140,18,'AB1116'),
(1401,140,17,'缓冲'),
(1402,140,16,'连体式'),
(1403,140,15,'上按两端式'),
(1404,140,14,'ARROW/箭牌'),
(1405,141,26,'同城物流送货上门'),
(1406,141,25,'3/6L'),
(1407,141,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1408,141,23,'70kg及以上'),
(1409,141,22,'305mm 400mm'),
(1410,141,21,'PP板'),
(1411,141,20,'地排水'),
(1412,141,19,'喷射虹吸式'),
(1413,141,18,'AB1116'),
(1414,141,17,'缓冲'),
(1415,141,16,'连体式'),
(1416,141,15,'上按两端式'),
(1417,141,14,'ARROW/箭牌'),
(1418,142,26,'同城物流送货上门'),
(1419,142,25,'3/6L'),
(1420,142,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1421,142,23,'70kg及以上'),
(1422,142,22,'305mm 400mm'),
(1423,142,21,'PP板'),
(1424,142,20,'地排水'),
(1425,142,19,'喷射虹吸式'),
(1426,142,18,'AB1116'),
(1427,142,17,'缓冲'),
(1428,142,16,'连体式'),
(1429,142,15,'上按两端式'),
(1430,142,14,'ARROW/箭牌'),
(1431,143,26,'同城物流送货上门'),
(1432,143,25,'3/6L'),
(1433,143,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1434,143,23,'70kg及以上'),
(1435,143,22,'305mm 400mm'),
(1436,143,21,'PP板'),
(1437,143,20,'地排水'),
(1438,143,19,'喷射虹吸式'),
(1439,143,18,'AB1116'),
(1440,143,17,'缓冲'),
(1441,143,16,'连体式'),
(1442,143,15,'上按两端式'),
(1443,143,14,'ARROW/箭牌'),
(1444,144,26,'同城物流送货上门'),
(1445,144,25,'3/6L'),
(1446,144,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1447,144,23,'70kg及以上'),
(1448,144,22,'305mm 400mm'),
(1449,144,21,'PP板'),
(1450,144,20,'地排水'),
(1451,144,19,'喷射虹吸式'),
(1452,144,18,'AB1116'),
(1453,144,17,'缓冲'),
(1454,144,16,'连体式'),
(1455,144,15,'上按两端式'),
(1456,144,14,'ARROW/箭牌'),
(1457,145,26,'同城物流送货上门'),
(1458,145,25,'3/6L'),
(1459,145,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1460,145,23,'70kg及以上'),
(1461,145,22,'305mm 400mm'),
(1462,145,21,'PP板'),
(1463,145,20,'地排水'),
(1464,145,19,'喷射虹吸式'),
(1465,145,18,'AB1116'),
(1466,145,17,'缓冲'),
(1467,145,16,'连体式'),
(1468,145,15,'上按两端式'),
(1469,145,14,'ARROW/箭牌'),
(1470,146,26,'同城物流送货上门'),
(1471,146,25,'3/6L'),
(1472,146,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1473,146,23,'70kg及以上'),
(1474,146,22,'305mm 400mm'),
(1475,146,21,'PP板'),
(1476,146,20,'地排水'),
(1477,146,19,'喷射虹吸式'),
(1478,146,18,'AB1116'),
(1479,146,17,'缓冲'),
(1480,146,16,'连体式'),
(1481,146,15,'上按两端式'),
(1482,146,14,'ARROW/箭牌'),
(1483,147,26,'同城物流送货上门'),
(1484,147,25,'3/6L'),
(1485,147,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1486,147,23,'70kg及以上'),
(1487,147,22,'305mm 400mm'),
(1488,147,21,'PP板'),
(1489,147,20,'地排水'),
(1490,147,19,'喷射虹吸式'),
(1491,147,18,'AB1116'),
(1492,147,17,'缓冲'),
(1493,147,16,'连体式'),
(1494,147,15,'上按两端式'),
(1495,147,14,'ARROW/箭牌'),
(1496,148,26,'同城物流送货上门'),
(1497,148,25,'3/6L'),
(1498,148,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1499,148,23,'70kg及以上'),
(1500,148,22,'305mm 400mm'),
(1501,148,21,'PP板'),
(1502,148,20,'地排水'),
(1503,148,19,'喷射虹吸式'),
(1504,148,18,'AB1116'),
(1505,148,17,'缓冲'),
(1506,148,16,'连体式'),
(1507,148,15,'上按两端式'),
(1508,148,14,'ARROW/箭牌'),
(1509,149,26,'同城物流送货上门'),
(1510,149,25,'3/6L'),
(1511,149,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1512,149,23,'70kg及以上'),
(1513,149,22,'305mm 400mm'),
(1514,149,21,'PP板'),
(1515,149,20,'地排水'),
(1516,149,19,'喷射虹吸式'),
(1517,149,18,'AB1116'),
(1518,149,17,'缓冲'),
(1519,149,16,'连体式'),
(1520,149,15,'上按两端式'),
(1521,149,14,'ARROW/箭牌'),
(1522,150,26,'同城物流送货上门'),
(1523,150,25,'3/6L'),
(1524,150,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1525,150,23,'70kg及以上'),
(1526,150,22,'305mm 400mm'),
(1527,150,21,'PP板'),
(1528,150,20,'地排水'),
(1529,150,19,'喷射虹吸式'),
(1530,150,18,'AB1116'),
(1531,150,17,'缓冲'),
(1532,150,16,'连体式'),
(1533,150,15,'上按两端式'),
(1534,150,14,'ARROW/箭牌'),
(1535,151,26,'同城物流送货上门'),
(1536,151,25,'3/6L'),
(1537,151,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(1538,151,23,'70kg及以上'),
(1539,151,22,'305mm 400mm'),
(1540,151,21,'PP板'),
(1541,151,20,'地排水'),
(1542,151,19,'喷射虹吸式'),
(1543,151,18,'AB1116'),
(1544,151,17,'缓冲'),
(1545,151,16,'连体式'),
(1546,151,15,'上按两端式'),
(1547,151,14,'ARROW/箭牌'),
(1548,152,56,'无安装说明'),
(1549,152,55,'是'),
(1550,152,54,'其他'),
(1551,152,53,'2040'),
(1552,152,52,'否'),
(1553,152,51,'软'),
(1554,152,50,'海绵'),
(1555,152,49,'经济型'),
(1556,152,48,'木'),
(1557,152,47,'成人'),
(1558,152,46,'林氏木业'),
(1559,152,45,'否'),
(1560,152,44,'广东省'),
(1561,152,43,'L形'),
(1562,152,42,'拼板'),
(1563,152,41,'其他 北京 上海 天津'),
(1564,152,40,'绒质'),
(1565,152,39,'整装'),
(1566,152,38,'艺术'),
(1567,152,37,'A银灰/B藏蓝/C香槟三色选'),
(1568,152,36,'大师设计'),
(1569,152,35,'木质工艺'),
(1570,152,34,'是'),
(1571,152,33,'升降'),
(1573,152,31,'2.93'),
(1574,152,30,'是'),
(1575,152,29,'植绒'),
(1576,152,28,'佛山市'),
(1577,152,27,'简约现代'),
(1578,153,56,'无安装说明'),
(1579,153,55,'是'),
(1580,153,54,'其他'),
(1581,153,53,'2040'),
(1582,153,52,'否'),
(1583,153,51,'软'),
(1584,153,50,'海绵'),
(1585,153,49,'经济型'),
(1586,153,48,'木'),
(1587,153,47,'成人'),
(1588,153,46,'林氏木业'),
(1589,153,45,'否'),
(1590,153,44,'广东省'),
(1591,153,43,'L形'),
(1592,153,42,'拼板'),
(1593,153,41,'其他 北京 上海 天津'),
(1594,153,40,'绒质'),
(1595,153,39,'整装'),
(1596,153,38,'艺术'),
(1597,153,37,'A银灰/B藏蓝/C香槟三色选'),
(1598,153,36,'大师设计'),
(1599,153,35,'木质工艺'),
(1600,153,34,'是'),
(1601,153,33,'升降'),
(1603,153,31,'2.93'),
(1604,153,30,'是'),
(1605,153,29,'植绒'),
(1606,153,28,'佛山市'),
(1607,153,27,'简约现代'),
(1608,154,56,'无安装说明'),
(1609,154,55,'是'),
(1610,154,54,'其他'),
(1611,154,53,'2040'),
(1612,154,52,'否'),
(1613,154,51,'软'),
(1614,154,50,'海绵'),
(1615,154,49,'经济型'),
(1616,154,48,'木'),
(1617,154,47,'成人'),
(1618,154,46,'林氏木业'),
(1619,154,45,'否'),
(1620,154,44,'广东省'),
(1621,154,43,'L形'),
(1622,154,42,'拼板'),
(1623,154,41,'其他 北京 上海 天津'),
(1624,154,40,'绒质'),
(1625,154,39,'整装'),
(1626,154,38,'艺术'),
(1627,154,37,'A银灰/B藏蓝/C香槟三色选'),
(1628,154,36,'大师设计'),
(1629,154,35,'木质工艺'),
(1630,154,34,'是'),
(1631,154,33,'升降'),
(1633,154,31,'2.93'),
(1634,154,30,'是'),
(1635,154,29,'植绒'),
(1636,154,28,'佛山市'),
(1637,154,27,'简约现代'),
(1638,155,56,'无安装说明'),
(1639,155,55,'是'),
(1640,155,54,'其他'),
(1641,155,53,'2040'),
(1642,155,52,'否'),
(1643,155,51,'软'),
(1644,155,50,'海绵'),
(1645,155,49,'经济型'),
(1646,155,48,'木'),
(1647,155,47,'成人'),
(1648,155,46,'林氏木业'),
(1649,155,45,'否'),
(1650,155,44,'广东省'),
(1651,155,43,'L形'),
(1652,155,42,'拼板'),
(1653,155,41,'其他 北京 上海 天津'),
(1654,155,40,'绒质'),
(1655,155,39,'整装'),
(1656,155,38,'艺术'),
(1657,155,37,'A银灰/B藏蓝/C香槟三色选'),
(1658,155,36,'大师设计'),
(1659,155,35,'木质工艺'),
(1660,155,34,'是'),
(1661,155,33,'升降'),
(1663,155,31,'2.93'),
(1664,155,30,'是'),
(1665,155,29,'植绒'),
(1666,155,28,'佛山市'),
(1667,155,27,'简约现代'),
(1668,156,56,'无安装说明'),
(1669,156,55,'是'),
(1670,156,54,'其他'),
(1671,156,53,'2040'),
(1672,156,52,'否'),
(1673,156,51,'软'),
(1674,156,50,'海绵'),
(1675,156,49,'经济型'),
(1676,156,48,'木'),
(1677,156,47,'成人'),
(1678,156,46,'林氏木业'),
(1679,156,45,'否'),
(1680,156,44,'广东省'),
(1681,156,43,'L形'),
(1682,156,42,'拼板'),
(1683,156,41,'其他 北京 上海 天津'),
(1684,156,40,'绒质'),
(1685,156,39,'整装'),
(1686,156,38,'艺术'),
(1687,156,37,'A银灰/B藏蓝/C香槟三色选'),
(1688,156,36,'大师设计'),
(1689,156,35,'木质工艺'),
(1690,156,34,'是'),
(1691,156,33,'升降'),
(1693,156,31,'2.93'),
(1694,156,30,'是'),
(1695,156,29,'植绒'),
(1696,156,28,'佛山市'),
(1697,156,27,'简约现代'),
(1698,157,56,'无安装说明'),
(1699,157,55,'是'),
(1700,157,54,'其他'),
(1701,157,53,'2040'),
(1702,157,52,'否'),
(1703,157,51,'软'),
(1704,157,50,'海绵'),
(1705,157,49,'经济型'),
(1706,157,48,'木'),
(1707,157,47,'成人'),
(1708,157,46,'林氏木业'),
(1709,157,45,'否'),
(1710,157,44,'广东省'),
(1711,157,43,'L形'),
(1712,157,42,'拼板'),
(1713,157,41,'其他 北京 上海 天津'),
(1714,157,40,'绒质'),
(1715,157,39,'整装'),
(1716,157,38,'艺术'),
(1717,157,37,'A银灰/B藏蓝/C香槟三色选'),
(1718,157,36,'大师设计'),
(1719,157,35,'木质工艺'),
(1720,157,34,'是'),
(1721,157,33,'升降'),
(1723,157,31,'2.93'),
(1724,157,30,'是'),
(1725,157,29,'植绒'),
(1726,157,28,'佛山市'),
(1727,157,27,'简约现代'),
(1728,158,56,'无安装说明'),
(1729,158,55,'是'),
(1730,158,54,'其他'),
(1731,158,53,'2040'),
(1732,158,52,'否'),
(1733,158,51,'软'),
(1734,158,50,'海绵'),
(1735,158,49,'经济型'),
(1736,158,48,'木'),
(1737,158,47,'成人'),
(1738,158,46,'林氏木业'),
(1739,158,45,'否'),
(1740,158,44,'广东省'),
(1741,158,43,'L形'),
(1742,158,42,'拼板'),
(1743,158,41,'其他 北京 上海 天津'),
(1744,158,40,'绒质'),
(1745,158,39,'整装'),
(1746,158,38,'艺术'),
(1747,158,37,'A银灰/B藏蓝/C香槟三色选'),
(1748,158,36,'大师设计'),
(1749,158,35,'木质工艺'),
(1750,158,34,'是'),
(1751,158,33,'升降'),
(1753,158,31,'2.93'),
(1754,158,30,'是'),
(1755,158,29,'植绒'),
(1756,158,28,'佛山市'),
(1757,158,27,'简约现代'),
(1758,159,56,'无安装说明'),
(1759,159,55,'是'),
(1760,159,54,'其他'),
(1761,159,53,'2040'),
(1762,159,52,'否'),
(1763,159,51,'软'),
(1764,159,50,'海绵'),
(1765,159,49,'经济型'),
(1766,159,48,'木'),
(1767,159,47,'成人'),
(1768,159,46,'林氏木业'),
(1769,159,45,'否'),
(1770,159,44,'广东省'),
(1771,159,43,'L形'),
(1772,159,42,'拼板'),
(1773,159,41,'其他 北京 上海 天津'),
(1774,159,40,'绒质'),
(1775,159,39,'整装'),
(1776,159,38,'艺术'),
(1777,159,37,'A银灰/B藏蓝/C香槟三色选'),
(1778,159,36,'大师设计'),
(1779,159,35,'木质工艺'),
(1780,159,34,'是'),
(1781,159,33,'升降'),
(1783,159,31,'2.93'),
(1784,159,30,'是'),
(1785,159,29,'植绒'),
(1786,159,28,'佛山市'),
(1787,159,27,'简约现代'),
(1788,160,56,'无安装说明'),
(1789,160,55,'是'),
(1790,160,54,'其他'),
(1791,160,53,'2040'),
(1792,160,52,'否'),
(1793,160,51,'软'),
(1794,160,50,'海绵'),
(1795,160,49,'经济型'),
(1796,160,48,'木'),
(1797,160,47,'成人'),
(1798,160,46,'林氏木业'),
(1799,160,45,'否'),
(1800,160,44,'广东省'),
(1801,160,43,'L形'),
(1802,160,42,'拼板'),
(1803,160,41,'其他 北京 上海 天津'),
(1804,160,40,'绒质'),
(1805,160,39,'整装'),
(1806,160,38,'艺术'),
(1807,160,37,'A银灰/B藏蓝/C香槟三色选'),
(1808,160,36,'大师设计'),
(1809,160,35,'木质工艺'),
(1810,160,34,'是'),
(1811,160,33,'升降'),
(1813,160,31,'2.93'),
(1814,160,30,'是'),
(1815,160,29,'植绒'),
(1816,160,28,'佛山市'),
(1817,160,27,'简约现代'),
(1818,161,56,'无安装说明'),
(1819,161,55,'是'),
(1820,161,54,'其他'),
(1821,161,53,'2040'),
(1822,161,52,'否'),
(1823,161,51,'软'),
(1824,161,50,'海绵'),
(1825,161,49,'经济型'),
(1826,161,48,'木'),
(1827,161,47,'成人'),
(1828,161,46,'林氏木业'),
(1829,161,45,'否'),
(1830,161,44,'广东省'),
(1831,161,43,'L形'),
(1832,161,42,'拼板'),
(1833,161,41,'其他 北京 上海 天津'),
(1834,161,40,'绒质'),
(1835,161,39,'整装'),
(1836,161,38,'艺术'),
(1837,161,37,'A银灰/B藏蓝/C香槟三色选'),
(1838,161,36,'大师设计'),
(1839,161,35,'木质工艺'),
(1840,161,34,'是'),
(1841,161,33,'升降'),
(1843,161,31,'2.93'),
(1844,161,30,'是'),
(1845,161,29,'植绒'),
(1846,161,28,'佛山市'),
(1847,161,27,'简约现代'),
(1848,162,56,'无安装说明'),
(1849,162,55,'是'),
(1850,162,54,'其他'),
(1851,162,53,'2040'),
(1852,162,52,'否'),
(1853,162,51,'软'),
(1854,162,50,'海绵'),
(1855,162,49,'经济型'),
(1856,162,48,'木'),
(1857,162,47,'成人'),
(1858,162,46,'林氏木业'),
(1859,162,45,'否'),
(1860,162,44,'广东省'),
(1861,162,43,'L形'),
(1862,162,42,'拼板'),
(1863,162,41,'其他 北京 上海 天津'),
(1864,162,40,'绒质'),
(1865,162,39,'整装'),
(1866,162,38,'艺术'),
(1867,162,37,'A银灰/B藏蓝/C香槟三色选'),
(1868,162,36,'大师设计'),
(1869,162,35,'木质工艺'),
(1870,162,34,'是'),
(1871,162,33,'升降'),
(1873,162,31,'2.93'),
(1874,162,30,'是'),
(1875,162,29,'植绒'),
(1876,162,28,'佛山市'),
(1877,162,27,'简约现代'),
(1878,163,56,'无安装说明'),
(1879,163,55,'是'),
(1880,163,54,'其他'),
(1881,163,53,'2040'),
(1882,163,52,'否'),
(1883,163,51,'软'),
(1884,163,50,'海绵'),
(1885,163,49,'经济型'),
(1886,163,48,'木'),
(1887,163,47,'成人'),
(1888,163,46,'林氏木业'),
(1889,163,45,'否'),
(1890,163,44,'广东省'),
(1891,163,43,'L形'),
(1892,163,42,'拼板'),
(1893,163,41,'其他 北京 上海 天津'),
(1894,163,40,'绒质'),
(1895,163,39,'整装'),
(1896,163,38,'艺术'),
(1897,163,37,'A银灰/B藏蓝/C香槟三色选'),
(1898,163,36,'大师设计'),
(1899,163,35,'木质工艺'),
(1900,163,34,'是'),
(1901,163,33,'升降'),
(1903,163,31,'2.93'),
(1904,163,30,'是'),
(1905,163,29,'植绒'),
(1906,163,28,'佛山市'),
(1907,163,27,'简约现代'),
(1908,164,56,'无安装说明'),
(1909,164,55,'是'),
(1910,164,54,'其他'),
(1911,164,53,'2040'),
(1912,164,52,'否'),
(1913,164,51,'软'),
(1914,164,50,'海绵'),
(1915,164,49,'经济型'),
(1916,164,48,'木'),
(1917,164,47,'成人'),
(1918,164,46,'林氏木业'),
(1919,164,45,'否'),
(1920,164,44,'广东省'),
(1921,164,43,'L形'),
(1922,164,42,'拼板'),
(1923,164,41,'其他 北京 上海 天津'),
(1924,164,40,'绒质'),
(1925,164,39,'整装'),
(1926,164,38,'艺术'),
(1927,164,37,'A银灰/B藏蓝/C香槟三色选'),
(1928,164,36,'大师设计'),
(1929,164,35,'木质工艺'),
(1930,164,34,'是'),
(1931,164,33,'升降'),
(1933,164,31,'2.93'),
(1934,164,30,'是'),
(1935,164,29,'植绒'),
(1936,164,28,'佛山市'),
(1937,164,27,'简约现代'),
(1938,165,56,'无安装说明'),
(1939,165,55,'是'),
(1940,165,54,'其他'),
(1941,165,53,'2040'),
(1942,165,52,'否'),
(1943,165,51,'软'),
(1944,165,50,'海绵'),
(1945,165,49,'经济型'),
(1946,165,48,'木'),
(1947,165,47,'成人'),
(1948,165,46,'林氏木业'),
(1949,165,45,'否'),
(1950,165,44,'广东省'),
(1951,165,43,'L形'),
(1952,165,42,'拼板'),
(1953,165,41,'其他 北京 上海 天津'),
(1954,165,40,'绒质'),
(1955,165,39,'整装'),
(1956,165,38,'艺术'),
(1957,165,37,'A银灰/B藏蓝/C香槟三色选'),
(1958,165,36,'大师设计'),
(1959,165,35,'木质工艺'),
(1960,165,34,'是'),
(1961,165,33,'升降'),
(1963,165,31,'2.93'),
(1964,165,30,'是'),
(1965,165,29,'植绒'),
(1966,165,28,'佛山市'),
(1967,165,27,'简约现代'),
(1968,166,56,'无安装说明'),
(1969,166,55,'是'),
(1970,166,54,'其他'),
(1971,166,53,'2040'),
(1972,166,52,'否'),
(1973,166,51,'软'),
(1974,166,50,'海绵'),
(1975,166,49,'经济型'),
(1976,166,48,'木'),
(1977,166,47,'成人'),
(1978,166,46,'林氏木业'),
(1979,166,45,'否'),
(1980,166,44,'广东省'),
(1981,166,43,'L形'),
(1982,166,42,'拼板'),
(1983,166,41,'其他 北京 上海 天津'),
(1984,166,40,'绒质'),
(1985,166,39,'整装'),
(1986,166,38,'艺术'),
(1987,166,37,'A银灰/B藏蓝/C香槟三色选'),
(1988,166,36,'大师设计'),
(1989,166,35,'木质工艺'),
(1990,166,34,'是'),
(1991,166,33,'升降'),
(1993,166,31,'2.93'),
(1994,166,30,'是'),
(1995,166,29,'植绒'),
(1996,166,28,'佛山市'),
(1997,166,27,'简约现代'),
(1998,167,56,'无安装说明'),
(1999,167,55,'是'),
(2000,167,54,'其他'),
(2001,167,53,'2040'),
(2002,167,52,'否'),
(2003,167,51,'软'),
(2004,167,50,'海绵'),
(2005,167,49,'经济型'),
(2006,167,48,'木'),
(2007,167,47,'成人'),
(2008,167,46,'林氏木业'),
(2009,167,45,'否'),
(2010,167,44,'广东省'),
(2011,167,43,'L形'),
(2012,167,42,'拼板'),
(2013,167,41,'其他 北京 上海 天津'),
(2014,167,40,'绒质'),
(2015,167,39,'整装'),
(2016,167,38,'艺术'),
(2017,167,37,'A银灰/B藏蓝/C香槟三色选'),
(2018,167,36,'大师设计'),
(2019,167,35,'木质工艺'),
(2020,167,34,'是'),
(2021,167,33,'升降'),
(2023,167,31,'2.93'),
(2024,167,30,'是'),
(2025,167,29,'植绒'),
(2026,167,28,'佛山市'),
(2027,167,27,'简约现代'),
(2028,168,56,'无安装说明'),
(2029,168,55,'是'),
(2030,168,54,'其他'),
(2031,168,53,'2040'),
(2032,168,52,'否'),
(2033,168,51,'软'),
(2034,168,50,'海绵'),
(2035,168,49,'经济型'),
(2036,168,48,'木'),
(2037,168,47,'成人'),
(2038,168,46,'林氏木业'),
(2039,168,45,'否'),
(2040,168,44,'广东省'),
(2041,168,43,'L形'),
(2042,168,42,'拼板'),
(2043,168,41,'其他 北京 上海 天津'),
(2044,168,40,'绒质'),
(2045,168,39,'整装'),
(2046,168,38,'艺术'),
(2047,168,37,'A银灰/B藏蓝/C香槟三色选'),
(2048,168,36,'大师设计'),
(2049,168,35,'木质工艺'),
(2050,168,34,'是'),
(2051,168,33,'升降'),
(2053,168,31,'2.93'),
(2054,168,30,'是'),
(2055,168,29,'植绒'),
(2056,168,28,'佛山市'),
(2057,168,27,'简约现代'),
(2058,169,56,'无安装说明'),
(2059,169,55,'是'),
(2060,169,54,'其他'),
(2061,169,53,'2040'),
(2062,169,52,'否'),
(2063,169,51,'软'),
(2064,169,50,'海绵'),
(2065,169,49,'经济型'),
(2066,169,48,'木'),
(2067,169,47,'成人'),
(2068,169,46,'林氏木业'),
(2069,169,45,'否'),
(2070,169,44,'广东省'),
(2071,169,43,'L形'),
(2072,169,42,'拼板'),
(2073,169,41,'其他 北京 上海 天津'),
(2074,169,40,'绒质'),
(2075,169,39,'整装'),
(2076,169,38,'艺术'),
(2077,169,37,'A银灰/B藏蓝/C香槟三色选'),
(2078,169,36,'大师设计'),
(2079,169,35,'木质工艺'),
(2080,169,34,'是'),
(2081,169,33,'升降'),
(2083,169,31,'2.93'),
(2084,169,30,'是'),
(2085,169,29,'植绒'),
(2086,169,28,'佛山市'),
(2087,169,27,'简约现代'),
(2088,170,56,'无安装说明'),
(2089,170,55,'是'),
(2090,170,54,'其他'),
(2091,170,53,'2040'),
(2092,170,52,'否'),
(2093,170,51,'软'),
(2094,170,50,'海绵'),
(2095,170,49,'经济型'),
(2096,170,48,'木'),
(2097,170,47,'成人'),
(2098,170,46,'林氏木业'),
(2099,170,45,'否'),
(2100,170,44,'广东省'),
(2101,170,43,'L形'),
(2102,170,42,'拼板'),
(2103,170,41,'其他 北京 上海 天津'),
(2104,170,40,'绒质'),
(2105,170,39,'整装'),
(2106,170,38,'艺术'),
(2107,170,37,'A银灰/B藏蓝/C香槟三色选'),
(2108,170,36,'大师设计'),
(2109,170,35,'木质工艺'),
(2110,170,34,'是'),
(2111,170,33,'升降'),
(2113,170,31,'2.93'),
(2114,170,30,'是'),
(2115,170,29,'植绒'),
(2116,170,28,'佛山市'),
(2117,170,27,'简约现代'),
(2118,171,56,'无安装说明'),
(2119,171,55,'是'),
(2120,171,54,'其他'),
(2121,171,53,'2040'),
(2122,171,52,'否'),
(2123,171,51,'软'),
(2124,171,50,'海绵'),
(2125,171,49,'经济型'),
(2126,171,48,'木'),
(2127,171,47,'成人'),
(2128,171,46,'林氏木业'),
(2129,171,45,'否'),
(2130,171,44,'广东省'),
(2131,171,43,'L形'),
(2132,171,42,'拼板'),
(2133,171,41,'其他 北京 上海 天津'),
(2134,171,40,'绒质'),
(2135,171,39,'整装'),
(2136,171,38,'艺术'),
(2137,171,37,'A银灰/B藏蓝/C香槟三色选'),
(2138,171,36,'大师设计'),
(2139,171,35,'木质工艺'),
(2140,171,34,'是'),
(2141,171,33,'升降'),
(2143,171,31,'2.93'),
(2144,171,30,'是'),
(2145,171,29,'植绒'),
(2146,171,28,'佛山市'),
(2147,171,27,'简约现代'),
(2148,172,56,'无安装说明'),
(2149,172,55,'是'),
(2150,172,54,'其他'),
(2151,172,53,'2040'),
(2152,172,52,'否'),
(2153,172,51,'软'),
(2154,172,50,'海绵'),
(2155,172,49,'经济型'),
(2156,172,48,'木'),
(2157,172,47,'成人'),
(2158,172,46,'林氏木业'),
(2159,172,45,'否'),
(2160,172,44,'广东省'),
(2161,172,43,'L形'),
(2162,172,42,'拼板'),
(2163,172,41,'其他 北京 上海 天津'),
(2164,172,40,'绒质'),
(2165,172,39,'整装'),
(2166,172,38,'艺术'),
(2167,172,37,'A银灰/B藏蓝/C香槟三色选'),
(2168,172,36,'大师设计'),
(2169,172,35,'木质工艺'),
(2170,172,34,'是'),
(2171,172,33,'升降'),
(2173,172,31,'2.93'),
(2174,172,30,'是'),
(2175,172,29,'植绒'),
(2176,172,28,'佛山市'),
(2177,172,27,'简约现代'),
(2178,173,56,'无安装说明'),
(2179,173,55,'是'),
(2180,173,54,'其他'),
(2181,173,53,'2040'),
(2182,173,52,'否'),
(2183,173,51,'软'),
(2184,173,50,'海绵'),
(2185,173,49,'经济型'),
(2186,173,48,'木'),
(2187,173,47,'成人'),
(2188,173,46,'林氏木业'),
(2189,173,45,'否'),
(2190,173,44,'广东省'),
(2191,173,43,'L形'),
(2192,173,42,'拼板'),
(2193,173,41,'其他 北京 上海 天津'),
(2194,173,40,'绒质'),
(2195,173,39,'整装'),
(2196,173,38,'艺术'),
(2197,173,37,'A银灰/B藏蓝/C香槟三色选'),
(2198,173,36,'大师设计'),
(2199,173,35,'木质工艺'),
(2200,173,34,'是'),
(2201,173,33,'升降'),
(2203,173,31,'2.93'),
(2204,173,30,'是'),
(2205,173,29,'植绒'),
(2206,173,28,'佛山市'),
(2207,173,27,'简约现代'),
(2208,174,56,'无安装说明'),
(2209,174,55,'是'),
(2210,174,54,'其他'),
(2211,174,53,'2040'),
(2212,174,52,'否'),
(2213,174,51,'软'),
(2214,174,50,'海绵'),
(2215,174,49,'经济型'),
(2216,174,48,'木'),
(2217,174,47,'成人'),
(2218,174,46,'林氏木业'),
(2219,174,45,'否'),
(2220,174,44,'广东省'),
(2221,174,43,'L形'),
(2222,174,42,'拼板'),
(2223,174,41,'其他 北京 上海 天津'),
(2224,174,40,'绒质'),
(2225,174,39,'整装'),
(2226,174,38,'艺术'),
(2227,174,37,'A银灰/B藏蓝/C香槟三色选'),
(2228,174,36,'大师设计'),
(2229,174,35,'木质工艺'),
(2230,174,34,'是'),
(2231,174,33,'升降'),
(2233,174,31,'2.93'),
(2234,174,30,'是'),
(2235,174,29,'植绒'),
(2236,174,28,'佛山市'),
(2237,174,27,'简约现代'),
(2238,175,56,'无安装说明'),
(2239,175,55,'是'),
(2240,175,54,'其他'),
(2241,175,53,'2040'),
(2242,175,52,'否'),
(2243,175,51,'软'),
(2244,175,50,'海绵'),
(2245,175,49,'经济型'),
(2246,175,48,'木'),
(2247,175,47,'成人'),
(2248,175,46,'林氏木业'),
(2249,175,45,'否'),
(2250,175,44,'广东省'),
(2251,175,43,'L形'),
(2252,175,42,'拼板'),
(2253,175,41,'其他 北京 上海 天津'),
(2254,175,40,'绒质'),
(2255,175,39,'整装'),
(2256,175,38,'艺术'),
(2257,175,37,'A银灰/B藏蓝/C香槟三色选'),
(2258,175,36,'大师设计'),
(2259,175,35,'木质工艺'),
(2260,175,34,'是'),
(2261,175,33,'升降'),
(2263,175,31,'2.93'),
(2264,175,30,'是'),
(2265,175,29,'植绒'),
(2266,175,28,'佛山市'),
(2267,175,27,'简约现代'),
(2268,176,56,'无安装说明'),
(2269,176,55,'是'),
(2270,176,54,'其他'),
(2271,176,53,'2040'),
(2272,176,52,'否'),
(2273,176,51,'软'),
(2274,176,50,'海绵'),
(2275,176,49,'经济型'),
(2276,176,48,'木'),
(2277,176,47,'成人'),
(2278,176,46,'林氏木业'),
(2279,176,45,'否'),
(2280,176,44,'广东省'),
(2281,176,43,'L形'),
(2282,176,42,'拼板'),
(2283,176,41,'其他 北京 上海 天津'),
(2284,176,40,'绒质'),
(2285,176,39,'整装'),
(2286,176,38,'艺术'),
(2287,176,37,'A银灰/B藏蓝/C香槟三色选'),
(2288,176,36,'大师设计'),
(2289,176,35,'木质工艺'),
(2290,176,34,'是'),
(2291,176,33,'升降'),
(2293,176,31,'2.93'),
(2294,176,30,'是'),
(2295,176,29,'植绒'),
(2296,176,28,'佛山市'),
(2297,176,27,'简约现代'),
(2298,177,56,'无安装说明'),
(2299,177,55,'是'),
(2300,177,54,'其他'),
(2301,177,53,'2040'),
(2302,177,52,'否'),
(2303,177,51,'软'),
(2304,177,50,'海绵'),
(2305,177,49,'经济型'),
(2306,177,48,'木'),
(2307,177,47,'成人'),
(2308,177,46,'林氏木业'),
(2309,177,45,'否'),
(2310,177,44,'广东省'),
(2311,177,43,'L形'),
(2312,177,42,'拼板'),
(2313,177,41,'其他 北京 上海 天津'),
(2314,177,40,'绒质'),
(2315,177,39,'整装'),
(2316,177,38,'艺术'),
(2317,177,37,'A银灰/B藏蓝/C香槟三色选'),
(2318,177,36,'大师设计'),
(2319,177,35,'木质工艺'),
(2320,177,34,'是'),
(2321,177,33,'升降'),
(2323,177,31,'2.93'),
(2324,177,30,'是'),
(2325,177,29,'植绒'),
(2326,177,28,'佛山市'),
(2327,177,27,'简约现代'),
(2328,178,56,'无安装说明'),
(2329,178,55,'是'),
(2330,178,54,'其他'),
(2331,178,53,'2040'),
(2332,178,52,'否'),
(2333,178,51,'软'),
(2334,178,50,'海绵'),
(2335,178,49,'经济型'),
(2336,178,48,'木'),
(2337,178,47,'成人'),
(2338,178,46,'林氏木业'),
(2339,178,45,'否'),
(2340,178,44,'广东省'),
(2341,178,43,'L形'),
(2342,178,42,'拼板'),
(2343,178,41,'其他 北京 上海 天津'),
(2344,178,40,'绒质'),
(2345,178,39,'整装'),
(2346,178,38,'艺术'),
(2347,178,37,'A银灰/B藏蓝/C香槟三色选'),
(2348,178,36,'大师设计'),
(2349,178,35,'木质工艺'),
(2350,178,34,'是'),
(2351,178,33,'升降'),
(2353,178,31,'2.93'),
(2354,178,30,'是'),
(2355,178,29,'植绒'),
(2356,178,28,'佛山市'),
(2357,178,27,'简约现代'),
(2358,179,56,'无安装说明'),
(2359,179,55,'是'),
(2360,179,54,'其他'),
(2361,179,53,'2040'),
(2362,179,52,'否'),
(2363,179,51,'软'),
(2364,179,50,'海绵'),
(2365,179,49,'经济型'),
(2366,179,48,'木'),
(2367,179,47,'成人'),
(2368,179,46,'林氏木业'),
(2369,179,45,'否'),
(2370,179,44,'广东省'),
(2371,179,43,'L形'),
(2372,179,42,'拼板'),
(2373,179,41,'其他 北京 上海 天津'),
(2374,179,40,'绒质'),
(2375,179,39,'整装'),
(2376,179,38,'艺术'),
(2377,179,37,'A银灰/B藏蓝/C香槟三色选'),
(2378,179,36,'大师设计'),
(2379,179,35,'木质工艺'),
(2380,179,34,'是'),
(2381,179,33,'升降'),
(2383,179,31,'2.93'),
(2384,179,30,'是'),
(2385,179,29,'植绒'),
(2386,179,28,'佛山市'),
(2387,179,27,'简约现代'),
(2388,180,56,'无安装说明'),
(2389,180,55,'是'),
(2390,180,54,'其他'),
(2391,180,53,'2040'),
(2392,180,52,'否'),
(2393,180,51,'软'),
(2394,180,50,'海绵'),
(2395,180,49,'经济型'),
(2396,180,48,'木'),
(2397,180,47,'成人'),
(2398,180,46,'林氏木业'),
(2399,180,45,'否'),
(2400,180,44,'广东省'),
(2401,180,43,'L形'),
(2402,180,42,'拼板'),
(2403,180,41,'其他 北京 上海 天津'),
(2404,180,40,'绒质'),
(2405,180,39,'整装'),
(2406,180,38,'艺术'),
(2407,180,37,'A银灰/B藏蓝/C香槟三色选'),
(2408,180,36,'大师设计'),
(2409,180,35,'木质工艺'),
(2410,180,34,'是'),
(2411,180,33,'升降'),
(2413,180,31,'2.93'),
(2414,180,30,'是'),
(2415,180,29,'植绒'),
(2416,180,28,'佛山市'),
(2417,180,27,'简约现代'),
(2418,181,56,'无安装说明'),
(2419,181,55,'是'),
(2420,181,54,'其他'),
(2421,181,53,'2040'),
(2422,181,52,'否'),
(2423,181,51,'软'),
(2424,181,50,'海绵'),
(2425,181,49,'经济型'),
(2426,181,48,'木'),
(2427,181,47,'成人'),
(2428,181,46,'林氏木业'),
(2429,181,45,'否'),
(2430,181,44,'广东省'),
(2431,181,43,'L形'),
(2432,181,42,'拼板'),
(2433,181,41,'其他 北京 上海 天津'),
(2434,181,40,'绒质'),
(2435,181,39,'整装'),
(2436,181,38,'艺术'),
(2437,181,37,'A银灰/B藏蓝/C香槟三色选'),
(2438,181,36,'大师设计'),
(2439,181,35,'木质工艺'),
(2440,181,34,'是'),
(2441,181,33,'升降'),
(2443,181,31,'2.93'),
(2444,181,30,'是'),
(2445,181,29,'植绒'),
(2446,181,28,'佛山市'),
(2447,181,27,'简约现代'),
(2448,182,56,'无安装说明'),
(2449,182,55,'是'),
(2450,182,54,'其他'),
(2451,182,53,'2040'),
(2452,182,52,'否'),
(2453,182,51,'软'),
(2454,182,50,'海绵'),
(2455,182,49,'经济型'),
(2456,182,48,'木'),
(2457,182,47,'成人'),
(2458,182,46,'林氏木业'),
(2459,182,45,'否'),
(2460,182,44,'广东省'),
(2461,182,43,'L形'),
(2462,182,42,'拼板'),
(2463,182,41,'其他 北京 上海 天津'),
(2464,182,40,'绒质'),
(2465,182,39,'整装'),
(2466,182,38,'艺术'),
(2467,182,37,'A银灰/B藏蓝/C香槟三色选'),
(2468,182,36,'大师设计'),
(2469,182,35,'木质工艺'),
(2470,182,34,'是'),
(2471,182,33,'升降'),
(2473,182,31,'2.93'),
(2474,182,30,'是'),
(2475,182,29,'植绒'),
(2476,182,28,'佛山市'),
(2477,182,27,'简约现代'),
(2478,183,56,'无安装说明'),
(2479,183,55,'是'),
(2480,183,54,'其他'),
(2481,183,53,'2040'),
(2482,183,52,'否'),
(2483,183,51,'软'),
(2484,183,50,'海绵'),
(2485,183,49,'经济型'),
(2486,183,48,'木'),
(2487,183,47,'成人'),
(2488,183,46,'林氏木业'),
(2489,183,45,'否'),
(2490,183,44,'广东省'),
(2491,183,43,'L形'),
(2492,183,42,'拼板'),
(2493,183,41,'其他 北京 上海 天津'),
(2494,183,40,'绒质'),
(2495,183,39,'整装'),
(2496,183,38,'艺术'),
(2497,183,37,'A银灰/B藏蓝/C香槟三色选'),
(2498,183,36,'大师设计'),
(2499,183,35,'木质工艺'),
(2500,183,34,'是'),
(2501,183,33,'升降'),
(2503,183,31,'2.93'),
(2504,183,30,'是'),
(2505,183,29,'植绒'),
(2506,183,28,'佛山市'),
(2507,183,27,'简约现代'),
(2508,184,56,'无安装说明'),
(2509,184,55,'是'),
(2510,184,54,'其他'),
(2511,184,53,'2040'),
(2512,184,52,'否'),
(2513,184,51,'软'),
(2514,184,50,'海绵'),
(2515,184,49,'经济型'),
(2516,184,48,'木'),
(2517,184,47,'成人'),
(2518,184,46,'林氏木业'),
(2519,184,45,'否'),
(2520,184,44,'广东省'),
(2521,184,43,'L形'),
(2522,184,42,'拼板'),
(2523,184,41,'其他 北京 上海 天津'),
(2524,184,40,'绒质'),
(2525,184,39,'整装'),
(2526,184,38,'艺术'),
(2527,184,37,'A银灰/B藏蓝/C香槟三色选'),
(2528,184,36,'大师设计'),
(2529,184,35,'木质工艺'),
(2530,184,34,'是'),
(2531,184,33,'升降'),
(2533,184,31,'2.93'),
(2534,184,30,'是'),
(2535,184,29,'植绒'),
(2536,184,28,'佛山市'),
(2537,184,27,'简约现代'),
(2538,185,56,'无安装说明'),
(2539,185,55,'是'),
(2540,185,54,'其他'),
(2541,185,53,'2040'),
(2542,185,52,'否'),
(2543,185,51,'软'),
(2544,185,50,'海绵'),
(2545,185,49,'经济型'),
(2546,185,48,'木'),
(2547,185,47,'成人'),
(2548,185,46,'林氏木业'),
(2549,185,45,'否'),
(2550,185,44,'广东省'),
(2551,185,43,'L形'),
(2552,185,42,'拼板'),
(2553,185,41,'其他 北京 上海 天津'),
(2554,185,40,'绒质'),
(2555,185,39,'整装'),
(2556,185,38,'艺术'),
(2557,185,37,'A银灰/B藏蓝/C香槟三色选'),
(2558,185,36,'大师设计'),
(2559,185,35,'木质工艺'),
(2560,185,34,'是'),
(2561,185,33,'升降'),
(2563,185,31,'2.93'),
(2564,185,30,'是'),
(2565,185,29,'植绒'),
(2566,185,28,'佛山市'),
(2567,185,27,'简约现代'),
(2568,186,56,'无安装说明'),
(2569,186,55,'是'),
(2570,186,54,'其他'),
(2571,186,53,'2040'),
(2572,186,52,'否'),
(2573,186,51,'软'),
(2574,186,50,'海绵'),
(2575,186,49,'经济型'),
(2576,186,48,'木'),
(2577,186,47,'成人'),
(2578,186,46,'林氏木业'),
(2579,186,45,'否'),
(2580,186,44,'广东省'),
(2581,186,43,'L形'),
(2582,186,42,'拼板'),
(2583,186,41,'其他 北京 上海 天津'),
(2584,186,40,'绒质'),
(2585,186,39,'整装'),
(2586,186,38,'艺术'),
(2587,186,37,'A银灰/B藏蓝/C香槟三色选'),
(2588,186,36,'大师设计'),
(2589,186,35,'木质工艺'),
(2590,186,34,'是'),
(2591,186,33,'升降'),
(2593,186,31,'2.93'),
(2594,186,30,'是'),
(2595,186,29,'植绒'),
(2596,186,28,'佛山市'),
(2597,186,27,'简约现代'),
(2598,187,56,'无安装说明'),
(2599,187,55,'是'),
(2600,187,54,'其他'),
(2601,187,53,'2040'),
(2602,187,52,'否'),
(2603,187,51,'软'),
(2604,187,50,'海绵'),
(2605,187,49,'经济型'),
(2606,187,48,'木'),
(2607,187,47,'成人'),
(2608,187,46,'林氏木业'),
(2609,187,45,'否'),
(2610,187,44,'广东省'),
(2611,187,43,'L形'),
(2612,187,42,'拼板'),
(2613,187,41,'其他 北京 上海 天津'),
(2614,187,40,'绒质'),
(2615,187,39,'整装'),
(2616,187,38,'艺术'),
(2617,187,37,'A银灰/B藏蓝/C香槟三色选'),
(2618,187,36,'大师设计'),
(2619,187,35,'木质工艺'),
(2620,187,34,'是'),
(2621,187,33,'升降'),
(2623,187,31,'2.93'),
(2624,187,30,'是'),
(2625,187,29,'植绒'),
(2626,187,28,'佛山市'),
(2627,187,27,'简约现代'),
(2628,188,56,'无安装说明'),
(2629,188,55,'是'),
(2630,188,54,'其他'),
(2631,188,53,'2040'),
(2632,188,52,'否'),
(2633,188,51,'软'),
(2634,188,50,'海绵'),
(2635,188,49,'经济型'),
(2636,188,48,'木'),
(2637,188,47,'成人'),
(2638,188,46,'林氏木业'),
(2639,188,45,'否'),
(2640,188,44,'广东省'),
(2641,188,43,'L形'),
(2642,188,42,'拼板'),
(2643,188,41,'其他 北京 上海 天津'),
(2644,188,40,'绒质'),
(2645,188,39,'整装'),
(2646,188,38,'艺术'),
(2647,188,37,'A银灰/B藏蓝/C香槟三色选'),
(2648,188,36,'大师设计'),
(2649,188,35,'木质工艺'),
(2650,188,34,'是'),
(2651,188,33,'升降'),
(2653,188,31,'2.93'),
(2654,188,30,'是'),
(2655,188,29,'植绒'),
(2656,188,28,'佛山市'),
(2657,188,27,'简约现代'),
(2658,189,56,'无安装说明'),
(2659,189,55,'是'),
(2660,189,54,'其他'),
(2661,189,53,'2040'),
(2662,189,52,'否'),
(2663,189,51,'软'),
(2664,189,50,'海绵'),
(2665,189,49,'经济型'),
(2666,189,48,'木'),
(2667,189,47,'成人'),
(2668,189,46,'林氏木业'),
(2669,189,45,'否'),
(2670,189,44,'广东省'),
(2671,189,43,'L形'),
(2672,189,42,'拼板'),
(2673,189,41,'其他 北京 上海 天津'),
(2674,189,40,'绒质'),
(2675,189,39,'整装'),
(2676,189,38,'艺术'),
(2677,189,37,'A银灰/B藏蓝/C香槟三色选'),
(2678,189,36,'大师设计'),
(2679,189,35,'木质工艺'),
(2680,189,34,'是'),
(2681,189,33,'升降'),
(2683,189,31,'2.93'),
(2684,189,30,'是'),
(2685,189,29,'植绒'),
(2686,189,28,'佛山市'),
(2687,189,27,'简约现代'),
(2688,190,56,'无安装说明'),
(2689,190,55,'是'),
(2690,190,54,'其他'),
(2691,190,53,'2040'),
(2692,190,52,'否'),
(2693,190,51,'软'),
(2694,190,50,'海绵'),
(2695,190,49,'经济型'),
(2696,190,48,'木'),
(2697,190,47,'成人'),
(2698,190,46,'林氏木业'),
(2699,190,45,'否'),
(2700,190,44,'广东省'),
(2701,190,43,'L形'),
(2702,190,42,'拼板'),
(2703,190,41,'其他 北京 上海 天津'),
(2704,190,40,'绒质'),
(2705,190,39,'整装'),
(2706,190,38,'艺术'),
(2707,190,37,'A银灰/B藏蓝/C香槟三色选'),
(2708,190,36,'大师设计'),
(2709,190,35,'木质工艺'),
(2710,190,34,'是'),
(2711,190,33,'升降'),
(2713,190,31,'2.93'),
(2714,190,30,'是'),
(2715,190,29,'植绒'),
(2716,190,28,'佛山市'),
(2717,190,27,'简约现代'),
(2718,191,56,'无安装说明'),
(2719,191,55,'是'),
(2720,191,54,'其他'),
(2721,191,53,'2040'),
(2722,191,52,'否'),
(2723,191,51,'软'),
(2724,191,50,'海绵'),
(2725,191,49,'经济型'),
(2726,191,48,'木'),
(2727,191,47,'成人'),
(2728,191,46,'林氏木业'),
(2729,191,45,'否'),
(2730,191,44,'广东省'),
(2731,191,43,'L形'),
(2732,191,42,'拼板'),
(2733,191,41,'其他 北京 上海 天津'),
(2734,191,40,'绒质'),
(2735,191,39,'整装'),
(2736,191,38,'艺术'),
(2737,191,37,'A银灰/B藏蓝/C香槟三色选'),
(2738,191,36,'大师设计'),
(2739,191,35,'木质工艺'),
(2740,191,34,'是'),
(2741,191,33,'升降'),
(2743,191,31,'2.93'),
(2744,191,30,'是'),
(2745,191,29,'植绒'),
(2746,191,28,'佛山市'),
(2747,191,27,'简约现代'),
(2748,192,56,'无安装说明'),
(2749,192,55,'是'),
(2750,192,54,'其他'),
(2751,192,53,'2040'),
(2752,192,52,'否'),
(2753,192,51,'软'),
(2754,192,50,'海绵'),
(2755,192,49,'经济型'),
(2756,192,48,'木'),
(2757,192,47,'成人'),
(2758,192,46,'林氏木业'),
(2759,192,45,'否'),
(2760,192,44,'广东省'),
(2761,192,43,'L形'),
(2762,192,42,'拼板'),
(2763,192,41,'其他 北京 上海 天津'),
(2764,192,40,'绒质'),
(2765,192,39,'整装'),
(2766,192,38,'艺术'),
(2767,192,37,'A银灰/B藏蓝/C香槟三色选'),
(2768,192,36,'大师设计'),
(2769,192,35,'木质工艺'),
(2770,192,34,'是'),
(2771,192,33,'升降'),
(2773,192,31,'2.93'),
(2774,192,30,'是'),
(2775,192,29,'植绒'),
(2776,192,28,'佛山市'),
(2777,192,27,'简约现代'),
(2778,193,56,'无安装说明'),
(2779,193,55,'是'),
(2780,193,54,'其他'),
(2781,193,53,'2040'),
(2782,193,52,'否'),
(2783,193,51,'软'),
(2784,193,50,'海绵'),
(2785,193,49,'经济型'),
(2786,193,48,'木'),
(2787,193,47,'成人'),
(2788,193,46,'林氏木业'),
(2789,193,45,'否'),
(2790,193,44,'广东省'),
(2791,193,43,'L形'),
(2792,193,42,'拼板'),
(2793,193,41,'其他 北京 上海 天津'),
(2794,193,40,'绒质'),
(2795,193,39,'整装'),
(2796,193,38,'艺术'),
(2797,193,37,'A银灰/B藏蓝/C香槟三色选'),
(2798,193,36,'大师设计'),
(2799,193,35,'木质工艺'),
(2800,193,34,'是'),
(2801,193,33,'升降'),
(2803,193,31,'2.93'),
(2804,193,30,'是'),
(2805,193,29,'植绒'),
(2806,193,28,'佛山市'),
(2807,193,27,'简约现代'),
(2808,194,56,'无安装说明'),
(2809,194,55,'是'),
(2810,194,54,'其他'),
(2811,194,53,'2040'),
(2812,194,52,'否'),
(2813,194,51,'软'),
(2814,194,50,'海绵'),
(2815,194,49,'经济型'),
(2816,194,48,'木'),
(2817,194,47,'成人'),
(2818,194,46,'林氏木业'),
(2819,194,45,'否'),
(2820,194,44,'广东省'),
(2821,194,43,'L形'),
(2822,194,42,'拼板'),
(2823,194,41,'其他 北京 上海 天津'),
(2824,194,40,'绒质'),
(2825,194,39,'整装'),
(2826,194,38,'艺术'),
(2827,194,37,'A银灰/B藏蓝/C香槟三色选'),
(2828,194,36,'大师设计'),
(2829,194,35,'木质工艺'),
(2830,194,34,'是'),
(2831,194,33,'升降'),
(2833,194,31,'2.93'),
(2834,194,30,'是'),
(2835,194,29,'植绒'),
(2836,194,28,'佛山市'),
(2837,194,27,'简约现代'),
(2838,195,56,'无安装说明'),
(2839,195,55,'是'),
(2840,195,54,'其他'),
(2841,195,53,'2040'),
(2842,195,52,'否'),
(2843,195,51,'软'),
(2844,195,50,'海绵'),
(2845,195,49,'经济型'),
(2846,195,48,'木'),
(2847,195,47,'成人'),
(2848,195,46,'林氏木业'),
(2849,195,45,'否'),
(2850,195,44,'广东省'),
(2851,195,43,'L形'),
(2852,195,42,'拼板'),
(2853,195,41,'其他 北京 上海 天津'),
(2854,195,40,'绒质'),
(2855,195,39,'整装'),
(2856,195,38,'艺术'),
(2857,195,37,'A银灰/B藏蓝/C香槟三色选'),
(2858,195,36,'大师设计'),
(2859,195,35,'木质工艺'),
(2860,195,34,'是'),
(2861,195,33,'升降'),
(2863,195,31,'2.93'),
(2864,195,30,'是'),
(2865,195,29,'植绒'),
(2866,195,28,'佛山市'),
(2867,195,27,'简约现代'),
(2868,196,56,'无安装说明'),
(2869,196,55,'是'),
(2870,196,54,'其他'),
(2871,196,53,'2040'),
(2872,196,52,'否'),
(2873,196,51,'软'),
(2874,196,50,'海绵'),
(2875,196,49,'经济型'),
(2876,196,48,'木'),
(2877,196,47,'成人'),
(2878,196,46,'林氏木业'),
(2879,196,45,'否'),
(2880,196,44,'广东省'),
(2881,196,43,'L形'),
(2882,196,42,'拼板'),
(2883,196,41,'其他 北京 上海 天津'),
(2884,196,40,'绒质'),
(2885,196,39,'整装'),
(2886,196,38,'艺术'),
(2887,196,37,'A银灰/B藏蓝/C香槟三色选'),
(2888,196,36,'大师设计'),
(2889,196,35,'木质工艺'),
(2890,196,34,'是'),
(2891,196,33,'升降'),
(2893,196,31,'2.93'),
(2894,196,30,'是'),
(2895,196,29,'植绒'),
(2896,196,28,'佛山市'),
(2897,196,27,'简约现代'),
(2898,197,56,'无安装说明'),
(2899,197,55,'是'),
(2900,197,54,'其他'),
(2901,197,53,'2040'),
(2902,197,52,'否'),
(2903,197,51,'软'),
(2904,197,50,'海绵'),
(2905,197,49,'经济型'),
(2906,197,48,'木'),
(2907,197,47,'成人'),
(2908,197,46,'林氏木业'),
(2909,197,45,'否'),
(2910,197,44,'广东省'),
(2911,197,43,'L形'),
(2912,197,42,'拼板'),
(2913,197,41,'其他 北京 上海 天津'),
(2914,197,40,'绒质'),
(2915,197,39,'整装'),
(2916,197,38,'艺术'),
(2917,197,37,'A银灰/B藏蓝/C香槟三色选'),
(2918,197,36,'大师设计'),
(2919,197,35,'木质工艺'),
(2920,197,34,'是'),
(2921,197,33,'升降'),
(2923,197,31,'2.93'),
(2924,197,30,'是'),
(2925,197,29,'植绒'),
(2926,197,28,'佛山市'),
(2927,197,27,'简约现代'),
(2928,198,56,'无安装说明'),
(2929,198,55,'是'),
(2930,198,54,'其他'),
(2931,198,53,'2040'),
(2932,198,52,'否'),
(2933,198,51,'软'),
(2934,198,50,'海绵'),
(2935,198,49,'经济型'),
(2936,198,48,'木'),
(2937,198,47,'成人'),
(2938,198,46,'林氏木业'),
(2939,198,45,'否'),
(2940,198,44,'广东省'),
(2941,198,43,'L形'),
(2942,198,42,'拼板'),
(2943,198,41,'其他 北京 上海 天津'),
(2944,198,40,'绒质'),
(2945,198,39,'整装'),
(2946,198,38,'艺术'),
(2947,198,37,'A银灰/B藏蓝/C香槟三色选'),
(2948,198,36,'大师设计'),
(2949,198,35,'木质工艺'),
(2950,198,34,'是'),
(2951,198,33,'升降'),
(2953,198,31,'2.93'),
(2954,198,30,'是'),
(2955,198,29,'植绒'),
(2956,198,28,'佛山市'),
(2957,198,27,'简约现代'),
(2958,199,56,'无安装说明'),
(2959,199,55,'是'),
(2960,199,54,'其他'),
(2961,199,53,'2040'),
(2962,199,52,'否'),
(2963,199,51,'软'),
(2964,199,50,'海绵'),
(2965,199,49,'经济型'),
(2966,199,48,'木'),
(2967,199,47,'成人'),
(2968,199,46,'林氏木业'),
(2969,199,45,'否'),
(2970,199,44,'广东省'),
(2971,199,43,'L形'),
(2972,199,42,'拼板'),
(2973,199,41,'其他 北京 上海 天津'),
(2974,199,40,'绒质'),
(2975,199,39,'整装'),
(2976,199,38,'艺术'),
(2977,199,37,'A银灰/B藏蓝/C香槟三色选'),
(2978,199,36,'大师设计'),
(2979,199,35,'木质工艺'),
(2980,199,34,'是'),
(2981,199,33,'升降'),
(2983,199,31,'2.93'),
(2984,199,30,'是'),
(2985,199,29,'植绒'),
(2986,199,28,'佛山市'),
(2987,199,27,'简约现代'),
(2988,200,56,'无安装说明'),
(2989,200,55,'是'),
(2990,200,54,'其他'),
(2991,200,53,'2040'),
(2992,200,52,'否'),
(2993,200,51,'软'),
(2994,200,50,'海绵'),
(2995,200,49,'经济型'),
(2996,200,48,'木'),
(2997,200,47,'成人'),
(2998,200,46,'林氏木业'),
(2999,200,45,'否'),
(3000,200,44,'广东省'),
(3001,200,43,'L形'),
(3002,200,42,'拼板'),
(3003,200,41,'其他 北京 上海 天津'),
(3004,200,40,'绒质'),
(3005,200,39,'整装'),
(3006,200,38,'艺术'),
(3007,200,37,'A银灰/B藏蓝/C香槟三色选'),
(3008,200,36,'大师设计'),
(3009,200,35,'木质工艺'),
(3010,200,34,'是'),
(3011,200,33,'升降'),
(3013,200,31,'2.93'),
(3014,200,30,'是'),
(3015,200,29,'植绒'),
(3016,200,28,'佛山市'),
(3017,200,27,'简约现代'),
(3018,201,56,'无安装说明'),
(3019,201,55,'是'),
(3020,201,54,'其他'),
(3021,201,53,'2040'),
(3022,201,52,'否'),
(3023,201,51,'软'),
(3024,201,50,'海绵'),
(3025,201,49,'经济型'),
(3026,201,48,'木'),
(3027,201,47,'成人'),
(3028,201,46,'林氏木业'),
(3029,201,45,'否'),
(3030,201,44,'广东省'),
(3031,201,43,'L形'),
(3032,201,42,'拼板'),
(3033,201,41,'其他 北京 上海 天津'),
(3034,201,40,'绒质'),
(3035,201,39,'整装'),
(3036,201,38,'艺术'),
(3037,201,37,'A银灰/B藏蓝/C香槟三色选'),
(3038,201,36,'大师设计'),
(3039,201,35,'木质工艺'),
(3040,201,34,'是'),
(3041,201,33,'升降'),
(3043,201,31,'2.93'),
(3044,201,30,'是'),
(3045,201,29,'植绒'),
(3046,201,28,'佛山市'),
(3047,201,27,'简约现代'),
(3048,202,56,'无安装说明'),
(3049,202,55,'是'),
(3050,202,54,'其他'),
(3051,202,53,'2040'),
(3052,202,52,'否'),
(3053,202,51,'软'),
(3054,202,50,'海绵'),
(3055,202,49,'经济型'),
(3056,202,48,'木'),
(3057,202,47,'成人'),
(3058,202,46,'林氏木业'),
(3059,202,45,'否'),
(3060,202,44,'广东省'),
(3061,202,43,'L形'),
(3062,202,42,'拼板'),
(3063,202,41,'其他 北京 上海 天津'),
(3064,202,40,'绒质'),
(3065,202,39,'整装'),
(3066,202,38,'艺术'),
(3067,202,37,'A银灰/B藏蓝/C香槟三色选'),
(3068,202,36,'大师设计'),
(3069,202,35,'木质工艺'),
(3070,202,34,'是'),
(3071,202,33,'升降'),
(3073,202,31,'2.93'),
(3074,202,30,'是'),
(3075,202,29,'植绒'),
(3076,202,28,'佛山市'),
(3077,202,27,'简约现代'),
(3078,203,56,'无安装说明'),
(3079,203,55,'是'),
(3080,203,54,'其他'),
(3081,203,53,'2040'),
(3082,203,52,'否'),
(3083,203,51,'软'),
(3084,203,50,'海绵'),
(3085,203,49,'经济型'),
(3086,203,48,'木'),
(3087,203,47,'成人'),
(3088,203,46,'林氏木业'),
(3089,203,45,'否'),
(3090,203,44,'广东省'),
(3091,203,43,'L形'),
(3092,203,42,'拼板'),
(3093,203,41,'其他 北京 上海 天津'),
(3094,203,40,'绒质'),
(3095,203,39,'整装'),
(3096,203,38,'艺术'),
(3097,203,37,'A银灰/B藏蓝/C香槟三色选'),
(3098,203,36,'大师设计'),
(3099,203,35,'木质工艺'),
(3100,203,34,'是'),
(3101,203,33,'升降'),
(3103,203,31,'2.93'),
(3104,203,30,'是'),
(3105,203,29,'植绒'),
(3106,203,28,'佛山市'),
(3107,203,27,'简约现代'),
(3108,204,56,'无安装说明'),
(3109,204,55,'是'),
(3110,204,54,'其他'),
(3111,204,53,'2040'),
(3112,204,52,'否'),
(3113,204,51,'软'),
(3114,204,50,'海绵'),
(3115,204,49,'经济型'),
(3116,204,48,'木'),
(3117,204,47,'成人'),
(3118,204,46,'林氏木业'),
(3119,204,45,'否'),
(3120,204,44,'广东省'),
(3121,204,43,'L形'),
(3122,204,42,'拼板'),
(3123,204,41,'其他 北京 上海 天津'),
(3124,204,40,'绒质'),
(3125,204,39,'整装'),
(3126,204,38,'艺术'),
(3127,204,37,'A银灰/B藏蓝/C香槟三色选'),
(3128,204,36,'大师设计'),
(3129,204,35,'木质工艺'),
(3130,204,34,'是'),
(3131,204,33,'升降'),
(3133,204,31,'2.93'),
(3134,204,30,'是'),
(3135,204,29,'植绒'),
(3136,204,28,'佛山市'),
(3137,204,27,'简约现代'),
(3138,205,56,'无安装说明'),
(3139,205,55,'是'),
(3140,205,54,'其他'),
(3141,205,53,'2040'),
(3142,205,52,'否'),
(3143,205,51,'软'),
(3144,205,50,'海绵'),
(3145,205,49,'经济型'),
(3146,205,48,'木'),
(3147,205,47,'成人'),
(3148,205,46,'林氏木业'),
(3149,205,45,'否'),
(3150,205,44,'广东省'),
(3151,205,43,'L形'),
(3152,205,42,'拼板'),
(3153,205,41,'其他 北京 上海 天津'),
(3154,205,40,'绒质'),
(3155,205,39,'整装'),
(3156,205,38,'艺术'),
(3157,205,37,'A银灰/B藏蓝/C香槟三色选'),
(3158,205,36,'大师设计'),
(3159,205,35,'木质工艺'),
(3160,205,34,'是'),
(3161,205,33,'升降'),
(3163,205,31,'2.93'),
(3164,205,30,'是'),
(3165,205,29,'植绒'),
(3166,205,28,'佛山市'),
(3167,205,27,'简约现代'),
(3168,206,56,'无安装说明'),
(3169,206,55,'是'),
(3170,206,54,'其他'),
(3171,206,53,'2040'),
(3172,206,52,'否'),
(3173,206,51,'软'),
(3174,206,50,'海绵'),
(3175,206,49,'经济型'),
(3176,206,48,'木'),
(3177,206,47,'成人'),
(3178,206,46,'林氏木业'),
(3179,206,45,'否'),
(3180,206,44,'广东省'),
(3181,206,43,'L形'),
(3182,206,42,'拼板'),
(3183,206,41,'其他 北京 上海 天津'),
(3184,206,40,'绒质'),
(3185,206,39,'整装'),
(3186,206,38,'艺术'),
(3187,206,37,'A银灰/B藏蓝/C香槟三色选'),
(3188,206,36,'大师设计'),
(3189,206,35,'木质工艺'),
(3190,206,34,'是'),
(3191,206,33,'升降'),
(3193,206,31,'2.93'),
(3194,206,30,'是'),
(3195,206,29,'植绒'),
(3196,206,28,'佛山市'),
(3197,206,27,'简约现代'),
(3198,207,67,'一级'),
(3199,207,66,'A．O．Smith/史密斯 F160'),
(3200,207,65,'横式'),
(3201,207,64,'艾欧史密斯(中国)热水器有限公司'),
(3202,207,63,'机械式'),
(3203,207,62,'F160'),
(3204,207,61,'2014010706673734'),
(3205,207,60,'艾欧史密斯(中国)热水器有限公司'),
(3206,207,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3207,207,58,'有效'),
(3208,207,57,'A．O．Smith/史密斯'),
(3209,208,67,'一级'),
(3210,208,66,'A．O．Smith/史密斯 F160'),
(3211,208,65,'横式'),
(3212,208,64,'艾欧史密斯(中国)热水器有限公司'),
(3213,208,63,'机械式'),
(3214,208,62,'F160'),
(3215,208,61,'2014010706673734'),
(3216,208,60,'艾欧史密斯(中国)热水器有限公司'),
(3217,208,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3218,208,58,'有效'),
(3219,208,57,'A．O．Smith/史密斯'),
(3220,209,67,'一级'),
(3221,209,66,'A．O．Smith/史密斯 F160'),
(3222,209,65,'横式'),
(3223,209,64,'艾欧史密斯(中国)热水器有限公司'),
(3224,209,63,'机械式'),
(3225,209,62,'F160'),
(3226,209,61,'2014010706673734'),
(3227,209,60,'艾欧史密斯(中国)热水器有限公司'),
(3228,209,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3229,209,58,'有效'),
(3230,209,57,'A．O．Smith/史密斯'),
(3231,210,67,'一级'),
(3232,210,66,'A．O．Smith/史密斯 F160'),
(3233,210,65,'横式'),
(3234,210,64,'艾欧史密斯(中国)热水器有限公司'),
(3235,210,63,'机械式'),
(3236,210,62,'F160'),
(3237,210,61,'2014010706673734'),
(3238,210,60,'艾欧史密斯(中国)热水器有限公司'),
(3239,210,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3240,210,58,'有效'),
(3241,210,57,'A．O．Smith/史密斯'),
(3242,211,67,'一级'),
(3243,211,66,'A．O．Smith/史密斯 F160'),
(3244,211,65,'横式'),
(3245,211,64,'艾欧史密斯(中国)热水器有限公司'),
(3246,211,63,'机械式'),
(3247,211,62,'F160'),
(3248,211,61,'2014010706673734'),
(3249,211,60,'艾欧史密斯(中国)热水器有限公司'),
(3250,211,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3251,211,58,'有效'),
(3252,211,57,'A．O．Smith/史密斯'),
(3253,212,67,'一级'),
(3254,212,66,'A．O．Smith/史密斯 F160'),
(3255,212,65,'横式'),
(3256,212,64,'艾欧史密斯(中国)热水器有限公司'),
(3257,212,63,'机械式'),
(3258,212,62,'F160'),
(3259,212,61,'2014010706673734'),
(3260,212,60,'艾欧史密斯(中国)热水器有限公司'),
(3261,212,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3262,212,58,'有效'),
(3263,212,57,'A．O．Smith/史密斯'),
(3264,213,67,'一级'),
(3265,213,66,'A．O．Smith/史密斯 F160'),
(3266,213,65,'横式'),
(3267,213,64,'艾欧史密斯(中国)热水器有限公司'),
(3268,213,63,'机械式'),
(3269,213,62,'F160'),
(3270,213,61,'2014010706673734'),
(3271,213,60,'艾欧史密斯(中国)热水器有限公司'),
(3272,213,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3273,213,58,'有效'),
(3274,213,57,'A．O．Smith/史密斯'),
(3275,214,67,'一级'),
(3276,214,66,'A．O．Smith/史密斯 F160'),
(3277,214,65,'横式'),
(3278,214,64,'艾欧史密斯(中国)热水器有限公司'),
(3279,214,63,'机械式'),
(3280,214,62,'F160'),
(3281,214,61,'2014010706673734'),
(3282,214,60,'艾欧史密斯(中国)热水器有限公司'),
(3283,214,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3284,214,58,'有效'),
(3285,214,57,'A．O．Smith/史密斯'),
(3286,215,67,'一级'),
(3287,215,66,'A．O．Smith/史密斯 F160'),
(3288,215,65,'横式'),
(3289,215,64,'艾欧史密斯(中国)热水器有限公司'),
(3290,215,63,'机械式'),
(3291,215,62,'F160'),
(3292,215,61,'2014010706673734'),
(3293,215,60,'艾欧史密斯(中国)热水器有限公司'),
(3294,215,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3295,215,58,'有效'),
(3296,215,57,'A．O．Smith/史密斯'),
(3297,216,67,'一级'),
(3298,216,66,'A．O．Smith/史密斯 F160'),
(3299,216,65,'横式'),
(3300,216,64,'艾欧史密斯(中国)热水器有限公司'),
(3301,216,63,'机械式'),
(3302,216,62,'F160'),
(3303,216,61,'2014010706673734'),
(3304,216,60,'艾欧史密斯(中国)热水器有限公司'),
(3305,216,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3306,216,58,'有效'),
(3307,216,57,'A．O．Smith/史密斯'),
(3308,217,67,'一级'),
(3309,217,66,'A．O．Smith/史密斯 F160'),
(3310,217,65,'横式'),
(3311,217,64,'艾欧史密斯(中国)热水器有限公司'),
(3312,217,63,'机械式'),
(3313,217,62,'F160'),
(3314,217,61,'2014010706673734'),
(3315,217,60,'艾欧史密斯(中国)热水器有限公司'),
(3316,217,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3317,217,58,'有效'),
(3318,217,57,'A．O．Smith/史密斯'),
(3319,218,67,'一级'),
(3320,218,66,'A．O．Smith/史密斯 F160'),
(3321,218,65,'横式'),
(3322,218,64,'艾欧史密斯(中国)热水器有限公司'),
(3323,218,63,'机械式'),
(3324,218,62,'F160'),
(3325,218,61,'2014010706673734'),
(3326,218,60,'艾欧史密斯(中国)热水器有限公司'),
(3327,218,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3328,218,58,'有效'),
(3329,218,57,'A．O．Smith/史密斯'),
(3330,219,67,'一级'),
(3331,219,66,'A．O．Smith/史密斯 F160'),
(3332,219,65,'横式'),
(3333,219,64,'艾欧史密斯(中国)热水器有限公司'),
(3334,219,63,'机械式'),
(3335,219,62,'F160'),
(3336,219,61,'2014010706673734'),
(3337,219,60,'艾欧史密斯(中国)热水器有限公司'),
(3338,219,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3339,219,58,'有效'),
(3340,219,57,'A．O．Smith/史密斯'),
(3341,220,67,'一级'),
(3342,220,66,'A．O．Smith/史密斯 F160'),
(3343,220,65,'横式'),
(3344,220,64,'艾欧史密斯(中国)热水器有限公司'),
(3345,220,63,'机械式'),
(3346,220,62,'F160'),
(3347,220,61,'2014010706673734'),
(3348,220,60,'艾欧史密斯(中国)热水器有限公司'),
(3349,220,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3350,220,58,'有效'),
(3351,220,57,'A．O．Smith/史密斯'),
(3352,221,67,'一级'),
(3353,221,66,'A．O．Smith/史密斯 F160'),
(3354,221,65,'横式'),
(3355,221,64,'艾欧史密斯(中国)热水器有限公司'),
(3356,221,63,'机械式'),
(3357,221,62,'F160'),
(3358,221,61,'2014010706673734'),
(3359,221,60,'艾欧史密斯(中国)热水器有限公司'),
(3360,221,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3361,221,58,'有效'),
(3362,221,57,'A．O．Smith/史密斯'),
(3363,222,67,'一级'),
(3364,222,66,'A．O．Smith/史密斯 F160'),
(3365,222,65,'横式'),
(3366,222,64,'艾欧史密斯(中国)热水器有限公司'),
(3367,222,63,'机械式'),
(3368,222,62,'F160'),
(3369,222,61,'2014010706673734'),
(3370,222,60,'艾欧史密斯(中国)热水器有限公司'),
(3371,222,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3372,222,58,'有效'),
(3373,222,57,'A．O．Smith/史密斯'),
(3374,223,67,'一级'),
(3375,223,66,'A．O．Smith/史密斯 F160'),
(3376,223,65,'横式'),
(3377,223,64,'艾欧史密斯(中国)热水器有限公司'),
(3378,223,63,'机械式'),
(3379,223,62,'F160'),
(3380,223,61,'2014010706673734'),
(3381,223,60,'艾欧史密斯(中国)热水器有限公司'),
(3382,223,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3383,223,58,'有效'),
(3384,223,57,'A．O．Smith/史密斯'),
(3385,224,67,'一级'),
(3386,224,66,'A．O．Smith/史密斯 F160'),
(3387,224,65,'横式'),
(3388,224,64,'艾欧史密斯(中国)热水器有限公司'),
(3389,224,63,'机械式'),
(3390,224,62,'F160'),
(3391,224,61,'2014010706673734'),
(3392,224,60,'艾欧史密斯(中国)热水器有限公司'),
(3393,224,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3394,224,58,'有效'),
(3395,224,57,'A．O．Smith/史密斯'),
(3396,225,67,'一级'),
(3397,225,66,'A．O．Smith/史密斯 F160'),
(3398,225,65,'横式'),
(3399,225,64,'艾欧史密斯(中国)热水器有限公司'),
(3400,225,63,'机械式'),
(3401,225,62,'F160'),
(3402,225,61,'2014010706673734'),
(3403,225,60,'艾欧史密斯(中国)热水器有限公司'),
(3404,225,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3405,225,58,'有效'),
(3406,225,57,'A．O．Smith/史密斯'),
(3407,226,67,'一级'),
(3408,226,66,'A．O．Smith/史密斯 F160'),
(3409,226,65,'横式'),
(3410,226,64,'艾欧史密斯(中国)热水器有限公司'),
(3411,226,63,'机械式'),
(3412,226,62,'F160'),
(3413,226,61,'2014010706673734'),
(3414,226,60,'艾欧史密斯(中国)热水器有限公司'),
(3415,226,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3416,226,58,'有效'),
(3417,226,57,'A．O．Smith/史密斯'),
(3418,227,67,'一级'),
(3419,227,66,'A．O．Smith/史密斯 F160'),
(3420,227,65,'横式'),
(3421,227,64,'艾欧史密斯(中国)热水器有限公司'),
(3422,227,63,'机械式'),
(3423,227,62,'F160'),
(3424,227,61,'2014010706673734'),
(3425,227,60,'艾欧史密斯(中国)热水器有限公司'),
(3426,227,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3427,227,58,'有效'),
(3428,227,57,'A．O．Smith/史密斯'),
(3429,228,67,'一级'),
(3430,228,66,'A．O．Smith/史密斯 F160'),
(3431,228,65,'横式'),
(3432,228,64,'艾欧史密斯(中国)热水器有限公司'),
(3433,228,63,'机械式'),
(3434,228,62,'F160'),
(3435,228,61,'2014010706673734'),
(3436,228,60,'艾欧史密斯(中国)热水器有限公司'),
(3437,228,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3438,228,58,'有效'),
(3439,228,57,'A．O．Smith/史密斯'),
(3440,229,67,'一级'),
(3441,229,66,'A．O．Smith/史密斯 F160'),
(3442,229,65,'横式'),
(3443,229,64,'艾欧史密斯(中国)热水器有限公司'),
(3444,229,63,'机械式'),
(3445,229,62,'F160'),
(3446,229,61,'2014010706673734'),
(3447,229,60,'艾欧史密斯(中国)热水器有限公司'),
(3448,229,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3449,229,58,'有效'),
(3450,229,57,'A．O．Smith/史密斯'),
(3451,230,67,'一级'),
(3452,230,66,'A．O．Smith/史密斯 F160'),
(3453,230,65,'横式'),
(3454,230,64,'艾欧史密斯(中国)热水器有限公司'),
(3455,230,63,'机械式'),
(3456,230,62,'F160'),
(3457,230,61,'2014010706673734'),
(3458,230,60,'艾欧史密斯(中国)热水器有限公司'),
(3459,230,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3460,230,58,'有效'),
(3461,230,57,'A．O．Smith/史密斯'),
(3462,231,67,'一级'),
(3463,231,66,'A．O．Smith/史密斯 F160'),
(3464,231,65,'横式'),
(3465,231,64,'艾欧史密斯(中国)热水器有限公司'),
(3466,231,63,'机械式'),
(3467,231,62,'F160'),
(3468,231,61,'2014010706673734'),
(3469,231,60,'艾欧史密斯(中国)热水器有限公司'),
(3470,231,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3471,231,58,'有效'),
(3472,231,57,'A．O．Smith/史密斯'),
(3473,232,67,'一级'),
(3474,232,66,'A．O．Smith/史密斯 F160'),
(3475,232,65,'横式'),
(3476,232,64,'艾欧史密斯(中国)热水器有限公司'),
(3477,232,63,'机械式'),
(3478,232,62,'F160'),
(3479,232,61,'2014010706673734'),
(3480,232,60,'艾欧史密斯(中国)热水器有限公司'),
(3481,232,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3482,232,58,'有效'),
(3483,232,57,'A．O．Smith/史密斯'),
(3484,233,67,'一级'),
(3485,233,66,'A．O．Smith/史密斯 F160'),
(3486,233,65,'横式'),
(3487,233,64,'艾欧史密斯(中国)热水器有限公司'),
(3488,233,63,'机械式'),
(3489,233,62,'F160'),
(3490,233,61,'2014010706673734'),
(3491,233,60,'艾欧史密斯(中国)热水器有限公司'),
(3492,233,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3493,233,58,'有效'),
(3494,233,57,'A．O．Smith/史密斯'),
(3495,234,67,'一级'),
(3496,234,66,'A．O．Smith/史密斯 F160'),
(3497,234,65,'横式'),
(3498,234,64,'艾欧史密斯(中国)热水器有限公司'),
(3499,234,63,'机械式'),
(3500,234,62,'F160'),
(3501,234,61,'2014010706673734'),
(3502,234,60,'艾欧史密斯(中国)热水器有限公司'),
(3503,234,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3504,234,58,'有效'),
(3505,234,57,'A．O．Smith/史密斯'),
(3506,235,67,'一级'),
(3507,235,66,'A．O．Smith/史密斯 F160'),
(3508,235,65,'横式'),
(3509,235,64,'艾欧史密斯(中国)热水器有限公司'),
(3510,235,63,'机械式'),
(3511,235,62,'F160'),
(3512,235,61,'2014010706673734'),
(3513,235,60,'艾欧史密斯(中国)热水器有限公司'),
(3514,235,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3515,235,58,'有效'),
(3516,235,57,'A．O．Smith/史密斯'),
(3517,236,67,'一级'),
(3518,236,66,'A．O．Smith/史密斯 F160'),
(3519,236,65,'横式'),
(3520,236,64,'艾欧史密斯(中国)热水器有限公司'),
(3521,236,63,'机械式'),
(3522,236,62,'F160'),
(3523,236,61,'2014010706673734'),
(3524,236,60,'艾欧史密斯(中国)热水器有限公司'),
(3525,236,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3526,236,58,'有效'),
(3527,236,57,'A．O．Smith/史密斯'),
(3528,237,67,'一级'),
(3529,237,66,'A．O．Smith/史密斯 F160'),
(3530,237,65,'横式'),
(3531,237,64,'艾欧史密斯(中国)热水器有限公司'),
(3532,237,63,'机械式'),
(3533,237,62,'F160'),
(3534,237,61,'2014010706673734'),
(3535,237,60,'艾欧史密斯(中国)热水器有限公司'),
(3536,237,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3537,237,58,'有效'),
(3538,237,57,'A．O．Smith/史密斯'),
(3539,238,67,'一级'),
(3540,238,66,'A．O．Smith/史密斯 F160'),
(3541,238,65,'横式'),
(3542,238,64,'艾欧史密斯(中国)热水器有限公司'),
(3543,238,63,'机械式'),
(3544,238,62,'F160'),
(3545,238,61,'2014010706673734'),
(3546,238,60,'艾欧史密斯(中国)热水器有限公司'),
(3547,238,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3548,238,58,'有效'),
(3549,238,57,'A．O．Smith/史密斯'),
(3550,239,67,'一级'),
(3551,239,66,'A．O．Smith/史密斯 F160'),
(3552,239,65,'横式'),
(3553,239,64,'艾欧史密斯(中国)热水器有限公司'),
(3554,239,63,'机械式'),
(3555,239,62,'F160'),
(3556,239,61,'2014010706673734'),
(3557,239,60,'艾欧史密斯(中国)热水器有限公司'),
(3558,239,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3559,239,58,'有效'),
(3560,239,57,'A．O．Smith/史密斯'),
(3561,240,67,'一级'),
(3562,240,66,'A．O．Smith/史密斯 F160'),
(3563,240,65,'横式'),
(3564,240,64,'艾欧史密斯(中国)热水器有限公司'),
(3565,240,63,'机械式'),
(3566,240,62,'F160'),
(3567,240,61,'2014010706673734'),
(3568,240,60,'艾欧史密斯(中国)热水器有限公司'),
(3569,240,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3570,240,58,'有效'),
(3571,240,57,'A．O．Smith/史密斯'),
(3572,241,67,'一级'),
(3573,241,66,'A．O．Smith/史密斯 F160'),
(3574,241,65,'横式'),
(3575,241,64,'艾欧史密斯(中国)热水器有限公司'),
(3576,241,63,'机械式'),
(3577,241,62,'F160'),
(3578,241,61,'2014010706673734'),
(3579,241,60,'艾欧史密斯(中国)热水器有限公司'),
(3580,241,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3581,241,58,'有效'),
(3582,241,57,'A．O．Smith/史密斯'),
(3583,242,67,'一级'),
(3584,242,66,'A．O．Smith/史密斯 F160'),
(3585,242,65,'横式'),
(3586,242,64,'艾欧史密斯(中国)热水器有限公司'),
(3587,242,63,'机械式'),
(3588,242,62,'F160'),
(3589,242,61,'2014010706673734'),
(3590,242,60,'艾欧史密斯(中国)热水器有限公司'),
(3591,242,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3592,242,58,'有效'),
(3593,242,57,'A．O．Smith/史密斯'),
(3594,243,67,'一级'),
(3595,243,66,'A．O．Smith/史密斯 F160'),
(3596,243,65,'横式'),
(3597,243,64,'艾欧史密斯(中国)热水器有限公司'),
(3598,243,63,'机械式'),
(3599,243,62,'F160'),
(3600,243,61,'2014010706673734'),
(3601,243,60,'艾欧史密斯(中国)热水器有限公司'),
(3602,243,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3603,243,58,'有效'),
(3604,243,57,'A．O．Smith/史密斯'),
(3605,244,67,'一级'),
(3606,244,66,'A．O．Smith/史密斯 F160'),
(3607,244,65,'横式'),
(3608,244,64,'艾欧史密斯(中国)热水器有限公司'),
(3609,244,63,'机械式'),
(3610,244,62,'F160'),
(3611,244,61,'2014010706673734'),
(3612,244,60,'艾欧史密斯(中国)热水器有限公司'),
(3613,244,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3614,244,58,'有效'),
(3615,244,57,'A．O．Smith/史密斯'),
(3616,245,67,'一级'),
(3617,245,66,'A．O．Smith/史密斯 F160'),
(3618,245,65,'横式'),
(3619,245,64,'艾欧史密斯(中国)热水器有限公司'),
(3620,245,63,'机械式'),
(3621,245,62,'F160'),
(3622,245,61,'2014010706673734'),
(3623,245,60,'艾欧史密斯(中国)热水器有限公司'),
(3624,245,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3625,245,58,'有效'),
(3626,245,57,'A．O．Smith/史密斯'),
(3627,246,67,'一级'),
(3628,246,66,'A．O．Smith/史密斯 F160'),
(3629,246,65,'横式'),
(3630,246,64,'艾欧史密斯(中国)热水器有限公司'),
(3631,246,63,'机械式'),
(3632,246,62,'F160'),
(3633,246,61,'2014010706673734'),
(3634,246,60,'艾欧史密斯(中国)热水器有限公司'),
(3635,246,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3636,246,58,'有效'),
(3637,246,57,'A．O．Smith/史密斯'),
(3638,247,67,'一级'),
(3639,247,66,'A．O．Smith/史密斯 F160'),
(3640,247,65,'横式'),
(3641,247,64,'艾欧史密斯(中国)热水器有限公司'),
(3642,247,63,'机械式'),
(3643,247,62,'F160'),
(3644,247,61,'2014010706673734'),
(3645,247,60,'艾欧史密斯(中国)热水器有限公司'),
(3646,247,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3647,247,58,'有效'),
(3648,247,57,'A．O．Smith/史密斯'),
(3649,248,67,'一级'),
(3650,248,66,'A．O．Smith/史密斯 F160'),
(3651,248,65,'横式'),
(3652,248,64,'艾欧史密斯(中国)热水器有限公司'),
(3653,248,63,'机械式'),
(3654,248,62,'F160'),
(3655,248,61,'2014010706673734'),
(3656,248,60,'艾欧史密斯(中国)热水器有限公司'),
(3657,248,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3658,248,58,'有效'),
(3659,248,57,'A．O．Smith/史密斯'),
(3660,249,67,'一级'),
(3661,249,66,'A．O．Smith/史密斯 F160'),
(3662,249,65,'横式'),
(3663,249,64,'艾欧史密斯(中国)热水器有限公司'),
(3664,249,63,'机械式'),
(3665,249,62,'F160'),
(3666,249,61,'2014010706673734'),
(3667,249,60,'艾欧史密斯(中国)热水器有限公司'),
(3668,249,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3669,249,58,'有效'),
(3670,249,57,'A．O．Smith/史密斯'),
(3671,250,67,'一级'),
(3672,250,66,'A．O．Smith/史密斯 F160'),
(3673,250,65,'横式'),
(3674,250,64,'艾欧史密斯(中国)热水器有限公司'),
(3675,250,63,'机械式'),
(3676,250,62,'F160'),
(3677,250,61,'2014010706673734'),
(3678,250,60,'艾欧史密斯(中国)热水器有限公司'),
(3679,250,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3680,250,58,'有效'),
(3681,250,57,'A．O．Smith/史密斯'),
(3682,251,67,'一级'),
(3683,251,66,'A．O．Smith/史密斯 F160'),
(3684,251,65,'横式'),
(3685,251,64,'艾欧史密斯(中国)热水器有限公司'),
(3686,251,63,'机械式'),
(3687,251,62,'F160'),
(3688,251,61,'2014010706673734'),
(3689,251,60,'艾欧史密斯(中国)热水器有限公司'),
(3690,251,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3691,251,58,'有效'),
(3692,251,57,'A．O．Smith/史密斯'),
(3693,252,67,'一级'),
(3694,252,66,'A．O．Smith/史密斯 F160'),
(3695,252,65,'横式'),
(3696,252,64,'艾欧史密斯(中国)热水器有限公司'),
(3697,252,63,'机械式'),
(3698,252,62,'F160'),
(3699,252,61,'2014010706673734'),
(3700,252,60,'艾欧史密斯(中国)热水器有限公司'),
(3701,252,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3702,252,58,'有效'),
(3703,252,57,'A．O．Smith/史密斯'),
(3704,253,67,'一级'),
(3705,253,66,'A．O．Smith/史密斯 F160'),
(3706,253,65,'横式'),
(3707,253,64,'艾欧史密斯(中国)热水器有限公司'),
(3708,253,63,'机械式'),
(3709,253,62,'F160'),
(3710,253,61,'2014010706673734'),
(3711,253,60,'艾欧史密斯(中国)热水器有限公司'),
(3712,253,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3713,253,58,'有效'),
(3714,253,57,'A．O．Smith/史密斯'),
(3715,254,67,'一级'),
(3716,254,66,'A．O．Smith/史密斯 F160'),
(3717,254,65,'横式'),
(3718,254,64,'艾欧史密斯(中国)热水器有限公司'),
(3719,254,63,'机械式'),
(3720,254,62,'F160'),
(3721,254,61,'2014010706673734'),
(3722,254,60,'艾欧史密斯(中国)热水器有限公司'),
(3723,254,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3724,254,58,'有效'),
(3725,254,57,'A．O．Smith/史密斯'),
(3726,255,67,'一级'),
(3727,255,66,'A．O．Smith/史密斯 F160'),
(3728,255,65,'横式'),
(3729,255,64,'艾欧史密斯(中国)热水器有限公司'),
(3730,255,63,'机械式'),
(3731,255,62,'F160'),
(3732,255,61,'2014010706673734'),
(3733,255,60,'艾欧史密斯(中国)热水器有限公司'),
(3734,255,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3735,255,58,'有效'),
(3736,255,57,'A．O．Smith/史密斯'),
(3737,256,67,'一级'),
(3738,256,66,'A．O．Smith/史密斯 F160'),
(3739,256,65,'横式'),
(3740,256,64,'艾欧史密斯(中国)热水器有限公司'),
(3741,256,63,'机械式'),
(3742,256,62,'F160'),
(3743,256,61,'2014010706673734'),
(3744,256,60,'艾欧史密斯(中国)热水器有限公司'),
(3745,256,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3746,256,58,'有效'),
(3747,256,57,'A．O．Smith/史密斯'),
(3748,257,67,'一级'),
(3749,257,66,'A．O．Smith/史密斯 F160'),
(3750,257,65,'横式'),
(3751,257,64,'艾欧史密斯(中国)热水器有限公司'),
(3752,257,63,'机械式'),
(3753,257,62,'F160'),
(3754,257,61,'2014010706673734'),
(3755,257,60,'艾欧史密斯(中国)热水器有限公司'),
(3756,257,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3757,257,58,'有效'),
(3758,257,57,'A．O．Smith/史密斯'),
(3759,258,67,'一级'),
(3760,258,66,'A．O．Smith/史密斯 F160'),
(3761,258,65,'横式'),
(3762,258,64,'艾欧史密斯(中国)热水器有限公司'),
(3763,258,63,'机械式'),
(3764,258,62,'F160'),
(3765,258,61,'2014010706673734'),
(3766,258,60,'艾欧史密斯(中国)热水器有限公司'),
(3767,258,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3768,258,58,'有效'),
(3769,258,57,'A．O．Smith/史密斯'),
(3770,259,67,'一级'),
(3771,259,66,'A．O．Smith/史密斯 F160'),
(3772,259,65,'横式'),
(3773,259,64,'艾欧史密斯(中国)热水器有限公司'),
(3774,259,63,'机械式'),
(3775,259,62,'F160'),
(3776,259,61,'2014010706673734'),
(3777,259,60,'艾欧史密斯(中国)热水器有限公司'),
(3778,259,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3779,259,58,'有效'),
(3780,259,57,'A．O．Smith/史密斯'),
(3781,260,67,'一级'),
(3782,260,66,'A．O．Smith/史密斯 F160'),
(3783,260,65,'横式'),
(3784,260,64,'艾欧史密斯(中国)热水器有限公司'),
(3785,260,63,'机械式'),
(3786,260,62,'F160'),
(3787,260,61,'2014010706673734'),
(3788,260,60,'艾欧史密斯(中国)热水器有限公司'),
(3789,260,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3790,260,58,'有效'),
(3791,260,57,'A．O．Smith/史密斯'),
(3792,261,67,'一级'),
(3793,261,66,'A．O．Smith/史密斯 F160'),
(3794,261,65,'横式'),
(3795,261,64,'艾欧史密斯(中国)热水器有限公司'),
(3796,261,63,'机械式'),
(3797,261,62,'F160'),
(3798,261,61,'2014010706673734'),
(3799,261,60,'艾欧史密斯(中国)热水器有限公司'),
(3800,261,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3801,261,58,'有效'),
(3802,261,57,'A．O．Smith/史密斯'),
(3803,262,67,'一级'),
(3804,262,66,'A．O．Smith/史密斯 F160'),
(3805,262,65,'横式'),
(3806,262,64,'艾欧史密斯(中国)热水器有限公司'),
(3807,262,63,'机械式'),
(3808,262,62,'F160'),
(3809,262,61,'2014010706673734'),
(3810,262,60,'艾欧史密斯(中国)热水器有限公司'),
(3811,262,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3812,262,58,'有效'),
(3813,262,57,'A．O．Smith/史密斯'),
(3814,263,67,'一级'),
(3815,263,66,'A．O．Smith/史密斯 F160'),
(3816,263,65,'横式'),
(3817,263,64,'艾欧史密斯(中国)热水器有限公司'),
(3818,263,63,'机械式'),
(3819,263,62,'F160'),
(3820,263,61,'2014010706673734'),
(3821,263,60,'艾欧史密斯(中国)热水器有限公司'),
(3822,263,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3823,263,58,'有效'),
(3824,263,57,'A．O．Smith/史密斯'),
(3825,264,67,'一级'),
(3826,264,66,'A．O．Smith/史密斯 F160'),
(3827,264,65,'横式'),
(3828,264,64,'艾欧史密斯(中国)热水器有限公司'),
(3829,264,63,'机械式'),
(3830,264,62,'F160'),
(3831,264,61,'2014010706673734'),
(3832,264,60,'艾欧史密斯(中国)热水器有限公司'),
(3833,264,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3834,264,58,'有效'),
(3835,264,57,'A．O．Smith/史密斯'),
(3836,265,67,'一级'),
(3837,265,66,'A．O．Smith/史密斯 F160'),
(3838,265,65,'横式'),
(3839,265,64,'艾欧史密斯(中国)热水器有限公司'),
(3840,265,63,'机械式'),
(3841,265,62,'F160'),
(3842,265,61,'2014010706673734'),
(3843,265,60,'艾欧史密斯(中国)热水器有限公司'),
(3844,265,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3845,265,58,'有效'),
(3846,265,57,'A．O．Smith/史密斯'),
(3847,266,67,'一级'),
(3848,266,66,'A．O．Smith/史密斯 F160'),
(3849,266,65,'横式'),
(3850,266,64,'艾欧史密斯(中国)热水器有限公司'),
(3851,266,63,'机械式'),
(3852,266,62,'F160'),
(3853,266,61,'2014010706673734'),
(3854,266,60,'艾欧史密斯(中国)热水器有限公司'),
(3855,266,59,'CEWH-40P8 40L, CEWH-50P8 50L, CEWH-60P8A 60L, CEWH...'),
(3856,266,58,'有效'),
(3857,266,57,'A．O．Smith/史密斯'),
(3858,267,72,'Ninebot'),
(3859,267,71,'One A1'),
(3860,267,70,'否'),
(3861,267,69,'独轮'),
(3862,267,68,'2016年夏季'),
(3863,268,72,'Ninebot'),
(3864,268,71,'One A1'),
(3865,268,70,'否'),
(3866,268,69,'独轮'),
(3867,268,68,'2016年夏季'),
(3868,269,72,'Ninebot'),
(3869,269,71,'One A1'),
(3870,269,70,'否'),
(3871,269,69,'独轮'),
(3872,269,68,'2016年夏季'),
(3873,270,72,'Ninebot'),
(3874,270,71,'One A1'),
(3875,270,70,'否'),
(3876,270,69,'独轮'),
(3877,270,68,'2016年夏季'),
(3878,271,72,'Ninebot'),
(3879,271,71,'One A1'),
(3880,271,70,'否'),
(3881,271,69,'独轮'),
(3882,271,68,'2016年夏季'),
(3883,272,72,'Ninebot'),
(3884,272,71,'One A1'),
(3885,272,70,'否'),
(3886,272,69,'独轮'),
(3887,272,68,'2016年夏季'),
(3888,273,72,'Ninebot'),
(3889,273,71,'One A1'),
(3890,273,70,'否'),
(3891,273,69,'独轮'),
(3892,273,68,'2016年夏季'),
(3893,274,72,'Ninebot'),
(3894,274,71,'One A1'),
(3895,274,70,'否'),
(3896,274,69,'独轮'),
(3897,274,68,'2016年夏季'),
(3898,275,72,'Ninebot'),
(3899,275,71,'One A1'),
(3900,275,70,'否'),
(3901,275,69,'独轮'),
(3902,275,68,'2016年夏季'),
(3903,276,72,'Ninebot'),
(3904,276,71,'One A1'),
(3905,276,70,'否'),
(3906,276,69,'独轮'),
(3907,276,68,'2016年夏季'),
(3908,277,72,'Ninebot'),
(3909,277,71,'One A1'),
(3910,277,70,'否'),
(3911,277,69,'独轮'),
(3912,277,68,'2016年夏季'),
(3913,278,72,'Ninebot'),
(3914,278,71,'One A1'),
(3915,278,70,'否'),
(3916,278,69,'独轮'),
(3917,278,68,'2016年夏季'),
(3918,279,72,'Ninebot'),
(3919,279,71,'One A1'),
(3920,279,70,'否'),
(3921,279,69,'独轮'),
(3922,279,68,'2016年夏季'),
(3923,280,72,'Ninebot'),
(3924,280,71,'One A1'),
(3925,280,70,'否'),
(3926,280,69,'独轮'),
(3927,280,68,'2016年夏季'),
(3928,281,72,'Ninebot'),
(3929,281,71,'One A1'),
(3930,281,70,'否'),
(3931,281,69,'独轮'),
(3932,281,68,'2016年夏季'),
(3933,282,72,'Ninebot'),
(3934,282,71,'One A1'),
(3935,282,70,'否'),
(3936,282,69,'独轮'),
(3937,282,68,'2016年夏季'),
(3938,283,72,'Ninebot'),
(3939,283,71,'One A1'),
(3940,283,70,'否'),
(3941,283,69,'独轮'),
(3942,283,68,'2016年夏季'),
(3943,284,72,'Ninebot'),
(3944,284,71,'One A1'),
(3945,284,70,'否'),
(3946,284,69,'独轮'),
(3947,284,68,'2016年夏季'),
(3948,285,72,'Ninebot'),
(3949,285,71,'One A1'),
(3950,285,70,'否'),
(3951,285,69,'独轮'),
(3952,285,68,'2016年夏季'),
(3953,286,72,'Ninebot'),
(3954,286,71,'One A1'),
(3955,286,70,'否'),
(3956,286,69,'独轮'),
(3957,286,68,'2016年夏季'),
(3958,287,72,'Ninebot'),
(3959,287,71,'One A1'),
(3960,287,70,'否'),
(3961,287,69,'独轮'),
(3962,287,68,'2016年夏季'),
(3963,288,72,'Ninebot'),
(3964,288,71,'One A1'),
(3965,288,70,'否'),
(3966,288,69,'独轮'),
(3967,288,68,'2016年夏季'),
(3968,289,72,'Ninebot'),
(3969,289,71,'One A1'),
(3970,289,70,'否'),
(3971,289,69,'独轮'),
(3972,289,68,'2016年夏季'),
(3973,290,72,'Ninebot'),
(3974,290,71,'One A1'),
(3975,290,70,'否'),
(3976,290,69,'独轮'),
(3977,290,68,'2016年夏季'),
(3978,291,72,'Ninebot'),
(3979,291,71,'One A1'),
(3980,291,70,'否'),
(3981,291,69,'独轮'),
(3982,291,68,'2016年夏季'),
(3983,292,72,'Ninebot'),
(3984,292,71,'One A1'),
(3985,292,70,'否'),
(3986,292,69,'独轮'),
(3987,292,68,'2016年夏季'),
(3988,293,72,'Ninebot'),
(3989,293,71,'One A1'),
(3990,293,70,'否'),
(3991,293,69,'独轮'),
(3992,293,68,'2016年夏季'),
(3993,294,72,'Ninebot'),
(3994,294,71,'One A1'),
(3995,294,70,'否'),
(3996,294,69,'独轮'),
(3997,294,68,'2016年夏季'),
(3998,295,72,'Ninebot'),
(3999,295,71,'One A1'),
(4000,295,70,'否'),
(4001,295,69,'独轮'),
(4002,295,68,'2016年夏季'),
(4003,296,72,'Ninebot'),
(4004,296,71,'One A1'),
(4005,296,70,'否'),
(4006,296,69,'独轮'),
(4007,296,68,'2016年夏季'),
(4008,297,72,'Ninebot'),
(4009,297,71,'One A1'),
(4010,297,70,'否'),
(4011,297,69,'独轮'),
(4012,297,68,'2016年夏季'),
(4013,298,72,'Ninebot'),
(4014,298,71,'One A1'),
(4015,298,70,'否'),
(4016,298,69,'独轮'),
(4017,298,68,'2016年夏季'),
(4018,299,72,'Ninebot'),
(4019,299,71,'One A1'),
(4020,299,70,'否'),
(4021,299,69,'独轮'),
(4022,299,68,'2016年夏季'),
(4023,300,72,'Ninebot'),
(4024,300,71,'One A1'),
(4025,300,70,'否'),
(4026,300,69,'独轮'),
(4027,300,68,'2016年夏季'),
(4028,301,72,'Ninebot'),
(4029,301,71,'One A1'),
(4030,301,70,'否'),
(4031,301,69,'独轮'),
(4032,301,68,'2016年夏季'),
(4033,302,72,'Ninebot'),
(4034,302,71,'One A1'),
(4035,302,70,'否'),
(4036,302,69,'独轮'),
(4037,302,68,'2016年夏季'),
(4038,303,72,'Ninebot'),
(4039,303,71,'One A1'),
(4040,303,70,'否'),
(4041,303,69,'独轮'),
(4042,303,68,'2016年夏季'),
(4043,304,72,'Ninebot'),
(4044,304,71,'One A1'),
(4045,304,70,'否'),
(4046,304,69,'独轮'),
(4047,304,68,'2016年夏季'),
(4048,305,72,'Ninebot'),
(4049,305,71,'One A1'),
(4050,305,70,'否'),
(4051,305,69,'独轮'),
(4052,305,68,'2016年夏季'),
(4053,306,72,'Ninebot'),
(4054,306,71,'One A1'),
(4055,306,70,'否'),
(4056,306,69,'独轮'),
(4057,306,68,'2016年夏季'),
(4058,307,72,'Ninebot'),
(4059,307,71,'One A1'),
(4060,307,70,'否'),
(4061,307,69,'独轮'),
(4062,307,68,'2016年夏季'),
(4063,308,72,'Ninebot'),
(4064,308,71,'One A1'),
(4065,308,70,'否'),
(4066,308,69,'独轮'),
(4067,308,68,'2016年夏季'),
(4068,309,72,'Ninebot'),
(4069,309,71,'One A1'),
(4070,309,70,'否'),
(4071,309,69,'独轮'),
(4072,309,68,'2016年夏季'),
(4073,310,72,'Ninebot'),
(4074,310,71,'One A1'),
(4075,310,70,'否'),
(4076,310,69,'独轮'),
(4077,310,68,'2016年夏季'),
(4078,311,72,'Ninebot'),
(4079,311,71,'One A1'),
(4080,311,70,'否'),
(4081,311,69,'独轮'),
(4082,311,68,'2016年夏季'),
(4083,312,72,'Ninebot'),
(4084,312,71,'One A1'),
(4085,312,70,'否'),
(4086,312,69,'独轮'),
(4087,312,68,'2016年夏季'),
(4088,313,72,'Ninebot'),
(4089,313,71,'One A1'),
(4090,313,70,'否'),
(4091,313,69,'独轮'),
(4092,313,68,'2016年夏季'),
(4093,314,72,'Ninebot'),
(4094,314,71,'One A1'),
(4095,314,70,'否'),
(4096,314,69,'独轮'),
(4097,314,68,'2016年夏季'),
(4098,315,72,'Ninebot'),
(4099,315,71,'One A1'),
(4100,315,70,'否'),
(4101,315,69,'独轮'),
(4102,315,68,'2016年夏季'),
(4103,316,72,'Ninebot'),
(4104,316,71,'One A1'),
(4105,316,70,'否'),
(4106,316,69,'独轮'),
(4107,316,68,'2016年夏季'),
(4108,317,72,'Ninebot'),
(4109,317,71,'One A1'),
(4110,317,70,'否'),
(4111,317,69,'独轮'),
(4112,317,68,'2016年夏季'),
(4113,318,72,'Ninebot'),
(4114,318,71,'One A1'),
(4115,318,70,'否'),
(4116,318,69,'独轮'),
(4117,318,68,'2016年夏季'),
(4118,319,72,'Ninebot'),
(4119,319,71,'One A1'),
(4120,319,70,'否'),
(4121,319,69,'独轮'),
(4122,319,68,'2016年夏季'),
(4123,320,72,'Ninebot'),
(4124,320,71,'One A1'),
(4125,320,70,'否'),
(4126,320,69,'独轮'),
(4127,320,68,'2016年夏季'),
(4128,321,72,'Ninebot'),
(4129,321,71,'One A1'),
(4130,321,70,'否'),
(4131,321,69,'独轮'),
(4132,321,68,'2016年夏季'),
(4133,322,86,'有'),
(4134,322,85,'规划式'),
(4135,322,84,'钛金咖'),
(4136,322,83,'地宝朵朵S'),
(4137,322,82,'有'),
(4138,322,81,'无'),
(4139,322,80,'3000mAh'),
(4140,322,79,'是'),
(4141,322,78,'机械+电子双层保护'),
(4142,322,77,'7.9cm'),
(4143,322,76,'拖扫吸式'),
(4144,322,75,'扫地机器人'),
(4145,322,74,'0.5L'),
(4146,322,73,'无'),
(4147,323,86,'有'),
(4148,323,85,'规划式'),
(4149,323,84,'钛金咖'),
(4150,323,83,'地宝朵朵S'),
(4151,323,82,'有'),
(4152,323,81,'无'),
(4153,323,80,'3000mAh'),
(4154,323,79,'是'),
(4155,323,78,'机械+电子双层保护'),
(4156,323,77,'7.9cm'),
(4157,323,76,'拖扫吸式'),
(4158,323,75,'扫地机器人'),
(4159,323,74,'0.5L'),
(4160,323,73,'无'),
(4161,324,86,'有'),
(4162,324,85,'规划式'),
(4163,324,84,'钛金咖'),
(4164,324,83,'地宝朵朵S'),
(4165,324,82,'有'),
(4166,324,81,'无'),
(4167,324,80,'3000mAh'),
(4168,324,79,'是'),
(4169,324,78,'机械+电子双层保护'),
(4170,324,77,'7.9cm'),
(4171,324,76,'拖扫吸式'),
(4172,324,75,'扫地机器人'),
(4173,324,74,'0.5L'),
(4174,324,73,'无'),
(4175,325,86,'有'),
(4176,325,85,'规划式'),
(4177,325,84,'钛金咖'),
(4178,325,83,'地宝朵朵S'),
(4179,325,82,'有'),
(4180,325,81,'无'),
(4181,325,80,'3000mAh'),
(4182,325,79,'是'),
(4183,325,78,'机械+电子双层保护'),
(4184,325,77,'7.9cm'),
(4185,325,76,'拖扫吸式'),
(4186,325,75,'扫地机器人'),
(4187,325,74,'0.5L'),
(4188,325,73,'无'),
(4189,326,86,'有'),
(4190,326,85,'规划式'),
(4191,326,84,'钛金咖'),
(4192,326,83,'地宝朵朵S'),
(4193,326,82,'有'),
(4194,326,81,'无'),
(4195,326,80,'3000mAh'),
(4196,326,79,'是'),
(4197,326,78,'机械+电子双层保护'),
(4198,326,77,'7.9cm'),
(4199,326,76,'拖扫吸式'),
(4200,326,75,'扫地机器人'),
(4201,326,74,'0.5L'),
(4202,326,73,'无'),
(4203,327,86,'有'),
(4204,327,85,'规划式'),
(4205,327,84,'钛金咖'),
(4206,327,83,'地宝朵朵S'),
(4207,327,82,'有'),
(4208,327,81,'无'),
(4209,327,80,'3000mAh'),
(4210,327,79,'是'),
(4211,327,78,'机械+电子双层保护'),
(4212,327,77,'7.9cm'),
(4213,327,76,'拖扫吸式'),
(4214,327,75,'扫地机器人'),
(4215,327,74,'0.5L'),
(4216,327,73,'无'),
(4217,328,86,'有'),
(4218,328,85,'规划式'),
(4219,328,84,'钛金咖'),
(4220,328,83,'地宝朵朵S'),
(4221,328,82,'有'),
(4222,328,81,'无'),
(4223,328,80,'3000mAh'),
(4224,328,79,'是'),
(4225,328,78,'机械+电子双层保护'),
(4226,328,77,'7.9cm'),
(4227,328,76,'拖扫吸式'),
(4228,328,75,'扫地机器人'),
(4229,328,74,'0.5L'),
(4230,328,73,'无'),
(4231,329,86,'有'),
(4232,329,85,'规划式'),
(4233,329,84,'钛金咖'),
(4234,329,83,'地宝朵朵S'),
(4235,329,82,'有'),
(4236,329,81,'无'),
(4237,329,80,'3000mAh'),
(4238,329,79,'是'),
(4239,329,78,'机械+电子双层保护'),
(4240,329,77,'7.9cm'),
(4241,329,76,'拖扫吸式'),
(4242,329,75,'扫地机器人'),
(4243,329,74,'0.5L'),
(4244,329,73,'无'),
(4245,330,86,'有'),
(4246,330,85,'规划式'),
(4247,330,84,'钛金咖'),
(4248,330,83,'地宝朵朵S'),
(4249,330,82,'有'),
(4250,330,81,'无'),
(4251,330,80,'3000mAh'),
(4252,330,79,'是'),
(4253,330,78,'机械+电子双层保护'),
(4254,330,77,'7.9cm'),
(4255,330,76,'拖扫吸式'),
(4256,330,75,'扫地机器人'),
(4257,330,74,'0.5L'),
(4258,330,73,'无'),
(4259,331,86,'有'),
(4260,331,85,'规划式'),
(4261,331,84,'钛金咖'),
(4262,331,83,'地宝朵朵S'),
(4263,331,82,'有'),
(4264,331,81,'无'),
(4265,331,80,'3000mAh'),
(4266,331,79,'是'),
(4267,331,78,'机械+电子双层保护'),
(4268,331,77,'7.9cm'),
(4269,331,76,'拖扫吸式'),
(4270,331,75,'扫地机器人'),
(4271,331,74,'0.5L'),
(4272,331,73,'无'),
(4273,332,86,'有'),
(4274,332,85,'规划式'),
(4275,332,84,'钛金咖'),
(4276,332,83,'地宝朵朵S'),
(4277,332,82,'有'),
(4278,332,81,'无'),
(4279,332,80,'3000mAh'),
(4280,332,79,'是'),
(4281,332,78,'机械+电子双层保护'),
(4282,332,77,'7.9cm'),
(4283,332,76,'拖扫吸式'),
(4284,332,75,'扫地机器人'),
(4285,332,74,'0.5L'),
(4286,332,73,'无'),
(4287,333,86,'有'),
(4288,333,85,'规划式'),
(4289,333,84,'钛金咖'),
(4290,333,83,'地宝朵朵S'),
(4291,333,82,'有'),
(4292,333,81,'无'),
(4293,333,80,'3000mAh'),
(4294,333,79,'是'),
(4295,333,78,'机械+电子双层保护'),
(4296,333,77,'7.9cm'),
(4297,333,76,'拖扫吸式'),
(4298,333,75,'扫地机器人'),
(4299,333,74,'0.5L'),
(4300,333,73,'无'),
(4301,334,86,'有'),
(4302,334,85,'规划式'),
(4303,334,84,'钛金咖'),
(4304,334,83,'地宝朵朵S'),
(4305,334,82,'有'),
(4306,334,81,'无'),
(4307,334,80,'3000mAh'),
(4308,334,79,'是'),
(4309,334,78,'机械+电子双层保护'),
(4310,334,77,'7.9cm'),
(4311,334,76,'拖扫吸式'),
(4312,334,75,'扫地机器人'),
(4313,334,74,'0.5L'),
(4314,334,73,'无'),
(4315,335,86,'有'),
(4316,335,85,'规划式'),
(4317,335,84,'钛金咖'),
(4318,335,83,'地宝朵朵S'),
(4319,335,82,'有'),
(4320,335,81,'无'),
(4321,335,80,'3000mAh'),
(4322,335,79,'是'),
(4323,335,78,'机械+电子双层保护'),
(4324,335,77,'7.9cm'),
(4325,335,76,'拖扫吸式'),
(4326,335,75,'扫地机器人'),
(4327,335,74,'0.5L'),
(4328,335,73,'无'),
(4329,336,86,'有'),
(4330,336,85,'规划式'),
(4331,336,84,'钛金咖'),
(4332,336,83,'地宝朵朵S'),
(4333,336,82,'有'),
(4334,336,81,'无'),
(4335,336,80,'3000mAh'),
(4336,336,79,'是'),
(4337,336,78,'机械+电子双层保护'),
(4338,336,77,'7.9cm'),
(4339,336,76,'拖扫吸式'),
(4340,336,75,'扫地机器人'),
(4341,336,74,'0.5L'),
(4342,336,73,'无'),
(4343,337,86,'有'),
(4344,337,85,'规划式'),
(4345,337,84,'钛金咖'),
(4346,337,83,'地宝朵朵S'),
(4347,337,82,'有'),
(4348,337,81,'无'),
(4349,337,80,'3000mAh'),
(4350,337,79,'是'),
(4351,337,78,'机械+电子双层保护'),
(4352,337,77,'7.9cm'),
(4353,337,76,'拖扫吸式'),
(4354,337,75,'扫地机器人'),
(4355,337,74,'0.5L'),
(4356,337,73,'无'),
(4357,338,86,'有'),
(4358,338,85,'规划式'),
(4359,338,84,'钛金咖'),
(4360,338,83,'地宝朵朵S'),
(4361,338,82,'有'),
(4362,338,81,'无'),
(4363,338,80,'3000mAh'),
(4364,338,79,'是'),
(4365,338,78,'机械+电子双层保护'),
(4366,338,77,'7.9cm'),
(4367,338,76,'拖扫吸式'),
(4368,338,75,'扫地机器人'),
(4369,338,74,'0.5L'),
(4370,338,73,'无'),
(4371,339,86,'有'),
(4372,339,85,'规划式'),
(4373,339,84,'钛金咖'),
(4374,339,83,'地宝朵朵S'),
(4375,339,82,'有'),
(4376,339,81,'无'),
(4377,339,80,'3000mAh'),
(4378,339,79,'是'),
(4379,339,78,'机械+电子双层保护'),
(4380,339,77,'7.9cm'),
(4381,339,76,'拖扫吸式'),
(4382,339,75,'扫地机器人'),
(4383,339,74,'0.5L'),
(4384,339,73,'无'),
(4385,340,86,'有'),
(4386,340,85,'规划式'),
(4387,340,84,'钛金咖'),
(4388,340,83,'地宝朵朵S'),
(4389,340,82,'有'),
(4390,340,81,'无'),
(4391,340,80,'3000mAh'),
(4392,340,79,'是'),
(4393,340,78,'机械+电子双层保护'),
(4394,340,77,'7.9cm'),
(4395,340,76,'拖扫吸式'),
(4396,340,75,'扫地机器人'),
(4397,340,74,'0.5L'),
(4398,340,73,'无'),
(4399,341,86,'有'),
(4400,341,85,'规划式'),
(4401,341,84,'钛金咖'),
(4402,341,83,'地宝朵朵S'),
(4403,341,82,'有'),
(4404,341,81,'无'),
(4405,341,80,'3000mAh'),
(4406,341,79,'是'),
(4407,341,78,'机械+电子双层保护'),
(4408,341,77,'7.9cm'),
(4409,341,76,'拖扫吸式'),
(4410,341,75,'扫地机器人'),
(4411,341,74,'0.5L'),
(4412,341,73,'无'),
(4413,342,86,'有'),
(4414,342,85,'规划式'),
(4415,342,84,'钛金咖'),
(4416,342,83,'地宝朵朵S'),
(4417,342,82,'有'),
(4418,342,81,'无'),
(4419,342,80,'3000mAh'),
(4420,342,79,'是'),
(4421,342,78,'机械+电子双层保护'),
(4422,342,77,'7.9cm'),
(4423,342,76,'拖扫吸式'),
(4424,342,75,'扫地机器人'),
(4425,342,74,'0.5L'),
(4426,342,73,'无'),
(4427,343,86,'有'),
(4428,343,85,'规划式'),
(4429,343,84,'钛金咖'),
(4430,343,83,'地宝朵朵S'),
(4431,343,82,'有'),
(4432,343,81,'无'),
(4433,343,80,'3000mAh'),
(4434,343,79,'是'),
(4435,343,78,'机械+电子双层保护'),
(4436,343,77,'7.9cm'),
(4437,343,76,'拖扫吸式'),
(4438,343,75,'扫地机器人'),
(4439,343,74,'0.5L'),
(4440,343,73,'无'),
(4441,344,86,'有'),
(4442,344,85,'规划式'),
(4443,344,84,'钛金咖'),
(4444,344,83,'地宝朵朵S'),
(4445,344,82,'有'),
(4446,344,81,'无'),
(4447,344,80,'3000mAh'),
(4448,344,79,'是'),
(4449,344,78,'机械+电子双层保护'),
(4450,344,77,'7.9cm'),
(4451,344,76,'拖扫吸式'),
(4452,344,75,'扫地机器人'),
(4453,344,74,'0.5L'),
(4454,344,73,'无'),
(4455,345,86,'有'),
(4456,345,85,'规划式'),
(4457,345,84,'钛金咖'),
(4458,345,83,'地宝朵朵S'),
(4459,345,82,'有'),
(4460,345,81,'无'),
(4461,345,80,'3000mAh'),
(4462,345,79,'是'),
(4463,345,78,'机械+电子双层保护'),
(4464,345,77,'7.9cm'),
(4465,345,76,'拖扫吸式'),
(4466,345,75,'扫地机器人'),
(4467,345,74,'0.5L'),
(4468,345,73,'无'),
(4469,346,86,'有'),
(4470,346,85,'规划式'),
(4471,346,84,'钛金咖'),
(4472,346,83,'地宝朵朵S'),
(4473,346,82,'有'),
(4474,346,81,'无'),
(4475,346,80,'3000mAh'),
(4476,346,79,'是'),
(4477,346,78,'机械+电子双层保护'),
(4478,346,77,'7.9cm'),
(4479,346,76,'拖扫吸式'),
(4480,346,75,'扫地机器人'),
(4481,346,74,'0.5L'),
(4482,346,73,'无'),
(4483,347,86,'有'),
(4484,347,85,'规划式'),
(4485,347,84,'钛金咖'),
(4486,347,83,'地宝朵朵S'),
(4487,347,82,'有'),
(4488,347,81,'无'),
(4489,347,80,'3000mAh'),
(4490,347,79,'是'),
(4491,347,78,'机械+电子双层保护'),
(4492,347,77,'7.9cm'),
(4493,347,76,'拖扫吸式'),
(4494,347,75,'扫地机器人'),
(4495,347,74,'0.5L'),
(4496,347,73,'无'),
(4497,348,86,'有'),
(4498,348,85,'规划式'),
(4499,348,84,'钛金咖'),
(4500,348,83,'地宝朵朵S'),
(4501,348,82,'有'),
(4502,348,81,'无'),
(4503,348,80,'3000mAh'),
(4504,348,79,'是'),
(4505,348,78,'机械+电子双层保护'),
(4506,348,77,'7.9cm'),
(4507,348,76,'拖扫吸式'),
(4508,348,75,'扫地机器人'),
(4509,348,74,'0.5L'),
(4510,348,73,'无'),
(4511,349,86,'有'),
(4512,349,85,'规划式'),
(4513,349,84,'钛金咖'),
(4514,349,83,'地宝朵朵S'),
(4515,349,82,'有'),
(4516,349,81,'无'),
(4517,349,80,'3000mAh'),
(4518,349,79,'是'),
(4519,349,78,'机械+电子双层保护'),
(4520,349,77,'7.9cm'),
(4521,349,76,'拖扫吸式'),
(4522,349,75,'扫地机器人'),
(4523,349,74,'0.5L'),
(4524,349,73,'无'),
(4525,350,86,'有'),
(4526,350,85,'规划式'),
(4527,350,84,'钛金咖'),
(4528,350,83,'地宝朵朵S'),
(4529,350,82,'有'),
(4530,350,81,'无'),
(4531,350,80,'3000mAh'),
(4532,350,79,'是'),
(4533,350,78,'机械+电子双层保护'),
(4534,350,77,'7.9cm'),
(4535,350,76,'拖扫吸式'),
(4536,350,75,'扫地机器人'),
(4537,350,74,'0.5L'),
(4538,350,73,'无'),
(4539,351,86,'有'),
(4540,351,85,'规划式'),
(4541,351,84,'钛金咖'),
(4542,351,83,'地宝朵朵S'),
(4543,351,82,'有'),
(4544,351,81,'无'),
(4545,351,80,'3000mAh'),
(4546,351,79,'是'),
(4547,351,78,'机械+电子双层保护'),
(4548,351,77,'7.9cm'),
(4549,351,76,'拖扫吸式'),
(4550,351,75,'扫地机器人'),
(4551,351,74,'0.5L'),
(4552,351,73,'无'),
(4553,352,86,'有'),
(4554,352,85,'规划式'),
(4555,352,84,'钛金咖'),
(4556,352,83,'地宝朵朵S'),
(4557,352,82,'有'),
(4558,352,81,'无'),
(4559,352,80,'3000mAh'),
(4560,352,79,'是'),
(4561,352,78,'机械+电子双层保护'),
(4562,352,77,'7.9cm'),
(4563,352,76,'拖扫吸式'),
(4564,352,75,'扫地机器人'),
(4565,352,74,'0.5L'),
(4566,352,73,'无'),
(4567,353,86,'有'),
(4568,353,85,'规划式'),
(4569,353,84,'钛金咖'),
(4570,353,83,'地宝朵朵S'),
(4571,353,82,'有'),
(4572,353,81,'无'),
(4573,353,80,'3000mAh'),
(4574,353,79,'是'),
(4575,353,78,'机械+电子双层保护'),
(4576,353,77,'7.9cm'),
(4577,353,76,'拖扫吸式'),
(4578,353,75,'扫地机器人'),
(4579,353,74,'0.5L'),
(4580,353,73,'无'),
(4581,354,86,'有'),
(4582,354,85,'规划式'),
(4583,354,84,'钛金咖'),
(4584,354,83,'地宝朵朵S'),
(4585,354,82,'有'),
(4586,354,81,'无'),
(4587,354,80,'3000mAh'),
(4588,354,79,'是'),
(4589,354,78,'机械+电子双层保护'),
(4590,354,77,'7.9cm'),
(4591,354,76,'拖扫吸式'),
(4592,354,75,'扫地机器人'),
(4593,354,74,'0.5L'),
(4594,354,73,'无'),
(4595,355,86,'有'),
(4596,355,85,'规划式'),
(4597,355,84,'钛金咖'),
(4598,355,83,'地宝朵朵S'),
(4599,355,82,'有'),
(4600,355,81,'无'),
(4601,355,80,'3000mAh'),
(4602,355,79,'是'),
(4603,355,78,'机械+电子双层保护'),
(4604,355,77,'7.9cm'),
(4605,355,76,'拖扫吸式'),
(4606,355,75,'扫地机器人'),
(4607,355,74,'0.5L'),
(4608,355,73,'无'),
(4609,356,86,'有'),
(4610,356,85,'规划式'),
(4611,356,84,'钛金咖'),
(4612,356,83,'地宝朵朵S'),
(4613,356,82,'有'),
(4614,356,81,'无'),
(4615,356,80,'3000mAh'),
(4616,356,79,'是'),
(4617,356,78,'机械+电子双层保护'),
(4618,356,77,'7.9cm'),
(4619,356,76,'拖扫吸式'),
(4620,356,75,'扫地机器人'),
(4621,356,74,'0.5L'),
(4622,356,73,'无'),
(4623,357,86,'有'),
(4624,357,85,'规划式'),
(4625,357,84,'钛金咖'),
(4626,357,83,'地宝朵朵S'),
(4627,357,82,'有'),
(4628,357,81,'无'),
(4629,357,80,'3000mAh'),
(4630,357,79,'是'),
(4631,357,78,'机械+电子双层保护'),
(4632,357,77,'7.9cm'),
(4633,357,76,'拖扫吸式'),
(4634,357,75,'扫地机器人'),
(4635,357,74,'0.5L'),
(4636,357,73,'无'),
(4637,358,86,'有'),
(4638,358,85,'规划式'),
(4639,358,84,'钛金咖'),
(4640,358,83,'地宝朵朵S'),
(4641,358,82,'有'),
(4642,358,81,'无'),
(4643,358,80,'3000mAh'),
(4644,358,79,'是'),
(4645,358,78,'机械+电子双层保护'),
(4646,358,77,'7.9cm'),
(4647,358,76,'拖扫吸式'),
(4648,358,75,'扫地机器人'),
(4649,358,74,'0.5L'),
(4650,358,73,'无'),
(4651,359,86,'有'),
(4652,359,85,'规划式'),
(4653,359,84,'钛金咖'),
(4654,359,83,'地宝朵朵S'),
(4655,359,82,'有'),
(4656,359,81,'无'),
(4657,359,80,'3000mAh'),
(4658,359,79,'是'),
(4659,359,78,'机械+电子双层保护'),
(4660,359,77,'7.9cm'),
(4661,359,76,'拖扫吸式'),
(4662,359,75,'扫地机器人'),
(4663,359,74,'0.5L'),
(4664,359,73,'无'),
(4665,360,86,'有'),
(4666,360,85,'规划式'),
(4667,360,84,'钛金咖'),
(4668,360,83,'地宝朵朵S'),
(4669,360,82,'有'),
(4670,360,81,'无'),
(4671,360,80,'3000mAh'),
(4672,360,79,'是'),
(4673,360,78,'机械+电子双层保护'),
(4674,360,77,'7.9cm'),
(4675,360,76,'拖扫吸式'),
(4676,360,75,'扫地机器人'),
(4677,360,74,'0.5L'),
(4678,360,73,'无'),
(4679,361,86,'有'),
(4680,361,85,'规划式'),
(4681,361,84,'钛金咖'),
(4682,361,83,'地宝朵朵S'),
(4683,361,82,'有'),
(4684,361,81,'无'),
(4685,361,80,'3000mAh'),
(4686,361,79,'是'),
(4687,361,78,'机械+电子双层保护'),
(4688,361,77,'7.9cm'),
(4689,361,76,'拖扫吸式'),
(4690,361,75,'扫地机器人'),
(4691,361,74,'0.5L'),
(4692,361,73,'无'),
(4693,362,86,'有'),
(4694,362,85,'规划式'),
(4695,362,84,'钛金咖'),
(4696,362,83,'地宝朵朵S'),
(4697,362,82,'有'),
(4698,362,81,'无'),
(4699,362,80,'3000mAh'),
(4700,362,79,'是'),
(4701,362,78,'机械+电子双层保护'),
(4702,362,77,'7.9cm'),
(4703,362,76,'拖扫吸式'),
(4704,362,75,'扫地机器人'),
(4705,362,74,'0.5L'),
(4706,362,73,'无'),
(4707,363,86,'有'),
(4708,363,85,'规划式'),
(4709,363,84,'钛金咖'),
(4710,363,83,'地宝朵朵S'),
(4711,363,82,'有'),
(4712,363,81,'无'),
(4713,363,80,'3000mAh'),
(4714,363,79,'是'),
(4715,363,78,'机械+电子双层保护'),
(4716,363,77,'7.9cm'),
(4717,363,76,'拖扫吸式'),
(4718,363,75,'扫地机器人'),
(4719,363,74,'0.5L'),
(4720,363,73,'无'),
(4721,364,86,'有'),
(4722,364,85,'规划式'),
(4723,364,84,'钛金咖'),
(4724,364,83,'地宝朵朵S'),
(4725,364,82,'有'),
(4726,364,81,'无'),
(4727,364,80,'3000mAh'),
(4728,364,79,'是'),
(4729,364,78,'机械+电子双层保护'),
(4730,364,77,'7.9cm'),
(4731,364,76,'拖扫吸式'),
(4732,364,75,'扫地机器人'),
(4733,364,74,'0.5L'),
(4734,364,73,'无'),
(4735,365,86,'有'),
(4736,365,85,'规划式'),
(4737,365,84,'钛金咖'),
(4738,365,83,'地宝朵朵S'),
(4739,365,82,'有'),
(4740,365,81,'无'),
(4741,365,80,'3000mAh'),
(4742,365,79,'是'),
(4743,365,78,'机械+电子双层保护'),
(4744,365,77,'7.9cm'),
(4745,365,76,'拖扫吸式'),
(4746,365,75,'扫地机器人'),
(4747,365,74,'0.5L'),
(4748,365,73,'无'),
(4749,366,86,'有'),
(4750,366,85,'规划式'),
(4751,366,84,'钛金咖'),
(4752,366,83,'地宝朵朵S'),
(4753,366,82,'有'),
(4754,366,81,'无'),
(4755,366,80,'3000mAh'),
(4756,366,79,'是'),
(4757,366,78,'机械+电子双层保护'),
(4758,366,77,'7.9cm'),
(4759,366,76,'拖扫吸式'),
(4760,366,75,'扫地机器人'),
(4761,366,74,'0.5L'),
(4762,366,73,'无'),
(4763,367,86,'有'),
(4764,367,85,'规划式'),
(4765,367,84,'钛金咖'),
(4766,367,83,'地宝朵朵S'),
(4767,367,82,'有'),
(4768,367,81,'无'),
(4769,367,80,'3000mAh'),
(4770,367,79,'是'),
(4771,367,78,'机械+电子双层保护'),
(4772,367,77,'7.9cm'),
(4773,367,76,'拖扫吸式'),
(4774,367,75,'扫地机器人'),
(4775,367,74,'0.5L'),
(4776,367,73,'无'),
(4777,368,86,'有'),
(4778,368,85,'规划式'),
(4779,368,84,'钛金咖'),
(4780,368,83,'地宝朵朵S'),
(4781,368,82,'有'),
(4782,368,81,'无'),
(4783,368,80,'3000mAh'),
(4784,368,79,'是'),
(4785,368,78,'机械+电子双层保护'),
(4786,368,77,'7.9cm'),
(4787,368,76,'拖扫吸式'),
(4788,368,75,'扫地机器人'),
(4789,368,74,'0.5L'),
(4790,368,73,'无'),
(4791,369,86,'有'),
(4792,369,85,'规划式'),
(4793,369,84,'钛金咖'),
(4794,369,83,'地宝朵朵S'),
(4795,369,82,'有'),
(4796,369,81,'无'),
(4797,369,80,'3000mAh'),
(4798,369,79,'是'),
(4799,369,78,'机械+电子双层保护'),
(4800,369,77,'7.9cm'),
(4801,369,76,'拖扫吸式'),
(4802,369,75,'扫地机器人'),
(4803,369,74,'0.5L'),
(4804,369,73,'无'),
(4805,370,86,'有'),
(4806,370,85,'规划式'),
(4807,370,84,'钛金咖'),
(4808,370,83,'地宝朵朵S'),
(4809,370,82,'有'),
(4810,370,81,'无'),
(4811,370,80,'3000mAh'),
(4812,370,79,'是'),
(4813,370,78,'机械+电子双层保护'),
(4814,370,77,'7.9cm'),
(4815,370,76,'拖扫吸式'),
(4816,370,75,'扫地机器人'),
(4817,370,74,'0.5L'),
(4818,370,73,'无'),
(4819,371,86,'有'),
(4820,371,85,'规划式'),
(4821,371,84,'钛金咖'),
(4822,371,83,'地宝朵朵S'),
(4823,371,82,'有'),
(4824,371,81,'无'),
(4825,371,80,'3000mAh'),
(4826,371,79,'是'),
(4827,371,78,'机械+电子双层保护'),
(4828,371,77,'7.9cm'),
(4829,371,76,'拖扫吸式'),
(4830,371,75,'扫地机器人'),
(4831,371,74,'0.5L'),
(4832,371,73,'无'),
(4833,372,86,'有'),
(4834,372,85,'规划式'),
(4835,372,84,'钛金咖'),
(4836,372,83,'地宝朵朵S'),
(4837,372,82,'有'),
(4838,372,81,'无'),
(4839,372,80,'3000mAh'),
(4840,372,79,'是'),
(4841,372,78,'机械+电子双层保护'),
(4842,372,77,'7.9cm'),
(4843,372,76,'拖扫吸式'),
(4844,372,75,'扫地机器人'),
(4845,372,74,'0.5L'),
(4846,372,73,'无'),
(4847,373,86,'有'),
(4848,373,85,'规划式'),
(4849,373,84,'钛金咖'),
(4850,373,83,'地宝朵朵S'),
(4851,373,82,'有'),
(4852,373,81,'无'),
(4853,373,80,'3000mAh'),
(4854,373,79,'是'),
(4855,373,78,'机械+电子双层保护'),
(4856,373,77,'7.9cm'),
(4857,373,76,'拖扫吸式'),
(4858,373,75,'扫地机器人'),
(4859,373,74,'0.5L'),
(4860,373,73,'无'),
(4861,374,86,'有'),
(4862,374,85,'规划式'),
(4863,374,84,'钛金咖'),
(4864,374,83,'地宝朵朵S'),
(4865,374,82,'有'),
(4866,374,81,'无'),
(4867,374,80,'3000mAh'),
(4868,374,79,'是'),
(4869,374,78,'机械+电子双层保护'),
(4870,374,77,'7.9cm'),
(4871,374,76,'拖扫吸式'),
(4872,374,75,'扫地机器人'),
(4873,374,74,'0.5L'),
(4874,374,73,'无'),
(4875,375,86,'有'),
(4876,375,85,'规划式'),
(4877,375,84,'钛金咖'),
(4878,375,83,'地宝朵朵S'),
(4879,375,82,'有'),
(4880,375,81,'无'),
(4881,375,80,'3000mAh'),
(4882,375,79,'是'),
(4883,375,78,'机械+电子双层保护'),
(4884,375,77,'7.9cm'),
(4885,375,76,'拖扫吸式'),
(4886,375,75,'扫地机器人'),
(4887,375,74,'0.5L'),
(4888,375,73,'无'),
(4889,376,86,'有'),
(4890,376,85,'规划式'),
(4891,376,84,'钛金咖'),
(4892,376,83,'地宝朵朵S'),
(4893,376,82,'有'),
(4894,376,81,'无'),
(4895,376,80,'3000mAh'),
(4896,376,79,'是'),
(4897,376,78,'机械+电子双层保护'),
(4898,376,77,'7.9cm'),
(4899,376,76,'拖扫吸式'),
(4900,376,75,'扫地机器人'),
(4901,376,74,'0.5L'),
(4902,376,73,'无'),
(4903,377,86,'有'),
(4904,377,85,'规划式'),
(4905,377,84,'钛金咖'),
(4906,377,83,'地宝朵朵S'),
(4907,377,82,'有'),
(4908,377,81,'无'),
(4909,377,80,'3000mAh'),
(4910,377,79,'是'),
(4911,377,78,'机械+电子双层保护'),
(4912,377,77,'7.9cm'),
(4913,377,76,'拖扫吸式'),
(4914,377,75,'扫地机器人'),
(4915,377,74,'0.5L'),
(4916,377,73,'无'),
(4917,378,101,'按键式'),
(4918,378,100,'多功能榨汁机'),
(4919,378,99,'金色 红色'),
(4920,378,98,'塑料'),
(4921,378,97,'韩国'),
(4922,378,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(4923,378,95,'HUROM CO.,LTD.'),
(4924,378,94,'HUO15FR'),
(4925,378,93,'2014010713734694'),
(4926,378,92,'150W(含)-200W(不含)'),
(4927,378,91,'HUROM CO.,LTD.'),
(4928,378,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(4929,378,89,'有效'),
(4930,378,88,'40转/分(含)-60转/分(含)'),
(4931,378,87,'Hurom/惠人'),
(4932,379,101,'按键式'),
(4933,379,100,'多功能榨汁机'),
(4934,379,99,'金色 红色'),
(4935,379,98,'塑料'),
(4936,379,97,'韩国'),
(4937,379,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(4938,379,95,'HUROM CO.,LTD.'),
(4939,379,94,'HUO15FR'),
(4940,379,93,'2014010713734694'),
(4941,379,92,'150W(含)-200W(不含)'),
(4942,379,91,'HUROM CO.,LTD.'),
(4943,379,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(4944,379,89,'有效'),
(4945,379,88,'40转/分(含)-60转/分(含)'),
(4946,379,87,'Hurom/惠人'),
(4947,380,101,'按键式'),
(4948,380,100,'多功能榨汁机'),
(4949,380,99,'金色 红色'),
(4950,380,98,'塑料'),
(4951,380,97,'韩国'),
(4952,380,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(4953,380,95,'HUROM CO.,LTD.'),
(4954,380,94,'HUO15FR'),
(4955,380,93,'2014010713734694'),
(4956,380,92,'150W(含)-200W(不含)'),
(4957,380,91,'HUROM CO.,LTD.'),
(4958,380,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(4959,380,89,'有效'),
(4960,380,88,'40转/分(含)-60转/分(含)'),
(4961,380,87,'Hurom/惠人'),
(4962,381,101,'按键式'),
(4963,381,100,'多功能榨汁机'),
(4964,381,99,'金色 红色'),
(4965,381,98,'塑料'),
(4966,381,97,'韩国'),
(4967,381,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(4968,381,95,'HUROM CO.,LTD.'),
(4969,381,94,'HUO15FR'),
(4970,381,93,'2014010713734694'),
(4971,381,92,'150W(含)-200W(不含)'),
(4972,381,91,'HUROM CO.,LTD.'),
(4973,381,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(4974,381,89,'有效'),
(4975,381,88,'40转/分(含)-60转/分(含)'),
(4976,381,87,'Hurom/惠人'),
(4977,382,101,'按键式'),
(4978,382,100,'多功能榨汁机'),
(4979,382,99,'金色 红色'),
(4980,382,98,'塑料'),
(4981,382,97,'韩国'),
(4982,382,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(4983,382,95,'HUROM CO.,LTD.'),
(4984,382,94,'HUO15FR'),
(4985,382,93,'2014010713734694'),
(4986,382,92,'150W(含)-200W(不含)'),
(4987,382,91,'HUROM CO.,LTD.'),
(4988,382,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(4989,382,89,'有效'),
(4990,382,88,'40转/分(含)-60转/分(含)'),
(4991,382,87,'Hurom/惠人'),
(4992,383,101,'按键式'),
(4993,383,100,'多功能榨汁机'),
(4994,383,99,'金色 红色'),
(4995,383,98,'塑料'),
(4996,383,97,'韩国'),
(4997,383,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(4998,383,95,'HUROM CO.,LTD.'),
(4999,383,94,'HUO15FR'),
(5000,383,93,'2014010713734694'),
(5001,383,92,'150W(含)-200W(不含)'),
(5002,383,91,'HUROM CO.,LTD.'),
(5003,383,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5004,383,89,'有效'),
(5005,383,88,'40转/分(含)-60转/分(含)'),
(5006,383,87,'Hurom/惠人'),
(5007,384,101,'按键式'),
(5008,384,100,'多功能榨汁机'),
(5009,384,99,'金色 红色'),
(5010,384,98,'塑料'),
(5011,384,97,'韩国'),
(5012,384,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5013,384,95,'HUROM CO.,LTD.'),
(5014,384,94,'HUO15FR'),
(5015,384,93,'2014010713734694'),
(5016,384,92,'150W(含)-200W(不含)'),
(5017,384,91,'HUROM CO.,LTD.'),
(5018,384,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5019,384,89,'有效'),
(5020,384,88,'40转/分(含)-60转/分(含)'),
(5021,384,87,'Hurom/惠人'),
(5022,385,101,'按键式'),
(5023,385,100,'多功能榨汁机'),
(5024,385,99,'金色 红色'),
(5025,385,98,'塑料'),
(5026,385,97,'韩国'),
(5027,385,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5028,385,95,'HUROM CO.,LTD.'),
(5029,385,94,'HUO15FR'),
(5030,385,93,'2014010713734694'),
(5031,385,92,'150W(含)-200W(不含)'),
(5032,385,91,'HUROM CO.,LTD.'),
(5033,385,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5034,385,89,'有效'),
(5035,385,88,'40转/分(含)-60转/分(含)'),
(5036,385,87,'Hurom/惠人'),
(5037,386,101,'按键式'),
(5038,386,100,'多功能榨汁机'),
(5039,386,99,'金色 红色'),
(5040,386,98,'塑料'),
(5041,386,97,'韩国'),
(5042,386,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5043,386,95,'HUROM CO.,LTD.'),
(5044,386,94,'HUO15FR'),
(5045,386,93,'2014010713734694'),
(5046,386,92,'150W(含)-200W(不含)'),
(5047,386,91,'HUROM CO.,LTD.'),
(5048,386,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5049,386,89,'有效'),
(5050,386,88,'40转/分(含)-60转/分(含)'),
(5051,386,87,'Hurom/惠人'),
(5052,387,101,'按键式'),
(5053,387,100,'多功能榨汁机'),
(5054,387,99,'金色 红色'),
(5055,387,98,'塑料'),
(5056,387,97,'韩国'),
(5057,387,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5058,387,95,'HUROM CO.,LTD.'),
(5059,387,94,'HUO15FR'),
(5060,387,93,'2014010713734694'),
(5061,387,92,'150W(含)-200W(不含)'),
(5062,387,91,'HUROM CO.,LTD.'),
(5063,387,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5064,387,89,'有效'),
(5065,387,88,'40转/分(含)-60转/分(含)'),
(5066,387,87,'Hurom/惠人'),
(5067,388,101,'按键式'),
(5068,388,100,'多功能榨汁机'),
(5069,388,99,'金色 红色'),
(5070,388,98,'塑料'),
(5071,388,97,'韩国'),
(5072,388,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5073,388,95,'HUROM CO.,LTD.'),
(5074,388,94,'HUO15FR'),
(5075,388,93,'2014010713734694'),
(5076,388,92,'150W(含)-200W(不含)'),
(5077,388,91,'HUROM CO.,LTD.'),
(5078,388,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5079,388,89,'有效'),
(5080,388,88,'40转/分(含)-60转/分(含)'),
(5081,388,87,'Hurom/惠人'),
(5082,389,101,'按键式'),
(5083,389,100,'多功能榨汁机'),
(5084,389,99,'金色 红色'),
(5085,389,98,'塑料'),
(5086,389,97,'韩国'),
(5087,389,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5088,389,95,'HUROM CO.,LTD.'),
(5089,389,94,'HUO15FR'),
(5090,389,93,'2014010713734694'),
(5091,389,92,'150W(含)-200W(不含)'),
(5092,389,91,'HUROM CO.,LTD.'),
(5093,389,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5094,389,89,'有效'),
(5095,389,88,'40转/分(含)-60转/分(含)'),
(5096,389,87,'Hurom/惠人'),
(5097,390,101,'按键式'),
(5098,390,100,'多功能榨汁机'),
(5099,390,99,'金色 红色'),
(5100,390,98,'塑料'),
(5101,390,97,'韩国'),
(5102,390,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5103,390,95,'HUROM CO.,LTD.'),
(5104,390,94,'HUO15FR'),
(5105,390,93,'2014010713734694'),
(5106,390,92,'150W(含)-200W(不含)'),
(5107,390,91,'HUROM CO.,LTD.'),
(5108,390,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5109,390,89,'有效'),
(5110,390,88,'40转/分(含)-60转/分(含)'),
(5111,390,87,'Hurom/惠人'),
(5112,391,101,'按键式'),
(5113,391,100,'多功能榨汁机'),
(5114,391,99,'金色 红色'),
(5115,391,98,'塑料'),
(5116,391,97,'韩国'),
(5117,391,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5118,391,95,'HUROM CO.,LTD.'),
(5119,391,94,'HUO15FR'),
(5120,391,93,'2014010713734694'),
(5121,391,92,'150W(含)-200W(不含)'),
(5122,391,91,'HUROM CO.,LTD.'),
(5123,391,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5124,391,89,'有效'),
(5125,391,88,'40转/分(含)-60转/分(含)'),
(5126,391,87,'Hurom/惠人'),
(5127,392,101,'按键式'),
(5128,392,100,'多功能榨汁机'),
(5129,392,99,'金色 红色'),
(5130,392,98,'塑料'),
(5131,392,97,'韩国'),
(5132,392,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5133,392,95,'HUROM CO.,LTD.'),
(5134,392,94,'HUO15FR'),
(5135,392,93,'2014010713734694'),
(5136,392,92,'150W(含)-200W(不含)'),
(5137,392,91,'HUROM CO.,LTD.'),
(5138,392,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5139,392,89,'有效'),
(5140,392,88,'40转/分(含)-60转/分(含)'),
(5141,392,87,'Hurom/惠人'),
(5142,393,101,'按键式'),
(5143,393,100,'多功能榨汁机'),
(5144,393,99,'金色 红色'),
(5145,393,98,'塑料'),
(5146,393,97,'韩国'),
(5147,393,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5148,393,95,'HUROM CO.,LTD.'),
(5149,393,94,'HUO15FR'),
(5150,393,93,'2014010713734694'),
(5151,393,92,'150W(含)-200W(不含)'),
(5152,393,91,'HUROM CO.,LTD.'),
(5153,393,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5154,393,89,'有效'),
(5155,393,88,'40转/分(含)-60转/分(含)'),
(5156,393,87,'Hurom/惠人'),
(5157,394,101,'按键式'),
(5158,394,100,'多功能榨汁机'),
(5159,394,99,'金色 红色'),
(5160,394,98,'塑料'),
(5161,394,97,'韩国'),
(5162,394,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5163,394,95,'HUROM CO.,LTD.'),
(5164,394,94,'HUO15FR'),
(5165,394,93,'2014010713734694'),
(5166,394,92,'150W(含)-200W(不含)'),
(5167,394,91,'HUROM CO.,LTD.'),
(5168,394,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5169,394,89,'有效'),
(5170,394,88,'40转/分(含)-60转/分(含)'),
(5171,394,87,'Hurom/惠人'),
(5172,395,101,'按键式'),
(5173,395,100,'多功能榨汁机'),
(5174,395,99,'金色 红色'),
(5175,395,98,'塑料'),
(5176,395,97,'韩国'),
(5177,395,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5178,395,95,'HUROM CO.,LTD.'),
(5179,395,94,'HUO15FR'),
(5180,395,93,'2014010713734694'),
(5181,395,92,'150W(含)-200W(不含)'),
(5182,395,91,'HUROM CO.,LTD.'),
(5183,395,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5184,395,89,'有效'),
(5185,395,88,'40转/分(含)-60转/分(含)'),
(5186,395,87,'Hurom/惠人'),
(5187,396,101,'按键式'),
(5188,396,100,'多功能榨汁机'),
(5189,396,99,'金色 红色'),
(5190,396,98,'塑料'),
(5191,396,97,'韩国'),
(5192,396,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5193,396,95,'HUROM CO.,LTD.'),
(5194,396,94,'HUO15FR'),
(5195,396,93,'2014010713734694'),
(5196,396,92,'150W(含)-200W(不含)'),
(5197,396,91,'HUROM CO.,LTD.'),
(5198,396,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5199,396,89,'有效'),
(5200,396,88,'40转/分(含)-60转/分(含)'),
(5201,396,87,'Hurom/惠人'),
(5202,397,101,'按键式'),
(5203,397,100,'多功能榨汁机'),
(5204,397,99,'金色 红色'),
(5205,397,98,'塑料'),
(5206,397,97,'韩国'),
(5207,397,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5208,397,95,'HUROM CO.,LTD.'),
(5209,397,94,'HUO15FR'),
(5210,397,93,'2014010713734694'),
(5211,397,92,'150W(含)-200W(不含)'),
(5212,397,91,'HUROM CO.,LTD.'),
(5213,397,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5214,397,89,'有效'),
(5215,397,88,'40转/分(含)-60转/分(含)'),
(5216,397,87,'Hurom/惠人'),
(5217,398,101,'按键式'),
(5218,398,100,'多功能榨汁机'),
(5219,398,99,'金色 红色'),
(5220,398,98,'塑料'),
(5221,398,97,'韩国'),
(5222,398,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5223,398,95,'HUROM CO.,LTD.'),
(5224,398,94,'HUO15FR'),
(5225,398,93,'2014010713734694'),
(5226,398,92,'150W(含)-200W(不含)'),
(5227,398,91,'HUROM CO.,LTD.'),
(5228,398,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5229,398,89,'有效'),
(5230,398,88,'40转/分(含)-60转/分(含)'),
(5231,398,87,'Hurom/惠人'),
(5232,399,101,'按键式'),
(5233,399,100,'多功能榨汁机'),
(5234,399,99,'金色 红色'),
(5235,399,98,'塑料'),
(5236,399,97,'韩国'),
(5237,399,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5238,399,95,'HUROM CO.,LTD.'),
(5239,399,94,'HUO15FR'),
(5240,399,93,'2014010713734694'),
(5241,399,92,'150W(含)-200W(不含)'),
(5242,399,91,'HUROM CO.,LTD.'),
(5243,399,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5244,399,89,'有效'),
(5245,399,88,'40转/分(含)-60转/分(含)'),
(5246,399,87,'Hurom/惠人'),
(5247,400,101,'按键式'),
(5248,400,100,'多功能榨汁机'),
(5249,400,99,'金色 红色'),
(5250,400,98,'塑料'),
(5251,400,97,'韩国'),
(5252,400,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5253,400,95,'HUROM CO.,LTD.'),
(5254,400,94,'HUO15FR'),
(5255,400,93,'2014010713734694'),
(5256,400,92,'150W(含)-200W(不含)'),
(5257,400,91,'HUROM CO.,LTD.'),
(5258,400,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5259,400,89,'有效'),
(5260,400,88,'40转/分(含)-60转/分(含)'),
(5261,400,87,'Hurom/惠人'),
(5262,401,101,'按键式'),
(5263,401,100,'多功能榨汁机'),
(5264,401,99,'金色 红色'),
(5265,401,98,'塑料'),
(5266,401,97,'韩国'),
(5267,401,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5268,401,95,'HUROM CO.,LTD.'),
(5269,401,94,'HUO15FR'),
(5270,401,93,'2014010713734694'),
(5271,401,92,'150W(含)-200W(不含)'),
(5272,401,91,'HUROM CO.,LTD.'),
(5273,401,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5274,401,89,'有效'),
(5275,401,88,'40转/分(含)-60转/分(含)'),
(5276,401,87,'Hurom/惠人'),
(5277,402,101,'按键式'),
(5278,402,100,'多功能榨汁机'),
(5279,402,99,'金色 红色'),
(5280,402,98,'塑料'),
(5281,402,97,'韩国'),
(5282,402,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5283,402,95,'HUROM CO.,LTD.'),
(5284,402,94,'HUO15FR'),
(5285,402,93,'2014010713734694'),
(5286,402,92,'150W(含)-200W(不含)'),
(5287,402,91,'HUROM CO.,LTD.'),
(5288,402,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5289,402,89,'有效'),
(5290,402,88,'40转/分(含)-60转/分(含)'),
(5291,402,87,'Hurom/惠人'),
(5292,403,101,'按键式'),
(5293,403,100,'多功能榨汁机'),
(5294,403,99,'金色 红色'),
(5295,403,98,'塑料'),
(5296,403,97,'韩国'),
(5297,403,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5298,403,95,'HUROM CO.,LTD.'),
(5299,403,94,'HUO15FR'),
(5300,403,93,'2014010713734694'),
(5301,403,92,'150W(含)-200W(不含)'),
(5302,403,91,'HUROM CO.,LTD.'),
(5303,403,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5304,403,89,'有效'),
(5305,403,88,'40转/分(含)-60转/分(含)'),
(5306,403,87,'Hurom/惠人'),
(5307,404,101,'按键式'),
(5308,404,100,'多功能榨汁机'),
(5309,404,99,'金色 红色'),
(5310,404,98,'塑料'),
(5311,404,97,'韩国'),
(5312,404,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5313,404,95,'HUROM CO.,LTD.'),
(5314,404,94,'HUO15FR'),
(5315,404,93,'2014010713734694'),
(5316,404,92,'150W(含)-200W(不含)'),
(5317,404,91,'HUROM CO.,LTD.'),
(5318,404,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5319,404,89,'有效'),
(5320,404,88,'40转/分(含)-60转/分(含)'),
(5321,404,87,'Hurom/惠人'),
(5322,405,101,'按键式'),
(5323,405,100,'多功能榨汁机'),
(5324,405,99,'金色 红色'),
(5325,405,98,'塑料'),
(5326,405,97,'韩国'),
(5327,405,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5328,405,95,'HUROM CO.,LTD.'),
(5329,405,94,'HUO15FR'),
(5330,405,93,'2014010713734694'),
(5331,405,92,'150W(含)-200W(不含)'),
(5332,405,91,'HUROM CO.,LTD.'),
(5333,405,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5334,405,89,'有效'),
(5335,405,88,'40转/分(含)-60转/分(含)'),
(5336,405,87,'Hurom/惠人'),
(5337,406,101,'按键式'),
(5338,406,100,'多功能榨汁机'),
(5339,406,99,'金色 红色'),
(5340,406,98,'塑料'),
(5341,406,97,'韩国'),
(5342,406,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5343,406,95,'HUROM CO.,LTD.'),
(5344,406,94,'HUO15FR'),
(5345,406,93,'2014010713734694'),
(5346,406,92,'150W(含)-200W(不含)'),
(5347,406,91,'HUROM CO.,LTD.'),
(5348,406,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5349,406,89,'有效'),
(5350,406,88,'40转/分(含)-60转/分(含)'),
(5351,406,87,'Hurom/惠人'),
(5352,407,101,'按键式'),
(5353,407,100,'多功能榨汁机'),
(5354,407,99,'金色 红色'),
(5355,407,98,'塑料'),
(5356,407,97,'韩国'),
(5357,407,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5358,407,95,'HUROM CO.,LTD.'),
(5359,407,94,'HUO15FR'),
(5360,407,93,'2014010713734694'),
(5361,407,92,'150W(含)-200W(不含)'),
(5362,407,91,'HUROM CO.,LTD.'),
(5363,407,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5364,407,89,'有效'),
(5365,407,88,'40转/分(含)-60转/分(含)'),
(5366,407,87,'Hurom/惠人'),
(5367,408,101,'按键式'),
(5368,408,100,'多功能榨汁机'),
(5369,408,99,'金色 红色'),
(5370,408,98,'塑料'),
(5371,408,97,'韩国'),
(5372,408,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5373,408,95,'HUROM CO.,LTD.'),
(5374,408,94,'HUO15FR'),
(5375,408,93,'2014010713734694'),
(5376,408,92,'150W(含)-200W(不含)'),
(5377,408,91,'HUROM CO.,LTD.'),
(5378,408,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5379,408,89,'有效'),
(5380,408,88,'40转/分(含)-60转/分(含)'),
(5381,408,87,'Hurom/惠人'),
(5382,409,101,'按键式'),
(5383,409,100,'多功能榨汁机'),
(5384,409,99,'金色 红色'),
(5385,409,98,'塑料'),
(5386,409,97,'韩国'),
(5387,409,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5388,409,95,'HUROM CO.,LTD.'),
(5389,409,94,'HUO15FR'),
(5390,409,93,'2014010713734694'),
(5391,409,92,'150W(含)-200W(不含)'),
(5392,409,91,'HUROM CO.,LTD.'),
(5393,409,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5394,409,89,'有效'),
(5395,409,88,'40转/分(含)-60转/分(含)'),
(5396,409,87,'Hurom/惠人'),
(5397,410,101,'按键式'),
(5398,410,100,'多功能榨汁机'),
(5399,410,99,'金色 红色'),
(5400,410,98,'塑料'),
(5401,410,97,'韩国'),
(5402,410,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5403,410,95,'HUROM CO.,LTD.'),
(5404,410,94,'HUO15FR'),
(5405,410,93,'2014010713734694'),
(5406,410,92,'150W(含)-200W(不含)'),
(5407,410,91,'HUROM CO.,LTD.'),
(5408,410,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5409,410,89,'有效'),
(5410,410,88,'40转/分(含)-60转/分(含)'),
(5411,410,87,'Hurom/惠人'),
(5412,411,101,'按键式'),
(5413,411,100,'多功能榨汁机'),
(5414,411,99,'金色 红色'),
(5415,411,98,'塑料'),
(5416,411,97,'韩国'),
(5417,411,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5418,411,95,'HUROM CO.,LTD.'),
(5419,411,94,'HUO15FR'),
(5420,411,93,'2014010713734694'),
(5421,411,92,'150W(含)-200W(不含)'),
(5422,411,91,'HUROM CO.,LTD.'),
(5423,411,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5424,411,89,'有效'),
(5425,411,88,'40转/分(含)-60转/分(含)'),
(5426,411,87,'Hurom/惠人'),
(5427,412,101,'按键式'),
(5428,412,100,'多功能榨汁机'),
(5429,412,99,'金色 红色'),
(5430,412,98,'塑料'),
(5431,412,97,'韩国'),
(5432,412,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5433,412,95,'HUROM CO.,LTD.'),
(5434,412,94,'HUO15FR'),
(5435,412,93,'2014010713734694'),
(5436,412,92,'150W(含)-200W(不含)'),
(5437,412,91,'HUROM CO.,LTD.'),
(5438,412,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5439,412,89,'有效'),
(5440,412,88,'40转/分(含)-60转/分(含)'),
(5441,412,87,'Hurom/惠人'),
(5442,413,101,'按键式'),
(5443,413,100,'多功能榨汁机'),
(5444,413,99,'金色 红色'),
(5445,413,98,'塑料'),
(5446,413,97,'韩国'),
(5447,413,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5448,413,95,'HUROM CO.,LTD.'),
(5449,413,94,'HUO15FR'),
(5450,413,93,'2014010713734694'),
(5451,413,92,'150W(含)-200W(不含)'),
(5452,413,91,'HUROM CO.,LTD.'),
(5453,413,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5454,413,89,'有效'),
(5455,413,88,'40转/分(含)-60转/分(含)'),
(5456,413,87,'Hurom/惠人'),
(5457,414,101,'按键式'),
(5458,414,100,'多功能榨汁机'),
(5459,414,99,'金色 红色'),
(5460,414,98,'塑料'),
(5461,414,97,'韩国'),
(5462,414,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5463,414,95,'HUROM CO.,LTD.'),
(5464,414,94,'HUO15FR'),
(5465,414,93,'2014010713734694'),
(5466,414,92,'150W(含)-200W(不含)'),
(5467,414,91,'HUROM CO.,LTD.'),
(5468,414,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5469,414,89,'有效'),
(5470,414,88,'40转/分(含)-60转/分(含)'),
(5471,414,87,'Hurom/惠人'),
(5472,415,101,'按键式'),
(5473,415,100,'多功能榨汁机'),
(5474,415,99,'金色 红色'),
(5475,415,98,'塑料'),
(5476,415,97,'韩国'),
(5477,415,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5478,415,95,'HUROM CO.,LTD.'),
(5479,415,94,'HUO15FR'),
(5480,415,93,'2014010713734694'),
(5481,415,92,'150W(含)-200W(不含)'),
(5482,415,91,'HUROM CO.,LTD.'),
(5483,415,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5484,415,89,'有效'),
(5485,415,88,'40转/分(含)-60转/分(含)'),
(5486,415,87,'Hurom/惠人'),
(5487,416,101,'按键式'),
(5488,416,100,'多功能榨汁机'),
(5489,416,99,'金色 红色'),
(5490,416,98,'塑料'),
(5491,416,97,'韩国'),
(5492,416,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5493,416,95,'HUROM CO.,LTD.'),
(5494,416,94,'HUO15FR'),
(5495,416,93,'2014010713734694'),
(5496,416,92,'150W(含)-200W(不含)'),
(5497,416,91,'HUROM CO.,LTD.'),
(5498,416,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5499,416,89,'有效'),
(5500,416,88,'40转/分(含)-60转/分(含)'),
(5501,416,87,'Hurom/惠人'),
(5502,417,101,'按键式'),
(5503,417,100,'多功能榨汁机'),
(5504,417,99,'金色 红色'),
(5505,417,98,'塑料'),
(5506,417,97,'韩国'),
(5507,417,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5508,417,95,'HUROM CO.,LTD.'),
(5509,417,94,'HUO15FR'),
(5510,417,93,'2014010713734694'),
(5511,417,92,'150W(含)-200W(不含)'),
(5512,417,91,'HUROM CO.,LTD.'),
(5513,417,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5514,417,89,'有效'),
(5515,417,88,'40转/分(含)-60转/分(含)'),
(5516,417,87,'Hurom/惠人'),
(5517,418,101,'按键式'),
(5518,418,100,'多功能榨汁机'),
(5519,418,99,'金色 红色'),
(5520,418,98,'塑料'),
(5521,418,97,'韩国'),
(5522,418,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5523,418,95,'HUROM CO.,LTD.'),
(5524,418,94,'HUO15FR'),
(5525,418,93,'2014010713734694'),
(5526,418,92,'150W(含)-200W(不含)'),
(5527,418,91,'HUROM CO.,LTD.'),
(5528,418,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5529,418,89,'有效'),
(5530,418,88,'40转/分(含)-60转/分(含)'),
(5531,418,87,'Hurom/惠人'),
(5532,419,101,'按键式'),
(5533,419,100,'多功能榨汁机'),
(5534,419,99,'金色 红色'),
(5535,419,98,'塑料'),
(5536,419,97,'韩国'),
(5537,419,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5538,419,95,'HUROM CO.,LTD.'),
(5539,419,94,'HUO15FR'),
(5540,419,93,'2014010713734694'),
(5541,419,92,'150W(含)-200W(不含)'),
(5542,419,91,'HUROM CO.,LTD.'),
(5543,419,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5544,419,89,'有效'),
(5545,419,88,'40转/分(含)-60转/分(含)'),
(5546,419,87,'Hurom/惠人'),
(5547,420,101,'按键式'),
(5548,420,100,'多功能榨汁机'),
(5549,420,99,'金色 红色'),
(5550,420,98,'塑料'),
(5551,420,97,'韩国'),
(5552,420,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5553,420,95,'HUROM CO.,LTD.'),
(5554,420,94,'HUO15FR'),
(5555,420,93,'2014010713734694'),
(5556,420,92,'150W(含)-200W(不含)'),
(5557,420,91,'HUROM CO.,LTD.'),
(5558,420,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5559,420,89,'有效'),
(5560,420,88,'40转/分(含)-60转/分(含)'),
(5561,420,87,'Hurom/惠人'),
(5562,421,101,'按键式'),
(5563,421,100,'多功能榨汁机'),
(5564,421,99,'金色 红色'),
(5565,421,98,'塑料'),
(5566,421,97,'韩国'),
(5567,421,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5568,421,95,'HUROM CO.,LTD.'),
(5569,421,94,'HUO15FR'),
(5570,421,93,'2014010713734694'),
(5571,421,92,'150W(含)-200W(不含)'),
(5572,421,91,'HUROM CO.,LTD.'),
(5573,421,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5574,421,89,'有效'),
(5575,421,88,'40转/分(含)-60转/分(含)'),
(5576,421,87,'Hurom/惠人'),
(5577,422,101,'按键式'),
(5578,422,100,'多功能榨汁机'),
(5579,422,99,'金色 红色'),
(5580,422,98,'塑料'),
(5581,422,97,'韩国'),
(5582,422,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5583,422,95,'HUROM CO.,LTD.'),
(5584,422,94,'HUO15FR'),
(5585,422,93,'2014010713734694'),
(5586,422,92,'150W(含)-200W(不含)'),
(5587,422,91,'HUROM CO.,LTD.'),
(5588,422,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5589,422,89,'有效'),
(5590,422,88,'40转/分(含)-60转/分(含)'),
(5591,422,87,'Hurom/惠人'),
(5592,423,101,'按键式'),
(5593,423,100,'多功能榨汁机'),
(5594,423,99,'金色 红色'),
(5595,423,98,'塑料'),
(5596,423,97,'韩国'),
(5597,423,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5598,423,95,'HUROM CO.,LTD.'),
(5599,423,94,'HUO15FR'),
(5600,423,93,'2014010713734694'),
(5601,423,92,'150W(含)-200W(不含)'),
(5602,423,91,'HUROM CO.,LTD.'),
(5603,423,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5604,423,89,'有效'),
(5605,423,88,'40转/分(含)-60转/分(含)'),
(5606,423,87,'Hurom/惠人'),
(5607,424,101,'按键式'),
(5608,424,100,'多功能榨汁机'),
(5609,424,99,'金色 红色'),
(5610,424,98,'塑料'),
(5611,424,97,'韩国'),
(5612,424,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5613,424,95,'HUROM CO.,LTD.'),
(5614,424,94,'HUO15FR'),
(5615,424,93,'2014010713734694'),
(5616,424,92,'150W(含)-200W(不含)'),
(5617,424,91,'HUROM CO.,LTD.'),
(5618,424,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5619,424,89,'有效'),
(5620,424,88,'40转/分(含)-60转/分(含)'),
(5621,424,87,'Hurom/惠人'),
(5622,425,101,'按键式'),
(5623,425,100,'多功能榨汁机'),
(5624,425,99,'金色 红色'),
(5625,425,98,'塑料'),
(5626,425,97,'韩国'),
(5627,425,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5628,425,95,'HUROM CO.,LTD.'),
(5629,425,94,'HUO15FR'),
(5630,425,93,'2014010713734694'),
(5631,425,92,'150W(含)-200W(不含)'),
(5632,425,91,'HUROM CO.,LTD.'),
(5633,425,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5634,425,89,'有效'),
(5635,425,88,'40转/分(含)-60转/分(含)'),
(5636,425,87,'Hurom/惠人'),
(5637,426,101,'按键式'),
(5638,426,100,'多功能榨汁机'),
(5639,426,99,'金色 红色'),
(5640,426,98,'塑料'),
(5641,426,97,'韩国'),
(5642,426,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5643,426,95,'HUROM CO.,LTD.'),
(5644,426,94,'HUO15FR'),
(5645,426,93,'2014010713734694'),
(5646,426,92,'150W(含)-200W(不含)'),
(5647,426,91,'HUROM CO.,LTD.'),
(5648,426,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5649,426,89,'有效'),
(5650,426,88,'40转/分(含)-60转/分(含)'),
(5651,426,87,'Hurom/惠人'),
(5652,427,101,'按键式'),
(5653,427,100,'多功能榨汁机'),
(5654,427,99,'金色 红色'),
(5655,427,98,'塑料'),
(5656,427,97,'韩国'),
(5657,427,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5658,427,95,'HUROM CO.,LTD.'),
(5659,427,94,'HUO15FR'),
(5660,427,93,'2014010713734694'),
(5661,427,92,'150W(含)-200W(不含)'),
(5662,427,91,'HUROM CO.,LTD.'),
(5663,427,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5664,427,89,'有效'),
(5665,427,88,'40转/分(含)-60转/分(含)'),
(5666,427,87,'Hurom/惠人'),
(5667,428,101,'按键式'),
(5668,428,100,'多功能榨汁机'),
(5669,428,99,'金色 红色'),
(5670,428,98,'塑料'),
(5671,428,97,'韩国'),
(5672,428,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5673,428,95,'HUROM CO.,LTD.'),
(5674,428,94,'HUO15FR'),
(5675,428,93,'2014010713734694'),
(5676,428,92,'150W(含)-200W(不含)'),
(5677,428,91,'HUROM CO.,LTD.'),
(5678,428,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5679,428,89,'有效'),
(5680,428,88,'40转/分(含)-60转/分(含)'),
(5681,428,87,'Hurom/惠人'),
(5682,429,101,'按键式'),
(5683,429,100,'多功能榨汁机'),
(5684,429,99,'金色 红色'),
(5685,429,98,'塑料'),
(5686,429,97,'韩国'),
(5687,429,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5688,429,95,'HUROM CO.,LTD.'),
(5689,429,94,'HUO15FR'),
(5690,429,93,'2014010713734694'),
(5691,429,92,'150W(含)-200W(不含)'),
(5692,429,91,'HUROM CO.,LTD.'),
(5693,429,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5694,429,89,'有效'),
(5695,429,88,'40转/分(含)-60转/分(含)'),
(5696,429,87,'Hurom/惠人'),
(5697,430,101,'按键式'),
(5698,430,100,'多功能榨汁机'),
(5699,430,99,'金色 红色'),
(5700,430,98,'塑料'),
(5701,430,97,'韩国'),
(5702,430,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5703,430,95,'HUROM CO.,LTD.'),
(5704,430,94,'HUO15FR'),
(5705,430,93,'2014010713734694'),
(5706,430,92,'150W(含)-200W(不含)'),
(5707,430,91,'HUROM CO.,LTD.'),
(5708,430,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5709,430,89,'有效'),
(5710,430,88,'40转/分(含)-60转/分(含)'),
(5711,430,87,'Hurom/惠人'),
(5712,431,101,'按键式'),
(5713,431,100,'多功能榨汁机'),
(5714,431,99,'金色 红色'),
(5715,431,98,'塑料'),
(5716,431,97,'韩国'),
(5717,431,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5718,431,95,'HUROM CO.,LTD.'),
(5719,431,94,'HUO15FR'),
(5720,431,93,'2014010713734694'),
(5721,431,92,'150W(含)-200W(不含)'),
(5722,431,91,'HUROM CO.,LTD.'),
(5723,431,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5724,431,89,'有效'),
(5725,431,88,'40转/分(含)-60转/分(含)'),
(5726,431,87,'Hurom/惠人'),
(5727,432,101,'按键式'),
(5728,432,100,'多功能榨汁机'),
(5729,432,99,'金色 红色'),
(5730,432,98,'塑料'),
(5731,432,97,'韩国'),
(5732,432,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5733,432,95,'HUROM CO.,LTD.'),
(5734,432,94,'HUO15FR'),
(5735,432,93,'2014010713734694'),
(5736,432,92,'150W(含)-200W(不含)'),
(5737,432,91,'HUROM CO.,LTD.'),
(5738,432,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5739,432,89,'有效'),
(5740,432,88,'40转/分(含)-60转/分(含)'),
(5741,432,87,'Hurom/惠人'),
(5742,433,101,'按键式'),
(5743,433,100,'多功能榨汁机'),
(5744,433,99,'金色 红色'),
(5745,433,98,'塑料'),
(5746,433,97,'韩国'),
(5747,433,96,'五谷 冰淇淋 制奶昔 制豆腐 榨汁'),
(5748,433,95,'HUROM CO.,LTD.'),
(5749,433,94,'HUO15FR'),
(5750,433,93,'2014010713734694'),
(5751,433,92,'150W(含)-200W(不含)'),
(5752,433,91,'HUROM CO.,LTD.'),
(5753,433,90,'HU15IV, HUO15IV, HUE15IV, HU15FR, HUO15FR, HUE15FR...'),
(5754,433,89,'有效'),
(5755,433,88,'40转/分(含)-60转/分(含)'),
(5756,433,87,'Hurom/惠人'),
(5757,434,112,'一级'),
(5758,434,111,'MeiLing/美菱 BCD-221UE...'),
(5759,434,110,'直冷'),
(5760,434,109,'合肥美菱股份有限公司'),
(5761,434,108,'2012010701548388'),
(5762,434,107,'合肥美菱股份有限公司'),
(5763,434,106,'BCD-213ZE3BR, BCD-213ZE3BD, BCD-213ZE3BK, BCD-213Z...'),
(5764,434,105,'BCD-221UE3CX'),
(5765,434,104,'三门式'),
(5766,434,103,'有效'),
(5767,434,102,'冷藏冷冻冰箱'),
(5768,435,112,'一级'),
(5769,435,111,'MeiLing/美菱 BCD-221UE...'),
(5770,435,110,'直冷'),
(5771,435,109,'合肥美菱股份有限公司'),
(5772,435,108,'2012010701548388'),
(5773,435,107,'合肥美菱股份有限公司'),
(5774,435,106,'BCD-213ZE3BR, BCD-213ZE3BD, BCD-213ZE3BK, BCD-213Z...'),
(5775,435,105,'BCD-221UE3CX'),
(5776,435,104,'三门式'),
(5777,435,103,'有效'),
(5778,435,102,'冷藏冷冻冰箱'),
(5779,436,112,'一级'),
(5780,436,111,'MeiLing/美菱 BCD-221UE...'),
(5781,436,110,'直冷'),
(5782,436,109,'合肥美菱股份有限公司'),
(5783,436,108,'2012010701548388'),
(5784,436,107,'合肥美菱股份有限公司'),
(5785,436,106,'BCD-213ZE3BR, BCD-213ZE3BD, BCD-213ZE3BK, BCD-213Z...'),
(5786,436,105,'BCD-221UE3CX'),
(5787,436,104,'三门式'),
(5788,436,103,'有效'),
(5789,436,102,'冷藏冷冻冰箱'),
(5790,437,112,'一级'),
(5791,437,111,'MeiLing/美菱 BCD-221UE...'),
(5792,437,110,'直冷'),
(5793,437,109,'合肥美菱股份有限公司'),
(5794,437,108,'2012010701548388'),
(5795,437,107,'合肥美菱股份有限公司'),
(5796,437,106,'BCD-213ZE3BR, BCD-213ZE3BD, BCD-213ZE3BK, BCD-213Z...'),
(5797,437,105,'BCD-221UE3CX'),
(5798,437,104,'三门式'),
(5799,437,103,'有效'),
(5800,437,102,'冷藏冷冻冰箱'),
(5801,438,112,'一级'),
(5802,438,111,'MeiLing/美菱 BCD-221UE...'),
(5803,438,110,'直冷'),
(5804,438,109,'合肥美菱股份有限公司'),
(5805,438,108,'2012010701548388'),
(5806,438,107,'合肥美菱股份有限公司'),
(5807,438,106,'BCD-213ZE3BR, BCD-213ZE3BD, BCD-213ZE3BK, BCD-213Z...'),
(5808,438,105,'BCD-221UE3CX'),
(5809,438,104,'三门式'),
(5810,438,103,'有效'),
(5811,438,102,'冷藏冷冻冰箱'),
(5812,439,112,'一级'),
(5813,439,111,'MeiLing/美菱 BCD-221UE...'),
(5814,439,110,'直冷'),
(5815,439,109,'合肥美菱股份有限公司'),
(5816,439,108,'2012010701548388'),
(5817,439,107,'合肥美菱股份有限公司'),
(5818,439,106,'BCD-213ZE3BR, BCD-213ZE3BD, BCD-213ZE3BK, BCD-213Z...'),
(5819,439,105,'BCD-221UE3CX'),
(5820,439,104,'三门式'),
(5821,439,103,'有效'),
(5822,439,102,'冷藏冷冻冰箱'),
(5823,440,112,'一级'),
(5824,440,111,'MeiLing/美菱 BCD-221UE...'),
(5825,440,110,'直冷'),
(5826,440,109,'合肥美菱股份有限公司'),
(5827,440,108,'2012010701548388'),
(5828,440,107,'合肥美菱股份有限公司'),
(5829,440,106,'BCD-213ZE3BR, BCD-213ZE3BD, BCD-213ZE3BK, BCD-213Z...'),
(5830,440,105,'BCD-221UE3CX'),
(5831,440,104,'三门式'),
(5832,440,103,'有效'),
(5833,440,102,'冷藏冷冻冰箱'),
(5834,441,112,'一级'),
(5835,441,111,'MeiLing/美菱 BCD-221UE...'),
(5836,441,110,'直冷'),
(5837,441,109,'合肥美菱股份有限公司'),
(5838,441,108,'2012010701548388'),
(5839,441,107,'合肥美菱股份有限公司'),
(5840,441,106,'BCD-213ZE3BR, BCD-213ZE3BD, BCD-213ZE3BK, BCD-213Z...'),
(5841,441,105,'BCD-221UE3CX'),
(5842,441,104,'三门式'),
(5843,441,103,'有效'),
(5844,441,102,'冷藏冷冻冰箱'),
(5845,442,112,'一级'),
(5846,442,111,'MeiLing/美菱 BCD-221UE...'),
(5847,442,110,'直冷'),
(5848,442,109,'合肥美菱股份有限公司'),
(5849,442,108,'2012010701548388'),
(5850,442,107,'合肥美菱股份有限公司'),
(5851,442,106,'BCD-213ZE3BR, BCD-213ZE3BD, BCD-213ZE3BK, BCD-213Z...'),
(5852,442,105,'BCD-221UE3CX'),
(5853,442,104,'三门式'),
(5854,442,103,'有效'),
(5855,442,102,'冷藏冷冻冰箱'),
(5856,443,112,'一级'),
(5857,443,111,'MeiLing/美菱 BCD-221UE...'),
(5858,443,110,'直冷'),
(5859,443,109,'合肥美菱股份有限公司'),
(5860,443,108,'2012010701548388'),
(5861,443,107,'合肥美菱股份有限公司'),
(5862,443,106,'BCD-213ZE3BR, BCD-213ZE3BD, BCD-213ZE3BK, BCD-213Z...'),
(5863,443,105,'BCD-221UE3CX'),
(5864,443,104,'三门式'),
(5865,443,103,'有效'),
(5866,443,102,'冷藏冷冻冰箱'),
(5867,444,112,'一级'),
(5868,444,111,'MeiLing/美菱 BCD-221UE...'),
(5869,444,110,'直冷'),
(5870,444,109,'合肥美菱股份有限公司'),
(5871,444,108,'2012010701548388'),
(5872,444,107,'合肥美菱股份有限公司'),
(5873,444,106,'BCD-213ZE3BR, BCD-213ZE3BD, BCD-213ZE3BK, BCD-213Z...'),
(5874,444,105,'BCD-221UE3CX'),
(5875,444,104,'三门式'),
(5876,444,103,'有效'),
(5877,444,102,'冷藏冷冻冰箱'),
(5878,445,112,'一级'),
(5879,445,111,'MeiLing/美菱 BCD-221UE...'),
(5880,445,110,'直冷'),
(5881,445,109,'合肥美菱股份有限公司'),
(5882,445,108,'2012010701548388'),
(5883,445,107,'合肥美菱股份有限公司'),
(5884,445,106,'BCD-213ZE3BR, BCD-213ZE3BD, BCD-213ZE3BK, BCD-213Z...'),
(5885,445,105,'BCD-221UE3CX'),
(5886,445,104,'三门式'),
(5887,445,103,'有效'),
(5888,445,102,'冷藏冷冻冰箱'),
(5889,446,112,'一级'),
(5890,446,111,'MeiLing/美菱 BCD-221UE...'),
(5891,446,110,'直冷'),
(5892,446,109,'合肥美菱股份有限公司'),
(5893,446,108,'2012010701548388'),
(5894,446,107,'合肥美菱股份有限公司'),
(5895,446,106,'BCD-213ZE3BR, BCD-213ZE3BD, BCD-213ZE3BK, BCD-213Z...'),
(5896,446,105,'BCD-221UE3CX'),
(5897,446,104,'三门式'),
(5898,446,103,'有效'),
(5899,446,102,'冷藏冷冻冰箱'),
(5900,447,112,'一级'),
(5901,447,111,'MeiLing/美菱 BCD-221UE...'),
(5902,447,110,'直冷'),
(5903,447,109,'合肥美菱股份有限公司'),
(5904,447,108,'2012010701548388'),
(5905,447,107,'合肥美菱股份有限公司'),
(5906,447,106,'BCD-213ZE3BR, BCD-213ZE3BD, BCD-213ZE3BK, BCD-213Z...'),
(5907,447,105,'BCD-221UE3CX'),
(5908,447,104,'三门式'),
(5909,447,103,'有效'),
(5910,447,102,'冷藏冷冻冰箱'),
(5911,448,112,'一级'),
(5912,448,111,'MeiLing/美菱 BCD-221UE...'),
(5913,448,110,'直冷'),
(5914,448,109,'合肥美菱股份有限公司'),
(5915,448,108,'2012010701548388'),
(5916,448,107,'合肥美菱股份有限公司'),
(5917,448,106,'BCD-213ZE3BR, BCD-213ZE3BD, BCD-213ZE3BK, BCD-213Z...'),
(5918,448,105,'BCD-221UE3CX'),
(5919,448,104,'三门式'),
(5920,448,103,'有效'),
(5921,448,102,'冷藏冷冻冰箱'),
(5922,449,112,'一级'),
(5923,449,111,'MeiLing/美菱 BCD-221UE...'),
(5924,449,110,'直冷'),
(5925,449,109,'合肥美菱股份有限公司'),
(5926,449,108,'2012010701548388'),
(5927,449,107,'合肥美菱股份有限公司'),
(5928,449,106,'BCD-213ZE3BR, BCD-213ZE3BD, BCD-213ZE3BK, BCD-213Z...'),
(5929,449,105,'BCD-221UE3CX'),
(5930,449,104,'三门式'),
(5931,449,103,'有效'),
(5932,449,102,'冷藏冷冻冰箱'),
(5933,450,112,'一级'),
(5934,450,111,'MeiLing/美菱 BCD-221UE...'),
(5935,450,110,'直冷'),
(5936,450,109,'合肥美菱股份有限公司'),
(5937,450,108,'2012010701548388'),
(5938,450,107,'合肥美菱股份有限公司'),
(5939,450,106,'BCD-213ZE3BR, BCD-213ZE3BD, BCD-213ZE3BK, BCD-213Z...'),
(5940,450,105,'BCD-221UE3CX'),
(5941,450,104,'三门式'),
(5942,450,103,'有效'),
(5943,450,102,'冷藏冷冻冰箱'),
(5944,451,112,'一级'),
(5945,451,111,'MeiLing/美菱 BCD-221UE...'),
(5946,451,110,'直冷'),
(5947,451,109,'合肥美菱股份有限公司'),
(5948,451,108,'2012010701548388'),
(5949,451,107,'合肥美菱股份有限公司'),
(5950,451,106,'BCD-213ZE3BR, BCD-213ZE3BD, BCD-213ZE3BK, BCD-213Z...'),
(5951,451,105,'BCD-221UE3CX'),
(5952,451,104,'三门式'),
(5953,451,103,'有效'),
(5954,451,102,'冷藏冷冻冰箱'),
(5955,452,112,'一级'),
(5956,452,111,'MeiLing/美菱 BCD-221UE...'),
(5957,452,110,'直冷'),
(5958,452,109,'合肥美菱股份有限公司'),
(5959,452,108,'2012010701548388'),
(5960,452,107,'合肥美菱股份有限公司'),
(5961,452,106,'BCD-213ZE3BR, BCD-213ZE3BD, BCD-213ZE3BK, BCD-213Z...'),
(5962,452,105,'BCD-221UE3CX'),
(5963,452,104,'三门式'),
(5964,452,103,'有效'),
(5965,452,102,'冷藏冷冻冰箱'),
(5966,453,112,'一级'),
(5967,453,111,'MeiLing/美菱 BCD-221UE...'),
(5968,453,110,'直冷'),
(5969,453,109,'合肥美菱股份有限公司'),
(5970,453,108,'2012010701548388'),
(5971,453,107,'合肥美菱股份有限公司'),
(5972,453,106,'BCD-213ZE3BR, BCD-213ZE3BD, BCD-213ZE3BK, BCD-213Z...'),
(5973,453,105,'BCD-221UE3CX'),
(5974,453,104,'三门式'),
(5975,453,103,'有效'),
(5976,453,102,'冷藏冷冻冰箱'),
(5977,454,122,'约10~16m2'),
(5978,454,121,'大1匹'),
(5979,454,120,'三级'),
(5980,454,119,'Hisense/海信 KFR-26GW/...'),
(5981,454,118,'冷暖电辅'),
(5982,454,117,'变频'),
(5983,454,116,'KFR-26GW/EF16A3z'),
(5984,454,115,'2013010703646857'),
(5985,454,114,'有效'),
(5986,454,113,'壁挂式'),
(5987,455,122,'约10~16m2'),
(5988,455,121,'大1匹'),
(5989,455,120,'三级'),
(5990,455,119,'Hisense/海信 KFR-26GW/...'),
(5991,455,118,'冷暖电辅'),
(5992,455,117,'变频'),
(5993,455,116,'KFR-26GW/EF16A3z'),
(5994,455,115,'2013010703646857'),
(5995,455,114,'有效'),
(5996,455,113,'壁挂式'),
(5997,456,122,'约10~16m2'),
(5998,456,121,'大1匹'),
(5999,456,120,'三级'),
(6000,456,119,'Hisense/海信 KFR-26GW/...'),
(6001,456,118,'冷暖电辅'),
(6002,456,117,'变频'),
(6003,456,116,'KFR-26GW/EF16A3z'),
(6004,456,115,'2013010703646857'),
(6005,456,114,'有效'),
(6006,456,113,'壁挂式'),
(6007,457,122,'约10~16m2'),
(6008,457,121,'大1匹'),
(6009,457,120,'三级'),
(6010,457,119,'Hisense/海信 KFR-26GW/...'),
(6011,457,118,'冷暖电辅'),
(6012,457,117,'变频'),
(6013,457,116,'KFR-26GW/EF16A3z'),
(6014,457,115,'2013010703646857'),
(6015,457,114,'有效'),
(6016,457,113,'壁挂式'),
(6017,458,122,'约10~16m2'),
(6018,458,121,'大1匹'),
(6019,458,120,'三级'),
(6020,458,119,'Hisense/海信 KFR-26GW/...'),
(6021,458,118,'冷暖电辅'),
(6022,458,117,'变频'),
(6023,458,116,'KFR-26GW/EF16A3z'),
(6024,458,115,'2013010703646857'),
(6025,458,114,'有效'),
(6026,458,113,'壁挂式'),
(6027,459,122,'约10~16m2'),
(6028,459,121,'大1匹'),
(6029,459,120,'三级'),
(6030,459,119,'Hisense/海信 KFR-26GW/...'),
(6031,459,118,'冷暖电辅'),
(6032,459,117,'变频'),
(6033,459,116,'KFR-26GW/EF16A3z'),
(6034,459,115,'2013010703646857'),
(6035,459,114,'有效'),
(6036,459,113,'壁挂式'),
(6037,460,122,'约10~16m2'),
(6038,460,121,'大1匹'),
(6039,460,120,'三级'),
(6040,460,119,'Hisense/海信 KFR-26GW/...'),
(6041,460,118,'冷暖电辅'),
(6042,460,117,'变频'),
(6043,460,116,'KFR-26GW/EF16A3z'),
(6044,460,115,'2013010703646857'),
(6045,460,114,'有效'),
(6046,460,113,'壁挂式'),
(6047,461,122,'约10~16m2'),
(6048,461,121,'大1匹'),
(6049,461,120,'三级'),
(6050,461,119,'Hisense/海信 KFR-26GW/...'),
(6051,461,118,'冷暖电辅'),
(6052,461,117,'变频'),
(6053,461,116,'KFR-26GW/EF16A3z'),
(6054,461,115,'2013010703646857'),
(6055,461,114,'有效'),
(6056,461,113,'壁挂式'),
(6057,462,122,'约10~16m2'),
(6058,462,121,'大1匹'),
(6059,462,120,'三级'),
(6060,462,119,'Hisense/海信 KFR-26GW/...'),
(6061,462,118,'冷暖电辅'),
(6062,462,117,'变频'),
(6063,462,116,'KFR-26GW/EF16A3z'),
(6064,462,115,'2013010703646857'),
(6065,462,114,'有效'),
(6066,462,113,'壁挂式'),
(6067,463,122,'约10~16m2'),
(6068,463,121,'大1匹'),
(6069,463,120,'三级'),
(6070,463,119,'Hisense/海信 KFR-26GW/...'),
(6071,463,118,'冷暖电辅'),
(6072,463,117,'变频'),
(6073,463,116,'KFR-26GW/EF16A3z'),
(6074,463,115,'2013010703646857'),
(6075,463,114,'有效'),
(6076,463,113,'壁挂式'),
(6077,464,122,'约10~16m2'),
(6078,464,121,'大1匹'),
(6079,464,120,'三级'),
(6080,464,119,'Hisense/海信 KFR-26GW/...'),
(6081,464,118,'冷暖电辅'),
(6082,464,117,'变频'),
(6083,464,116,'KFR-26GW/EF16A3z'),
(6084,464,115,'2013010703646857'),
(6085,464,114,'有效'),
(6086,464,113,'壁挂式'),
(6087,465,122,'约10~16m2'),
(6088,465,121,'大1匹'),
(6089,465,120,'三级'),
(6090,465,119,'Hisense/海信 KFR-26GW/...'),
(6091,465,118,'冷暖电辅'),
(6092,465,117,'变频'),
(6093,465,116,'KFR-26GW/EF16A3z'),
(6094,465,115,'2013010703646857'),
(6095,465,114,'有效'),
(6096,465,113,'壁挂式'),
(6097,466,122,'约10~16m2'),
(6098,466,121,'大1匹'),
(6099,466,120,'三级'),
(6100,466,119,'Hisense/海信 KFR-26GW/...'),
(6101,466,118,'冷暖电辅'),
(6102,466,117,'变频'),
(6103,466,116,'KFR-26GW/EF16A3z'),
(6104,466,115,'2013010703646857'),
(6105,466,114,'有效'),
(6106,466,113,'壁挂式'),
(6107,467,122,'约10~16m2'),
(6108,467,121,'大1匹'),
(6109,467,120,'三级'),
(6110,467,119,'Hisense/海信 KFR-26GW/...'),
(6111,467,118,'冷暖电辅'),
(6112,467,117,'变频'),
(6113,467,116,'KFR-26GW/EF16A3z'),
(6114,467,115,'2013010703646857'),
(6115,467,114,'有效'),
(6116,467,113,'壁挂式'),
(6117,468,122,'约10~16m2'),
(6118,468,121,'大1匹'),
(6119,468,120,'三级'),
(6120,468,119,'Hisense/海信 KFR-26GW/...'),
(6121,468,118,'冷暖电辅'),
(6122,468,117,'变频'),
(6123,468,116,'KFR-26GW/EF16A3z'),
(6124,468,115,'2013010703646857'),
(6125,468,114,'有效'),
(6126,468,113,'壁挂式'),
(6127,469,122,'约10~16m2'),
(6128,469,121,'大1匹'),
(6129,469,120,'三级'),
(6130,469,119,'Hisense/海信 KFR-26GW/...'),
(6131,469,118,'冷暖电辅'),
(6132,469,117,'变频'),
(6133,469,116,'KFR-26GW/EF16A3z'),
(6134,469,115,'2013010703646857'),
(6135,469,114,'有效'),
(6136,469,113,'壁挂式'),
(6137,470,122,'约10~16m2'),
(6138,470,121,'大1匹'),
(6139,470,120,'三级'),
(6140,470,119,'Hisense/海信 KFR-26GW/...'),
(6141,470,118,'冷暖电辅'),
(6142,470,117,'变频'),
(6143,470,116,'KFR-26GW/EF16A3z'),
(6144,470,115,'2013010703646857'),
(6145,470,114,'有效'),
(6146,470,113,'壁挂式'),
(6147,471,122,'约10~16m2'),
(6148,471,121,'大1匹'),
(6149,471,120,'三级'),
(6150,471,119,'Hisense/海信 KFR-26GW/...'),
(6151,471,118,'冷暖电辅'),
(6152,471,117,'变频'),
(6153,471,116,'KFR-26GW/EF16A3z'),
(6154,471,115,'2013010703646857'),
(6155,471,114,'有效'),
(6156,471,113,'壁挂式'),
(6157,472,122,'约10~16m2'),
(6158,472,121,'大1匹'),
(6159,472,120,'三级'),
(6160,472,119,'Hisense/海信 KFR-26GW/...'),
(6161,472,118,'冷暖电辅'),
(6162,472,117,'变频'),
(6163,472,116,'KFR-26GW/EF16A3z'),
(6164,472,115,'2013010703646857'),
(6165,472,114,'有效'),
(6166,472,113,'壁挂式'),
(6167,473,122,'约10~16m2'),
(6168,473,121,'大1匹'),
(6169,473,120,'三级'),
(6170,473,119,'Hisense/海信 KFR-26GW/...'),
(6171,473,118,'冷暖电辅'),
(6172,473,117,'变频'),
(6173,473,116,'KFR-26GW/EF16A3z'),
(6174,473,115,'2013010703646857'),
(6175,473,114,'有效'),
(6176,473,113,'壁挂式'),
(6177,474,122,'约10~16m2'),
(6178,474,121,'大1匹'),
(6179,474,120,'三级'),
(6180,474,119,'Hisense/海信 KFR-26GW/...'),
(6181,474,118,'冷暖电辅'),
(6182,474,117,'变频'),
(6183,474,116,'KFR-26GW/EF16A3z'),
(6184,474,115,'2013010703646857'),
(6185,474,114,'有效'),
(6186,474,113,'壁挂式'),
(6187,475,122,'约10~16m2'),
(6188,475,121,'大1匹'),
(6189,475,120,'三级'),
(6190,475,119,'Hisense/海信 KFR-26GW/...'),
(6191,475,118,'冷暖电辅'),
(6192,475,117,'变频'),
(6193,475,116,'KFR-26GW/EF16A3z'),
(6194,475,115,'2013010703646857'),
(6195,475,114,'有效'),
(6196,475,113,'壁挂式'),
(6197,476,122,'约10~16m2'),
(6198,476,121,'大1匹'),
(6199,476,120,'三级'),
(6200,476,119,'Hisense/海信 KFR-26GW/...'),
(6201,476,118,'冷暖电辅'),
(6202,476,117,'变频'),
(6203,476,116,'KFR-26GW/EF16A3z'),
(6204,476,115,'2013010703646857'),
(6205,476,114,'有效'),
(6206,476,113,'壁挂式'),
(6207,477,122,'约10~16m2'),
(6208,477,121,'大1匹'),
(6209,477,120,'三级'),
(6210,477,119,'Hisense/海信 KFR-26GW/...'),
(6211,477,118,'冷暖电辅'),
(6212,477,117,'变频'),
(6213,477,116,'KFR-26GW/EF16A3z'),
(6214,477,115,'2013010703646857'),
(6215,477,114,'有效'),
(6216,477,113,'壁挂式'),
(6217,478,122,'约10~16m2'),
(6218,478,121,'大1匹'),
(6219,478,120,'三级'),
(6220,478,119,'Hisense/海信 KFR-26GW/...'),
(6221,478,118,'冷暖电辅'),
(6222,478,117,'变频'),
(6223,478,116,'KFR-26GW/EF16A3z'),
(6224,478,115,'2013010703646857'),
(6225,478,114,'有效'),
(6226,478,113,'壁挂式'),
(6227,479,122,'约10~16m2'),
(6228,479,121,'大1匹'),
(6229,479,120,'三级'),
(6230,479,119,'Hisense/海信 KFR-26GW/...'),
(6231,479,118,'冷暖电辅'),
(6232,479,117,'变频'),
(6233,479,116,'KFR-26GW/EF16A3z'),
(6234,479,115,'2013010703646857'),
(6235,479,114,'有效'),
(6236,479,113,'壁挂式'),
(6237,480,122,'约10~16m2'),
(6238,480,121,'大1匹'),
(6239,480,120,'三级'),
(6240,480,119,'Hisense/海信 KFR-26GW/...'),
(6241,480,118,'冷暖电辅'),
(6242,480,117,'变频'),
(6243,480,116,'KFR-26GW/EF16A3z'),
(6244,480,115,'2013010703646857'),
(6245,480,114,'有效'),
(6246,480,113,'壁挂式'),
(6247,481,122,'约10~16m2'),
(6248,481,121,'大1匹'),
(6249,481,120,'三级'),
(6250,481,119,'Hisense/海信 KFR-26GW/...'),
(6251,481,118,'冷暖电辅'),
(6252,481,117,'变频'),
(6253,481,116,'KFR-26GW/EF16A3z'),
(6254,481,115,'2013010703646857'),
(6255,481,114,'有效'),
(6256,481,113,'壁挂式'),
(6257,482,122,'约10~16m2'),
(6258,482,121,'大1匹'),
(6259,482,120,'三级'),
(6260,482,119,'Hisense/海信 KFR-26GW/...'),
(6261,482,118,'冷暖电辅'),
(6262,482,117,'变频'),
(6263,482,116,'KFR-26GW/EF16A3z'),
(6264,482,115,'2013010703646857'),
(6265,482,114,'有效'),
(6266,482,113,'壁挂式'),
(6267,483,122,'约10~16m2'),
(6268,483,121,'大1匹'),
(6269,483,120,'三级'),
(6270,483,119,'Hisense/海信 KFR-26GW/...'),
(6271,483,118,'冷暖电辅'),
(6272,483,117,'变频'),
(6273,483,116,'KFR-26GW/EF16A3z'),
(6274,483,115,'2013010703646857'),
(6275,483,114,'有效'),
(6276,483,113,'壁挂式'),
(6277,485,122,'约10~16m2'),
(6278,485,121,'大1匹'),
(6279,485,120,'三级'),
(6280,485,119,'Hisense/海信 KFR-26GW/...'),
(6281,485,118,'冷暖电辅'),
(6282,485,117,'变频'),
(6283,485,116,'KFR-26GW/EF16A3z'),
(6284,485,115,'2013010703646857'),
(6285,485,114,'有效'),
(6286,485,113,'壁挂式'),
(6287,486,122,'约10~16m2'),
(6288,486,121,'大1匹'),
(6289,486,120,'三级'),
(6290,486,119,'Hisense/海信 KFR-26GW/...'),
(6291,486,118,'冷暖电辅'),
(6292,486,117,'变频'),
(6293,486,116,'KFR-26GW/EF16A3z'),
(6294,486,115,'2013010703646857'),
(6295,486,114,'有效'),
(6296,486,113,'壁挂式'),
(6297,487,122,'约10~16m2'),
(6298,487,121,'大1匹'),
(6299,487,120,'三级'),
(6300,487,119,'Hisense/海信 KFR-26GW/...'),
(6301,487,118,'冷暖电辅'),
(6302,487,117,'变频'),
(6303,487,116,'KFR-26GW/EF16A3z'),
(6304,487,115,'2013010703646857'),
(6305,487,114,'有效'),
(6306,487,113,'壁挂式'),
(6307,488,122,'约10~16m2'),
(6308,488,121,'大1匹'),
(6309,488,120,'三级'),
(6310,488,119,'Hisense/海信 KFR-26GW/...'),
(6311,488,118,'冷暖电辅'),
(6312,488,117,'变频'),
(6313,488,116,'KFR-26GW/EF16A3z'),
(6314,488,115,'2013010703646857'),
(6315,488,114,'有效'),
(6316,488,113,'壁挂式'),
(6317,489,122,'约10~16m2'),
(6318,489,121,'大1匹'),
(6319,489,120,'三级'),
(6320,489,119,'Hisense/海信 KFR-26GW/...'),
(6321,489,118,'冷暖电辅'),
(6322,489,117,'变频'),
(6323,489,116,'KFR-26GW/EF16A3z'),
(6324,489,115,'2013010703646857'),
(6325,489,114,'有效'),
(6326,489,113,'壁挂式'),
(6327,490,122,'约10~16m2'),
(6328,490,121,'大1匹'),
(6329,490,120,'三级'),
(6330,490,119,'Hisense/海信 KFR-26GW/...'),
(6331,490,118,'冷暖电辅'),
(6332,490,117,'变频'),
(6333,490,116,'KFR-26GW/EF16A3z'),
(6334,490,115,'2013010703646857'),
(6335,490,114,'有效'),
(6336,490,113,'壁挂式'),
(6337,491,122,'约10~16m2'),
(6338,491,121,'大1匹'),
(6339,491,120,'三级'),
(6340,491,119,'Hisense/海信 KFR-26GW/...'),
(6341,491,118,'冷暖电辅'),
(6342,491,117,'变频'),
(6343,491,116,'KFR-26GW/EF16A3z'),
(6344,491,115,'2013010703646857'),
(6345,491,114,'有效'),
(6346,491,113,'壁挂式'),
(6347,492,122,'约10~16m2'),
(6348,492,121,'大1匹'),
(6349,492,120,'三级'),
(6350,492,119,'Hisense/海信 KFR-26GW/...'),
(6351,492,118,'冷暖电辅'),
(6352,492,117,'变频'),
(6353,492,116,'KFR-26GW/EF16A3z'),
(6354,492,115,'2013010703646857'),
(6355,492,114,'有效'),
(6356,492,113,'壁挂式'),
(6357,493,122,'约10~16m2'),
(6358,493,121,'大1匹'),
(6359,493,120,'三级'),
(6360,493,119,'Hisense/海信 KFR-26GW/...'),
(6361,493,118,'冷暖电辅'),
(6362,493,117,'变频'),
(6363,493,116,'KFR-26GW/EF16A3z'),
(6364,493,115,'2013010703646857'),
(6365,493,114,'有效'),
(6366,493,113,'壁挂式'),
(6367,494,122,'约10~16m2'),
(6368,494,121,'大1匹'),
(6369,494,120,'三级'),
(6370,494,119,'Hisense/海信 KFR-26GW/...'),
(6371,494,118,'冷暖电辅'),
(6372,494,117,'变频'),
(6373,494,116,'KFR-26GW/EF16A3z'),
(6374,494,115,'2013010703646857'),
(6375,494,114,'有效'),
(6376,494,113,'壁挂式'),
(6377,495,122,'约10~16m2'),
(6378,495,121,'大1匹'),
(6379,495,120,'三级'),
(6380,495,119,'Hisense/海信 KFR-26GW/...'),
(6381,495,118,'冷暖电辅'),
(6382,495,117,'变频'),
(6383,495,116,'KFR-26GW/EF16A3z'),
(6384,495,115,'2013010703646857'),
(6385,495,114,'有效'),
(6386,495,113,'壁挂式'),
(6387,496,122,'约10~16m2'),
(6388,496,121,'大1匹'),
(6389,496,120,'三级'),
(6390,496,119,'Hisense/海信 KFR-26GW/...'),
(6391,496,118,'冷暖电辅'),
(6392,496,117,'变频'),
(6393,496,116,'KFR-26GW/EF16A3z'),
(6394,496,115,'2013010703646857'),
(6395,496,114,'有效'),
(6396,496,113,'壁挂式'),
(6397,497,122,'约10~16m2'),
(6398,497,121,'大1匹'),
(6399,497,120,'三级'),
(6400,497,119,'Hisense/海信 KFR-26GW/...'),
(6401,497,118,'冷暖电辅'),
(6402,497,117,'变频'),
(6403,497,116,'KFR-26GW/EF16A3z'),
(6404,497,115,'2013010703646857'),
(6405,497,114,'有效'),
(6406,497,113,'壁挂式'),
(6407,498,122,'约10~16m2'),
(6408,498,121,'大1匹'),
(6409,498,120,'三级'),
(6410,498,119,'Hisense/海信 KFR-26GW/...'),
(6411,498,118,'冷暖电辅'),
(6412,498,117,'变频'),
(6413,498,116,'KFR-26GW/EF16A3z'),
(6414,498,115,'2013010703646857'),
(6415,498,114,'有效'),
(6416,498,113,'壁挂式'),
(6417,499,122,'约10~16m2'),
(6418,499,121,'大1匹'),
(6419,499,120,'三级'),
(6420,499,119,'Hisense/海信 KFR-26GW/...'),
(6421,499,118,'冷暖电辅'),
(6422,499,117,'变频'),
(6423,499,116,'KFR-26GW/EF16A3z'),
(6424,499,115,'2013010703646857'),
(6425,499,114,'有效'),
(6426,499,113,'壁挂式'),
(6427,500,122,'约10~16m2'),
(6428,500,121,'大1匹'),
(6429,500,120,'三级'),
(6430,500,119,'Hisense/海信 KFR-26GW/...'),
(6431,500,118,'冷暖电辅'),
(6432,500,117,'变频'),
(6433,500,116,'KFR-26GW/EF16A3z'),
(6434,500,115,'2013010703646857'),
(6435,500,114,'有效'),
(6436,500,113,'壁挂式'),
(6437,501,122,'约10~16m2'),
(6438,501,121,'大1匹'),
(6439,501,120,'三级'),
(6440,501,119,'Hisense/海信 KFR-26GW/...'),
(6441,501,118,'冷暖电辅'),
(6442,501,117,'变频'),
(6443,501,116,'KFR-26GW/EF16A3z'),
(6444,501,115,'2013010703646857'),
(6445,501,114,'有效'),
(6446,501,113,'壁挂式'),
(6447,502,122,'约10~16m2'),
(6448,502,121,'大1匹'),
(6449,502,120,'三级'),
(6450,502,119,'Hisense/海信 KFR-26GW/...'),
(6451,502,118,'冷暖电辅'),
(6452,502,117,'变频'),
(6453,502,116,'KFR-26GW/EF16A3z'),
(6454,502,115,'2013010703646857'),
(6455,502,114,'有效'),
(6456,502,113,'壁挂式'),
(6457,503,122,'约10~16m2'),
(6458,503,121,'大1匹'),
(6459,503,120,'三级'),
(6460,503,119,'Hisense/海信 KFR-26GW/...'),
(6461,503,118,'冷暖电辅'),
(6462,503,117,'变频'),
(6463,503,116,'KFR-26GW/EF16A3z'),
(6464,503,115,'2013010703646857'),
(6465,503,114,'有效'),
(6466,503,113,'壁挂式'),
(6467,504,122,'约10~16m2'),
(6468,504,121,'大1匹'),
(6469,504,120,'三级'),
(6470,504,119,'Hisense/海信 KFR-26GW/...'),
(6471,504,118,'冷暖电辅'),
(6472,504,117,'变频'),
(6473,504,116,'KFR-26GW/EF16A3z'),
(6474,504,115,'2013010703646857'),
(6475,504,114,'有效'),
(6476,504,113,'壁挂式'),
(6477,505,122,'约10~16m2'),
(6478,505,121,'大1匹'),
(6479,505,120,'三级'),
(6480,505,119,'Hisense/海信 KFR-26GW/...'),
(6481,505,118,'冷暖电辅'),
(6482,505,117,'变频'),
(6483,505,116,'KFR-26GW/EF16A3z'),
(6484,505,115,'2013010703646857'),
(6485,505,114,'有效'),
(6486,505,113,'壁挂式'),
(6487,506,122,'约10~16m2'),
(6488,506,121,'大1匹'),
(6489,506,120,'三级'),
(6490,506,119,'Hisense/海信 KFR-26GW/...'),
(6491,506,118,'冷暖电辅'),
(6492,506,117,'变频'),
(6493,506,116,'KFR-26GW/EF16A3z'),
(6494,506,115,'2013010703646857'),
(6495,506,114,'有效'),
(6496,506,113,'壁挂式'),
(6497,507,122,'约10~16m2'),
(6498,507,121,'大1匹'),
(6499,507,120,'三级'),
(6500,507,119,'Hisense/海信 KFR-26GW/...'),
(6501,507,118,'冷暖电辅'),
(6502,507,117,'变频'),
(6503,507,116,'KFR-26GW/EF16A3z'),
(6504,507,115,'2013010703646857'),
(6505,507,114,'有效'),
(6506,507,113,'壁挂式'),
(6507,508,122,'约10~16m2'),
(6508,508,121,'大1匹'),
(6509,508,120,'三级'),
(6510,508,119,'Hisense/海信 KFR-26GW/...'),
(6511,508,118,'冷暖电辅'),
(6512,508,117,'变频'),
(6513,508,116,'KFR-26GW/EF16A3z'),
(6514,508,115,'2013010703646857'),
(6515,508,114,'有效'),
(6516,508,113,'壁挂式'),
(6517,509,122,'约10~16m2'),
(6518,509,121,'大1匹'),
(6519,509,120,'三级'),
(6520,509,119,'Hisense/海信 KFR-26GW/...'),
(6521,509,118,'冷暖电辅'),
(6522,509,117,'变频'),
(6523,509,116,'KFR-26GW/EF16A3z'),
(6524,509,115,'2013010703646857'),
(6525,509,114,'有效'),
(6526,509,113,'壁挂式'),
(6527,510,122,'约10~16m2'),
(6528,510,121,'大1匹'),
(6529,510,120,'三级'),
(6530,510,119,'Hisense/海信 KFR-26GW/...'),
(6531,510,118,'冷暖电辅'),
(6532,510,117,'变频'),
(6533,510,116,'KFR-26GW/EF16A3z'),
(6534,510,115,'2013010703646857'),
(6535,510,114,'有效'),
(6536,510,113,'壁挂式'),
(6537,511,122,'约10~16m2'),
(6538,511,121,'大1匹'),
(6539,511,120,'三级'),
(6540,511,119,'Hisense/海信 KFR-26GW/...'),
(6541,511,118,'冷暖电辅'),
(6542,511,117,'变频'),
(6543,511,116,'KFR-26GW/EF16A3z'),
(6544,511,115,'2013010703646857'),
(6545,511,114,'有效'),
(6546,511,113,'壁挂式'),
(6547,512,122,'约10~16m2'),
(6548,512,121,'大1匹'),
(6549,512,120,'三级'),
(6550,512,119,'Hisense/海信 KFR-26GW/...'),
(6551,512,118,'冷暖电辅'),
(6552,512,117,'变频'),
(6553,512,116,'KFR-26GW/EF16A3z'),
(6554,512,115,'2013010703646857'),
(6555,512,114,'有效'),
(6556,512,113,'壁挂式'),
(6557,513,122,'约10~16m2'),
(6558,513,121,'大1匹'),
(6559,513,120,'三级'),
(6560,513,119,'Hisense/海信 KFR-26GW/...'),
(6561,513,118,'冷暖电辅'),
(6562,513,117,'变频'),
(6563,513,116,'KFR-26GW/EF16A3z'),
(6564,513,115,'2013010703646857'),
(6565,513,114,'有效'),
(6566,513,113,'壁挂式'),
(6567,514,142,'蓝晶石系列-PD'),
(6568,514,141,'女'),
(6569,514,140,'大表盘'),
(6570,514,139,'30米生活防水'),
(6571,514,138,'圆形'),
(6572,514,137,'宾派'),
(6573,514,136,'全国联保'),
(6574,514,135,'真皮'),
(6575,514,134,'2016年'),
(6576,514,133,'36mm'),
(6577,514,132,'全新'),
(6578,514,131,'国内'),
(6579,514,130,'8mm'),
(6580,514,129,'日本'),
(6581,514,128,'镀膜玻璃'),
(6582,514,127,'石英表'),
(6583,514,126,'合金'),
(6584,514,125,'指针式'),
(6585,514,124,'深蓝色 白色 紫色 红色 黑色'),
(6586,514,123,'时尚潮流'),
(6587,515,142,'蓝晶石系列-PD'),
(6588,515,141,'女'),
(6589,515,140,'大表盘'),
(6590,515,139,'30米生活防水'),
(6591,515,138,'圆形'),
(6592,515,137,'宾派'),
(6593,515,136,'全国联保'),
(6594,515,135,'真皮'),
(6595,515,134,'2016年'),
(6596,515,133,'36mm'),
(6597,515,132,'全新'),
(6598,515,131,'国内'),
(6599,515,130,'8mm'),
(6600,515,129,'日本'),
(6601,515,128,'镀膜玻璃'),
(6602,515,127,'石英表'),
(6603,515,126,'合金'),
(6604,515,125,'指针式'),
(6605,515,124,'深蓝色 白色 紫色 红色 黑色'),
(6606,515,123,'时尚潮流'),
(6607,516,142,'蓝晶石系列-PD'),
(6608,516,141,'女'),
(6609,516,140,'大表盘'),
(6610,516,139,'30米生活防水'),
(6611,516,138,'圆形'),
(6612,516,137,'宾派'),
(6613,516,136,'全国联保'),
(6614,516,135,'真皮'),
(6615,516,134,'2016年'),
(6616,516,133,'36mm'),
(6617,516,132,'全新'),
(6618,516,131,'国内'),
(6619,516,130,'8mm'),
(6620,516,129,'日本'),
(6621,516,128,'镀膜玻璃'),
(6622,516,127,'石英表'),
(6623,516,126,'合金'),
(6624,516,125,'指针式'),
(6625,516,124,'深蓝色 白色 紫色 红色 黑色'),
(6626,516,123,'时尚潮流'),
(6627,517,142,'蓝晶石系列-PD'),
(6628,517,141,'女'),
(6629,517,140,'大表盘'),
(6630,517,139,'30米生活防水'),
(6631,517,138,'圆形'),
(6632,517,137,'宾派'),
(6633,517,136,'全国联保'),
(6634,517,135,'真皮'),
(6635,517,134,'2016年'),
(6636,517,133,'36mm'),
(6637,517,132,'全新'),
(6638,517,131,'国内'),
(6639,517,130,'8mm'),
(6640,517,129,'日本'),
(6641,517,128,'镀膜玻璃'),
(6642,517,127,'石英表'),
(6643,517,126,'合金'),
(6644,517,125,'指针式'),
(6645,517,124,'深蓝色 白色 紫色 红色 黑色'),
(6646,517,123,'时尚潮流'),
(6647,518,142,'蓝晶石系列-PD'),
(6648,518,141,'女'),
(6649,518,140,'大表盘'),
(6650,518,139,'30米生活防水'),
(6651,518,138,'圆形'),
(6652,518,137,'宾派'),
(6653,518,136,'全国联保'),
(6654,518,135,'真皮'),
(6655,518,134,'2016年'),
(6656,518,133,'36mm'),
(6657,518,132,'全新'),
(6658,518,131,'国内'),
(6659,518,130,'8mm'),
(6660,518,129,'日本'),
(6661,518,128,'镀膜玻璃'),
(6662,518,127,'石英表'),
(6663,518,126,'合金'),
(6664,518,125,'指针式'),
(6665,518,124,'深蓝色 白色 紫色 红色 黑色'),
(6666,518,123,'时尚潮流'),
(6667,519,142,'蓝晶石系列-PD'),
(6668,519,141,'女'),
(6669,519,140,'大表盘'),
(6670,519,139,'30米生活防水'),
(6671,519,138,'圆形'),
(6672,519,137,'宾派'),
(6673,519,136,'全国联保'),
(6674,519,135,'真皮'),
(6675,519,134,'2016年'),
(6676,519,133,'36mm'),
(6677,519,132,'全新'),
(6678,519,131,'国内'),
(6679,519,130,'8mm'),
(6680,519,129,'日本'),
(6681,519,128,'镀膜玻璃'),
(6682,519,127,'石英表'),
(6683,519,126,'合金'),
(6684,519,125,'指针式'),
(6685,519,124,'深蓝色 白色 紫色 红色 黑色'),
(6686,519,123,'时尚潮流'),
(6687,520,142,'蓝晶石系列-PD'),
(6688,520,141,'女'),
(6689,520,140,'大表盘'),
(6690,520,139,'30米生活防水'),
(6691,520,138,'圆形'),
(6692,520,137,'宾派'),
(6693,520,136,'全国联保'),
(6694,520,135,'真皮'),
(6695,520,134,'2016年'),
(6696,520,133,'36mm'),
(6697,520,132,'全新'),
(6698,520,131,'国内'),
(6699,520,130,'8mm'),
(6700,520,129,'日本'),
(6701,520,128,'镀膜玻璃'),
(6702,520,127,'石英表'),
(6703,520,126,'合金'),
(6704,520,125,'指针式'),
(6705,520,124,'深蓝色 白色 紫色 红色 黑色'),
(6706,520,123,'时尚潮流'),
(6707,521,142,'蓝晶石系列-PD'),
(6708,521,141,'女'),
(6709,521,140,'大表盘'),
(6710,521,139,'30米生活防水'),
(6711,521,138,'圆形'),
(6712,521,137,'宾派'),
(6713,521,136,'全国联保'),
(6714,521,135,'真皮'),
(6715,521,134,'2016年'),
(6716,521,133,'36mm'),
(6717,521,132,'全新'),
(6718,521,131,'国内'),
(6719,521,130,'8mm'),
(6720,521,129,'日本'),
(6721,521,128,'镀膜玻璃'),
(6722,521,127,'石英表'),
(6723,521,126,'合金'),
(6724,521,125,'指针式'),
(6725,521,124,'深蓝色 白色 紫色 红色 黑色'),
(6726,521,123,'时尚潮流'),
(6727,522,142,'蓝晶石系列-PD'),
(6728,522,141,'女'),
(6729,522,140,'大表盘'),
(6730,522,139,'30米生活防水'),
(6731,522,138,'圆形'),
(6732,522,137,'宾派'),
(6733,522,136,'全国联保'),
(6734,522,135,'真皮'),
(6735,522,134,'2016年'),
(6736,522,133,'36mm'),
(6737,522,132,'全新'),
(6738,522,131,'国内'),
(6739,522,130,'8mm'),
(6740,522,129,'日本'),
(6741,522,128,'镀膜玻璃'),
(6742,522,127,'石英表'),
(6743,522,126,'合金'),
(6744,522,125,'指针式'),
(6745,522,124,'深蓝色 白色 紫色 红色 黑色'),
(6746,522,123,'时尚潮流'),
(6747,523,142,'蓝晶石系列-PD'),
(6748,523,141,'女'),
(6749,523,140,'大表盘'),
(6750,523,139,'30米生活防水'),
(6751,523,138,'圆形'),
(6752,523,137,'宾派'),
(6753,523,136,'全国联保'),
(6754,523,135,'真皮'),
(6755,523,134,'2016年'),
(6756,523,133,'36mm'),
(6757,523,132,'全新'),
(6758,523,131,'国内'),
(6759,523,130,'8mm'),
(6760,523,129,'日本'),
(6761,523,128,'镀膜玻璃'),
(6762,523,127,'石英表'),
(6763,523,126,'合金'),
(6764,523,125,'指针式'),
(6765,523,124,'深蓝色 白色 紫色 红色 黑色'),
(6766,523,123,'时尚潮流'),
(6767,524,142,'蓝晶石系列-PD'),
(6768,524,141,'女'),
(6769,524,140,'大表盘'),
(6770,524,139,'30米生活防水'),
(6771,524,138,'圆形'),
(6772,524,137,'宾派'),
(6773,524,136,'全国联保'),
(6774,524,135,'真皮'),
(6775,524,134,'2016年'),
(6776,524,133,'36mm'),
(6777,524,132,'全新'),
(6778,524,131,'国内'),
(6779,524,130,'8mm'),
(6780,524,129,'日本'),
(6781,524,128,'镀膜玻璃'),
(6782,524,127,'石英表'),
(6783,524,126,'合金'),
(6784,524,125,'指针式'),
(6785,524,124,'深蓝色 白色 紫色 红色 黑色'),
(6786,524,123,'时尚潮流'),
(6787,525,142,'蓝晶石系列-PD'),
(6788,525,141,'女'),
(6789,525,140,'大表盘'),
(6790,525,139,'30米生活防水'),
(6791,525,138,'圆形'),
(6792,525,137,'宾派'),
(6793,525,136,'全国联保'),
(6794,525,135,'真皮'),
(6795,525,134,'2016年'),
(6796,525,133,'36mm'),
(6797,525,132,'全新'),
(6798,525,131,'国内'),
(6799,525,130,'8mm'),
(6800,525,129,'日本'),
(6801,525,128,'镀膜玻璃'),
(6802,525,127,'石英表'),
(6803,525,126,'合金'),
(6804,525,125,'指针式'),
(6805,525,124,'深蓝色 白色 紫色 红色 黑色'),
(6806,525,123,'时尚潮流'),
(6807,526,142,'蓝晶石系列-PD'),
(6808,526,141,'女'),
(6809,526,140,'大表盘'),
(6810,526,139,'30米生活防水'),
(6811,526,138,'圆形'),
(6812,526,137,'宾派'),
(6813,526,136,'全国联保'),
(6814,526,135,'真皮'),
(6815,526,134,'2016年'),
(6816,526,133,'36mm'),
(6817,526,132,'全新'),
(6818,526,131,'国内'),
(6819,526,130,'8mm'),
(6820,526,129,'日本'),
(6821,526,128,'镀膜玻璃'),
(6822,526,127,'石英表'),
(6823,526,126,'合金'),
(6824,526,125,'指针式'),
(6825,526,124,'深蓝色 白色 紫色 红色 黑色'),
(6826,526,123,'时尚潮流'),
(6827,527,142,'蓝晶石系列-PD'),
(6828,527,141,'女'),
(6829,527,140,'大表盘'),
(6830,527,139,'30米生活防水'),
(6831,527,138,'圆形'),
(6832,527,137,'宾派'),
(6833,527,136,'全国联保'),
(6834,527,135,'真皮'),
(6835,527,134,'2016年'),
(6836,527,133,'36mm'),
(6837,527,132,'全新'),
(6838,527,131,'国内'),
(6839,527,130,'8mm'),
(6840,527,129,'日本'),
(6841,527,128,'镀膜玻璃'),
(6842,527,127,'石英表'),
(6843,527,126,'合金'),
(6844,527,125,'指针式'),
(6845,527,124,'深蓝色 白色 紫色 红色 黑色'),
(6846,527,123,'时尚潮流'),
(6847,528,142,'蓝晶石系列-PD'),
(6848,528,141,'女'),
(6849,528,140,'大表盘'),
(6850,528,139,'30米生活防水'),
(6851,528,138,'圆形'),
(6852,528,137,'宾派'),
(6853,528,136,'全国联保'),
(6854,528,135,'真皮'),
(6855,528,134,'2016年'),
(6856,528,133,'36mm'),
(6857,528,132,'全新'),
(6858,528,131,'国内'),
(6859,528,130,'8mm'),
(6860,528,129,'日本'),
(6861,528,128,'镀膜玻璃'),
(6862,528,127,'石英表'),
(6863,528,126,'合金'),
(6864,528,125,'指针式'),
(6865,528,124,'深蓝色 白色 紫色 红色 黑色'),
(6866,528,123,'时尚潮流'),
(6867,529,142,'蓝晶石系列-PD'),
(6868,529,141,'女'),
(6869,529,140,'大表盘'),
(6870,529,139,'30米生活防水'),
(6871,529,138,'圆形'),
(6872,529,137,'宾派'),
(6873,529,136,'全国联保'),
(6874,529,135,'真皮'),
(6875,529,134,'2016年'),
(6876,529,133,'36mm'),
(6877,529,132,'全新'),
(6878,529,131,'国内'),
(6879,529,130,'8mm'),
(6880,529,129,'日本'),
(6881,529,128,'镀膜玻璃'),
(6882,529,127,'石英表'),
(6883,529,126,'合金'),
(6884,529,125,'指针式'),
(6885,529,124,'深蓝色 白色 紫色 红色 黑色'),
(6886,529,123,'时尚潮流'),
(6887,530,142,'蓝晶石系列-PD'),
(6888,530,141,'女'),
(6889,530,140,'大表盘'),
(6890,530,139,'30米生活防水'),
(6891,530,138,'圆形'),
(6892,530,137,'宾派'),
(6893,530,136,'全国联保'),
(6894,530,135,'真皮'),
(6895,530,134,'2016年'),
(6896,530,133,'36mm'),
(6897,530,132,'全新'),
(6898,530,131,'国内'),
(6899,530,130,'8mm'),
(6900,530,129,'日本'),
(6901,530,128,'镀膜玻璃'),
(6902,530,127,'石英表'),
(6903,530,126,'合金'),
(6904,530,125,'指针式'),
(6905,530,124,'深蓝色 白色 紫色 红色 黑色'),
(6906,530,123,'时尚潮流'),
(6907,531,142,'蓝晶石系列-PD'),
(6908,531,141,'女'),
(6909,531,140,'大表盘'),
(6910,531,139,'30米生活防水'),
(6911,531,138,'圆形'),
(6912,531,137,'宾派'),
(6913,531,136,'全国联保'),
(6914,531,135,'真皮'),
(6915,531,134,'2016年'),
(6916,531,133,'36mm'),
(6917,531,132,'全新'),
(6918,531,131,'国内'),
(6919,531,130,'8mm'),
(6920,531,129,'日本'),
(6921,531,128,'镀膜玻璃'),
(6922,531,127,'石英表'),
(6923,531,126,'合金'),
(6924,531,125,'指针式'),
(6925,531,124,'深蓝色 白色 紫色 红色 黑色'),
(6926,531,123,'时尚潮流'),
(6927,532,142,'蓝晶石系列-PD'),
(6928,532,141,'女'),
(6929,532,140,'大表盘'),
(6930,532,139,'30米生活防水'),
(6931,532,138,'圆形'),
(6932,532,137,'宾派'),
(6933,532,136,'全国联保'),
(6934,532,135,'真皮'),
(6935,532,134,'2016年'),
(6936,532,133,'36mm'),
(6937,532,132,'全新'),
(6938,532,131,'国内'),
(6939,532,130,'8mm'),
(6940,532,129,'日本'),
(6941,532,128,'镀膜玻璃'),
(6942,532,127,'石英表'),
(6943,532,126,'合金'),
(6944,532,125,'指针式'),
(6945,532,124,'深蓝色 白色 紫色 红色 黑色'),
(6946,532,123,'时尚潮流'),
(6947,533,142,'蓝晶石系列-PD'),
(6948,533,141,'女'),
(6949,533,140,'大表盘'),
(6950,533,139,'30米生活防水'),
(6951,533,138,'圆形'),
(6952,533,137,'宾派'),
(6953,533,136,'全国联保'),
(6954,533,135,'真皮'),
(6955,533,134,'2016年'),
(6956,533,133,'36mm'),
(6957,533,132,'全新'),
(6958,533,131,'国内'),
(6959,533,130,'8mm'),
(6960,533,129,'日本'),
(6961,533,128,'镀膜玻璃'),
(6962,533,127,'石英表'),
(6963,533,126,'合金'),
(6964,533,125,'指针式'),
(6965,533,124,'深蓝色 白色 紫色 红色 黑色'),
(6966,533,123,'时尚潮流'),
(6967,534,142,'蓝晶石系列-PD'),
(6968,534,141,'女'),
(6969,534,140,'大表盘'),
(6970,534,139,'30米生活防水'),
(6971,534,138,'圆形'),
(6972,534,137,'宾派'),
(6973,534,136,'全国联保'),
(6974,534,135,'真皮'),
(6975,534,134,'2016年'),
(6976,534,133,'36mm'),
(6977,534,132,'全新'),
(6978,534,131,'国内'),
(6979,534,130,'8mm'),
(6980,534,129,'日本'),
(6981,534,128,'镀膜玻璃'),
(6982,534,127,'石英表'),
(6983,534,126,'合金'),
(6984,534,125,'指针式'),
(6985,534,124,'深蓝色 白色 紫色 红色 黑色'),
(6986,534,123,'时尚潮流'),
(6987,535,142,'蓝晶石系列-PD'),
(6988,535,141,'女'),
(6989,535,140,'大表盘'),
(6990,535,139,'30米生活防水'),
(6991,535,138,'圆形'),
(6992,535,137,'宾派'),
(6993,535,136,'全国联保'),
(6994,535,135,'真皮'),
(6995,535,134,'2016年'),
(6996,535,133,'36mm'),
(6997,535,132,'全新'),
(6998,535,131,'国内'),
(6999,535,130,'8mm'),
(7000,535,129,'日本'),
(7001,535,128,'镀膜玻璃'),
(7002,535,127,'石英表'),
(7003,535,126,'合金'),
(7004,535,125,'指针式'),
(7005,535,124,'深蓝色 白色 紫色 红色 黑色'),
(7006,535,123,'时尚潮流'),
(7007,536,142,'蓝晶石系列-PD'),
(7008,536,141,'女'),
(7009,536,140,'大表盘'),
(7010,536,139,'30米生活防水'),
(7011,536,138,'圆形'),
(7012,536,137,'宾派'),
(7013,536,136,'全国联保'),
(7014,536,135,'真皮'),
(7015,536,134,'2016年'),
(7016,536,133,'36mm'),
(7017,536,132,'全新'),
(7018,536,131,'国内'),
(7019,536,130,'8mm'),
(7020,536,129,'日本'),
(7021,536,128,'镀膜玻璃'),
(7022,536,127,'石英表'),
(7023,536,126,'合金'),
(7024,536,125,'指针式'),
(7025,536,124,'深蓝色 白色 紫色 红色 黑色'),
(7026,536,123,'时尚潮流'),
(7027,537,142,'蓝晶石系列-PD'),
(7028,537,141,'女'),
(7029,537,140,'大表盘'),
(7030,537,139,'30米生活防水'),
(7031,537,138,'圆形'),
(7032,537,137,'宾派'),
(7033,537,136,'全国联保'),
(7034,537,135,'真皮'),
(7035,537,134,'2016年'),
(7036,537,133,'36mm'),
(7037,537,132,'全新'),
(7038,537,131,'国内'),
(7039,537,130,'8mm'),
(7040,537,129,'日本'),
(7041,537,128,'镀膜玻璃'),
(7042,537,127,'石英表'),
(7043,537,126,'合金'),
(7044,537,125,'指针式'),
(7045,537,124,'深蓝色 白色 紫色 红色 黑色'),
(7046,537,123,'时尚潮流'),
(7047,538,142,'蓝晶石系列-PD'),
(7048,538,141,'女'),
(7049,538,140,'大表盘'),
(7050,538,139,'30米生活防水'),
(7051,538,138,'圆形'),
(7052,538,137,'宾派'),
(7053,538,136,'全国联保'),
(7054,538,135,'真皮'),
(7055,538,134,'2016年'),
(7056,538,133,'36mm'),
(7057,538,132,'全新'),
(7058,538,131,'国内'),
(7059,538,130,'8mm'),
(7060,538,129,'日本'),
(7061,538,128,'镀膜玻璃'),
(7062,538,127,'石英表'),
(7063,538,126,'合金'),
(7064,538,125,'指针式'),
(7065,538,124,'深蓝色 白色 紫色 红色 黑色'),
(7066,538,123,'时尚潮流'),
(7067,539,142,'蓝晶石系列-PD'),
(7068,539,141,'女'),
(7069,539,140,'大表盘'),
(7070,539,139,'30米生活防水'),
(7071,539,138,'圆形'),
(7072,539,137,'宾派'),
(7073,539,136,'全国联保'),
(7074,539,135,'真皮'),
(7075,539,134,'2016年'),
(7076,539,133,'36mm'),
(7077,539,132,'全新'),
(7078,539,131,'国内'),
(7079,539,130,'8mm'),
(7080,539,129,'日本'),
(7081,539,128,'镀膜玻璃'),
(7082,539,127,'石英表'),
(7083,539,126,'合金'),
(7084,539,125,'指针式'),
(7085,539,124,'深蓝色 白色 紫色 红色 黑色'),
(7086,539,123,'时尚潮流'),
(7087,540,142,'蓝晶石系列-PD'),
(7088,540,141,'女'),
(7089,540,140,'大表盘'),
(7090,540,139,'30米生活防水'),
(7091,540,138,'圆形'),
(7092,540,137,'宾派'),
(7093,540,136,'全国联保'),
(7094,540,135,'真皮'),
(7095,540,134,'2016年'),
(7096,540,133,'36mm'),
(7097,540,132,'全新'),
(7098,540,131,'国内'),
(7099,540,130,'8mm'),
(7100,540,129,'日本'),
(7101,540,128,'镀膜玻璃'),
(7102,540,127,'石英表'),
(7103,540,126,'合金'),
(7104,540,125,'指针式'),
(7105,540,124,'深蓝色 白色 紫色 红色 黑色'),
(7106,540,123,'时尚潮流'),
(7107,541,142,'蓝晶石系列-PD'),
(7108,541,141,'女'),
(7109,541,140,'大表盘'),
(7110,541,139,'30米生活防水'),
(7111,541,138,'圆形'),
(7112,541,137,'宾派'),
(7113,541,136,'全国联保'),
(7114,541,135,'真皮'),
(7115,541,134,'2016年'),
(7116,541,133,'36mm'),
(7117,541,132,'全新'),
(7118,541,131,'国内'),
(7119,541,130,'8mm'),
(7120,541,129,'日本'),
(7121,541,128,'镀膜玻璃'),
(7122,541,127,'石英表'),
(7123,541,126,'合金'),
(7124,541,125,'指针式'),
(7125,541,124,'深蓝色 白色 紫色 红色 黑色'),
(7126,541,123,'时尚潮流'),
(7127,542,142,'蓝晶石系列-PD'),
(7128,542,141,'女'),
(7129,542,140,'大表盘'),
(7130,542,139,'30米生活防水'),
(7131,542,138,'圆形'),
(7132,542,137,'宾派'),
(7133,542,136,'全国联保'),
(7134,542,135,'真皮'),
(7135,542,134,'2016年'),
(7136,542,133,'36mm'),
(7137,542,132,'全新'),
(7138,542,131,'国内'),
(7139,542,130,'8mm'),
(7140,542,129,'日本'),
(7141,542,128,'镀膜玻璃'),
(7142,542,127,'石英表'),
(7143,542,126,'合金'),
(7144,542,125,'指针式'),
(7145,542,124,'深蓝色 白色 紫色 红色 黑色'),
(7146,542,123,'时尚潮流'),
(7147,543,142,'蓝晶石系列-PD'),
(7148,543,141,'女'),
(7149,543,140,'大表盘'),
(7150,543,139,'30米生活防水'),
(7151,543,138,'圆形'),
(7152,543,137,'宾派'),
(7153,543,136,'全国联保'),
(7154,543,135,'真皮'),
(7155,543,134,'2016年'),
(7156,543,133,'36mm'),
(7157,543,132,'全新'),
(7158,543,131,'国内'),
(7159,543,130,'8mm'),
(7160,543,129,'日本'),
(7161,543,128,'镀膜玻璃'),
(7162,543,127,'石英表'),
(7163,543,126,'合金'),
(7164,543,125,'指针式'),
(7165,543,124,'深蓝色 白色 紫色 红色 黑色'),
(7166,543,123,'时尚潮流'),
(7167,544,142,'蓝晶石系列-PD'),
(7168,544,141,'女'),
(7169,544,140,'大表盘'),
(7170,544,139,'30米生活防水'),
(7171,544,138,'圆形'),
(7172,544,137,'宾派'),
(7173,544,136,'全国联保'),
(7174,544,135,'真皮'),
(7175,544,134,'2016年'),
(7176,544,133,'36mm'),
(7177,544,132,'全新'),
(7178,544,131,'国内'),
(7179,544,130,'8mm'),
(7180,544,129,'日本'),
(7181,544,128,'镀膜玻璃'),
(7182,544,127,'石英表'),
(7183,544,126,'合金'),
(7184,544,125,'指针式'),
(7185,544,124,'深蓝色 白色 紫色 红色 黑色'),
(7186,544,123,'时尚潮流'),
(7187,545,142,'蓝晶石系列-PD'),
(7188,545,141,'女'),
(7189,545,140,'大表盘'),
(7190,545,139,'30米生活防水'),
(7191,545,138,'圆形'),
(7192,545,137,'宾派'),
(7193,545,136,'全国联保'),
(7194,545,135,'真皮'),
(7195,545,134,'2016年'),
(7196,545,133,'36mm'),
(7197,545,132,'全新'),
(7198,545,131,'国内'),
(7199,545,130,'8mm'),
(7200,545,129,'日本'),
(7201,545,128,'镀膜玻璃'),
(7202,545,127,'石英表'),
(7203,545,126,'合金'),
(7204,545,125,'指针式'),
(7205,545,124,'深蓝色 白色 紫色 红色 黑色'),
(7206,545,123,'时尚潮流'),
(7207,546,142,'蓝晶石系列-PD'),
(7208,546,141,'女'),
(7209,546,140,'大表盘'),
(7210,546,139,'30米生活防水'),
(7211,546,138,'圆形'),
(7212,546,137,'宾派'),
(7213,546,136,'全国联保'),
(7214,546,135,'真皮'),
(7215,546,134,'2016年'),
(7216,546,133,'36mm'),
(7217,546,132,'全新'),
(7218,546,131,'国内'),
(7219,546,130,'8mm'),
(7220,546,129,'日本'),
(7221,546,128,'镀膜玻璃'),
(7222,546,127,'石英表'),
(7223,546,126,'合金'),
(7224,546,125,'指针式'),
(7225,546,124,'深蓝色 白色 紫色 红色 黑色'),
(7226,546,123,'时尚潮流'),
(7227,547,142,'蓝晶石系列-PD'),
(7228,547,141,'女'),
(7229,547,140,'大表盘'),
(7230,547,139,'30米生活防水'),
(7231,547,138,'圆形'),
(7232,547,137,'宾派'),
(7233,547,136,'全国联保'),
(7234,547,135,'真皮'),
(7235,547,134,'2016年'),
(7236,547,133,'36mm'),
(7237,547,132,'全新'),
(7238,547,131,'国内'),
(7239,547,130,'8mm'),
(7240,547,129,'日本'),
(7241,547,128,'镀膜玻璃'),
(7242,547,127,'石英表'),
(7243,547,126,'合金'),
(7244,547,125,'指针式'),
(7245,547,124,'深蓝色 白色 紫色 红色 黑色'),
(7246,547,123,'时尚潮流'),
(7247,548,142,'蓝晶石系列-PD'),
(7248,548,141,'女'),
(7249,548,140,'大表盘'),
(7250,548,139,'30米生活防水'),
(7251,548,138,'圆形'),
(7252,548,137,'宾派'),
(7253,548,136,'全国联保'),
(7254,548,135,'真皮'),
(7255,548,134,'2016年'),
(7256,548,133,'36mm'),
(7257,548,132,'全新'),
(7258,548,131,'国内'),
(7259,548,130,'8mm'),
(7260,548,129,'日本'),
(7261,548,128,'镀膜玻璃'),
(7262,548,127,'石英表'),
(7263,548,126,'合金'),
(7264,548,125,'指针式'),
(7265,548,124,'深蓝色 白色 紫色 红色 黑色'),
(7266,548,123,'时尚潮流'),
(7267,549,142,'蓝晶石系列-PD'),
(7268,549,141,'女'),
(7269,549,140,'大表盘'),
(7270,549,139,'30米生活防水'),
(7271,549,138,'圆形'),
(7272,549,137,'宾派'),
(7273,549,136,'全国联保'),
(7274,549,135,'真皮'),
(7275,549,134,'2016年'),
(7276,549,133,'36mm'),
(7277,549,132,'全新'),
(7278,549,131,'国内'),
(7279,549,130,'8mm'),
(7280,549,129,'日本'),
(7281,549,128,'镀膜玻璃'),
(7282,549,127,'石英表'),
(7283,549,126,'合金'),
(7284,549,125,'指针式'),
(7285,549,124,'深蓝色 白色 紫色 红色 黑色'),
(7286,549,123,'时尚潮流'),
(7287,550,142,'蓝晶石系列-PD'),
(7288,550,141,'女'),
(7289,550,140,'大表盘'),
(7290,550,139,'30米生活防水'),
(7291,550,138,'圆形'),
(7292,550,137,'宾派'),
(7293,550,136,'全国联保'),
(7294,550,135,'真皮'),
(7295,550,134,'2016年'),
(7296,550,133,'36mm'),
(7297,550,132,'全新'),
(7298,550,131,'国内'),
(7299,550,130,'8mm'),
(7300,550,129,'日本'),
(7301,550,128,'镀膜玻璃'),
(7302,550,127,'石英表'),
(7303,550,126,'合金'),
(7304,550,125,'指针式'),
(7305,550,124,'深蓝色 白色 紫色 红色 黑色'),
(7306,550,123,'时尚潮流'),
(7307,551,142,'蓝晶石系列-PD'),
(7308,551,141,'女'),
(7309,551,140,'大表盘'),
(7310,551,139,'30米生活防水'),
(7311,551,138,'圆形'),
(7312,551,137,'宾派'),
(7313,551,136,'全国联保'),
(7314,551,135,'真皮'),
(7315,551,134,'2016年'),
(7316,551,133,'36mm'),
(7317,551,132,'全新'),
(7318,551,131,'国内'),
(7319,551,130,'8mm'),
(7320,551,129,'日本'),
(7321,551,128,'镀膜玻璃'),
(7322,551,127,'石英表'),
(7323,551,126,'合金'),
(7324,551,125,'指针式'),
(7325,551,124,'深蓝色 白色 紫色 红色 黑色'),
(7326,551,123,'时尚潮流'),
(7327,552,142,'蓝晶石系列-PD'),
(7328,552,141,'女'),
(7329,552,140,'大表盘'),
(7330,552,139,'30米生活防水'),
(7331,552,138,'圆形'),
(7332,552,137,'宾派'),
(7333,552,136,'全国联保'),
(7334,552,135,'真皮'),
(7335,552,134,'2016年'),
(7336,552,133,'36mm'),
(7337,552,132,'全新'),
(7338,552,131,'国内'),
(7339,552,130,'8mm'),
(7340,552,129,'日本'),
(7341,552,128,'镀膜玻璃'),
(7342,552,127,'石英表'),
(7343,552,126,'合金'),
(7344,552,125,'指针式'),
(7345,552,124,'深蓝色 白色 紫色 红色 黑色'),
(7346,552,123,'时尚潮流'),
(7347,553,142,'蓝晶石系列-PD'),
(7348,553,141,'女'),
(7349,553,140,'大表盘'),
(7350,553,139,'30米生活防水'),
(7351,553,138,'圆形'),
(7352,553,137,'宾派'),
(7353,553,136,'全国联保'),
(7354,553,135,'真皮'),
(7355,553,134,'2016年'),
(7356,553,133,'36mm'),
(7357,553,132,'全新'),
(7358,553,131,'国内'),
(7359,553,130,'8mm'),
(7360,553,129,'日本'),
(7361,553,128,'镀膜玻璃'),
(7362,553,127,'石英表'),
(7363,553,126,'合金'),
(7364,553,125,'指针式'),
(7365,553,124,'深蓝色 白色 紫色 红色 黑色'),
(7366,553,123,'时尚潮流'),
(7367,554,142,'蓝晶石系列-PD'),
(7368,554,141,'女'),
(7369,554,140,'大表盘'),
(7370,554,139,'30米生活防水'),
(7371,554,138,'圆形'),
(7372,554,137,'宾派'),
(7373,554,136,'全国联保'),
(7374,554,135,'真皮'),
(7375,554,134,'2016年'),
(7376,554,133,'36mm'),
(7377,554,132,'全新'),
(7378,554,131,'国内'),
(7379,554,130,'8mm'),
(7380,554,129,'日本'),
(7381,554,128,'镀膜玻璃'),
(7382,554,127,'石英表'),
(7383,554,126,'合金'),
(7384,554,125,'指针式'),
(7385,554,124,'深蓝色 白色 紫色 红色 黑色'),
(7386,554,123,'时尚潮流'),
(7387,555,142,'蓝晶石系列-PD'),
(7388,555,141,'女'),
(7389,555,140,'大表盘'),
(7390,555,139,'30米生活防水'),
(7391,555,138,'圆形'),
(7392,555,137,'宾派'),
(7393,555,136,'全国联保'),
(7394,555,135,'真皮'),
(7395,555,134,'2016年'),
(7396,555,133,'36mm'),
(7397,555,132,'全新'),
(7398,555,131,'国内'),
(7399,555,130,'8mm'),
(7400,555,129,'日本'),
(7401,555,128,'镀膜玻璃'),
(7402,555,127,'石英表'),
(7403,555,126,'合金'),
(7404,555,125,'指针式'),
(7405,555,124,'深蓝色 白色 紫色 红色 黑色'),
(7406,555,123,'时尚潮流'),
(7407,556,142,'蓝晶石系列-PD'),
(7408,556,141,'女'),
(7409,556,140,'大表盘'),
(7410,556,139,'30米生活防水'),
(7411,556,138,'圆形'),
(7412,556,137,'宾派'),
(7413,556,136,'全国联保'),
(7414,556,135,'真皮'),
(7415,556,134,'2016年'),
(7416,556,133,'36mm'),
(7417,556,132,'全新'),
(7418,556,131,'国内'),
(7419,556,130,'8mm'),
(7420,556,129,'日本'),
(7421,556,128,'镀膜玻璃'),
(7422,556,127,'石英表'),
(7423,556,126,'合金'),
(7424,556,125,'指针式'),
(7425,556,124,'深蓝色 白色 紫色 红色 黑色'),
(7426,556,123,'时尚潮流'),
(7427,557,142,'蓝晶石系列-PD'),
(7428,557,141,'女'),
(7429,557,140,'大表盘'),
(7430,557,139,'30米生活防水'),
(7431,557,138,'圆形'),
(7432,557,137,'宾派'),
(7433,557,136,'全国联保'),
(7434,557,135,'真皮'),
(7435,557,134,'2016年'),
(7436,557,133,'36mm'),
(7437,557,132,'全新'),
(7438,557,131,'国内'),
(7439,557,130,'8mm'),
(7440,557,129,'日本'),
(7441,557,128,'镀膜玻璃'),
(7442,557,127,'石英表'),
(7443,557,126,'合金'),
(7444,557,125,'指针式'),
(7445,557,124,'深蓝色 白色 紫色 红色 黑色'),
(7446,557,123,'时尚潮流'),
(7447,558,142,'蓝晶石系列-PD'),
(7448,558,141,'女'),
(7449,558,140,'大表盘'),
(7450,558,139,'30米生活防水'),
(7451,558,138,'圆形'),
(7452,558,137,'宾派'),
(7453,558,136,'全国联保'),
(7454,558,135,'真皮'),
(7455,558,134,'2016年'),
(7456,558,133,'36mm'),
(7457,558,132,'全新'),
(7458,558,131,'国内'),
(7459,558,130,'8mm'),
(7460,558,129,'日本'),
(7461,558,128,'镀膜玻璃'),
(7462,558,127,'石英表'),
(7463,558,126,'合金'),
(7464,558,125,'指针式'),
(7465,558,124,'深蓝色 白色 紫色 红色 黑色'),
(7466,558,123,'时尚潮流'),
(7467,559,142,'蓝晶石系列-PD'),
(7468,559,141,'女'),
(7469,559,140,'大表盘'),
(7470,559,139,'30米生活防水'),
(7471,559,138,'圆形'),
(7472,559,137,'宾派'),
(7473,559,136,'全国联保'),
(7474,559,135,'真皮'),
(7475,559,134,'2016年'),
(7476,559,133,'36mm'),
(7477,559,132,'全新'),
(7478,559,131,'国内'),
(7479,559,130,'8mm'),
(7480,559,129,'日本'),
(7481,559,128,'镀膜玻璃'),
(7482,559,127,'石英表'),
(7483,559,126,'合金'),
(7484,559,125,'指针式'),
(7485,559,124,'深蓝色 白色 紫色 红色 黑色'),
(7486,559,123,'时尚潮流'),
(7487,560,142,'蓝晶石系列-PD'),
(7488,560,141,'女'),
(7489,560,140,'大表盘'),
(7490,560,139,'30米生活防水'),
(7491,560,138,'圆形'),
(7492,560,137,'宾派'),
(7493,560,136,'全国联保'),
(7494,560,135,'真皮'),
(7495,560,134,'2016年'),
(7496,560,133,'36mm'),
(7497,560,132,'全新'),
(7498,560,131,'国内'),
(7499,560,130,'8mm'),
(7500,560,129,'日本'),
(7501,560,128,'镀膜玻璃'),
(7502,560,127,'石英表'),
(7503,560,126,'合金'),
(7504,560,125,'指针式'),
(7505,560,124,'深蓝色 白色 紫色 红色 黑色'),
(7506,560,123,'时尚潮流'),
(7507,561,142,'蓝晶石系列-PD'),
(7508,561,141,'女'),
(7509,561,140,'大表盘'),
(7510,561,139,'30米生活防水'),
(7511,561,138,'圆形'),
(7512,561,137,'宾派'),
(7513,561,136,'全国联保'),
(7514,561,135,'真皮'),
(7515,561,134,'2016年'),
(7516,561,133,'36mm'),
(7517,561,132,'全新'),
(7518,561,131,'国内'),
(7519,561,130,'8mm'),
(7520,561,129,'日本'),
(7521,561,128,'镀膜玻璃'),
(7522,561,127,'石英表'),
(7523,561,126,'合金'),
(7524,561,125,'指针式'),
(7525,561,124,'深蓝色 白色 紫色 红色 黑色'),
(7526,561,123,'时尚潮流'),
(7527,562,142,'蓝晶石系列-PD'),
(7528,562,141,'女'),
(7529,562,140,'大表盘'),
(7530,562,139,'30米生活防水'),
(7531,562,138,'圆形'),
(7532,562,137,'宾派'),
(7533,562,136,'全国联保'),
(7534,562,135,'真皮'),
(7535,562,134,'2016年'),
(7536,562,133,'36mm'),
(7537,562,132,'全新'),
(7538,562,131,'国内'),
(7539,562,130,'8mm'),
(7540,562,129,'日本'),
(7541,562,128,'镀膜玻璃'),
(7542,562,127,'石英表'),
(7543,562,126,'合金'),
(7544,562,125,'指针式'),
(7545,562,124,'深蓝色 白色 紫色 红色 黑色'),
(7546,562,123,'时尚潮流'),
(7547,563,142,'蓝晶石系列-PD'),
(7548,563,141,'女'),
(7549,563,140,'大表盘'),
(7550,563,139,'30米生活防水'),
(7551,563,138,'圆形'),
(7552,563,137,'宾派'),
(7553,563,136,'全国联保'),
(7554,563,135,'真皮'),
(7555,563,134,'2016年'),
(7556,563,133,'36mm'),
(7557,563,132,'全新'),
(7558,563,131,'国内'),
(7559,563,130,'8mm'),
(7560,563,129,'日本'),
(7561,563,128,'镀膜玻璃'),
(7562,563,127,'石英表'),
(7563,563,126,'合金'),
(7564,563,125,'指针式'),
(7565,563,124,'深蓝色 白色 紫色 红色 黑色'),
(7566,563,123,'时尚潮流'),
(7567,564,142,'蓝晶石系列-PD'),
(7568,564,141,'女'),
(7569,564,140,'大表盘'),
(7570,564,139,'30米生活防水'),
(7571,564,138,'圆形'),
(7572,564,137,'宾派'),
(7573,564,136,'全国联保'),
(7574,564,135,'真皮'),
(7575,564,134,'2016年'),
(7576,564,133,'36mm'),
(7577,564,132,'全新'),
(7578,564,131,'国内'),
(7579,564,130,'8mm'),
(7580,564,129,'日本'),
(7581,564,128,'镀膜玻璃'),
(7582,564,127,'石英表'),
(7583,564,126,'合金'),
(7584,564,125,'指针式'),
(7585,564,124,'深蓝色 白色 紫色 红色 黑色'),
(7586,564,123,'时尚潮流'),
(7587,565,142,'蓝晶石系列-PD'),
(7588,565,141,'女'),
(7589,565,140,'大表盘'),
(7590,565,139,'30米生活防水'),
(7591,565,138,'圆形'),
(7592,565,137,'宾派'),
(7593,565,136,'全国联保'),
(7594,565,135,'真皮'),
(7595,565,134,'2016年'),
(7596,565,133,'36mm'),
(7597,565,132,'全新'),
(7598,565,131,'国内'),
(7599,565,130,'8mm'),
(7600,565,129,'日本'),
(7601,565,128,'镀膜玻璃'),
(7602,565,127,'石英表'),
(7603,565,126,'合金'),
(7604,565,125,'指针式'),
(7605,565,124,'深蓝色 白色 紫色 红色 黑色'),
(7606,565,123,'时尚潮流'),
(7607,566,142,'蓝晶石系列-PD'),
(7608,566,141,'女'),
(7609,566,140,'大表盘'),
(7610,566,139,'30米生活防水'),
(7611,566,138,'圆形'),
(7612,566,137,'宾派'),
(7613,566,136,'全国联保'),
(7614,566,135,'真皮'),
(7615,566,134,'2016年'),
(7616,566,133,'36mm'),
(7617,566,132,'全新'),
(7618,566,131,'国内'),
(7619,566,130,'8mm'),
(7620,566,129,'日本'),
(7621,566,128,'镀膜玻璃'),
(7622,566,127,'石英表'),
(7623,566,126,'合金'),
(7624,566,125,'指针式'),
(7625,566,124,'深蓝色 白色 紫色 红色 黑色'),
(7626,566,123,'时尚潮流'),
(7627,567,142,'蓝晶石系列-PD'),
(7628,567,141,'女'),
(7629,567,140,'大表盘'),
(7630,567,139,'30米生活防水'),
(7631,567,138,'圆形'),
(7632,567,137,'宾派'),
(7633,567,136,'全国联保'),
(7634,567,135,'真皮'),
(7635,567,134,'2016年'),
(7636,567,133,'36mm'),
(7637,567,132,'全新'),
(7638,567,131,'国内'),
(7639,567,130,'8mm'),
(7640,567,129,'日本'),
(7641,567,128,'镀膜玻璃'),
(7642,567,127,'石英表'),
(7643,567,126,'合金'),
(7644,567,125,'指针式'),
(7645,567,124,'深蓝色 白色 紫色 红色 黑色'),
(7646,567,123,'时尚潮流'),
(7647,568,142,'蓝晶石系列-PD'),
(7648,568,141,'女'),
(7649,568,140,'大表盘'),
(7650,568,139,'30米生活防水'),
(7651,568,138,'圆形'),
(7652,568,137,'宾派'),
(7653,568,136,'全国联保'),
(7654,568,135,'真皮'),
(7655,568,134,'2016年'),
(7656,568,133,'36mm'),
(7657,568,132,'全新'),
(7658,568,131,'国内'),
(7659,568,130,'8mm'),
(7660,568,129,'日本'),
(7661,568,128,'镀膜玻璃'),
(7662,568,127,'石英表'),
(7663,568,126,'合金'),
(7664,568,125,'指针式'),
(7665,568,124,'深蓝色 白色 紫色 红色 黑色'),
(7666,568,123,'时尚潮流'),
(7667,569,142,'蓝晶石系列-PD'),
(7668,569,141,'女'),
(7669,569,140,'大表盘'),
(7670,569,139,'30米生活防水'),
(7671,569,138,'圆形'),
(7672,569,137,'宾派'),
(7673,569,136,'全国联保'),
(7674,569,135,'真皮'),
(7675,569,134,'2016年'),
(7676,569,133,'36mm'),
(7677,569,132,'全新'),
(7678,569,131,'国内'),
(7679,569,130,'8mm'),
(7680,569,129,'日本'),
(7681,569,128,'镀膜玻璃'),
(7682,569,127,'石英表'),
(7683,569,126,'合金'),
(7684,569,125,'指针式'),
(7685,569,124,'深蓝色 白色 紫色 红色 黑色'),
(7686,569,123,'时尚潮流'),
(7687,570,164,'K-MZBK002'),
(7688,570,163,'男'),
(7689,570,162,'复古'),
(7690,570,161,'普通'),
(7691,570,160,'透底'),
(7692,570,159,'30米生活防水'),
(7693,570,158,'圆形'),
(7694,570,157,'卡诗顿'),
(7695,570,156,'店铺保修'),
(7696,570,155,'真皮'),
(7697,570,154,'2014年春夏季'),
(7698,570,153,'全新'),
(7699,570,152,'40mm'),
(7700,570,151,'国内'),
(7701,570,150,'11mm'),
(7702,570,149,'针扣'),
(7703,570,148,'镀膜玻璃'),
(7704,570,147,'自动机械表'),
(7705,570,146,'精钢'),
(7706,570,145,'指针式'),
(7707,570,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(7708,570,143,'时尚潮流'),
(7709,571,164,'K-MZBK002'),
(7710,571,163,'男'),
(7711,571,162,'复古'),
(7712,571,161,'普通'),
(7713,571,160,'透底'),
(7714,571,159,'30米生活防水'),
(7715,571,158,'圆形'),
(7716,571,157,'卡诗顿'),
(7717,571,156,'店铺保修'),
(7718,571,155,'真皮'),
(7719,571,154,'2014年春夏季'),
(7720,571,153,'全新'),
(7721,571,152,'40mm'),
(7722,571,151,'国内'),
(7723,571,150,'11mm'),
(7724,571,149,'针扣'),
(7725,571,148,'镀膜玻璃'),
(7726,571,147,'自动机械表'),
(7727,571,146,'精钢'),
(7728,571,145,'指针式'),
(7729,571,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(7730,571,143,'时尚潮流'),
(7731,572,164,'K-MZBK002'),
(7732,572,163,'男'),
(7733,572,162,'复古'),
(7734,572,161,'普通'),
(7735,572,160,'透底'),
(7736,572,159,'30米生活防水'),
(7737,572,158,'圆形'),
(7738,572,157,'卡诗顿'),
(7739,572,156,'店铺保修'),
(7740,572,155,'真皮'),
(7741,572,154,'2014年春夏季'),
(7742,572,153,'全新'),
(7743,572,152,'40mm'),
(7744,572,151,'国内'),
(7745,572,150,'11mm'),
(7746,572,149,'针扣'),
(7747,572,148,'镀膜玻璃'),
(7748,572,147,'自动机械表'),
(7749,572,146,'精钢'),
(7750,572,145,'指针式'),
(7751,572,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(7752,572,143,'时尚潮流'),
(7753,573,164,'K-MZBK002'),
(7754,573,163,'男'),
(7755,573,162,'复古'),
(7756,573,161,'普通'),
(7757,573,160,'透底'),
(7758,573,159,'30米生活防水'),
(7759,573,158,'圆形'),
(7760,573,157,'卡诗顿'),
(7761,573,156,'店铺保修'),
(7762,573,155,'真皮'),
(7763,573,154,'2014年春夏季'),
(7764,573,153,'全新'),
(7765,573,152,'40mm'),
(7766,573,151,'国内'),
(7767,573,150,'11mm'),
(7768,573,149,'针扣'),
(7769,573,148,'镀膜玻璃'),
(7770,573,147,'自动机械表'),
(7771,573,146,'精钢'),
(7772,573,145,'指针式'),
(7773,573,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(7774,573,143,'时尚潮流'),
(7775,574,164,'K-MZBK002'),
(7776,574,163,'男'),
(7777,574,162,'复古'),
(7778,574,161,'普通'),
(7779,574,160,'透底'),
(7780,574,159,'30米生活防水'),
(7781,574,158,'圆形'),
(7782,574,157,'卡诗顿'),
(7783,574,156,'店铺保修'),
(7784,574,155,'真皮'),
(7785,574,154,'2014年春夏季'),
(7786,574,153,'全新'),
(7787,574,152,'40mm'),
(7788,574,151,'国内'),
(7789,574,150,'11mm'),
(7790,574,149,'针扣'),
(7791,574,148,'镀膜玻璃'),
(7792,574,147,'自动机械表'),
(7793,574,146,'精钢'),
(7794,574,145,'指针式'),
(7795,574,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(7796,574,143,'时尚潮流'),
(7797,575,164,'K-MZBK002'),
(7798,575,163,'男'),
(7799,575,162,'复古'),
(7800,575,161,'普通'),
(7801,575,160,'透底'),
(7802,575,159,'30米生活防水'),
(7803,575,158,'圆形'),
(7804,575,157,'卡诗顿'),
(7805,575,156,'店铺保修'),
(7806,575,155,'真皮'),
(7807,575,154,'2014年春夏季'),
(7808,575,153,'全新'),
(7809,575,152,'40mm'),
(7810,575,151,'国内'),
(7811,575,150,'11mm'),
(7812,575,149,'针扣'),
(7813,575,148,'镀膜玻璃'),
(7814,575,147,'自动机械表'),
(7815,575,146,'精钢'),
(7816,575,145,'指针式'),
(7817,575,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(7818,575,143,'时尚潮流'),
(7819,576,164,'K-MZBK002'),
(7820,576,163,'男'),
(7821,576,162,'复古'),
(7822,576,161,'普通'),
(7823,576,160,'透底'),
(7824,576,159,'30米生活防水'),
(7825,576,158,'圆形'),
(7826,576,157,'卡诗顿'),
(7827,576,156,'店铺保修'),
(7828,576,155,'真皮'),
(7829,576,154,'2014年春夏季'),
(7830,576,153,'全新'),
(7831,576,152,'40mm'),
(7832,576,151,'国内'),
(7833,576,150,'11mm'),
(7834,576,149,'针扣'),
(7835,576,148,'镀膜玻璃'),
(7836,576,147,'自动机械表'),
(7837,576,146,'精钢'),
(7838,576,145,'指针式'),
(7839,576,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(7840,576,143,'时尚潮流'),
(7841,577,164,'K-MZBK002'),
(7842,577,163,'男'),
(7843,577,162,'复古'),
(7844,577,161,'普通'),
(7845,577,160,'透底'),
(7846,577,159,'30米生活防水'),
(7847,577,158,'圆形'),
(7848,577,157,'卡诗顿'),
(7849,577,156,'店铺保修'),
(7850,577,155,'真皮'),
(7851,577,154,'2014年春夏季'),
(7852,577,153,'全新'),
(7853,577,152,'40mm'),
(7854,577,151,'国内'),
(7855,577,150,'11mm'),
(7856,577,149,'针扣'),
(7857,577,148,'镀膜玻璃'),
(7858,577,147,'自动机械表'),
(7859,577,146,'精钢'),
(7860,577,145,'指针式'),
(7861,577,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(7862,577,143,'时尚潮流'),
(7863,578,164,'K-MZBK002'),
(7864,578,163,'男'),
(7865,578,162,'复古'),
(7866,578,161,'普通'),
(7867,578,160,'透底'),
(7868,578,159,'30米生活防水'),
(7869,578,158,'圆形'),
(7870,578,157,'卡诗顿'),
(7871,578,156,'店铺保修'),
(7872,578,155,'真皮'),
(7873,578,154,'2014年春夏季'),
(7874,578,153,'全新'),
(7875,578,152,'40mm'),
(7876,578,151,'国内'),
(7877,578,150,'11mm'),
(7878,578,149,'针扣'),
(7879,578,148,'镀膜玻璃'),
(7880,578,147,'自动机械表'),
(7881,578,146,'精钢'),
(7882,578,145,'指针式'),
(7883,578,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(7884,578,143,'时尚潮流'),
(7885,579,164,'K-MZBK002'),
(7886,579,163,'男'),
(7887,579,162,'复古'),
(7888,579,161,'普通'),
(7889,579,160,'透底'),
(7890,579,159,'30米生活防水'),
(7891,579,158,'圆形'),
(7892,579,157,'卡诗顿'),
(7893,579,156,'店铺保修'),
(7894,579,155,'真皮'),
(7895,579,154,'2014年春夏季'),
(7896,579,153,'全新'),
(7897,579,152,'40mm'),
(7898,579,151,'国内'),
(7899,579,150,'11mm'),
(7900,579,149,'针扣'),
(7901,579,148,'镀膜玻璃'),
(7902,579,147,'自动机械表'),
(7903,579,146,'精钢'),
(7904,579,145,'指针式'),
(7905,579,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(7906,579,143,'时尚潮流'),
(7907,580,164,'K-MZBK002'),
(7908,580,163,'男'),
(7909,580,162,'复古'),
(7910,580,161,'普通'),
(7911,580,160,'透底'),
(7912,580,159,'30米生活防水'),
(7913,580,158,'圆形'),
(7914,580,157,'卡诗顿'),
(7915,580,156,'店铺保修'),
(7916,580,155,'真皮'),
(7917,580,154,'2014年春夏季'),
(7918,580,153,'全新'),
(7919,580,152,'40mm'),
(7920,580,151,'国内'),
(7921,580,150,'11mm'),
(7922,580,149,'针扣'),
(7923,580,148,'镀膜玻璃'),
(7924,580,147,'自动机械表'),
(7925,580,146,'精钢'),
(7926,580,145,'指针式'),
(7927,580,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(7928,580,143,'时尚潮流'),
(7929,581,164,'K-MZBK002'),
(7930,581,163,'男'),
(7931,581,162,'复古'),
(7932,581,161,'普通'),
(7933,581,160,'透底'),
(7934,581,159,'30米生活防水'),
(7935,581,158,'圆形'),
(7936,581,157,'卡诗顿'),
(7937,581,156,'店铺保修'),
(7938,581,155,'真皮'),
(7939,581,154,'2014年春夏季'),
(7940,581,153,'全新'),
(7941,581,152,'40mm'),
(7942,581,151,'国内'),
(7943,581,150,'11mm'),
(7944,581,149,'针扣'),
(7945,581,148,'镀膜玻璃'),
(7946,581,147,'自动机械表'),
(7947,581,146,'精钢'),
(7948,581,145,'指针式'),
(7949,581,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(7950,581,143,'时尚潮流'),
(7951,582,164,'K-MZBK002'),
(7952,582,163,'男'),
(7953,582,162,'复古'),
(7954,582,161,'普通'),
(7955,582,160,'透底'),
(7956,582,159,'30米生活防水'),
(7957,582,158,'圆形'),
(7958,582,157,'卡诗顿'),
(7959,582,156,'店铺保修'),
(7960,582,155,'真皮'),
(7961,582,154,'2014年春夏季'),
(7962,582,153,'全新'),
(7963,582,152,'40mm'),
(7964,582,151,'国内'),
(7965,582,150,'11mm'),
(7966,582,149,'针扣'),
(7967,582,148,'镀膜玻璃'),
(7968,582,147,'自动机械表'),
(7969,582,146,'精钢'),
(7970,582,145,'指针式'),
(7971,582,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(7972,582,143,'时尚潮流'),
(7973,583,164,'K-MZBK002'),
(7974,583,163,'男'),
(7975,583,162,'复古'),
(7976,583,161,'普通'),
(7977,583,160,'透底'),
(7978,583,159,'30米生活防水'),
(7979,583,158,'圆形'),
(7980,583,157,'卡诗顿'),
(7981,583,156,'店铺保修'),
(7982,583,155,'真皮'),
(7983,583,154,'2014年春夏季'),
(7984,583,153,'全新'),
(7985,583,152,'40mm'),
(7986,583,151,'国内'),
(7987,583,150,'11mm'),
(7988,583,149,'针扣'),
(7989,583,148,'镀膜玻璃'),
(7990,583,147,'自动机械表'),
(7991,583,146,'精钢'),
(7992,583,145,'指针式'),
(7993,583,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(7994,583,143,'时尚潮流'),
(7995,584,164,'K-MZBK002'),
(7996,584,163,'男'),
(7997,584,162,'复古'),
(7998,584,161,'普通'),
(7999,584,160,'透底'),
(8000,584,159,'30米生活防水'),
(8001,584,158,'圆形'),
(8002,584,157,'卡诗顿'),
(8003,584,156,'店铺保修'),
(8004,584,155,'真皮'),
(8005,584,154,'2014年春夏季'),
(8006,584,153,'全新'),
(8007,584,152,'40mm'),
(8008,584,151,'国内'),
(8009,584,150,'11mm'),
(8010,584,149,'针扣'),
(8011,584,148,'镀膜玻璃'),
(8012,584,147,'自动机械表'),
(8013,584,146,'精钢'),
(8014,584,145,'指针式'),
(8015,584,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8016,584,143,'时尚潮流'),
(8017,585,164,'K-MZBK002'),
(8018,585,163,'男'),
(8019,585,162,'复古'),
(8020,585,161,'普通'),
(8021,585,160,'透底'),
(8022,585,159,'30米生活防水'),
(8023,585,158,'圆形'),
(8024,585,157,'卡诗顿'),
(8025,585,156,'店铺保修'),
(8026,585,155,'真皮'),
(8027,585,154,'2014年春夏季'),
(8028,585,153,'全新'),
(8029,585,152,'40mm'),
(8030,585,151,'国内'),
(8031,585,150,'11mm'),
(8032,585,149,'针扣'),
(8033,585,148,'镀膜玻璃'),
(8034,585,147,'自动机械表'),
(8035,585,146,'精钢'),
(8036,585,145,'指针式'),
(8037,585,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8038,585,143,'时尚潮流'),
(8039,586,164,'K-MZBK002'),
(8040,586,163,'男'),
(8041,586,162,'复古'),
(8042,586,161,'普通'),
(8043,586,160,'透底'),
(8044,586,159,'30米生活防水'),
(8045,586,158,'圆形'),
(8046,586,157,'卡诗顿'),
(8047,586,156,'店铺保修'),
(8048,586,155,'真皮'),
(8049,586,154,'2014年春夏季'),
(8050,586,153,'全新'),
(8051,586,152,'40mm'),
(8052,586,151,'国内'),
(8053,586,150,'11mm'),
(8054,586,149,'针扣'),
(8055,586,148,'镀膜玻璃'),
(8056,586,147,'自动机械表'),
(8057,586,146,'精钢'),
(8058,586,145,'指针式'),
(8059,586,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8060,586,143,'时尚潮流'),
(8061,587,164,'K-MZBK002'),
(8062,587,163,'男'),
(8063,587,162,'复古'),
(8064,587,161,'普通'),
(8065,587,160,'透底'),
(8066,587,159,'30米生活防水'),
(8067,587,158,'圆形'),
(8068,587,157,'卡诗顿'),
(8069,587,156,'店铺保修'),
(8070,587,155,'真皮'),
(8071,587,154,'2014年春夏季'),
(8072,587,153,'全新'),
(8073,587,152,'40mm'),
(8074,587,151,'国内'),
(8075,587,150,'11mm'),
(8076,587,149,'针扣'),
(8077,587,148,'镀膜玻璃'),
(8078,587,147,'自动机械表'),
(8079,587,146,'精钢'),
(8080,587,145,'指针式'),
(8081,587,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8082,587,143,'时尚潮流'),
(8083,588,164,'K-MZBK002'),
(8084,588,163,'男'),
(8085,588,162,'复古'),
(8086,588,161,'普通'),
(8087,588,160,'透底'),
(8088,588,159,'30米生活防水'),
(8089,588,158,'圆形'),
(8090,588,157,'卡诗顿'),
(8091,588,156,'店铺保修'),
(8092,588,155,'真皮'),
(8093,588,154,'2014年春夏季'),
(8094,588,153,'全新'),
(8095,588,152,'40mm'),
(8096,588,151,'国内'),
(8097,588,150,'11mm'),
(8098,588,149,'针扣'),
(8099,588,148,'镀膜玻璃'),
(8100,588,147,'自动机械表'),
(8101,588,146,'精钢'),
(8102,588,145,'指针式'),
(8103,588,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8104,588,143,'时尚潮流'),
(8105,589,164,'K-MZBK002'),
(8106,589,163,'男'),
(8107,589,162,'复古'),
(8108,589,161,'普通'),
(8109,589,160,'透底'),
(8110,589,159,'30米生活防水'),
(8111,589,158,'圆形'),
(8112,589,157,'卡诗顿'),
(8113,589,156,'店铺保修'),
(8114,589,155,'真皮'),
(8115,589,154,'2014年春夏季'),
(8116,589,153,'全新'),
(8117,589,152,'40mm'),
(8118,589,151,'国内'),
(8119,589,150,'11mm'),
(8120,589,149,'针扣'),
(8121,589,148,'镀膜玻璃'),
(8122,589,147,'自动机械表'),
(8123,589,146,'精钢'),
(8124,589,145,'指针式'),
(8125,589,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8126,589,143,'时尚潮流'),
(8127,590,164,'K-MZBK002'),
(8128,590,163,'男'),
(8129,590,162,'复古'),
(8130,590,161,'普通'),
(8131,590,160,'透底'),
(8132,590,159,'30米生活防水'),
(8133,590,158,'圆形'),
(8134,590,157,'卡诗顿'),
(8135,590,156,'店铺保修'),
(8136,590,155,'真皮'),
(8137,590,154,'2014年春夏季'),
(8138,590,153,'全新'),
(8139,590,152,'40mm'),
(8140,590,151,'国内'),
(8141,590,150,'11mm'),
(8142,590,149,'针扣'),
(8143,590,148,'镀膜玻璃'),
(8144,590,147,'自动机械表'),
(8145,590,146,'精钢'),
(8146,590,145,'指针式'),
(8147,590,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8148,590,143,'时尚潮流'),
(8149,591,164,'K-MZBK002'),
(8150,591,163,'男'),
(8151,591,162,'复古'),
(8152,591,161,'普通'),
(8153,591,160,'透底'),
(8154,591,159,'30米生活防水'),
(8155,591,158,'圆形'),
(8156,591,157,'卡诗顿'),
(8157,591,156,'店铺保修'),
(8158,591,155,'真皮'),
(8159,591,154,'2014年春夏季'),
(8160,591,153,'全新'),
(8161,591,152,'40mm'),
(8162,591,151,'国内'),
(8163,591,150,'11mm'),
(8164,591,149,'针扣'),
(8165,591,148,'镀膜玻璃'),
(8166,591,147,'自动机械表'),
(8167,591,146,'精钢'),
(8168,591,145,'指针式'),
(8169,591,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8170,591,143,'时尚潮流'),
(8171,592,164,'K-MZBK002'),
(8172,592,163,'男'),
(8173,592,162,'复古'),
(8174,592,161,'普通'),
(8175,592,160,'透底'),
(8176,592,159,'30米生活防水'),
(8177,592,158,'圆形'),
(8178,592,157,'卡诗顿'),
(8179,592,156,'店铺保修'),
(8180,592,155,'真皮'),
(8181,592,154,'2014年春夏季'),
(8182,592,153,'全新'),
(8183,592,152,'40mm'),
(8184,592,151,'国内'),
(8185,592,150,'11mm'),
(8186,592,149,'针扣'),
(8187,592,148,'镀膜玻璃'),
(8188,592,147,'自动机械表'),
(8189,592,146,'精钢'),
(8190,592,145,'指针式'),
(8191,592,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8192,592,143,'时尚潮流'),
(8193,593,164,'K-MZBK002'),
(8194,593,163,'男'),
(8195,593,162,'复古'),
(8196,593,161,'普通'),
(8197,593,160,'透底'),
(8198,593,159,'30米生活防水'),
(8199,593,158,'圆形'),
(8200,593,157,'卡诗顿'),
(8201,593,156,'店铺保修'),
(8202,593,155,'真皮'),
(8203,593,154,'2014年春夏季'),
(8204,593,153,'全新'),
(8205,593,152,'40mm'),
(8206,593,151,'国内'),
(8207,593,150,'11mm'),
(8208,593,149,'针扣'),
(8209,593,148,'镀膜玻璃'),
(8210,593,147,'自动机械表'),
(8211,593,146,'精钢'),
(8212,593,145,'指针式'),
(8213,593,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8214,593,143,'时尚潮流'),
(8215,594,164,'K-MZBK002'),
(8216,594,163,'男'),
(8217,594,162,'复古'),
(8218,594,161,'普通'),
(8219,594,160,'透底'),
(8220,594,159,'30米生活防水'),
(8221,594,158,'圆形'),
(8222,594,157,'卡诗顿'),
(8223,594,156,'店铺保修'),
(8224,594,155,'真皮'),
(8225,594,154,'2014年春夏季'),
(8226,594,153,'全新'),
(8227,594,152,'40mm'),
(8228,594,151,'国内'),
(8229,594,150,'11mm'),
(8230,594,149,'针扣'),
(8231,594,148,'镀膜玻璃'),
(8232,594,147,'自动机械表'),
(8233,594,146,'精钢'),
(8234,594,145,'指针式'),
(8235,594,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8236,594,143,'时尚潮流'),
(8237,595,164,'K-MZBK002'),
(8238,595,163,'男'),
(8239,595,162,'复古'),
(8240,595,161,'普通'),
(8241,595,160,'透底'),
(8242,595,159,'30米生活防水'),
(8243,595,158,'圆形'),
(8244,595,157,'卡诗顿'),
(8245,595,156,'店铺保修'),
(8246,595,155,'真皮'),
(8247,595,154,'2014年春夏季'),
(8248,595,153,'全新'),
(8249,595,152,'40mm'),
(8250,595,151,'国内'),
(8251,595,150,'11mm'),
(8252,595,149,'针扣'),
(8253,595,148,'镀膜玻璃'),
(8254,595,147,'自动机械表'),
(8255,595,146,'精钢'),
(8256,595,145,'指针式'),
(8257,595,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8258,595,143,'时尚潮流'),
(8259,596,164,'K-MZBK002'),
(8260,596,163,'男'),
(8261,596,162,'复古'),
(8262,596,161,'普通'),
(8263,596,160,'透底'),
(8264,596,159,'30米生活防水'),
(8265,596,158,'圆形'),
(8266,596,157,'卡诗顿'),
(8267,596,156,'店铺保修'),
(8268,596,155,'真皮'),
(8269,596,154,'2014年春夏季'),
(8270,596,153,'全新'),
(8271,596,152,'40mm'),
(8272,596,151,'国内'),
(8273,596,150,'11mm'),
(8274,596,149,'针扣'),
(8275,596,148,'镀膜玻璃'),
(8276,596,147,'自动机械表'),
(8277,596,146,'精钢'),
(8278,596,145,'指针式'),
(8279,596,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8280,596,143,'时尚潮流'),
(8281,597,164,'K-MZBK002'),
(8282,597,163,'男'),
(8283,597,162,'复古'),
(8284,597,161,'普通'),
(8285,597,160,'透底'),
(8286,597,159,'30米生活防水'),
(8287,597,158,'圆形'),
(8288,597,157,'卡诗顿'),
(8289,597,156,'店铺保修'),
(8290,597,155,'真皮'),
(8291,597,154,'2014年春夏季'),
(8292,597,153,'全新'),
(8293,597,152,'40mm'),
(8294,597,151,'国内'),
(8295,597,150,'11mm'),
(8296,597,149,'针扣'),
(8297,597,148,'镀膜玻璃'),
(8298,597,147,'自动机械表'),
(8299,597,146,'精钢'),
(8300,597,145,'指针式'),
(8301,597,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8302,597,143,'时尚潮流'),
(8303,598,164,'K-MZBK002'),
(8304,598,163,'男'),
(8305,598,162,'复古'),
(8306,598,161,'普通'),
(8307,598,160,'透底'),
(8308,598,159,'30米生活防水'),
(8309,598,158,'圆形'),
(8310,598,157,'卡诗顿'),
(8311,598,156,'店铺保修'),
(8312,598,155,'真皮'),
(8313,598,154,'2014年春夏季'),
(8314,598,153,'全新'),
(8315,598,152,'40mm'),
(8316,598,151,'国内'),
(8317,598,150,'11mm'),
(8318,598,149,'针扣'),
(8319,598,148,'镀膜玻璃'),
(8320,598,147,'自动机械表'),
(8321,598,146,'精钢'),
(8322,598,145,'指针式'),
(8323,598,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8324,598,143,'时尚潮流'),
(8325,599,164,'K-MZBK002'),
(8326,599,163,'男'),
(8327,599,162,'复古'),
(8328,599,161,'普通'),
(8329,599,160,'透底'),
(8330,599,159,'30米生活防水'),
(8331,599,158,'圆形'),
(8332,599,157,'卡诗顿'),
(8333,599,156,'店铺保修'),
(8334,599,155,'真皮'),
(8335,599,154,'2014年春夏季'),
(8336,599,153,'全新'),
(8337,599,152,'40mm'),
(8338,599,151,'国内'),
(8339,599,150,'11mm'),
(8340,599,149,'针扣'),
(8341,599,148,'镀膜玻璃'),
(8342,599,147,'自动机械表'),
(8343,599,146,'精钢'),
(8344,599,145,'指针式'),
(8345,599,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8346,599,143,'时尚潮流'),
(8347,600,164,'K-MZBK002'),
(8348,600,163,'男'),
(8349,600,162,'复古'),
(8350,600,161,'普通'),
(8351,600,160,'透底'),
(8352,600,159,'30米生活防水'),
(8353,600,158,'圆形'),
(8354,600,157,'卡诗顿'),
(8355,600,156,'店铺保修'),
(8356,600,155,'真皮'),
(8357,600,154,'2014年春夏季'),
(8358,600,153,'全新'),
(8359,600,152,'40mm'),
(8360,600,151,'国内'),
(8361,600,150,'11mm'),
(8362,600,149,'针扣'),
(8363,600,148,'镀膜玻璃'),
(8364,600,147,'自动机械表'),
(8365,600,146,'精钢'),
(8366,600,145,'指针式'),
(8367,600,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8368,600,143,'时尚潮流'),
(8369,601,164,'K-MZBK002'),
(8370,601,163,'男'),
(8371,601,162,'复古'),
(8372,601,161,'普通'),
(8373,601,160,'透底'),
(8374,601,159,'30米生活防水'),
(8375,601,158,'圆形'),
(8376,601,157,'卡诗顿'),
(8377,601,156,'店铺保修'),
(8378,601,155,'真皮'),
(8379,601,154,'2014年春夏季'),
(8380,601,153,'全新'),
(8381,601,152,'40mm'),
(8382,601,151,'国内'),
(8383,601,150,'11mm'),
(8384,601,149,'针扣'),
(8385,601,148,'镀膜玻璃'),
(8386,601,147,'自动机械表'),
(8387,601,146,'精钢'),
(8388,601,145,'指针式'),
(8389,601,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8390,601,143,'时尚潮流'),
(8391,602,164,'K-MZBK002'),
(8392,602,163,'男'),
(8393,602,162,'复古'),
(8394,602,161,'普通'),
(8395,602,160,'透底'),
(8396,602,159,'30米生活防水'),
(8397,602,158,'圆形'),
(8398,602,157,'卡诗顿'),
(8399,602,156,'店铺保修'),
(8400,602,155,'真皮'),
(8401,602,154,'2014年春夏季'),
(8402,602,153,'全新'),
(8403,602,152,'40mm'),
(8404,602,151,'国内'),
(8405,602,150,'11mm'),
(8406,602,149,'针扣'),
(8407,602,148,'镀膜玻璃'),
(8408,602,147,'自动机械表'),
(8409,602,146,'精钢'),
(8410,602,145,'指针式'),
(8411,602,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8412,602,143,'时尚潮流'),
(8413,603,164,'K-MZBK002'),
(8414,603,163,'男'),
(8415,603,162,'复古'),
(8416,603,161,'普通'),
(8417,603,160,'透底'),
(8418,603,159,'30米生活防水'),
(8419,603,158,'圆形'),
(8420,603,157,'卡诗顿'),
(8421,603,156,'店铺保修'),
(8422,603,155,'真皮'),
(8423,603,154,'2014年春夏季'),
(8424,603,153,'全新'),
(8425,603,152,'40mm'),
(8426,603,151,'国内'),
(8427,603,150,'11mm'),
(8428,603,149,'针扣'),
(8429,603,148,'镀膜玻璃'),
(8430,603,147,'自动机械表'),
(8431,603,146,'精钢'),
(8432,603,145,'指针式'),
(8433,603,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8434,603,143,'时尚潮流'),
(8435,604,164,'K-MZBK002'),
(8436,604,163,'男'),
(8437,604,162,'复古'),
(8438,604,161,'普通'),
(8439,604,160,'透底'),
(8440,604,159,'30米生活防水'),
(8441,604,158,'圆形'),
(8442,604,157,'卡诗顿'),
(8443,604,156,'店铺保修'),
(8444,604,155,'真皮'),
(8445,604,154,'2014年春夏季'),
(8446,604,153,'全新'),
(8447,604,152,'40mm'),
(8448,604,151,'国内'),
(8449,604,150,'11mm'),
(8450,604,149,'针扣'),
(8451,604,148,'镀膜玻璃'),
(8452,604,147,'自动机械表'),
(8453,604,146,'精钢'),
(8454,604,145,'指针式'),
(8455,604,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8456,604,143,'时尚潮流'),
(8457,605,164,'K-MZBK002'),
(8458,605,163,'男'),
(8459,605,162,'复古'),
(8460,605,161,'普通'),
(8461,605,160,'透底'),
(8462,605,159,'30米生活防水'),
(8463,605,158,'圆形'),
(8464,605,157,'卡诗顿'),
(8465,605,156,'店铺保修'),
(8466,605,155,'真皮'),
(8467,605,154,'2014年春夏季'),
(8468,605,153,'全新'),
(8469,605,152,'40mm'),
(8470,605,151,'国内'),
(8471,605,150,'11mm'),
(8472,605,149,'针扣'),
(8473,605,148,'镀膜玻璃'),
(8474,605,147,'自动机械表'),
(8475,605,146,'精钢'),
(8476,605,145,'指针式'),
(8477,605,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8478,605,143,'时尚潮流'),
(8479,606,164,'K-MZBK002'),
(8480,606,163,'男'),
(8481,606,162,'复古'),
(8482,606,161,'普通'),
(8483,606,160,'透底'),
(8484,606,159,'30米生活防水'),
(8485,606,158,'圆形'),
(8486,606,157,'卡诗顿'),
(8487,606,156,'店铺保修'),
(8488,606,155,'真皮'),
(8489,606,154,'2014年春夏季'),
(8490,606,153,'全新'),
(8491,606,152,'40mm'),
(8492,606,151,'国内'),
(8493,606,150,'11mm'),
(8494,606,149,'针扣'),
(8495,606,148,'镀膜玻璃'),
(8496,606,147,'自动机械表'),
(8497,606,146,'精钢'),
(8498,606,145,'指针式'),
(8499,606,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8500,606,143,'时尚潮流'),
(8501,607,164,'K-MZBK002'),
(8502,607,163,'男'),
(8503,607,162,'复古'),
(8504,607,161,'普通'),
(8505,607,160,'透底'),
(8506,607,159,'30米生活防水'),
(8507,607,158,'圆形'),
(8508,607,157,'卡诗顿'),
(8509,607,156,'店铺保修'),
(8510,607,155,'真皮'),
(8511,607,154,'2014年春夏季'),
(8512,607,153,'全新'),
(8513,607,152,'40mm'),
(8514,607,151,'国内'),
(8515,607,150,'11mm'),
(8516,607,149,'针扣'),
(8517,607,148,'镀膜玻璃'),
(8518,607,147,'自动机械表'),
(8519,607,146,'精钢'),
(8520,607,145,'指针式'),
(8521,607,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8522,607,143,'时尚潮流'),
(8523,608,164,'K-MZBK002'),
(8524,608,163,'男'),
(8525,608,162,'复古'),
(8526,608,161,'普通'),
(8527,608,160,'透底'),
(8528,608,159,'30米生活防水'),
(8529,608,158,'圆形'),
(8530,608,157,'卡诗顿'),
(8531,608,156,'店铺保修'),
(8532,608,155,'真皮'),
(8533,608,154,'2014年春夏季'),
(8534,608,153,'全新'),
(8535,608,152,'40mm'),
(8536,608,151,'国内'),
(8537,608,150,'11mm'),
(8538,608,149,'针扣'),
(8539,608,148,'镀膜玻璃'),
(8540,608,147,'自动机械表'),
(8541,608,146,'精钢'),
(8542,608,145,'指针式'),
(8543,608,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8544,608,143,'时尚潮流'),
(8545,609,164,'K-MZBK002'),
(8546,609,163,'男'),
(8547,609,162,'复古'),
(8548,609,161,'普通'),
(8549,609,160,'透底'),
(8550,609,159,'30米生活防水'),
(8551,609,158,'圆形'),
(8552,609,157,'卡诗顿'),
(8553,609,156,'店铺保修'),
(8554,609,155,'真皮'),
(8555,609,154,'2014年春夏季'),
(8556,609,153,'全新'),
(8557,609,152,'40mm'),
(8558,609,151,'国内'),
(8559,609,150,'11mm'),
(8560,609,149,'针扣'),
(8561,609,148,'镀膜玻璃'),
(8562,609,147,'自动机械表'),
(8563,609,146,'精钢'),
(8564,609,145,'指针式'),
(8565,609,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8566,609,143,'时尚潮流'),
(8567,610,164,'K-MZBK002'),
(8568,610,163,'男'),
(8569,610,162,'复古'),
(8570,610,161,'普通'),
(8571,610,160,'透底'),
(8572,610,159,'30米生活防水'),
(8573,610,158,'圆形'),
(8574,610,157,'卡诗顿'),
(8575,610,156,'店铺保修'),
(8576,610,155,'真皮'),
(8577,610,154,'2014年春夏季'),
(8578,610,153,'全新'),
(8579,610,152,'40mm'),
(8580,610,151,'国内'),
(8581,610,150,'11mm'),
(8582,610,149,'针扣'),
(8583,610,148,'镀膜玻璃'),
(8584,610,147,'自动机械表'),
(8585,610,146,'精钢'),
(8586,610,145,'指针式'),
(8587,610,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8588,610,143,'时尚潮流'),
(8589,611,164,'K-MZBK002'),
(8590,611,163,'男'),
(8591,611,162,'复古'),
(8592,611,161,'普通'),
(8593,611,160,'透底'),
(8594,611,159,'30米生活防水'),
(8595,611,158,'圆形'),
(8596,611,157,'卡诗顿'),
(8597,611,156,'店铺保修'),
(8598,611,155,'真皮'),
(8599,611,154,'2014年春夏季'),
(8600,611,153,'全新'),
(8601,611,152,'40mm'),
(8602,611,151,'国内'),
(8603,611,150,'11mm'),
(8604,611,149,'针扣'),
(8605,611,148,'镀膜玻璃'),
(8606,611,147,'自动机械表'),
(8607,611,146,'精钢'),
(8608,611,145,'指针式'),
(8609,611,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8610,611,143,'时尚潮流'),
(8611,612,164,'K-MZBK002'),
(8612,612,163,'男'),
(8613,612,162,'复古'),
(8614,612,161,'普通'),
(8615,612,160,'透底'),
(8616,612,159,'30米生活防水'),
(8617,612,158,'圆形'),
(8618,612,157,'卡诗顿'),
(8619,612,156,'店铺保修'),
(8620,612,155,'真皮'),
(8621,612,154,'2014年春夏季'),
(8622,612,153,'全新'),
(8623,612,152,'40mm'),
(8624,612,151,'国内'),
(8625,612,150,'11mm'),
(8626,612,149,'针扣'),
(8627,612,148,'镀膜玻璃'),
(8628,612,147,'自动机械表'),
(8629,612,146,'精钢'),
(8630,612,145,'指针式'),
(8631,612,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8632,612,143,'时尚潮流'),
(8633,613,164,'K-MZBK002'),
(8634,613,163,'男'),
(8635,613,162,'复古'),
(8636,613,161,'普通'),
(8637,613,160,'透底'),
(8638,613,159,'30米生活防水'),
(8639,613,158,'圆形'),
(8640,613,157,'卡诗顿'),
(8641,613,156,'店铺保修'),
(8642,613,155,'真皮'),
(8643,613,154,'2014年春夏季'),
(8644,613,153,'全新'),
(8645,613,152,'40mm'),
(8646,613,151,'国内'),
(8647,613,150,'11mm'),
(8648,613,149,'针扣'),
(8649,613,148,'镀膜玻璃'),
(8650,613,147,'自动机械表'),
(8651,613,146,'精钢'),
(8652,613,145,'指针式'),
(8653,613,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8654,613,143,'时尚潮流'),
(8655,614,164,'K-MZBK002'),
(8656,614,163,'男'),
(8657,614,162,'复古'),
(8658,614,161,'普通'),
(8659,614,160,'透底'),
(8660,614,159,'30米生活防水'),
(8661,614,158,'圆形'),
(8662,614,157,'卡诗顿'),
(8663,614,156,'店铺保修'),
(8664,614,155,'真皮'),
(8665,614,154,'2014年春夏季'),
(8666,614,153,'全新'),
(8667,614,152,'40mm'),
(8668,614,151,'国内'),
(8669,614,150,'11mm'),
(8670,614,149,'针扣'),
(8671,614,148,'镀膜玻璃'),
(8672,614,147,'自动机械表'),
(8673,614,146,'精钢'),
(8674,614,145,'指针式'),
(8675,614,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8676,614,143,'时尚潮流'),
(8677,615,164,'K-MZBK002'),
(8678,615,163,'男'),
(8679,615,162,'复古'),
(8680,615,161,'普通'),
(8681,615,160,'透底'),
(8682,615,159,'30米生活防水'),
(8683,615,158,'圆形'),
(8684,615,157,'卡诗顿'),
(8685,615,156,'店铺保修'),
(8686,615,155,'真皮'),
(8687,615,154,'2014年春夏季'),
(8688,615,153,'全新'),
(8689,615,152,'40mm'),
(8690,615,151,'国内'),
(8691,615,150,'11mm'),
(8692,615,149,'针扣'),
(8693,615,148,'镀膜玻璃'),
(8694,615,147,'自动机械表'),
(8695,615,146,'精钢'),
(8696,615,145,'指针式'),
(8697,615,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8698,615,143,'时尚潮流'),
(8699,616,164,'K-MZBK002'),
(8700,616,163,'男'),
(8701,616,162,'复古'),
(8702,616,161,'普通'),
(8703,616,160,'透底'),
(8704,616,159,'30米生活防水'),
(8705,616,158,'圆形'),
(8706,616,157,'卡诗顿'),
(8707,616,156,'店铺保修'),
(8708,616,155,'真皮'),
(8709,616,154,'2014年春夏季'),
(8710,616,153,'全新'),
(8711,616,152,'40mm'),
(8712,616,151,'国内'),
(8713,616,150,'11mm'),
(8714,616,149,'针扣'),
(8715,616,148,'镀膜玻璃'),
(8716,616,147,'自动机械表'),
(8717,616,146,'精钢'),
(8718,616,145,'指针式'),
(8719,616,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8720,616,143,'时尚潮流'),
(8721,617,164,'K-MZBK002'),
(8722,617,163,'男'),
(8723,617,162,'复古'),
(8724,617,161,'普通'),
(8725,617,160,'透底'),
(8726,617,159,'30米生活防水'),
(8727,617,158,'圆形'),
(8728,617,157,'卡诗顿'),
(8729,617,156,'店铺保修'),
(8730,617,155,'真皮'),
(8731,617,154,'2014年春夏季'),
(8732,617,153,'全新'),
(8733,617,152,'40mm'),
(8734,617,151,'国内'),
(8735,617,150,'11mm'),
(8736,617,149,'针扣'),
(8737,617,148,'镀膜玻璃'),
(8738,617,147,'自动机械表'),
(8739,617,146,'精钢'),
(8740,617,145,'指针式'),
(8741,617,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8742,617,143,'时尚潮流'),
(8743,618,164,'K-MZBK002'),
(8744,618,163,'男'),
(8745,618,162,'复古'),
(8746,618,161,'普通'),
(8747,618,160,'透底'),
(8748,618,159,'30米生活防水'),
(8749,618,158,'圆形'),
(8750,618,157,'卡诗顿'),
(8751,618,156,'店铺保修'),
(8752,618,155,'真皮'),
(8753,618,154,'2014年春夏季'),
(8754,618,153,'全新'),
(8755,618,152,'40mm'),
(8756,618,151,'国内'),
(8757,618,150,'11mm'),
(8758,618,149,'针扣'),
(8759,618,148,'镀膜玻璃'),
(8760,618,147,'自动机械表'),
(8761,618,146,'精钢'),
(8762,618,145,'指针式'),
(8763,618,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8764,618,143,'时尚潮流'),
(8765,619,164,'K-MZBK002'),
(8766,619,163,'男'),
(8767,619,162,'复古'),
(8768,619,161,'普通'),
(8769,619,160,'透底'),
(8770,619,159,'30米生活防水'),
(8771,619,158,'圆形'),
(8772,619,157,'卡诗顿'),
(8773,619,156,'店铺保修'),
(8774,619,155,'真皮'),
(8775,619,154,'2014年春夏季'),
(8776,619,153,'全新'),
(8777,619,152,'40mm'),
(8778,619,151,'国内'),
(8779,619,150,'11mm'),
(8780,619,149,'针扣'),
(8781,619,148,'镀膜玻璃'),
(8782,619,147,'自动机械表'),
(8783,619,146,'精钢'),
(8784,619,145,'指针式'),
(8785,619,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8786,619,143,'时尚潮流'),
(8787,620,164,'K-MZBK002'),
(8788,620,163,'男'),
(8789,620,162,'复古'),
(8790,620,161,'普通'),
(8791,620,160,'透底'),
(8792,620,159,'30米生活防水'),
(8793,620,158,'圆形'),
(8794,620,157,'卡诗顿'),
(8795,620,156,'店铺保修'),
(8796,620,155,'真皮'),
(8797,620,154,'2014年春夏季'),
(8798,620,153,'全新'),
(8799,620,152,'40mm'),
(8800,620,151,'国内'),
(8801,620,150,'11mm'),
(8802,620,149,'针扣'),
(8803,620,148,'镀膜玻璃'),
(8804,620,147,'自动机械表'),
(8805,620,146,'精钢'),
(8806,620,145,'指针式'),
(8807,620,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8808,620,143,'时尚潮流'),
(8809,621,164,'K-MZBK002'),
(8810,621,163,'男'),
(8811,621,162,'复古'),
(8812,621,161,'普通'),
(8813,621,160,'透底'),
(8814,621,159,'30米生活防水'),
(8815,621,158,'圆形'),
(8816,621,157,'卡诗顿'),
(8817,621,156,'店铺保修'),
(8818,621,155,'真皮'),
(8819,621,154,'2014年春夏季'),
(8820,621,153,'全新'),
(8821,621,152,'40mm'),
(8822,621,151,'国内'),
(8823,621,150,'11mm'),
(8824,621,149,'针扣'),
(8825,621,148,'镀膜玻璃'),
(8826,621,147,'自动机械表'),
(8827,621,146,'精钢'),
(8828,621,145,'指针式'),
(8829,621,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8830,621,143,'时尚潮流'),
(8831,622,164,'K-MZBK002'),
(8832,622,163,'男'),
(8833,622,162,'复古'),
(8834,622,161,'普通'),
(8835,622,160,'透底'),
(8836,622,159,'30米生活防水'),
(8837,622,158,'圆形'),
(8838,622,157,'卡诗顿'),
(8839,622,156,'店铺保修'),
(8840,622,155,'真皮'),
(8841,622,154,'2014年春夏季'),
(8842,622,153,'全新'),
(8843,622,152,'40mm'),
(8844,622,151,'国内'),
(8845,622,150,'11mm'),
(8846,622,149,'针扣'),
(8847,622,148,'镀膜玻璃'),
(8848,622,147,'自动机械表'),
(8849,622,146,'精钢'),
(8850,622,145,'指针式'),
(8851,622,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8852,622,143,'时尚潮流'),
(8853,623,164,'K-MZBK002'),
(8854,623,163,'男'),
(8855,623,162,'复古'),
(8856,623,161,'普通'),
(8857,623,160,'透底'),
(8858,623,159,'30米生活防水'),
(8859,623,158,'圆形'),
(8860,623,157,'卡诗顿'),
(8861,623,156,'店铺保修'),
(8862,623,155,'真皮'),
(8863,623,154,'2014年春夏季'),
(8864,623,153,'全新'),
(8865,623,152,'40mm'),
(8866,623,151,'国内'),
(8867,623,150,'11mm'),
(8868,623,149,'针扣'),
(8869,623,148,'镀膜玻璃'),
(8870,623,147,'自动机械表'),
(8871,623,146,'精钢'),
(8872,623,145,'指针式'),
(8873,623,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8874,623,143,'时尚潮流'),
(8875,624,164,'K-MZBK002'),
(8876,624,163,'男'),
(8877,624,162,'复古'),
(8878,624,161,'普通'),
(8879,624,160,'透底'),
(8880,624,159,'30米生活防水'),
(8881,624,158,'圆形'),
(8882,624,157,'卡诗顿'),
(8883,624,156,'店铺保修'),
(8884,624,155,'真皮'),
(8885,624,154,'2014年春夏季'),
(8886,624,153,'全新'),
(8887,624,152,'40mm'),
(8888,624,151,'国内'),
(8889,624,150,'11mm'),
(8890,624,149,'针扣'),
(8891,624,148,'镀膜玻璃'),
(8892,624,147,'自动机械表'),
(8893,624,146,'精钢'),
(8894,624,145,'指针式'),
(8895,624,144,'黑面咖壳皮带款 黑面白壳皮带款 咖面咖壳皮带款 白面白壳皮带款 白面咖壳皮带款 白面白壳钢带款 黑面白壳钢带款 白面咖壳钢带款 黑面咖壳钢带款 咖面咖壳钢带款'),
(8896,624,143,'时尚潮流'),
(8897,625,187,'头层牛皮'),
(8898,625,186,'N8027-1'),
(8899,625,185,'无'),
(8900,625,184,'否'),
(8901,625,183,'拉链'),
(8902,625,182,'装卸式提把'),
(8903,625,181,'商务'),
(8904,625,180,'手拿'),
(8905,625,179,'牛皮'),
(8906,625,178,'青年'),
(8907,625,177,'内贴袋'),
(8908,625,176,'横款方形'),
(8909,625,175,'BISON DENIM/美洲野牛'),
(8910,625,174,'2015年秋季'),
(8911,625,173,'涤纶'),
(8912,625,172,'全新'),
(8913,625,171,'纯色'),
(8914,625,170,'手拿包'),
(8915,625,169,'软'),
(8916,625,168,'小号黑色 大号黑色 大号啡色'),
(8917,625,167,'拉链暗袋'),
(8918,625,166,'小'),
(8919,625,165,'商务/OL'),
(8920,626,187,'头层牛皮'),
(8921,626,186,'N8027-1'),
(8922,626,185,'无'),
(8923,626,184,'否'),
(8924,626,183,'拉链'),
(8925,626,182,'装卸式提把'),
(8926,626,181,'商务'),
(8927,626,180,'手拿'),
(8928,626,179,'牛皮'),
(8929,626,178,'青年'),
(8930,626,177,'内贴袋'),
(8931,626,176,'横款方形'),
(8932,626,175,'BISON DENIM/美洲野牛'),
(8933,626,174,'2015年秋季'),
(8934,626,173,'涤纶'),
(8935,626,172,'全新'),
(8936,626,171,'纯色'),
(8937,626,170,'手拿包'),
(8938,626,169,'软'),
(8939,626,168,'小号黑色 大号黑色 大号啡色'),
(8940,626,167,'拉链暗袋'),
(8941,626,166,'小'),
(8942,626,165,'商务/OL'),
(8943,627,187,'头层牛皮'),
(8944,627,186,'N8027-1'),
(8945,627,185,'无'),
(8946,627,184,'否'),
(8947,627,183,'拉链'),
(8948,627,182,'装卸式提把'),
(8949,627,181,'商务'),
(8950,627,180,'手拿'),
(8951,627,179,'牛皮'),
(8952,627,178,'青年'),
(8953,627,177,'内贴袋'),
(8954,627,176,'横款方形'),
(8955,627,175,'BISON DENIM/美洲野牛'),
(8956,627,174,'2015年秋季'),
(8957,627,173,'涤纶'),
(8958,627,172,'全新'),
(8959,627,171,'纯色'),
(8960,627,170,'手拿包'),
(8961,627,169,'软'),
(8962,627,168,'小号黑色 大号黑色 大号啡色'),
(8963,627,167,'拉链暗袋'),
(8964,627,166,'小'),
(8965,627,165,'商务/OL'),
(8966,628,187,'头层牛皮'),
(8967,628,186,'N8027-1'),
(8968,628,185,'无'),
(8969,628,184,'否'),
(8970,628,183,'拉链'),
(8971,628,182,'装卸式提把'),
(8972,628,181,'商务'),
(8973,628,180,'手拿'),
(8974,628,179,'牛皮'),
(8975,628,178,'青年'),
(8976,628,177,'内贴袋'),
(8977,628,176,'横款方形'),
(8978,628,175,'BISON DENIM/美洲野牛'),
(8979,628,174,'2015年秋季'),
(8980,628,173,'涤纶'),
(8981,628,172,'全新'),
(8982,628,171,'纯色'),
(8983,628,170,'手拿包'),
(8984,628,169,'软'),
(8985,628,168,'小号黑色 大号黑色 大号啡色'),
(8986,628,167,'拉链暗袋'),
(8987,628,166,'小'),
(8988,628,165,'商务/OL'),
(8989,629,187,'头层牛皮'),
(8990,629,186,'N8027-1'),
(8991,629,185,'无'),
(8992,629,184,'否'),
(8993,629,183,'拉链'),
(8994,629,182,'装卸式提把'),
(8995,629,181,'商务'),
(8996,629,180,'手拿'),
(8997,629,179,'牛皮'),
(8998,629,178,'青年'),
(8999,629,177,'内贴袋'),
(9000,629,176,'横款方形'),
(9001,629,175,'BISON DENIM/美洲野牛'),
(9002,629,174,'2015年秋季'),
(9003,629,173,'涤纶'),
(9004,629,172,'全新'),
(9005,629,171,'纯色'),
(9006,629,170,'手拿包'),
(9007,629,169,'软'),
(9008,629,168,'小号黑色 大号黑色 大号啡色'),
(9009,629,167,'拉链暗袋'),
(9010,629,166,'小'),
(9011,629,165,'商务/OL'),
(9012,630,187,'头层牛皮'),
(9013,630,186,'N8027-1'),
(9014,630,185,'无'),
(9015,630,184,'否'),
(9016,630,183,'拉链'),
(9017,630,182,'装卸式提把'),
(9018,630,181,'商务'),
(9019,630,180,'手拿'),
(9020,630,179,'牛皮'),
(9021,630,178,'青年'),
(9022,630,177,'内贴袋'),
(9023,630,176,'横款方形'),
(9024,630,175,'BISON DENIM/美洲野牛'),
(9025,630,174,'2015年秋季'),
(9026,630,173,'涤纶'),
(9027,630,172,'全新'),
(9028,630,171,'纯色'),
(9029,630,170,'手拿包'),
(9030,630,169,'软'),
(9031,630,168,'小号黑色 大号黑色 大号啡色'),
(9032,630,167,'拉链暗袋'),
(9033,630,166,'小'),
(9034,630,165,'商务/OL'),
(9035,631,187,'头层牛皮'),
(9036,631,186,'N8027-1'),
(9037,631,185,'无'),
(9038,631,184,'否'),
(9039,631,183,'拉链'),
(9040,631,182,'装卸式提把'),
(9041,631,181,'商务'),
(9042,631,180,'手拿'),
(9043,631,179,'牛皮'),
(9044,631,178,'青年'),
(9045,631,177,'内贴袋'),
(9046,631,176,'横款方形'),
(9047,631,175,'BISON DENIM/美洲野牛'),
(9048,631,174,'2015年秋季'),
(9049,631,173,'涤纶'),
(9050,631,172,'全新'),
(9051,631,171,'纯色'),
(9052,631,170,'手拿包'),
(9053,631,169,'软'),
(9054,631,168,'小号黑色 大号黑色 大号啡色'),
(9055,631,167,'拉链暗袋'),
(9056,631,166,'小'),
(9057,631,165,'商务/OL'),
(9058,632,187,'头层牛皮'),
(9059,632,186,'N8027-1'),
(9060,632,185,'无'),
(9061,632,184,'否'),
(9062,632,183,'拉链'),
(9063,632,182,'装卸式提把'),
(9064,632,181,'商务'),
(9065,632,180,'手拿'),
(9066,632,179,'牛皮'),
(9067,632,178,'青年'),
(9068,632,177,'内贴袋'),
(9069,632,176,'横款方形'),
(9070,632,175,'BISON DENIM/美洲野牛'),
(9071,632,174,'2015年秋季'),
(9072,632,173,'涤纶'),
(9073,632,172,'全新'),
(9074,632,171,'纯色'),
(9075,632,170,'手拿包'),
(9076,632,169,'软'),
(9077,632,168,'小号黑色 大号黑色 大号啡色'),
(9078,632,167,'拉链暗袋'),
(9079,632,166,'小'),
(9080,632,165,'商务/OL'),
(9081,633,187,'头层牛皮'),
(9082,633,186,'N8027-1'),
(9083,633,185,'无'),
(9084,633,184,'否'),
(9085,633,183,'拉链'),
(9086,633,182,'装卸式提把'),
(9087,633,181,'商务'),
(9088,633,180,'手拿'),
(9089,633,179,'牛皮'),
(9090,633,178,'青年'),
(9091,633,177,'内贴袋'),
(9092,633,176,'横款方形'),
(9093,633,175,'BISON DENIM/美洲野牛'),
(9094,633,174,'2015年秋季'),
(9095,633,173,'涤纶'),
(9096,633,172,'全新'),
(9097,633,171,'纯色'),
(9098,633,170,'手拿包'),
(9099,633,169,'软'),
(9100,633,168,'小号黑色 大号黑色 大号啡色'),
(9101,633,167,'拉链暗袋'),
(9102,633,166,'小'),
(9103,633,165,'商务/OL'),
(9104,634,187,'头层牛皮'),
(9105,634,186,'N8027-1'),
(9106,634,185,'无'),
(9107,634,184,'否'),
(9108,634,183,'拉链'),
(9109,634,182,'装卸式提把'),
(9110,634,181,'商务'),
(9111,634,180,'手拿'),
(9112,634,179,'牛皮'),
(9113,634,178,'青年'),
(9114,634,177,'内贴袋'),
(9115,634,176,'横款方形'),
(9116,634,175,'BISON DENIM/美洲野牛'),
(9117,634,174,'2015年秋季'),
(9118,634,173,'涤纶'),
(9119,634,172,'全新'),
(9120,634,171,'纯色'),
(9121,634,170,'手拿包'),
(9122,634,169,'软'),
(9123,634,168,'小号黑色 大号黑色 大号啡色'),
(9124,634,167,'拉链暗袋'),
(9125,634,166,'小'),
(9126,634,165,'商务/OL'),
(9127,635,187,'头层牛皮'),
(9128,635,186,'N8027-1'),
(9129,635,185,'无'),
(9130,635,184,'否'),
(9131,635,183,'拉链'),
(9132,635,182,'装卸式提把'),
(9133,635,181,'商务'),
(9134,635,180,'手拿'),
(9135,635,179,'牛皮'),
(9136,635,178,'青年'),
(9137,635,177,'内贴袋'),
(9138,635,176,'横款方形'),
(9139,635,175,'BISON DENIM/美洲野牛'),
(9140,635,174,'2015年秋季'),
(9141,635,173,'涤纶'),
(9142,635,172,'全新'),
(9143,635,171,'纯色'),
(9144,635,170,'手拿包'),
(9145,635,169,'软'),
(9146,635,168,'小号黑色 大号黑色 大号啡色'),
(9147,635,167,'拉链暗袋'),
(9148,635,166,'小'),
(9149,635,165,'商务/OL'),
(9150,636,187,'头层牛皮'),
(9151,636,186,'N8027-1'),
(9152,636,185,'无'),
(9153,636,184,'否'),
(9154,636,183,'拉链'),
(9155,636,182,'装卸式提把'),
(9156,636,181,'商务'),
(9157,636,180,'手拿'),
(9158,636,179,'牛皮'),
(9159,636,178,'青年'),
(9160,636,177,'内贴袋'),
(9161,636,176,'横款方形'),
(9162,636,175,'BISON DENIM/美洲野牛'),
(9163,636,174,'2015年秋季'),
(9164,636,173,'涤纶'),
(9165,636,172,'全新'),
(9166,636,171,'纯色'),
(9167,636,170,'手拿包'),
(9168,636,169,'软'),
(9169,636,168,'小号黑色 大号黑色 大号啡色'),
(9170,636,167,'拉链暗袋'),
(9171,636,166,'小'),
(9172,636,165,'商务/OL'),
(9173,637,187,'头层牛皮'),
(9174,637,186,'N8027-1'),
(9175,637,185,'无'),
(9176,637,184,'否'),
(9177,637,183,'拉链'),
(9178,637,182,'装卸式提把'),
(9179,637,181,'商务'),
(9180,637,180,'手拿'),
(9181,637,179,'牛皮'),
(9182,637,178,'青年'),
(9183,637,177,'内贴袋'),
(9184,637,176,'横款方形'),
(9185,637,175,'BISON DENIM/美洲野牛'),
(9186,637,174,'2015年秋季'),
(9187,637,173,'涤纶'),
(9188,637,172,'全新'),
(9189,637,171,'纯色'),
(9190,637,170,'手拿包'),
(9191,637,169,'软'),
(9192,637,168,'小号黑色 大号黑色 大号啡色'),
(9193,637,167,'拉链暗袋'),
(9194,637,166,'小'),
(9195,637,165,'商务/OL'),
(9196,638,187,'头层牛皮'),
(9197,638,186,'N8027-1'),
(9198,638,185,'无'),
(9199,638,184,'否'),
(9200,638,183,'拉链'),
(9201,638,182,'装卸式提把'),
(9202,638,181,'商务'),
(9203,638,180,'手拿'),
(9204,638,179,'牛皮'),
(9205,638,178,'青年'),
(9206,638,177,'内贴袋'),
(9207,638,176,'横款方形'),
(9208,638,175,'BISON DENIM/美洲野牛'),
(9209,638,174,'2015年秋季'),
(9210,638,173,'涤纶'),
(9211,638,172,'全新'),
(9212,638,171,'纯色'),
(9213,638,170,'手拿包'),
(9214,638,169,'软'),
(9215,638,168,'小号黑色 大号黑色 大号啡色'),
(9216,638,167,'拉链暗袋'),
(9217,638,166,'小'),
(9218,638,165,'商务/OL'),
(9219,639,187,'头层牛皮'),
(9220,639,186,'N8027-1'),
(9221,639,185,'无'),
(9222,639,184,'否'),
(9223,639,183,'拉链'),
(9224,639,182,'装卸式提把'),
(9225,639,181,'商务'),
(9226,639,180,'手拿'),
(9227,639,179,'牛皮'),
(9228,639,178,'青年'),
(9229,639,177,'内贴袋'),
(9230,639,176,'横款方形'),
(9231,639,175,'BISON DENIM/美洲野牛'),
(9232,639,174,'2015年秋季'),
(9233,639,173,'涤纶'),
(9234,639,172,'全新'),
(9235,639,171,'纯色'),
(9236,639,170,'手拿包'),
(9237,639,169,'软'),
(9238,639,168,'小号黑色 大号黑色 大号啡色'),
(9239,639,167,'拉链暗袋'),
(9240,639,166,'小'),
(9241,639,165,'商务/OL'),
(9242,640,187,'头层牛皮'),
(9243,640,186,'N8027-1'),
(9244,640,185,'无'),
(9245,640,184,'否'),
(9246,640,183,'拉链'),
(9247,640,182,'装卸式提把'),
(9248,640,181,'商务'),
(9249,640,180,'手拿'),
(9250,640,179,'牛皮'),
(9251,640,178,'青年'),
(9252,640,177,'内贴袋'),
(9253,640,176,'横款方形'),
(9254,640,175,'BISON DENIM/美洲野牛'),
(9255,640,174,'2015年秋季'),
(9256,640,173,'涤纶'),
(9257,640,172,'全新'),
(9258,640,171,'纯色'),
(9259,640,170,'手拿包'),
(9260,640,169,'软'),
(9261,640,168,'小号黑色 大号黑色 大号啡色'),
(9262,640,167,'拉链暗袋'),
(9263,640,166,'小'),
(9264,640,165,'商务/OL'),
(9265,641,187,'头层牛皮'),
(9266,641,186,'N8027-1'),
(9267,641,185,'无'),
(9268,641,184,'否'),
(9269,641,183,'拉链'),
(9270,641,182,'装卸式提把'),
(9271,641,181,'商务'),
(9272,641,180,'手拿'),
(9273,641,179,'牛皮'),
(9274,641,178,'青年'),
(9275,641,177,'内贴袋'),
(9276,641,176,'横款方形'),
(9277,641,175,'BISON DENIM/美洲野牛'),
(9278,641,174,'2015年秋季'),
(9279,641,173,'涤纶'),
(9280,641,172,'全新'),
(9281,641,171,'纯色'),
(9282,641,170,'手拿包'),
(9283,641,169,'软'),
(9284,641,168,'小号黑色 大号黑色 大号啡色'),
(9285,641,167,'拉链暗袋'),
(9286,641,166,'小'),
(9287,641,165,'商务/OL'),
(9288,642,187,'头层牛皮'),
(9289,642,186,'N8027-1'),
(9290,642,185,'无'),
(9291,642,184,'否'),
(9292,642,183,'拉链'),
(9293,642,182,'装卸式提把'),
(9294,642,181,'商务'),
(9295,642,180,'手拿'),
(9296,642,179,'牛皮'),
(9297,642,178,'青年'),
(9298,642,177,'内贴袋'),
(9299,642,176,'横款方形'),
(9300,642,175,'BISON DENIM/美洲野牛'),
(9301,642,174,'2015年秋季'),
(9302,642,173,'涤纶'),
(9303,642,172,'全新'),
(9304,642,171,'纯色'),
(9305,642,170,'手拿包'),
(9306,642,169,'软'),
(9307,642,168,'小号黑色 大号黑色 大号啡色'),
(9308,642,167,'拉链暗袋'),
(9309,642,166,'小'),
(9310,642,165,'商务/OL'),
(9311,643,187,'头层牛皮'),
(9312,643,186,'N8027-1'),
(9313,643,185,'无'),
(9314,643,184,'否'),
(9315,643,183,'拉链'),
(9316,643,182,'装卸式提把'),
(9317,643,181,'商务'),
(9318,643,180,'手拿'),
(9319,643,179,'牛皮'),
(9320,643,178,'青年'),
(9321,643,177,'内贴袋'),
(9322,643,176,'横款方形'),
(9323,643,175,'BISON DENIM/美洲野牛'),
(9324,643,174,'2015年秋季'),
(9325,643,173,'涤纶'),
(9326,643,172,'全新'),
(9327,643,171,'纯色'),
(9328,643,170,'手拿包'),
(9329,643,169,'软'),
(9330,643,168,'小号黑色 大号黑色 大号啡色'),
(9331,643,167,'拉链暗袋'),
(9332,643,166,'小'),
(9333,643,165,'商务/OL'),
(9334,644,187,'头层牛皮'),
(9335,644,186,'N8027-1'),
(9336,644,185,'无'),
(9337,644,184,'否'),
(9338,644,183,'拉链'),
(9339,644,182,'装卸式提把'),
(9340,644,181,'商务'),
(9341,644,180,'手拿'),
(9342,644,179,'牛皮'),
(9343,644,178,'青年'),
(9344,644,177,'内贴袋'),
(9345,644,176,'横款方形'),
(9346,644,175,'BISON DENIM/美洲野牛'),
(9347,644,174,'2015年秋季'),
(9348,644,173,'涤纶'),
(9349,644,172,'全新'),
(9350,644,171,'纯色'),
(9351,644,170,'手拿包'),
(9352,644,169,'软'),
(9353,644,168,'小号黑色 大号黑色 大号啡色'),
(9354,644,167,'拉链暗袋'),
(9355,644,166,'小'),
(9356,644,165,'商务/OL'),
(9357,645,187,'头层牛皮'),
(9358,645,186,'N8027-1'),
(9359,645,185,'无'),
(9360,645,184,'否'),
(9361,645,183,'拉链'),
(9362,645,182,'装卸式提把'),
(9363,645,181,'商务'),
(9364,645,180,'手拿'),
(9365,645,179,'牛皮'),
(9366,645,178,'青年'),
(9367,645,177,'内贴袋'),
(9368,645,176,'横款方形'),
(9369,645,175,'BISON DENIM/美洲野牛'),
(9370,645,174,'2015年秋季'),
(9371,645,173,'涤纶'),
(9372,645,172,'全新'),
(9373,645,171,'纯色'),
(9374,645,170,'手拿包'),
(9375,645,169,'软'),
(9376,645,168,'小号黑色 大号黑色 大号啡色'),
(9377,645,167,'拉链暗袋'),
(9378,645,166,'小'),
(9379,645,165,'商务/OL'),
(9380,646,187,'头层牛皮'),
(9381,646,186,'N8027-1'),
(9382,646,185,'无'),
(9383,646,184,'否'),
(9384,646,183,'拉链'),
(9385,646,182,'装卸式提把'),
(9386,646,181,'商务'),
(9387,646,180,'手拿'),
(9388,646,179,'牛皮'),
(9389,646,178,'青年'),
(9390,646,177,'内贴袋'),
(9391,646,176,'横款方形'),
(9392,646,175,'BISON DENIM/美洲野牛'),
(9393,646,174,'2015年秋季'),
(9394,646,173,'涤纶'),
(9395,646,172,'全新'),
(9396,646,171,'纯色'),
(9397,646,170,'手拿包'),
(9398,646,169,'软'),
(9399,646,168,'小号黑色 大号黑色 大号啡色'),
(9400,646,167,'拉链暗袋'),
(9401,646,166,'小'),
(9402,646,165,'商务/OL'),
(9403,647,187,'头层牛皮'),
(9404,647,186,'N8027-1'),
(9405,647,185,'无'),
(9406,647,184,'否'),
(9407,647,183,'拉链'),
(9408,647,182,'装卸式提把'),
(9409,647,181,'商务'),
(9410,647,180,'手拿'),
(9411,647,179,'牛皮'),
(9412,647,178,'青年'),
(9413,647,177,'内贴袋'),
(9414,647,176,'横款方形'),
(9415,647,175,'BISON DENIM/美洲野牛'),
(9416,647,174,'2015年秋季'),
(9417,647,173,'涤纶'),
(9418,647,172,'全新'),
(9419,647,171,'纯色'),
(9420,647,170,'手拿包'),
(9421,647,169,'软'),
(9422,647,168,'小号黑色 大号黑色 大号啡色'),
(9423,647,167,'拉链暗袋'),
(9424,647,166,'小'),
(9425,647,165,'商务/OL'),
(9426,648,187,'头层牛皮'),
(9427,648,186,'N8027-1'),
(9428,648,185,'无'),
(9429,648,184,'否'),
(9430,648,183,'拉链'),
(9431,648,182,'装卸式提把'),
(9432,648,181,'商务'),
(9433,648,180,'手拿'),
(9434,648,179,'牛皮'),
(9435,648,178,'青年'),
(9436,648,177,'内贴袋'),
(9437,648,176,'横款方形'),
(9438,648,175,'BISON DENIM/美洲野牛'),
(9439,648,174,'2015年秋季'),
(9440,648,173,'涤纶'),
(9441,648,172,'全新'),
(9442,648,171,'纯色'),
(9443,648,170,'手拿包'),
(9444,648,169,'软'),
(9445,648,168,'小号黑色 大号黑色 大号啡色'),
(9446,648,167,'拉链暗袋'),
(9447,648,166,'小'),
(9448,648,165,'商务/OL'),
(9449,649,187,'头层牛皮'),
(9450,649,186,'N8027-1'),
(9451,649,185,'无'),
(9452,649,184,'否'),
(9453,649,183,'拉链'),
(9454,649,182,'装卸式提把'),
(9455,649,181,'商务'),
(9456,649,180,'手拿'),
(9457,649,179,'牛皮'),
(9458,649,178,'青年'),
(9459,649,177,'内贴袋'),
(9460,649,176,'横款方形'),
(9461,649,175,'BISON DENIM/美洲野牛'),
(9462,649,174,'2015年秋季'),
(9463,649,173,'涤纶'),
(9464,649,172,'全新'),
(9465,649,171,'纯色'),
(9466,649,170,'手拿包'),
(9467,649,169,'软'),
(9468,649,168,'小号黑色 大号黑色 大号啡色'),
(9469,649,167,'拉链暗袋'),
(9470,649,166,'小'),
(9471,649,165,'商务/OL'),
(9472,650,187,'头层牛皮'),
(9473,650,186,'N8027-1'),
(9474,650,185,'无'),
(9475,650,184,'否'),
(9476,650,183,'拉链'),
(9477,650,182,'装卸式提把'),
(9478,650,181,'商务'),
(9479,650,180,'手拿'),
(9480,650,179,'牛皮'),
(9481,650,178,'青年'),
(9482,650,177,'内贴袋'),
(9483,650,176,'横款方形'),
(9484,650,175,'BISON DENIM/美洲野牛'),
(9485,650,174,'2015年秋季'),
(9486,650,173,'涤纶'),
(9487,650,172,'全新'),
(9488,650,171,'纯色'),
(9489,650,170,'手拿包'),
(9490,650,169,'软'),
(9491,650,168,'小号黑色 大号黑色 大号啡色'),
(9492,650,167,'拉链暗袋'),
(9493,650,166,'小'),
(9494,650,165,'商务/OL'),
(9495,651,187,'头层牛皮'),
(9496,651,186,'N8027-1'),
(9497,651,185,'无'),
(9498,651,184,'否'),
(9499,651,183,'拉链'),
(9500,651,182,'装卸式提把'),
(9501,651,181,'商务'),
(9502,651,180,'手拿'),
(9503,651,179,'牛皮'),
(9504,651,178,'青年'),
(9505,651,177,'内贴袋'),
(9506,651,176,'横款方形'),
(9507,651,175,'BISON DENIM/美洲野牛'),
(9508,651,174,'2015年秋季'),
(9509,651,173,'涤纶'),
(9510,651,172,'全新'),
(9511,651,171,'纯色'),
(9512,651,170,'手拿包'),
(9513,651,169,'软'),
(9514,651,168,'小号黑色 大号黑色 大号啡色'),
(9515,651,167,'拉链暗袋'),
(9516,651,166,'小'),
(9517,651,165,'商务/OL'),
(9518,652,187,'头层牛皮'),
(9519,652,186,'N8027-1'),
(9520,652,185,'无'),
(9521,652,184,'否'),
(9522,652,183,'拉链'),
(9523,652,182,'装卸式提把'),
(9524,652,181,'商务'),
(9525,652,180,'手拿'),
(9526,652,179,'牛皮'),
(9527,652,178,'青年'),
(9528,652,177,'内贴袋'),
(9529,652,176,'横款方形'),
(9530,652,175,'BISON DENIM/美洲野牛'),
(9531,652,174,'2015年秋季'),
(9532,652,173,'涤纶'),
(9533,652,172,'全新'),
(9534,652,171,'纯色'),
(9535,652,170,'手拿包'),
(9536,652,169,'软'),
(9537,652,168,'小号黑色 大号黑色 大号啡色'),
(9538,652,167,'拉链暗袋'),
(9539,652,166,'小'),
(9540,652,165,'商务/OL'),
(9541,653,187,'头层牛皮'),
(9542,653,186,'N8027-1'),
(9543,653,185,'无'),
(9544,653,184,'否'),
(9545,653,183,'拉链'),
(9546,653,182,'装卸式提把'),
(9547,653,181,'商务'),
(9548,653,180,'手拿'),
(9549,653,179,'牛皮'),
(9550,653,178,'青年'),
(9551,653,177,'内贴袋'),
(9552,653,176,'横款方形'),
(9553,653,175,'BISON DENIM/美洲野牛'),
(9554,653,174,'2015年秋季'),
(9555,653,173,'涤纶'),
(9556,653,172,'全新'),
(9557,653,171,'纯色'),
(9558,653,170,'手拿包'),
(9559,653,169,'软'),
(9560,653,168,'小号黑色 大号黑色 大号啡色'),
(9561,653,167,'拉链暗袋'),
(9562,653,166,'小'),
(9563,653,165,'商务/OL'),
(9564,654,187,'头层牛皮'),
(9565,654,186,'N8027-1'),
(9566,654,185,'无'),
(9567,654,184,'否'),
(9568,654,183,'拉链'),
(9569,654,182,'装卸式提把'),
(9570,654,181,'商务'),
(9571,654,180,'手拿'),
(9572,654,179,'牛皮'),
(9573,654,178,'青年'),
(9574,654,177,'内贴袋'),
(9575,654,176,'横款方形'),
(9576,654,175,'BISON DENIM/美洲野牛'),
(9577,654,174,'2015年秋季'),
(9578,654,173,'涤纶'),
(9579,654,172,'全新'),
(9580,654,171,'纯色'),
(9581,654,170,'手拿包'),
(9582,654,169,'软'),
(9583,654,168,'小号黑色 大号黑色 大号啡色'),
(9584,654,167,'拉链暗袋'),
(9585,654,166,'小'),
(9586,654,165,'商务/OL'),
(9587,655,187,'头层牛皮'),
(9588,655,186,'N8027-1'),
(9589,655,185,'无'),
(9590,655,184,'否'),
(9591,655,183,'拉链'),
(9592,655,182,'装卸式提把'),
(9593,655,181,'商务'),
(9594,655,180,'手拿'),
(9595,655,179,'牛皮'),
(9596,655,178,'青年'),
(9597,655,177,'内贴袋'),
(9598,655,176,'横款方形'),
(9599,655,175,'BISON DENIM/美洲野牛'),
(9600,655,174,'2015年秋季'),
(9601,655,173,'涤纶'),
(9602,655,172,'全新'),
(9603,655,171,'纯色'),
(9604,655,170,'手拿包'),
(9605,655,169,'软'),
(9606,655,168,'小号黑色 大号黑色 大号啡色'),
(9607,655,167,'拉链暗袋'),
(9608,655,166,'小'),
(9609,655,165,'商务/OL'),
(9610,656,187,'头层牛皮'),
(9611,656,186,'N8027-1'),
(9612,656,185,'无'),
(9613,656,184,'否'),
(9614,656,183,'拉链'),
(9615,656,182,'装卸式提把'),
(9616,656,181,'商务'),
(9617,656,180,'手拿'),
(9618,656,179,'牛皮'),
(9619,656,178,'青年'),
(9620,656,177,'内贴袋'),
(9621,656,176,'横款方形'),
(9622,656,175,'BISON DENIM/美洲野牛'),
(9623,656,174,'2015年秋季'),
(9624,656,173,'涤纶'),
(9625,656,172,'全新'),
(9626,656,171,'纯色'),
(9627,656,170,'手拿包'),
(9628,656,169,'软'),
(9629,656,168,'小号黑色 大号黑色 大号啡色'),
(9630,656,167,'拉链暗袋'),
(9631,656,166,'小'),
(9632,656,165,'商务/OL'),
(9633,657,187,'头层牛皮'),
(9634,657,186,'N8027-1'),
(9635,657,185,'无'),
(9636,657,184,'否'),
(9637,657,183,'拉链'),
(9638,657,182,'装卸式提把'),
(9639,657,181,'商务'),
(9640,657,180,'手拿'),
(9641,657,179,'牛皮'),
(9642,657,178,'青年'),
(9643,657,177,'内贴袋'),
(9644,657,176,'横款方形'),
(9645,657,175,'BISON DENIM/美洲野牛'),
(9646,657,174,'2015年秋季'),
(9647,657,173,'涤纶'),
(9648,657,172,'全新'),
(9649,657,171,'纯色'),
(9650,657,170,'手拿包'),
(9651,657,169,'软'),
(9652,657,168,'小号黑色 大号黑色 大号啡色'),
(9653,657,167,'拉链暗袋'),
(9654,657,166,'小'),
(9655,657,165,'商务/OL'),
(9656,658,187,'头层牛皮'),
(9657,658,186,'N8027-1'),
(9658,658,185,'无'),
(9659,658,184,'否'),
(9660,658,183,'拉链'),
(9661,658,182,'装卸式提把'),
(9662,658,181,'商务'),
(9663,658,180,'手拿'),
(9664,658,179,'牛皮'),
(9665,658,178,'青年'),
(9666,658,177,'内贴袋'),
(9667,658,176,'横款方形'),
(9668,658,175,'BISON DENIM/美洲野牛'),
(9669,658,174,'2015年秋季'),
(9670,658,173,'涤纶'),
(9671,658,172,'全新'),
(9672,658,171,'纯色'),
(9673,658,170,'手拿包'),
(9674,658,169,'软'),
(9675,658,168,'小号黑色 大号黑色 大号啡色'),
(9676,658,167,'拉链暗袋'),
(9677,658,166,'小'),
(9678,658,165,'商务/OL'),
(9679,659,187,'头层牛皮'),
(9680,659,186,'N8027-1'),
(9681,659,185,'无'),
(9682,659,184,'否'),
(9683,659,183,'拉链'),
(9684,659,182,'装卸式提把'),
(9685,659,181,'商务'),
(9686,659,180,'手拿'),
(9687,659,179,'牛皮'),
(9688,659,178,'青年'),
(9689,659,177,'内贴袋'),
(9690,659,176,'横款方形'),
(9691,659,175,'BISON DENIM/美洲野牛'),
(9692,659,174,'2015年秋季'),
(9693,659,173,'涤纶'),
(9694,659,172,'全新'),
(9695,659,171,'纯色'),
(9696,659,170,'手拿包'),
(9697,659,169,'软'),
(9698,659,168,'小号黑色 大号黑色 大号啡色'),
(9699,659,167,'拉链暗袋'),
(9700,659,166,'小'),
(9701,659,165,'商务/OL'),
(9702,660,187,'头层牛皮'),
(9703,660,186,'N8027-1'),
(9704,660,185,'无'),
(9705,660,184,'否'),
(9706,660,183,'拉链'),
(9707,660,182,'装卸式提把'),
(9708,660,181,'商务'),
(9709,660,180,'手拿'),
(9710,660,179,'牛皮'),
(9711,660,178,'青年'),
(9712,660,177,'内贴袋'),
(9713,660,176,'横款方形'),
(9714,660,175,'BISON DENIM/美洲野牛'),
(9715,660,174,'2015年秋季'),
(9716,660,173,'涤纶'),
(9717,660,172,'全新'),
(9718,660,171,'纯色'),
(9719,660,170,'手拿包'),
(9720,660,169,'软'),
(9721,660,168,'小号黑色 大号黑色 大号啡色'),
(9722,660,167,'拉链暗袋'),
(9723,660,166,'小'),
(9724,660,165,'商务/OL'),
(9725,661,187,'头层牛皮'),
(9726,661,186,'N8027-1'),
(9727,661,185,'无'),
(9728,661,184,'否'),
(9729,661,183,'拉链'),
(9730,661,182,'装卸式提把'),
(9731,661,181,'商务'),
(9732,661,180,'手拿'),
(9733,661,179,'牛皮'),
(9734,661,178,'青年'),
(9735,661,177,'内贴袋'),
(9736,661,176,'横款方形'),
(9737,661,175,'BISON DENIM/美洲野牛'),
(9738,661,174,'2015年秋季'),
(9739,661,173,'涤纶'),
(9740,661,172,'全新'),
(9741,661,171,'纯色'),
(9742,661,170,'手拿包'),
(9743,661,169,'软'),
(9744,661,168,'小号黑色 大号黑色 大号啡色'),
(9745,661,167,'拉链暗袋'),
(9746,661,166,'小'),
(9747,661,165,'商务/OL'),
(9748,662,187,'头层牛皮'),
(9749,662,186,'N8027-1'),
(9750,662,185,'无'),
(9751,662,184,'否'),
(9752,662,183,'拉链'),
(9753,662,182,'装卸式提把'),
(9754,662,181,'商务'),
(9755,662,180,'手拿'),
(9756,662,179,'牛皮'),
(9757,662,178,'青年'),
(9758,662,177,'内贴袋'),
(9759,662,176,'横款方形'),
(9760,662,175,'BISON DENIM/美洲野牛'),
(9761,662,174,'2015年秋季'),
(9762,662,173,'涤纶'),
(9763,662,172,'全新'),
(9764,662,171,'纯色'),
(9765,662,170,'手拿包'),
(9766,662,169,'软'),
(9767,662,168,'小号黑色 大号黑色 大号啡色'),
(9768,662,167,'拉链暗袋'),
(9769,662,166,'小'),
(9770,662,165,'商务/OL'),
(9771,663,187,'头层牛皮'),
(9772,663,186,'N8027-1'),
(9773,663,185,'无'),
(9774,663,184,'否'),
(9775,663,183,'拉链'),
(9776,663,182,'装卸式提把'),
(9777,663,181,'商务'),
(9778,663,180,'手拿'),
(9779,663,179,'牛皮'),
(9780,663,178,'青年'),
(9781,663,177,'内贴袋'),
(9782,663,176,'横款方形'),
(9783,663,175,'BISON DENIM/美洲野牛'),
(9784,663,174,'2015年秋季'),
(9785,663,173,'涤纶'),
(9786,663,172,'全新'),
(9787,663,171,'纯色'),
(9788,663,170,'手拿包'),
(9789,663,169,'软'),
(9790,663,168,'小号黑色 大号黑色 大号啡色'),
(9791,663,167,'拉链暗袋'),
(9792,663,166,'小'),
(9793,663,165,'商务/OL'),
(9794,664,187,'头层牛皮'),
(9795,664,186,'N8027-1'),
(9796,664,185,'无'),
(9797,664,184,'否'),
(9798,664,183,'拉链'),
(9799,664,182,'装卸式提把'),
(9800,664,181,'商务'),
(9801,664,180,'手拿'),
(9802,664,179,'牛皮'),
(9803,664,178,'青年'),
(9804,664,177,'内贴袋'),
(9805,664,176,'横款方形'),
(9806,664,175,'BISON DENIM/美洲野牛'),
(9807,664,174,'2015年秋季'),
(9808,664,173,'涤纶'),
(9809,664,172,'全新'),
(9810,664,171,'纯色'),
(9811,664,170,'手拿包'),
(9812,664,169,'软'),
(9813,664,168,'小号黑色 大号黑色 大号啡色'),
(9814,664,167,'拉链暗袋'),
(9815,664,166,'小'),
(9816,664,165,'商务/OL'),
(9817,665,187,'头层牛皮'),
(9818,665,186,'N8027-1'),
(9819,665,185,'无'),
(9820,665,184,'否'),
(9821,665,183,'拉链'),
(9822,665,182,'装卸式提把'),
(9823,665,181,'商务'),
(9824,665,180,'手拿'),
(9825,665,179,'牛皮'),
(9826,665,178,'青年'),
(9827,665,177,'内贴袋'),
(9828,665,176,'横款方形'),
(9829,665,175,'BISON DENIM/美洲野牛'),
(9830,665,174,'2015年秋季'),
(9831,665,173,'涤纶'),
(9832,665,172,'全新'),
(9833,665,171,'纯色'),
(9834,665,170,'手拿包'),
(9835,665,169,'软'),
(9836,665,168,'小号黑色 大号黑色 大号啡色'),
(9837,665,167,'拉链暗袋'),
(9838,665,166,'小'),
(9839,665,165,'商务/OL'),
(9840,666,187,'头层牛皮'),
(9841,666,186,'N8027-1'),
(9842,666,185,'无'),
(9843,666,184,'否'),
(9844,666,183,'拉链'),
(9845,666,182,'装卸式提把'),
(9846,666,181,'商务'),
(9847,666,180,'手拿'),
(9848,666,179,'牛皮'),
(9849,666,178,'青年'),
(9850,666,177,'内贴袋'),
(9851,666,176,'横款方形'),
(9852,666,175,'BISON DENIM/美洲野牛'),
(9853,666,174,'2015年秋季'),
(9854,666,173,'涤纶'),
(9855,666,172,'全新'),
(9856,666,171,'纯色'),
(9857,666,170,'手拿包'),
(9858,666,169,'软'),
(9859,666,168,'小号黑色 大号黑色 大号啡色'),
(9860,666,167,'拉链暗袋'),
(9861,666,166,'小'),
(9862,666,165,'商务/OL'),
(9863,667,187,'头层牛皮'),
(9864,667,186,'N8027-1'),
(9865,667,185,'无'),
(9866,667,184,'否'),
(9867,667,183,'拉链'),
(9868,667,182,'装卸式提把'),
(9869,667,181,'商务'),
(9870,667,180,'手拿'),
(9871,667,179,'牛皮'),
(9872,667,178,'青年'),
(9873,667,177,'内贴袋'),
(9874,667,176,'横款方形'),
(9875,667,175,'BISON DENIM/美洲野牛'),
(9876,667,174,'2015年秋季'),
(9877,667,173,'涤纶'),
(9878,667,172,'全新'),
(9879,667,171,'纯色'),
(9880,667,170,'手拿包'),
(9881,667,169,'软'),
(9882,667,168,'小号黑色 大号黑色 大号啡色'),
(9883,667,167,'拉链暗袋'),
(9884,667,166,'小'),
(9885,667,165,'商务/OL'),
(9886,668,187,'头层牛皮'),
(9887,668,186,'N8027-1'),
(9888,668,185,'无'),
(9889,668,184,'否'),
(9890,668,183,'拉链'),
(9891,668,182,'装卸式提把'),
(9892,668,181,'商务'),
(9893,668,180,'手拿'),
(9894,668,179,'牛皮'),
(9895,668,178,'青年'),
(9896,668,177,'内贴袋'),
(9897,668,176,'横款方形'),
(9898,668,175,'BISON DENIM/美洲野牛'),
(9899,668,174,'2015年秋季'),
(9900,668,173,'涤纶'),
(9901,668,172,'全新'),
(9902,668,171,'纯色'),
(9903,668,170,'手拿包'),
(9904,668,169,'软'),
(9905,668,168,'小号黑色 大号黑色 大号啡色'),
(9906,668,167,'拉链暗袋'),
(9907,668,166,'小'),
(9908,668,165,'商务/OL'),
(9909,669,187,'头层牛皮'),
(9910,669,186,'N8027-1'),
(9911,669,185,'无'),
(9912,669,184,'否'),
(9913,669,183,'拉链'),
(9914,669,182,'装卸式提把'),
(9915,669,181,'商务'),
(9916,669,180,'手拿'),
(9917,669,179,'牛皮'),
(9918,669,178,'青年'),
(9919,669,177,'内贴袋'),
(9920,669,176,'横款方形'),
(9921,669,175,'BISON DENIM/美洲野牛'),
(9922,669,174,'2015年秋季'),
(9923,669,173,'涤纶'),
(9924,669,172,'全新'),
(9925,669,171,'纯色'),
(9926,669,170,'手拿包'),
(9927,669,169,'软'),
(9928,669,168,'小号黑色 大号黑色 大号啡色'),
(9929,669,167,'拉链暗袋'),
(9930,669,166,'小'),
(9931,669,165,'商务/OL'),
(9932,670,187,'头层牛皮'),
(9933,670,186,'N8027-1'),
(9934,670,185,'无'),
(9935,670,184,'否'),
(9936,670,183,'拉链'),
(9937,670,182,'装卸式提把'),
(9938,670,181,'商务'),
(9939,670,180,'手拿'),
(9940,670,179,'牛皮'),
(9941,670,178,'青年'),
(9942,670,177,'内贴袋'),
(9943,670,176,'横款方形'),
(9944,670,175,'BISON DENIM/美洲野牛'),
(9945,670,174,'2015年秋季'),
(9946,670,173,'涤纶'),
(9947,670,172,'全新'),
(9948,670,171,'纯色'),
(9949,670,170,'手拿包'),
(9950,670,169,'软'),
(9951,670,168,'小号黑色 大号黑色 大号啡色'),
(9952,670,167,'拉链暗袋'),
(9953,670,166,'小'),
(9954,670,165,'商务/OL'),
(9955,671,187,'头层牛皮'),
(9956,671,186,'N8027-1'),
(9957,671,185,'无'),
(9958,671,184,'否'),
(9959,671,183,'拉链'),
(9960,671,182,'装卸式提把'),
(9961,671,181,'商务'),
(9962,671,180,'手拿'),
(9963,671,179,'牛皮'),
(9964,671,178,'青年'),
(9965,671,177,'内贴袋'),
(9966,671,176,'横款方形'),
(9967,671,175,'BISON DENIM/美洲野牛'),
(9968,671,174,'2015年秋季'),
(9969,671,173,'涤纶'),
(9970,671,172,'全新'),
(9971,671,171,'纯色'),
(9972,671,170,'手拿包'),
(9973,671,169,'软'),
(9974,671,168,'小号黑色 大号黑色 大号啡色'),
(9975,671,167,'拉链暗袋'),
(9976,671,166,'小'),
(9977,671,165,'商务/OL'),
(9978,672,187,'头层牛皮'),
(9979,672,186,'N8027-1'),
(9980,672,185,'无'),
(9981,672,184,'否'),
(9982,672,183,'拉链'),
(9983,672,182,'装卸式提把'),
(9984,672,181,'商务'),
(9985,672,180,'手拿'),
(9986,672,179,'牛皮'),
(9987,672,178,'青年'),
(9988,672,177,'内贴袋'),
(9989,672,176,'横款方形'),
(9990,672,175,'BISON DENIM/美洲野牛'),
(9991,672,174,'2015年秋季'),
(9992,672,173,'涤纶'),
(9993,672,172,'全新'),
(9994,672,171,'纯色'),
(9995,672,170,'手拿包'),
(9996,672,169,'软'),
(9997,672,168,'小号黑色 大号黑色 大号啡色'),
(9998,672,167,'拉链暗袋'),
(9999,672,166,'小'),
(10000,672,165,'商务/OL'),
(10001,673,187,'头层牛皮'),
(10002,673,186,'N8027-1'),
(10003,673,185,'无'),
(10004,673,184,'否'),
(10005,673,183,'拉链'),
(10006,673,182,'装卸式提把'),
(10007,673,181,'商务'),
(10008,673,180,'手拿'),
(10009,673,179,'牛皮'),
(10010,673,178,'青年'),
(10011,673,177,'内贴袋'),
(10012,673,176,'横款方形'),
(10013,673,175,'BISON DENIM/美洲野牛'),
(10014,673,174,'2015年秋季'),
(10015,673,173,'涤纶'),
(10016,673,172,'全新'),
(10017,673,171,'纯色'),
(10018,673,170,'手拿包'),
(10019,673,169,'软'),
(10020,673,168,'小号黑色 大号黑色 大号啡色'),
(10021,673,167,'拉链暗袋'),
(10022,673,166,'小'),
(10023,673,165,'商务/OL'),
(10024,674,187,'头层牛皮'),
(10025,674,186,'N8027-1'),
(10026,674,185,'无'),
(10027,674,184,'否'),
(10028,674,183,'拉链'),
(10029,674,182,'装卸式提把'),
(10030,674,181,'商务'),
(10031,674,180,'手拿'),
(10032,674,179,'牛皮'),
(10033,674,178,'青年'),
(10034,674,177,'内贴袋'),
(10035,674,176,'横款方形'),
(10036,674,175,'BISON DENIM/美洲野牛'),
(10037,674,174,'2015年秋季'),
(10038,674,173,'涤纶'),
(10039,674,172,'全新'),
(10040,674,171,'纯色'),
(10041,674,170,'手拿包'),
(10042,674,169,'软'),
(10043,674,168,'小号黑色 大号黑色 大号啡色'),
(10044,674,167,'拉链暗袋'),
(10045,674,166,'小'),
(10046,674,165,'商务/OL'),
(10047,675,187,'头层牛皮'),
(10048,675,186,'N8027-1'),
(10049,675,185,'无'),
(10050,675,184,'否'),
(10051,675,183,'拉链'),
(10052,675,182,'装卸式提把'),
(10053,675,181,'商务'),
(10054,675,180,'手拿'),
(10055,675,179,'牛皮'),
(10056,675,178,'青年'),
(10057,675,177,'内贴袋'),
(10058,675,176,'横款方形'),
(10059,675,175,'BISON DENIM/美洲野牛'),
(10060,675,174,'2015年秋季'),
(10061,675,173,'涤纶'),
(10062,675,172,'全新'),
(10063,675,171,'纯色'),
(10064,675,170,'手拿包'),
(10065,675,169,'软'),
(10066,675,168,'小号黑色 大号黑色 大号啡色'),
(10067,675,167,'拉链暗袋'),
(10068,675,166,'小'),
(10069,675,165,'商务/OL'),
(10070,676,187,'头层牛皮'),
(10071,676,186,'N8027-1'),
(10072,676,185,'无'),
(10073,676,184,'否'),
(10074,676,183,'拉链'),
(10075,676,182,'装卸式提把'),
(10076,676,181,'商务'),
(10077,676,180,'手拿'),
(10078,676,179,'牛皮'),
(10079,676,178,'青年'),
(10080,676,177,'内贴袋'),
(10081,676,176,'横款方形'),
(10082,676,175,'BISON DENIM/美洲野牛'),
(10083,676,174,'2015年秋季'),
(10084,676,173,'涤纶'),
(10085,676,172,'全新'),
(10086,676,171,'纯色'),
(10087,676,170,'手拿包'),
(10088,676,169,'软'),
(10089,676,168,'小号黑色 大号黑色 大号啡色'),
(10090,676,167,'拉链暗袋'),
(10091,676,166,'小'),
(10092,676,165,'商务/OL'),
(10093,677,187,'头层牛皮'),
(10094,677,186,'N8027-1'),
(10095,677,185,'无'),
(10096,677,184,'否'),
(10097,677,183,'拉链'),
(10098,677,182,'装卸式提把'),
(10099,677,181,'商务'),
(10100,677,180,'手拿'),
(10101,677,179,'牛皮'),
(10102,677,178,'青年'),
(10103,677,177,'内贴袋'),
(10104,677,176,'横款方形'),
(10105,677,175,'BISON DENIM/美洲野牛'),
(10106,677,174,'2015年秋季'),
(10107,677,173,'涤纶'),
(10108,677,172,'全新'),
(10109,677,171,'纯色'),
(10110,677,170,'手拿包'),
(10111,677,169,'软'),
(10112,677,168,'小号黑色 大号黑色 大号啡色'),
(10113,677,167,'拉链暗袋'),
(10114,677,166,'小'),
(10115,677,165,'商务/OL'),
(10116,678,195,'薄'),
(10117,678,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10118,678,193,'商务绅士'),
(10119,678,192,'GM0020-A'),
(10120,678,191,'G·Mons/吉约蒙'),
(10121,678,190,'2016年夏季'),
(10122,678,189,'条绒布'),
(10123,678,188,'纯电商(只在线上销售)'),
(10124,679,195,'薄'),
(10125,679,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10126,679,193,'商务绅士'),
(10127,679,192,'GM0020-A'),
(10128,679,191,'G·Mons/吉约蒙'),
(10129,679,190,'2016年夏季'),
(10130,679,189,'条绒布'),
(10131,679,188,'纯电商(只在线上销售)'),
(10132,680,195,'薄'),
(10133,680,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10134,680,193,'商务绅士'),
(10135,680,192,'GM0020-A'),
(10136,680,191,'G·Mons/吉约蒙'),
(10137,680,190,'2016年夏季'),
(10138,680,189,'条绒布'),
(10139,680,188,'纯电商(只在线上销售)'),
(10140,681,195,'薄'),
(10141,681,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10142,681,193,'商务绅士'),
(10143,681,192,'GM0020-A'),
(10144,681,191,'G·Mons/吉约蒙'),
(10145,681,190,'2016年夏季'),
(10146,681,189,'条绒布'),
(10147,681,188,'纯电商(只在线上销售)'),
(10148,682,195,'薄'),
(10149,682,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10150,682,193,'商务绅士'),
(10151,682,192,'GM0020-A'),
(10152,682,191,'G·Mons/吉约蒙'),
(10153,682,190,'2016年夏季'),
(10154,682,189,'条绒布'),
(10155,682,188,'纯电商(只在线上销售)'),
(10156,683,195,'薄'),
(10157,683,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10158,683,193,'商务绅士'),
(10159,683,192,'GM0020-A'),
(10160,683,191,'G·Mons/吉约蒙'),
(10161,683,190,'2016年夏季'),
(10162,683,189,'条绒布'),
(10163,683,188,'纯电商(只在线上销售)'),
(10164,684,195,'薄'),
(10165,684,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10166,684,193,'商务绅士'),
(10167,684,192,'GM0020-A'),
(10168,684,191,'G·Mons/吉约蒙'),
(10169,684,190,'2016年夏季'),
(10170,684,189,'条绒布'),
(10171,684,188,'纯电商(只在线上销售)'),
(10172,685,195,'薄'),
(10173,685,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10174,685,193,'商务绅士'),
(10175,685,192,'GM0020-A'),
(10176,685,191,'G·Mons/吉约蒙'),
(10177,685,190,'2016年夏季'),
(10178,685,189,'条绒布'),
(10179,685,188,'纯电商(只在线上销售)'),
(10180,686,195,'薄'),
(10181,686,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10182,686,193,'商务绅士'),
(10183,686,192,'GM0020-A'),
(10184,686,191,'G·Mons/吉约蒙'),
(10185,686,190,'2016年夏季'),
(10186,686,189,'条绒布'),
(10187,686,188,'纯电商(只在线上销售)'),
(10188,687,195,'薄'),
(10189,687,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10190,687,193,'商务绅士'),
(10191,687,192,'GM0020-A'),
(10192,687,191,'G·Mons/吉约蒙'),
(10193,687,190,'2016年夏季'),
(10194,687,189,'条绒布'),
(10195,687,188,'纯电商(只在线上销售)'),
(10196,688,195,'薄'),
(10197,688,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10198,688,193,'商务绅士'),
(10199,688,192,'GM0020-A'),
(10200,688,191,'G·Mons/吉约蒙'),
(10201,688,190,'2016年夏季'),
(10202,688,189,'条绒布'),
(10203,688,188,'纯电商(只在线上销售)'),
(10204,689,195,'薄'),
(10205,689,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10206,689,193,'商务绅士'),
(10207,689,192,'GM0020-A'),
(10208,689,191,'G·Mons/吉约蒙'),
(10209,689,190,'2016年夏季'),
(10210,689,189,'条绒布'),
(10211,689,188,'纯电商(只在线上销售)'),
(10212,690,195,'薄'),
(10213,690,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10214,690,193,'商务绅士'),
(10215,690,192,'GM0020-A'),
(10216,690,191,'G·Mons/吉约蒙'),
(10217,690,190,'2016年夏季'),
(10218,690,189,'条绒布'),
(10219,690,188,'纯电商(只在线上销售)'),
(10220,691,195,'薄'),
(10221,691,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10222,691,193,'商务绅士'),
(10223,691,192,'GM0020-A'),
(10224,691,191,'G·Mons/吉约蒙'),
(10225,691,190,'2016年夏季'),
(10226,691,189,'条绒布'),
(10227,691,188,'纯电商(只在线上销售)'),
(10228,692,195,'薄'),
(10229,692,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10230,692,193,'商务绅士'),
(10231,692,192,'GM0020-A'),
(10232,692,191,'G·Mons/吉约蒙'),
(10233,692,190,'2016年夏季'),
(10234,692,189,'条绒布'),
(10235,692,188,'纯电商(只在线上销售)'),
(10236,693,195,'薄'),
(10237,693,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10238,693,193,'商务绅士'),
(10239,693,192,'GM0020-A'),
(10240,693,191,'G·Mons/吉约蒙'),
(10241,693,190,'2016年夏季'),
(10242,693,189,'条绒布'),
(10243,693,188,'纯电商(只在线上销售)'),
(10244,694,195,'薄'),
(10245,694,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10246,694,193,'商务绅士'),
(10247,694,192,'GM0020-A'),
(10248,694,191,'G·Mons/吉约蒙'),
(10249,694,190,'2016年夏季'),
(10250,694,189,'条绒布'),
(10251,694,188,'纯电商(只在线上销售)'),
(10252,695,195,'薄'),
(10253,695,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10254,695,193,'商务绅士'),
(10255,695,192,'GM0020-A'),
(10256,695,191,'G·Mons/吉约蒙'),
(10257,695,190,'2016年夏季'),
(10258,695,189,'条绒布'),
(10259,695,188,'纯电商(只在线上销售)'),
(10260,696,195,'薄'),
(10261,696,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10262,696,193,'商务绅士'),
(10263,696,192,'GM0020-A'),
(10264,696,191,'G·Mons/吉约蒙'),
(10265,696,190,'2016年夏季'),
(10266,696,189,'条绒布'),
(10267,696,188,'纯电商(只在线上销售)'),
(10268,697,195,'薄'),
(10269,697,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10270,697,193,'商务绅士'),
(10271,697,192,'GM0020-A'),
(10272,697,191,'G·Mons/吉约蒙'),
(10273,697,190,'2016年夏季'),
(10274,697,189,'条绒布'),
(10275,697,188,'纯电商(只在线上销售)'),
(10276,698,195,'薄'),
(10277,698,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10278,698,193,'商务绅士'),
(10279,698,192,'GM0020-A'),
(10280,698,191,'G·Mons/吉约蒙'),
(10281,698,190,'2016年夏季'),
(10282,698,189,'条绒布'),
(10283,698,188,'纯电商(只在线上销售)'),
(10284,699,195,'薄'),
(10285,699,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10286,699,193,'商务绅士'),
(10287,699,192,'GM0020-A'),
(10288,699,191,'G·Mons/吉约蒙'),
(10289,699,190,'2016年夏季'),
(10290,699,189,'条绒布'),
(10291,699,188,'纯电商(只在线上销售)'),
(10292,700,195,'薄'),
(10293,700,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10294,700,193,'商务绅士'),
(10295,700,192,'GM0020-A'),
(10296,700,191,'G·Mons/吉约蒙'),
(10297,700,190,'2016年夏季'),
(10298,700,189,'条绒布'),
(10299,700,188,'纯电商(只在线上销售)'),
(10300,701,195,'薄'),
(10301,701,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10302,701,193,'商务绅士'),
(10303,701,192,'GM0020-A'),
(10304,701,191,'G·Mons/吉约蒙'),
(10305,701,190,'2016年夏季'),
(10306,701,189,'条绒布'),
(10307,701,188,'纯电商(只在线上销售)'),
(10308,702,195,'薄'),
(10309,702,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10310,702,193,'商务绅士'),
(10311,702,192,'GM0020-A'),
(10312,702,191,'G·Mons/吉约蒙'),
(10313,702,190,'2016年夏季'),
(10314,702,189,'条绒布'),
(10315,702,188,'纯电商(只在线上销售)'),
(10316,703,195,'薄'),
(10317,703,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10318,703,193,'商务绅士'),
(10319,703,192,'GM0020-A'),
(10320,703,191,'G·Mons/吉约蒙'),
(10321,703,190,'2016年夏季'),
(10322,703,189,'条绒布'),
(10323,703,188,'纯电商(只在线上销售)'),
(10324,704,195,'薄'),
(10325,704,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10326,704,193,'商务绅士'),
(10327,704,192,'GM0020-A'),
(10328,704,191,'G·Mons/吉约蒙'),
(10329,704,190,'2016年夏季'),
(10330,704,189,'条绒布'),
(10331,704,188,'纯电商(只在线上销售)'),
(10332,705,195,'薄'),
(10333,705,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10334,705,193,'商务绅士'),
(10335,705,192,'GM0020-A'),
(10336,705,191,'G·Mons/吉约蒙'),
(10337,705,190,'2016年夏季'),
(10338,705,189,'条绒布'),
(10339,705,188,'纯电商(只在线上销售)'),
(10340,706,195,'薄'),
(10341,706,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10342,706,193,'商务绅士'),
(10343,706,192,'GM0020-A'),
(10344,706,191,'G·Mons/吉约蒙'),
(10345,706,190,'2016年夏季'),
(10346,706,189,'条绒布'),
(10347,706,188,'纯电商(只在线上销售)'),
(10348,707,195,'薄'),
(10349,707,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10350,707,193,'商务绅士'),
(10351,707,192,'GM0020-A'),
(10352,707,191,'G·Mons/吉约蒙'),
(10353,707,190,'2016年夏季'),
(10354,707,189,'条绒布'),
(10355,707,188,'纯电商(只在线上销售)'),
(10356,708,195,'薄'),
(10357,708,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10358,708,193,'商务绅士'),
(10359,708,192,'GM0020-A'),
(10360,708,191,'G·Mons/吉约蒙'),
(10361,708,190,'2016年夏季'),
(10362,708,189,'条绒布'),
(10363,708,188,'纯电商(只在线上销售)'),
(10364,709,195,'薄'),
(10365,709,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10366,709,193,'商务绅士'),
(10367,709,192,'GM0020-A'),
(10368,709,191,'G·Mons/吉约蒙'),
(10369,709,190,'2016年夏季'),
(10370,709,189,'条绒布'),
(10371,709,188,'纯电商(只在线上销售)'),
(10372,710,195,'薄'),
(10373,710,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10374,710,193,'商务绅士'),
(10375,710,192,'GM0020-A'),
(10376,710,191,'G·Mons/吉约蒙'),
(10377,710,190,'2016年夏季'),
(10378,710,189,'条绒布'),
(10379,710,188,'纯电商(只在线上销售)'),
(10380,711,195,'薄'),
(10381,711,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10382,711,193,'商务绅士'),
(10383,711,192,'GM0020-A'),
(10384,711,191,'G·Mons/吉约蒙'),
(10385,711,190,'2016年夏季'),
(10386,711,189,'条绒布'),
(10387,711,188,'纯电商(只在线上销售)'),
(10388,712,195,'薄'),
(10389,712,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10390,712,193,'商务绅士'),
(10391,712,192,'GM0020-A'),
(10392,712,191,'G·Mons/吉约蒙'),
(10393,712,190,'2016年夏季'),
(10394,712,189,'条绒布'),
(10395,712,188,'纯电商(只在线上销售)'),
(10396,713,195,'薄'),
(10397,713,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10398,713,193,'商务绅士'),
(10399,713,192,'GM0020-A'),
(10400,713,191,'G·Mons/吉约蒙'),
(10401,713,190,'2016年夏季'),
(10402,713,189,'条绒布'),
(10403,713,188,'纯电商(只在线上销售)'),
(10404,714,195,'薄'),
(10405,714,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10406,714,193,'商务绅士'),
(10407,714,192,'GM0020-A'),
(10408,714,191,'G·Mons/吉约蒙'),
(10409,714,190,'2016年夏季'),
(10410,714,189,'条绒布'),
(10411,714,188,'纯电商(只在线上销售)'),
(10412,715,195,'薄'),
(10413,715,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10414,715,193,'商务绅士'),
(10415,715,192,'GM0020-A'),
(10416,715,191,'G·Mons/吉约蒙'),
(10417,715,190,'2016年夏季'),
(10418,715,189,'条绒布'),
(10419,715,188,'纯电商(只在线上销售)'),
(10420,716,195,'薄'),
(10421,716,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10422,716,193,'商务绅士'),
(10423,716,192,'GM0020-A'),
(10424,716,191,'G·Mons/吉约蒙'),
(10425,716,190,'2016年夏季'),
(10426,716,189,'条绒布'),
(10427,716,188,'纯电商(只在线上销售)'),
(10428,717,195,'薄'),
(10429,717,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10430,717,193,'商务绅士'),
(10431,717,192,'GM0020-A'),
(10432,717,191,'G·Mons/吉约蒙'),
(10433,717,190,'2016年夏季'),
(10434,717,189,'条绒布'),
(10435,717,188,'纯电商(只在线上销售)'),
(10436,718,195,'薄'),
(10437,718,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10438,718,193,'商务绅士'),
(10439,718,192,'GM0020-A'),
(10440,718,191,'G·Mons/吉约蒙'),
(10441,718,190,'2016年夏季'),
(10442,718,189,'条绒布'),
(10443,718,188,'纯电商(只在线上销售)'),
(10444,719,195,'薄'),
(10445,719,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10446,719,193,'商务绅士'),
(10447,719,192,'GM0020-A'),
(10448,719,191,'G·Mons/吉约蒙'),
(10449,719,190,'2016年夏季'),
(10450,719,189,'条绒布'),
(10451,719,188,'纯电商(只在线上销售)'),
(10452,720,195,'薄'),
(10453,720,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10454,720,193,'商务绅士'),
(10455,720,192,'GM0020-A'),
(10456,720,191,'G·Mons/吉约蒙'),
(10457,720,190,'2016年夏季'),
(10458,720,189,'条绒布'),
(10459,720,188,'纯电商(只在线上销售)'),
(10460,721,195,'薄'),
(10461,721,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10462,721,193,'商务绅士'),
(10463,721,192,'GM0020-A'),
(10464,721,191,'G·Mons/吉约蒙'),
(10465,721,190,'2016年夏季'),
(10466,721,189,'条绒布'),
(10467,721,188,'纯电商(只在线上销售)'),
(10468,722,195,'薄'),
(10469,722,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10470,722,193,'商务绅士'),
(10471,722,192,'GM0020-A'),
(10472,722,191,'G·Mons/吉约蒙'),
(10473,722,190,'2016年夏季'),
(10474,722,189,'条绒布'),
(10475,722,188,'纯电商(只在线上销售)'),
(10476,723,195,'薄'),
(10477,723,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10478,723,193,'商务绅士'),
(10479,723,192,'GM0020-A'),
(10480,723,191,'G·Mons/吉约蒙'),
(10481,723,190,'2016年夏季'),
(10482,723,189,'条绒布'),
(10483,723,188,'纯电商(只在线上销售)'),
(10484,724,195,'薄'),
(10485,724,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10486,724,193,'商务绅士'),
(10487,724,192,'GM0020-A'),
(10488,724,191,'G·Mons/吉约蒙'),
(10489,724,190,'2016年夏季'),
(10490,724,189,'条绒布'),
(10491,724,188,'纯电商(只在线上销售)'),
(10492,725,195,'薄'),
(10493,725,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10494,725,193,'商务绅士'),
(10495,725,192,'GM0020-A'),
(10496,725,191,'G·Mons/吉约蒙'),
(10497,725,190,'2016年夏季'),
(10498,725,189,'条绒布'),
(10499,725,188,'纯电商(只在线上销售)'),
(10500,726,195,'薄'),
(10501,726,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10502,726,193,'商务绅士'),
(10503,726,192,'GM0020-A'),
(10504,726,191,'G·Mons/吉约蒙'),
(10505,726,190,'2016年夏季'),
(10506,726,189,'条绒布'),
(10507,726,188,'纯电商(只在线上销售)'),
(10508,727,195,'薄'),
(10509,727,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10510,727,193,'商务绅士'),
(10511,727,192,'GM0020-A'),
(10512,727,191,'G·Mons/吉约蒙'),
(10513,727,190,'2016年夏季'),
(10514,727,189,'条绒布'),
(10515,727,188,'纯电商(只在线上销售)'),
(10516,728,195,'薄'),
(10517,728,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10518,728,193,'商务绅士'),
(10519,728,192,'GM0020-A'),
(10520,728,191,'G·Mons/吉约蒙'),
(10521,728,190,'2016年夏季'),
(10522,728,189,'条绒布'),
(10523,728,188,'纯电商(只在线上销售)'),
(10524,729,195,'薄'),
(10525,729,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10526,729,193,'商务绅士'),
(10527,729,192,'GM0020-A'),
(10528,729,191,'G·Mons/吉约蒙'),
(10529,729,190,'2016年夏季'),
(10530,729,189,'条绒布'),
(10531,729,188,'纯电商(只在线上销售)'),
(10532,730,195,'薄'),
(10533,730,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10534,730,193,'商务绅士'),
(10535,730,192,'GM0020-A'),
(10536,730,191,'G·Mons/吉约蒙'),
(10537,730,190,'2016年夏季'),
(10538,730,189,'条绒布'),
(10539,730,188,'纯电商(只在线上销售)'),
(10540,731,195,'薄'),
(10541,731,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10542,731,193,'商务绅士'),
(10543,731,192,'GM0020-A'),
(10544,731,191,'G·Mons/吉约蒙'),
(10545,731,190,'2016年夏季'),
(10546,731,189,'条绒布'),
(10547,731,188,'纯电商(只在线上销售)'),
(10548,732,195,'薄'),
(10549,732,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10550,732,193,'商务绅士'),
(10551,732,192,'GM0020-A'),
(10552,732,191,'G·Mons/吉约蒙'),
(10553,732,190,'2016年夏季'),
(10554,732,189,'条绒布'),
(10555,732,188,'纯电商(只在线上销售)'),
(10556,733,195,'薄'),
(10557,733,194,'聚酯纤维80% 粘胶纤维(粘纤)20%'),
(10558,733,193,'商务绅士'),
(10559,733,192,'GM0020-A'),
(10560,733,191,'G·Mons/吉约蒙'),
(10561,733,190,'2016年夏季'),
(10562,733,189,'条绒布'),
(10563,733,188,'纯电商(只在线上销售)'),
(10564,734,220,'日常'),
(10565,734,219,'布'),
(10566,734,218,'圆头'),
(10567,734,217,'LS39537'),
(10568,734,216,'平跟'),
(10569,734,215,'车缝线'),
(10570,734,214,'松紧带'),
(10571,734,213,'38 39 40 41 42 43 44'),
(10572,734,212,'胶粘鞋'),
(10573,734,211,'透气'),
(10574,734,210,'商场同款(线上线下都销售)'),
(10575,734,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(10576,734,208,'PLAYBOY/花花公子'),
(10577,734,207,'低跟(1-3cm)'),
(10578,734,206,'日常休闲'),
(10579,734,205,'夏季'),
(10580,734,204,'布'),
(10581,734,203,'纯色'),
(10582,734,202,'布鞋'),
(10583,734,201,'2016年夏季'),
(10584,734,200,'蓝色 棕色 灰色'),
(10585,734,199,'橡胶'),
(10586,734,198,'布鞋'),
(10587,734,197,'布'),
(10588,734,196,'休闲'),
(10589,735,220,'日常'),
(10590,735,219,'布'),
(10591,735,218,'圆头'),
(10592,735,217,'LS39537'),
(10593,735,216,'平跟'),
(10594,735,215,'车缝线'),
(10595,735,214,'松紧带'),
(10596,735,213,'38 39 40 41 42 43 44'),
(10597,735,212,'胶粘鞋'),
(10598,735,211,'透气'),
(10599,735,210,'商场同款(线上线下都销售)'),
(10600,735,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(10601,735,208,'PLAYBOY/花花公子'),
(10602,735,207,'低跟(1-3cm)'),
(10603,735,206,'日常休闲'),
(10604,735,205,'夏季'),
(10605,735,204,'布'),
(10606,735,203,'纯色'),
(10607,735,202,'布鞋'),
(10608,735,201,'2016年夏季'),
(10609,735,200,'蓝色 棕色 灰色'),
(10610,735,199,'橡胶'),
(10611,735,198,'布鞋'),
(10612,735,197,'布'),
(10613,735,196,'休闲'),
(10614,736,220,'日常'),
(10615,736,219,'布'),
(10616,736,218,'圆头'),
(10617,736,217,'LS39537'),
(10618,736,216,'平跟'),
(10619,736,215,'车缝线'),
(10620,736,214,'松紧带'),
(10621,736,213,'38 39 40 41 42 43 44'),
(10622,736,212,'胶粘鞋'),
(10623,736,211,'透气'),
(10624,736,210,'商场同款(线上线下都销售)'),
(10625,736,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(10626,736,208,'PLAYBOY/花花公子'),
(10627,736,207,'低跟(1-3cm)'),
(10628,736,206,'日常休闲'),
(10629,736,205,'夏季'),
(10630,736,204,'布'),
(10631,736,203,'纯色'),
(10632,736,202,'布鞋'),
(10633,736,201,'2016年夏季'),
(10634,736,200,'蓝色 棕色 灰色'),
(10635,736,199,'橡胶'),
(10636,736,198,'布鞋'),
(10637,736,197,'布'),
(10638,736,196,'休闲'),
(10639,737,220,'日常'),
(10640,737,219,'布'),
(10641,737,218,'圆头'),
(10642,737,217,'LS39537'),
(10643,737,216,'平跟'),
(10644,737,215,'车缝线'),
(10645,737,214,'松紧带'),
(10646,737,213,'38 39 40 41 42 43 44'),
(10647,737,212,'胶粘鞋'),
(10648,737,211,'透气'),
(10649,737,210,'商场同款(线上线下都销售)'),
(10650,737,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(10651,737,208,'PLAYBOY/花花公子'),
(10652,737,207,'低跟(1-3cm)'),
(10653,737,206,'日常休闲'),
(10654,737,205,'夏季'),
(10655,737,204,'布'),
(10656,737,203,'纯色'),
(10657,737,202,'布鞋'),
(10658,737,201,'2016年夏季'),
(10659,737,200,'蓝色 棕色 灰色'),
(10660,737,199,'橡胶'),
(10661,737,198,'布鞋'),
(10662,737,197,'布'),
(10663,737,196,'休闲'),
(10664,738,220,'日常'),
(10665,738,219,'布'),
(10666,738,218,'圆头'),
(10667,738,217,'LS39537'),
(10668,738,216,'平跟'),
(10669,738,215,'车缝线'),
(10670,738,214,'松紧带'),
(10671,738,213,'38 39 40 41 42 43 44'),
(10672,738,212,'胶粘鞋'),
(10673,738,211,'透气'),
(10674,738,210,'商场同款(线上线下都销售)'),
(10675,738,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(10676,738,208,'PLAYBOY/花花公子'),
(10677,738,207,'低跟(1-3cm)'),
(10678,738,206,'日常休闲'),
(10679,738,205,'夏季'),
(10680,738,204,'布'),
(10681,738,203,'纯色'),
(10682,738,202,'布鞋'),
(10683,738,201,'2016年夏季'),
(10684,738,200,'蓝色 棕色 灰色'),
(10685,738,199,'橡胶'),
(10686,738,198,'布鞋'),
(10687,738,197,'布'),
(10688,738,196,'休闲'),
(10689,739,220,'日常'),
(10690,739,219,'布'),
(10691,739,218,'圆头'),
(10692,739,217,'LS39537'),
(10693,739,216,'平跟'),
(10694,739,215,'车缝线'),
(10695,739,214,'松紧带'),
(10696,739,213,'38 39 40 41 42 43 44'),
(10697,739,212,'胶粘鞋'),
(10698,739,211,'透气'),
(10699,739,210,'商场同款(线上线下都销售)'),
(10700,739,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(10701,739,208,'PLAYBOY/花花公子'),
(10702,739,207,'低跟(1-3cm)'),
(10703,739,206,'日常休闲'),
(10704,739,205,'夏季'),
(10705,739,204,'布'),
(10706,739,203,'纯色'),
(10707,739,202,'布鞋'),
(10708,739,201,'2016年夏季'),
(10709,739,200,'蓝色 棕色 灰色'),
(10710,739,199,'橡胶'),
(10711,739,198,'布鞋'),
(10712,739,197,'布'),
(10713,739,196,'休闲'),
(10714,740,220,'日常'),
(10715,740,219,'布'),
(10716,740,218,'圆头'),
(10717,740,217,'LS39537'),
(10718,740,216,'平跟'),
(10719,740,215,'车缝线'),
(10720,740,214,'松紧带'),
(10721,740,213,'38 39 40 41 42 43 44'),
(10722,740,212,'胶粘鞋'),
(10723,740,211,'透气'),
(10724,740,210,'商场同款(线上线下都销售)'),
(10725,740,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(10726,740,208,'PLAYBOY/花花公子'),
(10727,740,207,'低跟(1-3cm)'),
(10728,740,206,'日常休闲'),
(10729,740,205,'夏季'),
(10730,740,204,'布'),
(10731,740,203,'纯色'),
(10732,740,202,'布鞋'),
(10733,740,201,'2016年夏季'),
(10734,740,200,'蓝色 棕色 灰色'),
(10735,740,199,'橡胶'),
(10736,740,198,'布鞋'),
(10737,740,197,'布'),
(10738,740,196,'休闲'),
(10739,741,220,'日常'),
(10740,741,219,'布'),
(10741,741,218,'圆头'),
(10742,741,217,'LS39537'),
(10743,741,216,'平跟'),
(10744,741,215,'车缝线'),
(10745,741,214,'松紧带'),
(10746,741,213,'38 39 40 41 42 43 44'),
(10747,741,212,'胶粘鞋'),
(10748,741,211,'透气'),
(10749,741,210,'商场同款(线上线下都销售)'),
(10750,741,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(10751,741,208,'PLAYBOY/花花公子'),
(10752,741,207,'低跟(1-3cm)'),
(10753,741,206,'日常休闲'),
(10754,741,205,'夏季'),
(10755,741,204,'布'),
(10756,741,203,'纯色'),
(10757,741,202,'布鞋'),
(10758,741,201,'2016年夏季'),
(10759,741,200,'蓝色 棕色 灰色'),
(10760,741,199,'橡胶'),
(10761,741,198,'布鞋'),
(10762,741,197,'布'),
(10763,741,196,'休闲'),
(10764,742,220,'日常'),
(10765,742,219,'布'),
(10766,742,218,'圆头'),
(10767,742,217,'LS39537'),
(10768,742,216,'平跟'),
(10769,742,215,'车缝线'),
(10770,742,214,'松紧带'),
(10771,742,213,'38 39 40 41 42 43 44'),
(10772,742,212,'胶粘鞋'),
(10773,742,211,'透气'),
(10774,742,210,'商场同款(线上线下都销售)'),
(10775,742,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(10776,742,208,'PLAYBOY/花花公子'),
(10777,742,207,'低跟(1-3cm)'),
(10778,742,206,'日常休闲'),
(10779,742,205,'夏季'),
(10780,742,204,'布'),
(10781,742,203,'纯色'),
(10782,742,202,'布鞋'),
(10783,742,201,'2016年夏季'),
(10784,742,200,'蓝色 棕色 灰色'),
(10785,742,199,'橡胶'),
(10786,742,198,'布鞋'),
(10787,742,197,'布'),
(10788,742,196,'休闲'),
(10789,743,220,'日常'),
(10790,743,219,'布'),
(10791,743,218,'圆头'),
(10792,743,217,'LS39537'),
(10793,743,216,'平跟'),
(10794,743,215,'车缝线'),
(10795,743,214,'松紧带'),
(10796,743,213,'38 39 40 41 42 43 44'),
(10797,743,212,'胶粘鞋'),
(10798,743,211,'透气'),
(10799,743,210,'商场同款(线上线下都销售)'),
(10800,743,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(10801,743,208,'PLAYBOY/花花公子'),
(10802,743,207,'低跟(1-3cm)'),
(10803,743,206,'日常休闲'),
(10804,743,205,'夏季'),
(10805,743,204,'布'),
(10806,743,203,'纯色'),
(10807,743,202,'布鞋'),
(10808,743,201,'2016年夏季'),
(10809,743,200,'蓝色 棕色 灰色'),
(10810,743,199,'橡胶'),
(10811,743,198,'布鞋'),
(10812,743,197,'布'),
(10813,743,196,'休闲'),
(10814,744,220,'日常'),
(10815,744,219,'布'),
(10816,744,218,'圆头'),
(10817,744,217,'LS39537'),
(10818,744,216,'平跟'),
(10819,744,215,'车缝线'),
(10820,744,214,'松紧带'),
(10821,744,213,'38 39 40 41 42 43 44'),
(10822,744,212,'胶粘鞋'),
(10823,744,211,'透气'),
(10824,744,210,'商场同款(线上线下都销售)'),
(10825,744,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(10826,744,208,'PLAYBOY/花花公子'),
(10827,744,207,'低跟(1-3cm)'),
(10828,744,206,'日常休闲'),
(10829,744,205,'夏季'),
(10830,744,204,'布'),
(10831,744,203,'纯色'),
(10832,744,202,'布鞋'),
(10833,744,201,'2016年夏季'),
(10834,744,200,'蓝色 棕色 灰色'),
(10835,744,199,'橡胶'),
(10836,744,198,'布鞋'),
(10837,744,197,'布'),
(10838,744,196,'休闲'),
(10839,745,220,'日常'),
(10840,745,219,'布'),
(10841,745,218,'圆头'),
(10842,745,217,'LS39537'),
(10843,745,216,'平跟'),
(10844,745,215,'车缝线'),
(10845,745,214,'松紧带'),
(10846,745,213,'38 39 40 41 42 43 44'),
(10847,745,212,'胶粘鞋'),
(10848,745,211,'透气'),
(10849,745,210,'商场同款(线上线下都销售)'),
(10850,745,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(10851,745,208,'PLAYBOY/花花公子'),
(10852,745,207,'低跟(1-3cm)'),
(10853,745,206,'日常休闲'),
(10854,745,205,'夏季'),
(10855,745,204,'布'),
(10856,745,203,'纯色'),
(10857,745,202,'布鞋'),
(10858,745,201,'2016年夏季'),
(10859,745,200,'蓝色 棕色 灰色'),
(10860,745,199,'橡胶'),
(10861,745,198,'布鞋'),
(10862,745,197,'布'),
(10863,745,196,'休闲'),
(10864,746,220,'日常'),
(10865,746,219,'布'),
(10866,746,218,'圆头'),
(10867,746,217,'LS39537'),
(10868,746,216,'平跟'),
(10869,746,215,'车缝线'),
(10870,746,214,'松紧带'),
(10871,746,213,'38 39 40 41 42 43 44'),
(10872,746,212,'胶粘鞋'),
(10873,746,211,'透气'),
(10874,746,210,'商场同款(线上线下都销售)'),
(10875,746,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(10876,746,208,'PLAYBOY/花花公子'),
(10877,746,207,'低跟(1-3cm)'),
(10878,746,206,'日常休闲'),
(10879,746,205,'夏季'),
(10880,746,204,'布'),
(10881,746,203,'纯色'),
(10882,746,202,'布鞋'),
(10883,746,201,'2016年夏季'),
(10884,746,200,'蓝色 棕色 灰色'),
(10885,746,199,'橡胶'),
(10886,746,198,'布鞋'),
(10887,746,197,'布'),
(10888,746,196,'休闲'),
(10889,747,220,'日常'),
(10890,747,219,'布'),
(10891,747,218,'圆头'),
(10892,747,217,'LS39537'),
(10893,747,216,'平跟'),
(10894,747,215,'车缝线'),
(10895,747,214,'松紧带'),
(10896,747,213,'38 39 40 41 42 43 44'),
(10897,747,212,'胶粘鞋'),
(10898,747,211,'透气'),
(10899,747,210,'商场同款(线上线下都销售)'),
(10900,747,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(10901,747,208,'PLAYBOY/花花公子'),
(10902,747,207,'低跟(1-3cm)'),
(10903,747,206,'日常休闲'),
(10904,747,205,'夏季'),
(10905,747,204,'布'),
(10906,747,203,'纯色'),
(10907,747,202,'布鞋'),
(10908,747,201,'2016年夏季'),
(10909,747,200,'蓝色 棕色 灰色'),
(10910,747,199,'橡胶'),
(10911,747,198,'布鞋'),
(10912,747,197,'布'),
(10913,747,196,'休闲'),
(10914,748,220,'日常'),
(10915,748,219,'布'),
(10916,748,218,'圆头'),
(10917,748,217,'LS39537'),
(10918,748,216,'平跟'),
(10919,748,215,'车缝线'),
(10920,748,214,'松紧带'),
(10921,748,213,'38 39 40 41 42 43 44'),
(10922,748,212,'胶粘鞋'),
(10923,748,211,'透气'),
(10924,748,210,'商场同款(线上线下都销售)'),
(10925,748,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(10926,748,208,'PLAYBOY/花花公子'),
(10927,748,207,'低跟(1-3cm)'),
(10928,748,206,'日常休闲'),
(10929,748,205,'夏季'),
(10930,748,204,'布'),
(10931,748,203,'纯色'),
(10932,748,202,'布鞋'),
(10933,748,201,'2016年夏季'),
(10934,748,200,'蓝色 棕色 灰色'),
(10935,748,199,'橡胶'),
(10936,748,198,'布鞋'),
(10937,748,197,'布'),
(10938,748,196,'休闲'),
(10939,749,220,'日常'),
(10940,749,219,'布'),
(10941,749,218,'圆头'),
(10942,749,217,'LS39537'),
(10943,749,216,'平跟'),
(10944,749,215,'车缝线'),
(10945,749,214,'松紧带'),
(10946,749,213,'38 39 40 41 42 43 44'),
(10947,749,212,'胶粘鞋'),
(10948,749,211,'透气'),
(10949,749,210,'商场同款(线上线下都销售)'),
(10950,749,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(10951,749,208,'PLAYBOY/花花公子'),
(10952,749,207,'低跟(1-3cm)'),
(10953,749,206,'日常休闲'),
(10954,749,205,'夏季'),
(10955,749,204,'布'),
(10956,749,203,'纯色'),
(10957,749,202,'布鞋'),
(10958,749,201,'2016年夏季'),
(10959,749,200,'蓝色 棕色 灰色'),
(10960,749,199,'橡胶'),
(10961,749,198,'布鞋'),
(10962,749,197,'布'),
(10963,749,196,'休闲'),
(10964,750,220,'日常'),
(10965,750,219,'布'),
(10966,750,218,'圆头'),
(10967,750,217,'LS39537'),
(10968,750,216,'平跟'),
(10969,750,215,'车缝线'),
(10970,750,214,'松紧带'),
(10971,750,213,'38 39 40 41 42 43 44'),
(10972,750,212,'胶粘鞋'),
(10973,750,211,'透气'),
(10974,750,210,'商场同款(线上线下都销售)'),
(10975,750,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(10976,750,208,'PLAYBOY/花花公子'),
(10977,750,207,'低跟(1-3cm)'),
(10978,750,206,'日常休闲'),
(10979,750,205,'夏季'),
(10980,750,204,'布'),
(10981,750,203,'纯色'),
(10982,750,202,'布鞋'),
(10983,750,201,'2016年夏季'),
(10984,750,200,'蓝色 棕色 灰色'),
(10985,750,199,'橡胶'),
(10986,750,198,'布鞋'),
(10987,750,197,'布'),
(10988,750,196,'休闲'),
(10989,751,220,'日常'),
(10990,751,219,'布'),
(10991,751,218,'圆头'),
(10992,751,217,'LS39537'),
(10993,751,216,'平跟'),
(10994,751,215,'车缝线'),
(10995,751,214,'松紧带'),
(10996,751,213,'38 39 40 41 42 43 44'),
(10997,751,212,'胶粘鞋'),
(10998,751,211,'透气'),
(10999,751,210,'商场同款(线上线下都销售)'),
(11000,751,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11001,751,208,'PLAYBOY/花花公子'),
(11002,751,207,'低跟(1-3cm)'),
(11003,751,206,'日常休闲'),
(11004,751,205,'夏季'),
(11005,751,204,'布'),
(11006,751,203,'纯色'),
(11007,751,202,'布鞋'),
(11008,751,201,'2016年夏季'),
(11009,751,200,'蓝色 棕色 灰色'),
(11010,751,199,'橡胶'),
(11011,751,198,'布鞋'),
(11012,751,197,'布'),
(11013,751,196,'休闲'),
(11014,752,220,'日常'),
(11015,752,219,'布'),
(11016,752,218,'圆头'),
(11017,752,217,'LS39537'),
(11018,752,216,'平跟'),
(11019,752,215,'车缝线'),
(11020,752,214,'松紧带'),
(11021,752,213,'38 39 40 41 42 43 44'),
(11022,752,212,'胶粘鞋'),
(11023,752,211,'透气'),
(11024,752,210,'商场同款(线上线下都销售)'),
(11025,752,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11026,752,208,'PLAYBOY/花花公子'),
(11027,752,207,'低跟(1-3cm)'),
(11028,752,206,'日常休闲'),
(11029,752,205,'夏季'),
(11030,752,204,'布'),
(11031,752,203,'纯色'),
(11032,752,202,'布鞋'),
(11033,752,201,'2016年夏季'),
(11034,752,200,'蓝色 棕色 灰色'),
(11035,752,199,'橡胶'),
(11036,752,198,'布鞋'),
(11037,752,197,'布'),
(11038,752,196,'休闲'),
(11039,753,220,'日常'),
(11040,753,219,'布'),
(11041,753,218,'圆头'),
(11042,753,217,'LS39537'),
(11043,753,216,'平跟'),
(11044,753,215,'车缝线'),
(11045,753,214,'松紧带'),
(11046,753,213,'38 39 40 41 42 43 44'),
(11047,753,212,'胶粘鞋'),
(11048,753,211,'透气'),
(11049,753,210,'商场同款(线上线下都销售)'),
(11050,753,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11051,753,208,'PLAYBOY/花花公子'),
(11052,753,207,'低跟(1-3cm)'),
(11053,753,206,'日常休闲'),
(11054,753,205,'夏季'),
(11055,753,204,'布'),
(11056,753,203,'纯色'),
(11057,753,202,'布鞋'),
(11058,753,201,'2016年夏季'),
(11059,753,200,'蓝色 棕色 灰色'),
(11060,753,199,'橡胶'),
(11061,753,198,'布鞋'),
(11062,753,197,'布'),
(11063,753,196,'休闲'),
(11064,754,220,'日常'),
(11065,754,219,'布'),
(11066,754,218,'圆头'),
(11067,754,217,'LS39537'),
(11068,754,216,'平跟'),
(11069,754,215,'车缝线'),
(11070,754,214,'松紧带'),
(11071,754,213,'38 39 40 41 42 43 44'),
(11072,754,212,'胶粘鞋'),
(11073,754,211,'透气'),
(11074,754,210,'商场同款(线上线下都销售)'),
(11075,754,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11076,754,208,'PLAYBOY/花花公子'),
(11077,754,207,'低跟(1-3cm)'),
(11078,754,206,'日常休闲'),
(11079,754,205,'夏季'),
(11080,754,204,'布'),
(11081,754,203,'纯色'),
(11082,754,202,'布鞋'),
(11083,754,201,'2016年夏季'),
(11084,754,200,'蓝色 棕色 灰色'),
(11085,754,199,'橡胶'),
(11086,754,198,'布鞋'),
(11087,754,197,'布'),
(11088,754,196,'休闲'),
(11089,755,220,'日常'),
(11090,755,219,'布'),
(11091,755,218,'圆头'),
(11092,755,217,'LS39537'),
(11093,755,216,'平跟'),
(11094,755,215,'车缝线'),
(11095,755,214,'松紧带'),
(11096,755,213,'38 39 40 41 42 43 44'),
(11097,755,212,'胶粘鞋'),
(11098,755,211,'透气'),
(11099,755,210,'商场同款(线上线下都销售)'),
(11100,755,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11101,755,208,'PLAYBOY/花花公子'),
(11102,755,207,'低跟(1-3cm)'),
(11103,755,206,'日常休闲'),
(11104,755,205,'夏季'),
(11105,755,204,'布'),
(11106,755,203,'纯色'),
(11107,755,202,'布鞋'),
(11108,755,201,'2016年夏季'),
(11109,755,200,'蓝色 棕色 灰色'),
(11110,755,199,'橡胶'),
(11111,755,198,'布鞋'),
(11112,755,197,'布'),
(11113,755,196,'休闲'),
(11114,756,220,'日常'),
(11115,756,219,'布'),
(11116,756,218,'圆头'),
(11117,756,217,'LS39537'),
(11118,756,216,'平跟'),
(11119,756,215,'车缝线'),
(11120,756,214,'松紧带'),
(11121,756,213,'38 39 40 41 42 43 44'),
(11122,756,212,'胶粘鞋'),
(11123,756,211,'透气'),
(11124,756,210,'商场同款(线上线下都销售)'),
(11125,756,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11126,756,208,'PLAYBOY/花花公子'),
(11127,756,207,'低跟(1-3cm)'),
(11128,756,206,'日常休闲'),
(11129,756,205,'夏季'),
(11130,756,204,'布'),
(11131,756,203,'纯色'),
(11132,756,202,'布鞋'),
(11133,756,201,'2016年夏季'),
(11134,756,200,'蓝色 棕色 灰色'),
(11135,756,199,'橡胶'),
(11136,756,198,'布鞋'),
(11137,756,197,'布'),
(11138,756,196,'休闲'),
(11139,757,220,'日常'),
(11140,757,219,'布'),
(11141,757,218,'圆头'),
(11142,757,217,'LS39537'),
(11143,757,216,'平跟'),
(11144,757,215,'车缝线'),
(11145,757,214,'松紧带'),
(11146,757,213,'38 39 40 41 42 43 44'),
(11147,757,212,'胶粘鞋'),
(11148,757,211,'透气'),
(11149,757,210,'商场同款(线上线下都销售)'),
(11150,757,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11151,757,208,'PLAYBOY/花花公子'),
(11152,757,207,'低跟(1-3cm)'),
(11153,757,206,'日常休闲'),
(11154,757,205,'夏季'),
(11155,757,204,'布'),
(11156,757,203,'纯色'),
(11157,757,202,'布鞋'),
(11158,757,201,'2016年夏季'),
(11159,757,200,'蓝色 棕色 灰色'),
(11160,757,199,'橡胶'),
(11161,757,198,'布鞋'),
(11162,757,197,'布'),
(11163,757,196,'休闲'),
(11164,758,220,'日常'),
(11165,758,219,'布'),
(11166,758,218,'圆头'),
(11167,758,217,'LS39537'),
(11168,758,216,'平跟'),
(11169,758,215,'车缝线'),
(11170,758,214,'松紧带'),
(11171,758,213,'38 39 40 41 42 43 44'),
(11172,758,212,'胶粘鞋'),
(11173,758,211,'透气'),
(11174,758,210,'商场同款(线上线下都销售)'),
(11175,758,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11176,758,208,'PLAYBOY/花花公子'),
(11177,758,207,'低跟(1-3cm)'),
(11178,758,206,'日常休闲'),
(11179,758,205,'夏季'),
(11180,758,204,'布'),
(11181,758,203,'纯色'),
(11182,758,202,'布鞋'),
(11183,758,201,'2016年夏季'),
(11184,758,200,'蓝色 棕色 灰色'),
(11185,758,199,'橡胶'),
(11186,758,198,'布鞋'),
(11187,758,197,'布'),
(11188,758,196,'休闲'),
(11189,759,220,'日常'),
(11190,759,219,'布'),
(11191,759,218,'圆头'),
(11192,759,217,'LS39537'),
(11193,759,216,'平跟'),
(11194,759,215,'车缝线'),
(11195,759,214,'松紧带'),
(11196,759,213,'38 39 40 41 42 43 44'),
(11197,759,212,'胶粘鞋'),
(11198,759,211,'透气'),
(11199,759,210,'商场同款(线上线下都销售)'),
(11200,759,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11201,759,208,'PLAYBOY/花花公子'),
(11202,759,207,'低跟(1-3cm)'),
(11203,759,206,'日常休闲'),
(11204,759,205,'夏季'),
(11205,759,204,'布'),
(11206,759,203,'纯色'),
(11207,759,202,'布鞋'),
(11208,759,201,'2016年夏季'),
(11209,759,200,'蓝色 棕色 灰色'),
(11210,759,199,'橡胶'),
(11211,759,198,'布鞋'),
(11212,759,197,'布'),
(11213,759,196,'休闲'),
(11214,760,220,'日常'),
(11215,760,219,'布'),
(11216,760,218,'圆头'),
(11217,760,217,'LS39537'),
(11218,760,216,'平跟'),
(11219,760,215,'车缝线'),
(11220,760,214,'松紧带'),
(11221,760,213,'38 39 40 41 42 43 44'),
(11222,760,212,'胶粘鞋'),
(11223,760,211,'透气'),
(11224,760,210,'商场同款(线上线下都销售)'),
(11225,760,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11226,760,208,'PLAYBOY/花花公子'),
(11227,760,207,'低跟(1-3cm)'),
(11228,760,206,'日常休闲'),
(11229,760,205,'夏季'),
(11230,760,204,'布'),
(11231,760,203,'纯色'),
(11232,760,202,'布鞋'),
(11233,760,201,'2016年夏季'),
(11234,760,200,'蓝色 棕色 灰色'),
(11235,760,199,'橡胶'),
(11236,760,198,'布鞋'),
(11237,760,197,'布'),
(11238,760,196,'休闲'),
(11239,761,220,'日常'),
(11240,761,219,'布'),
(11241,761,218,'圆头'),
(11242,761,217,'LS39537'),
(11243,761,216,'平跟'),
(11244,761,215,'车缝线'),
(11245,761,214,'松紧带'),
(11246,761,213,'38 39 40 41 42 43 44'),
(11247,761,212,'胶粘鞋'),
(11248,761,211,'透气'),
(11249,761,210,'商场同款(线上线下都销售)'),
(11250,761,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11251,761,208,'PLAYBOY/花花公子'),
(11252,761,207,'低跟(1-3cm)'),
(11253,761,206,'日常休闲'),
(11254,761,205,'夏季'),
(11255,761,204,'布'),
(11256,761,203,'纯色'),
(11257,761,202,'布鞋'),
(11258,761,201,'2016年夏季'),
(11259,761,200,'蓝色 棕色 灰色'),
(11260,761,199,'橡胶'),
(11261,761,198,'布鞋'),
(11262,761,197,'布'),
(11263,761,196,'休闲'),
(11264,762,220,'日常'),
(11265,762,219,'布'),
(11266,762,218,'圆头'),
(11267,762,217,'LS39537'),
(11268,762,216,'平跟'),
(11269,762,215,'车缝线'),
(11270,762,214,'松紧带'),
(11271,762,213,'38 39 40 41 42 43 44'),
(11272,762,212,'胶粘鞋'),
(11273,762,211,'透气'),
(11274,762,210,'商场同款(线上线下都销售)'),
(11275,762,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11276,762,208,'PLAYBOY/花花公子'),
(11277,762,207,'低跟(1-3cm)'),
(11278,762,206,'日常休闲'),
(11279,762,205,'夏季'),
(11280,762,204,'布'),
(11281,762,203,'纯色'),
(11282,762,202,'布鞋'),
(11283,762,201,'2016年夏季'),
(11284,762,200,'蓝色 棕色 灰色'),
(11285,762,199,'橡胶'),
(11286,762,198,'布鞋'),
(11287,762,197,'布'),
(11288,762,196,'休闲'),
(11289,763,220,'日常'),
(11290,763,219,'布'),
(11291,763,218,'圆头'),
(11292,763,217,'LS39537'),
(11293,763,216,'平跟'),
(11294,763,215,'车缝线'),
(11295,763,214,'松紧带'),
(11296,763,213,'38 39 40 41 42 43 44'),
(11297,763,212,'胶粘鞋'),
(11298,763,211,'透气'),
(11299,763,210,'商场同款(线上线下都销售)'),
(11300,763,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11301,763,208,'PLAYBOY/花花公子'),
(11302,763,207,'低跟(1-3cm)'),
(11303,763,206,'日常休闲'),
(11304,763,205,'夏季'),
(11305,763,204,'布'),
(11306,763,203,'纯色'),
(11307,763,202,'布鞋'),
(11308,763,201,'2016年夏季'),
(11309,763,200,'蓝色 棕色 灰色'),
(11310,763,199,'橡胶'),
(11311,763,198,'布鞋'),
(11312,763,197,'布'),
(11313,763,196,'休闲'),
(11314,764,220,'日常'),
(11315,764,219,'布'),
(11316,764,218,'圆头'),
(11317,764,217,'LS39537'),
(11318,764,216,'平跟'),
(11319,764,215,'车缝线'),
(11320,764,214,'松紧带'),
(11321,764,213,'38 39 40 41 42 43 44'),
(11322,764,212,'胶粘鞋'),
(11323,764,211,'透气'),
(11324,764,210,'商场同款(线上线下都销售)'),
(11325,764,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11326,764,208,'PLAYBOY/花花公子'),
(11327,764,207,'低跟(1-3cm)'),
(11328,764,206,'日常休闲'),
(11329,764,205,'夏季'),
(11330,764,204,'布'),
(11331,764,203,'纯色'),
(11332,764,202,'布鞋'),
(11333,764,201,'2016年夏季'),
(11334,764,200,'蓝色 棕色 灰色'),
(11335,764,199,'橡胶'),
(11336,764,198,'布鞋'),
(11337,764,197,'布'),
(11338,764,196,'休闲'),
(11339,765,220,'日常'),
(11340,765,219,'布'),
(11341,765,218,'圆头'),
(11342,765,217,'LS39537'),
(11343,765,216,'平跟'),
(11344,765,215,'车缝线'),
(11345,765,214,'松紧带'),
(11346,765,213,'38 39 40 41 42 43 44'),
(11347,765,212,'胶粘鞋'),
(11348,765,211,'透气'),
(11349,765,210,'商场同款(线上线下都销售)'),
(11350,765,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11351,765,208,'PLAYBOY/花花公子'),
(11352,765,207,'低跟(1-3cm)'),
(11353,765,206,'日常休闲'),
(11354,765,205,'夏季'),
(11355,765,204,'布'),
(11356,765,203,'纯色'),
(11357,765,202,'布鞋'),
(11358,765,201,'2016年夏季'),
(11359,765,200,'蓝色 棕色 灰色'),
(11360,765,199,'橡胶'),
(11361,765,198,'布鞋'),
(11362,765,197,'布'),
(11363,765,196,'休闲'),
(11364,766,220,'日常'),
(11365,766,219,'布'),
(11366,766,218,'圆头'),
(11367,766,217,'LS39537'),
(11368,766,216,'平跟'),
(11369,766,215,'车缝线'),
(11370,766,214,'松紧带'),
(11371,766,213,'38 39 40 41 42 43 44'),
(11372,766,212,'胶粘鞋'),
(11373,766,211,'透气'),
(11374,766,210,'商场同款(线上线下都销售)'),
(11375,766,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11376,766,208,'PLAYBOY/花花公子'),
(11377,766,207,'低跟(1-3cm)'),
(11378,766,206,'日常休闲'),
(11379,766,205,'夏季'),
(11380,766,204,'布'),
(11381,766,203,'纯色'),
(11382,766,202,'布鞋'),
(11383,766,201,'2016年夏季'),
(11384,766,200,'蓝色 棕色 灰色'),
(11385,766,199,'橡胶'),
(11386,766,198,'布鞋'),
(11387,766,197,'布'),
(11388,766,196,'休闲'),
(11389,767,220,'日常'),
(11390,767,219,'布'),
(11391,767,218,'圆头'),
(11392,767,217,'LS39537'),
(11393,767,216,'平跟'),
(11394,767,215,'车缝线'),
(11395,767,214,'松紧带'),
(11396,767,213,'38 39 40 41 42 43 44'),
(11397,767,212,'胶粘鞋'),
(11398,767,211,'透气'),
(11399,767,210,'商场同款(线上线下都销售)'),
(11400,767,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11401,767,208,'PLAYBOY/花花公子'),
(11402,767,207,'低跟(1-3cm)'),
(11403,767,206,'日常休闲'),
(11404,767,205,'夏季'),
(11405,767,204,'布'),
(11406,767,203,'纯色'),
(11407,767,202,'布鞋'),
(11408,767,201,'2016年夏季'),
(11409,767,200,'蓝色 棕色 灰色'),
(11410,767,199,'橡胶'),
(11411,767,198,'布鞋'),
(11412,767,197,'布'),
(11413,767,196,'休闲'),
(11414,768,220,'日常'),
(11415,768,219,'布'),
(11416,768,218,'圆头'),
(11417,768,217,'LS39537'),
(11418,768,216,'平跟'),
(11419,768,215,'车缝线'),
(11420,768,214,'松紧带'),
(11421,768,213,'38 39 40 41 42 43 44'),
(11422,768,212,'胶粘鞋'),
(11423,768,211,'透气'),
(11424,768,210,'商场同款(线上线下都销售)'),
(11425,768,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11426,768,208,'PLAYBOY/花花公子'),
(11427,768,207,'低跟(1-3cm)'),
(11428,768,206,'日常休闲'),
(11429,768,205,'夏季'),
(11430,768,204,'布'),
(11431,768,203,'纯色'),
(11432,768,202,'布鞋'),
(11433,768,201,'2016年夏季'),
(11434,768,200,'蓝色 棕色 灰色'),
(11435,768,199,'橡胶'),
(11436,768,198,'布鞋'),
(11437,768,197,'布'),
(11438,768,196,'休闲'),
(11439,769,220,'日常'),
(11440,769,219,'布'),
(11441,769,218,'圆头'),
(11442,769,217,'LS39537'),
(11443,769,216,'平跟'),
(11444,769,215,'车缝线'),
(11445,769,214,'松紧带'),
(11446,769,213,'38 39 40 41 42 43 44'),
(11447,769,212,'胶粘鞋'),
(11448,769,211,'透气'),
(11449,769,210,'商场同款(线上线下都销售)'),
(11450,769,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11451,769,208,'PLAYBOY/花花公子'),
(11452,769,207,'低跟(1-3cm)'),
(11453,769,206,'日常休闲'),
(11454,769,205,'夏季'),
(11455,769,204,'布'),
(11456,769,203,'纯色'),
(11457,769,202,'布鞋'),
(11458,769,201,'2016年夏季'),
(11459,769,200,'蓝色 棕色 灰色'),
(11460,769,199,'橡胶'),
(11461,769,198,'布鞋'),
(11462,769,197,'布'),
(11463,769,196,'休闲'),
(11464,770,220,'日常'),
(11465,770,219,'布'),
(11466,770,218,'圆头'),
(11467,770,217,'LS39537'),
(11468,770,216,'平跟'),
(11469,770,215,'车缝线'),
(11470,770,214,'松紧带'),
(11471,770,213,'38 39 40 41 42 43 44'),
(11472,770,212,'胶粘鞋'),
(11473,770,211,'透气'),
(11474,770,210,'商场同款(线上线下都销售)'),
(11475,770,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11476,770,208,'PLAYBOY/花花公子'),
(11477,770,207,'低跟(1-3cm)'),
(11478,770,206,'日常休闲'),
(11479,770,205,'夏季'),
(11480,770,204,'布'),
(11481,770,203,'纯色'),
(11482,770,202,'布鞋'),
(11483,770,201,'2016年夏季'),
(11484,770,200,'蓝色 棕色 灰色'),
(11485,770,199,'橡胶'),
(11486,770,198,'布鞋'),
(11487,770,197,'布'),
(11488,770,196,'休闲'),
(11489,771,220,'日常'),
(11490,771,219,'布'),
(11491,771,218,'圆头'),
(11492,771,217,'LS39537'),
(11493,771,216,'平跟'),
(11494,771,215,'车缝线'),
(11495,771,214,'松紧带'),
(11496,771,213,'38 39 40 41 42 43 44'),
(11497,771,212,'胶粘鞋'),
(11498,771,211,'透气'),
(11499,771,210,'商场同款(线上线下都销售)'),
(11500,771,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11501,771,208,'PLAYBOY/花花公子'),
(11502,771,207,'低跟(1-3cm)'),
(11503,771,206,'日常休闲'),
(11504,771,205,'夏季'),
(11505,771,204,'布'),
(11506,771,203,'纯色'),
(11507,771,202,'布鞋'),
(11508,771,201,'2016年夏季'),
(11509,771,200,'蓝色 棕色 灰色'),
(11510,771,199,'橡胶'),
(11511,771,198,'布鞋'),
(11512,771,197,'布'),
(11513,771,196,'休闲'),
(11514,772,220,'日常'),
(11515,772,219,'布'),
(11516,772,218,'圆头'),
(11517,772,217,'LS39537'),
(11518,772,216,'平跟'),
(11519,772,215,'车缝线'),
(11520,772,214,'松紧带'),
(11521,772,213,'38 39 40 41 42 43 44'),
(11522,772,212,'胶粘鞋'),
(11523,772,211,'透气'),
(11524,772,210,'商场同款(线上线下都销售)'),
(11525,772,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11526,772,208,'PLAYBOY/花花公子'),
(11527,772,207,'低跟(1-3cm)'),
(11528,772,206,'日常休闲'),
(11529,772,205,'夏季'),
(11530,772,204,'布'),
(11531,772,203,'纯色'),
(11532,772,202,'布鞋'),
(11533,772,201,'2016年夏季'),
(11534,772,200,'蓝色 棕色 灰色'),
(11535,772,199,'橡胶'),
(11536,772,198,'布鞋'),
(11537,772,197,'布'),
(11538,772,196,'休闲'),
(11539,773,220,'日常'),
(11540,773,219,'布'),
(11541,773,218,'圆头'),
(11542,773,217,'LS39537'),
(11543,773,216,'平跟'),
(11544,773,215,'车缝线'),
(11545,773,214,'松紧带'),
(11546,773,213,'38 39 40 41 42 43 44'),
(11547,773,212,'胶粘鞋'),
(11548,773,211,'透气'),
(11549,773,210,'商场同款(线上线下都销售)'),
(11550,773,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11551,773,208,'PLAYBOY/花花公子'),
(11552,773,207,'低跟(1-3cm)'),
(11553,773,206,'日常休闲'),
(11554,773,205,'夏季'),
(11555,773,204,'布'),
(11556,773,203,'纯色'),
(11557,773,202,'布鞋'),
(11558,773,201,'2016年夏季'),
(11559,773,200,'蓝色 棕色 灰色'),
(11560,773,199,'橡胶'),
(11561,773,198,'布鞋'),
(11562,773,197,'布'),
(11563,773,196,'休闲'),
(11564,774,220,'日常'),
(11565,774,219,'布'),
(11566,774,218,'圆头'),
(11567,774,217,'LS39537'),
(11568,774,216,'平跟'),
(11569,774,215,'车缝线'),
(11570,774,214,'松紧带'),
(11571,774,213,'38 39 40 41 42 43 44'),
(11572,774,212,'胶粘鞋'),
(11573,774,211,'透气'),
(11574,774,210,'商场同款(线上线下都销售)'),
(11575,774,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11576,774,208,'PLAYBOY/花花公子'),
(11577,774,207,'低跟(1-3cm)'),
(11578,774,206,'日常休闲'),
(11579,774,205,'夏季'),
(11580,774,204,'布'),
(11581,774,203,'纯色'),
(11582,774,202,'布鞋'),
(11583,774,201,'2016年夏季'),
(11584,774,200,'蓝色 棕色 灰色'),
(11585,774,199,'橡胶'),
(11586,774,198,'布鞋'),
(11587,774,197,'布'),
(11588,774,196,'休闲'),
(11589,775,220,'日常'),
(11590,775,219,'布'),
(11591,775,218,'圆头'),
(11592,775,217,'LS39537'),
(11593,775,216,'平跟'),
(11594,775,215,'车缝线'),
(11595,775,214,'松紧带'),
(11596,775,213,'38 39 40 41 42 43 44'),
(11597,775,212,'胶粘鞋'),
(11598,775,211,'透气'),
(11599,775,210,'商场同款(线上线下都销售)'),
(11600,775,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11601,775,208,'PLAYBOY/花花公子'),
(11602,775,207,'低跟(1-3cm)'),
(11603,775,206,'日常休闲'),
(11604,775,205,'夏季'),
(11605,775,204,'布'),
(11606,775,203,'纯色'),
(11607,775,202,'布鞋'),
(11608,775,201,'2016年夏季'),
(11609,775,200,'蓝色 棕色 灰色'),
(11610,775,199,'橡胶'),
(11611,775,198,'布鞋'),
(11612,775,197,'布'),
(11613,775,196,'休闲'),
(11614,776,220,'日常'),
(11615,776,219,'布'),
(11616,776,218,'圆头'),
(11617,776,217,'LS39537'),
(11618,776,216,'平跟'),
(11619,776,215,'车缝线'),
(11620,776,214,'松紧带'),
(11621,776,213,'38 39 40 41 42 43 44'),
(11622,776,212,'胶粘鞋'),
(11623,776,211,'透气'),
(11624,776,210,'商场同款(线上线下都销售)'),
(11625,776,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11626,776,208,'PLAYBOY/花花公子'),
(11627,776,207,'低跟(1-3cm)'),
(11628,776,206,'日常休闲'),
(11629,776,205,'夏季'),
(11630,776,204,'布'),
(11631,776,203,'纯色'),
(11632,776,202,'布鞋'),
(11633,776,201,'2016年夏季'),
(11634,776,200,'蓝色 棕色 灰色'),
(11635,776,199,'橡胶'),
(11636,776,198,'布鞋'),
(11637,776,197,'布'),
(11638,776,196,'休闲'),
(11639,777,220,'日常'),
(11640,777,219,'布'),
(11641,777,218,'圆头'),
(11642,777,217,'LS39537'),
(11643,777,216,'平跟'),
(11644,777,215,'车缝线'),
(11645,777,214,'松紧带'),
(11646,777,213,'38 39 40 41 42 43 44'),
(11647,777,212,'胶粘鞋'),
(11648,777,211,'透气'),
(11649,777,210,'商场同款(线上线下都销售)'),
(11650,777,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11651,777,208,'PLAYBOY/花花公子'),
(11652,777,207,'低跟(1-3cm)'),
(11653,777,206,'日常休闲'),
(11654,777,205,'夏季'),
(11655,777,204,'布'),
(11656,777,203,'纯色'),
(11657,777,202,'布鞋'),
(11658,777,201,'2016年夏季'),
(11659,777,200,'蓝色 棕色 灰色'),
(11660,777,199,'橡胶'),
(11661,777,198,'布鞋'),
(11662,777,197,'布'),
(11663,777,196,'休闲'),
(11664,778,220,'日常'),
(11665,778,219,'布'),
(11666,778,218,'圆头'),
(11667,778,217,'LS39537'),
(11668,778,216,'平跟'),
(11669,778,215,'车缝线'),
(11670,778,214,'松紧带'),
(11671,778,213,'38 39 40 41 42 43 44'),
(11672,778,212,'胶粘鞋'),
(11673,778,211,'透气'),
(11674,778,210,'商场同款(线上线下都销售)'),
(11675,778,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11676,778,208,'PLAYBOY/花花公子'),
(11677,778,207,'低跟(1-3cm)'),
(11678,778,206,'日常休闲'),
(11679,778,205,'夏季'),
(11680,778,204,'布'),
(11681,778,203,'纯色'),
(11682,778,202,'布鞋'),
(11683,778,201,'2016年夏季'),
(11684,778,200,'蓝色 棕色 灰色'),
(11685,778,199,'橡胶'),
(11686,778,198,'布鞋'),
(11687,778,197,'布'),
(11688,778,196,'休闲'),
(11689,779,220,'日常'),
(11690,779,219,'布'),
(11691,779,218,'圆头'),
(11692,779,217,'LS39537'),
(11693,779,216,'平跟'),
(11694,779,215,'车缝线'),
(11695,779,214,'松紧带'),
(11696,779,213,'38 39 40 41 42 43 44'),
(11697,779,212,'胶粘鞋'),
(11698,779,211,'透气'),
(11699,779,210,'商场同款(线上线下都销售)'),
(11700,779,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11701,779,208,'PLAYBOY/花花公子'),
(11702,779,207,'低跟(1-3cm)'),
(11703,779,206,'日常休闲'),
(11704,779,205,'夏季'),
(11705,779,204,'布'),
(11706,779,203,'纯色'),
(11707,779,202,'布鞋'),
(11708,779,201,'2016年夏季'),
(11709,779,200,'蓝色 棕色 灰色'),
(11710,779,199,'橡胶'),
(11711,779,198,'布鞋'),
(11712,779,197,'布'),
(11713,779,196,'休闲'),
(11714,780,220,'日常'),
(11715,780,219,'布'),
(11716,780,218,'圆头'),
(11717,780,217,'LS39537'),
(11718,780,216,'平跟'),
(11719,780,215,'车缝线'),
(11720,780,214,'松紧带'),
(11721,780,213,'38 39 40 41 42 43 44'),
(11722,780,212,'胶粘鞋'),
(11723,780,211,'透气'),
(11724,780,210,'商场同款(线上线下都销售)'),
(11725,780,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11726,780,208,'PLAYBOY/花花公子'),
(11727,780,207,'低跟(1-3cm)'),
(11728,780,206,'日常休闲'),
(11729,780,205,'夏季'),
(11730,780,204,'布'),
(11731,780,203,'纯色'),
(11732,780,202,'布鞋'),
(11733,780,201,'2016年夏季'),
(11734,780,200,'蓝色 棕色 灰色'),
(11735,780,199,'橡胶'),
(11736,780,198,'布鞋'),
(11737,780,197,'布'),
(11738,780,196,'休闲'),
(11739,781,220,'日常'),
(11740,781,219,'布'),
(11741,781,218,'圆头'),
(11742,781,217,'LS39537'),
(11743,781,216,'平跟'),
(11744,781,215,'车缝线'),
(11745,781,214,'松紧带'),
(11746,781,213,'38 39 40 41 42 43 44'),
(11747,781,212,'胶粘鞋'),
(11748,781,211,'透气'),
(11749,781,210,'商场同款(线上线下都销售)'),
(11750,781,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11751,781,208,'PLAYBOY/花花公子'),
(11752,781,207,'低跟(1-3cm)'),
(11753,781,206,'日常休闲'),
(11754,781,205,'夏季'),
(11755,781,204,'布'),
(11756,781,203,'纯色'),
(11757,781,202,'布鞋'),
(11758,781,201,'2016年夏季'),
(11759,781,200,'蓝色 棕色 灰色'),
(11760,781,199,'橡胶'),
(11761,781,198,'布鞋'),
(11762,781,197,'布'),
(11763,781,196,'休闲'),
(11764,782,220,'日常'),
(11765,782,219,'布'),
(11766,782,218,'圆头'),
(11767,782,217,'LS39537'),
(11768,782,216,'平跟'),
(11769,782,215,'车缝线'),
(11770,782,214,'松紧带'),
(11771,782,213,'38 39 40 41 42 43 44'),
(11772,782,212,'胶粘鞋'),
(11773,782,211,'透气'),
(11774,782,210,'商场同款(线上线下都销售)'),
(11775,782,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11776,782,208,'PLAYBOY/花花公子'),
(11777,782,207,'低跟(1-3cm)'),
(11778,782,206,'日常休闲'),
(11779,782,205,'夏季'),
(11780,782,204,'布'),
(11781,782,203,'纯色'),
(11782,782,202,'布鞋'),
(11783,782,201,'2016年夏季'),
(11784,782,200,'蓝色 棕色 灰色'),
(11785,782,199,'橡胶'),
(11786,782,198,'布鞋'),
(11787,782,197,'布'),
(11788,782,196,'休闲'),
(11789,783,220,'日常'),
(11790,783,219,'布'),
(11791,783,218,'圆头'),
(11792,783,217,'LS39537'),
(11793,783,216,'平跟'),
(11794,783,215,'车缝线'),
(11795,783,214,'松紧带'),
(11796,783,213,'38 39 40 41 42 43 44'),
(11797,783,212,'胶粘鞋'),
(11798,783,211,'透气'),
(11799,783,210,'商场同款(线上线下都销售)'),
(11800,783,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11801,783,208,'PLAYBOY/花花公子'),
(11802,783,207,'低跟(1-3cm)'),
(11803,783,206,'日常休闲'),
(11804,783,205,'夏季'),
(11805,783,204,'布'),
(11806,783,203,'纯色'),
(11807,783,202,'布鞋'),
(11808,783,201,'2016年夏季'),
(11809,783,200,'蓝色 棕色 灰色'),
(11810,783,199,'橡胶'),
(11811,783,198,'布鞋'),
(11812,783,197,'布'),
(11813,783,196,'休闲'),
(11814,784,220,'日常'),
(11815,784,219,'布'),
(11816,784,218,'圆头'),
(11817,784,217,'LS39537'),
(11818,784,216,'平跟'),
(11819,784,215,'车缝线'),
(11820,784,214,'松紧带'),
(11821,784,213,'38 39 40 41 42 43 44'),
(11822,784,212,'胶粘鞋'),
(11823,784,211,'透气'),
(11824,784,210,'商场同款(线上线下都销售)'),
(11825,784,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11826,784,208,'PLAYBOY/花花公子'),
(11827,784,207,'低跟(1-3cm)'),
(11828,784,206,'日常休闲'),
(11829,784,205,'夏季'),
(11830,784,204,'布'),
(11831,784,203,'纯色'),
(11832,784,202,'布鞋'),
(11833,784,201,'2016年夏季'),
(11834,784,200,'蓝色 棕色 灰色'),
(11835,784,199,'橡胶'),
(11836,784,198,'布鞋'),
(11837,784,197,'布'),
(11838,784,196,'休闲'),
(11839,785,220,'日常'),
(11840,785,219,'布'),
(11841,785,218,'圆头'),
(11842,785,217,'LS39537'),
(11843,785,216,'平跟'),
(11844,785,215,'车缝线'),
(11845,785,214,'松紧带'),
(11846,785,213,'38 39 40 41 42 43 44'),
(11847,785,212,'胶粘鞋'),
(11848,785,211,'透气'),
(11849,785,210,'商场同款(线上线下都销售)'),
(11850,785,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11851,785,208,'PLAYBOY/花花公子'),
(11852,785,207,'低跟(1-3cm)'),
(11853,785,206,'日常休闲'),
(11854,785,205,'夏季'),
(11855,785,204,'布'),
(11856,785,203,'纯色'),
(11857,785,202,'布鞋'),
(11858,785,201,'2016年夏季'),
(11859,785,200,'蓝色 棕色 灰色'),
(11860,785,199,'橡胶'),
(11861,785,198,'布鞋'),
(11862,785,197,'布'),
(11863,785,196,'休闲'),
(11864,786,220,'日常'),
(11865,786,219,'布'),
(11866,786,218,'圆头'),
(11867,786,217,'LS39537'),
(11868,786,216,'平跟'),
(11869,786,215,'车缝线'),
(11870,786,214,'松紧带'),
(11871,786,213,'38 39 40 41 42 43 44'),
(11872,786,212,'胶粘鞋'),
(11873,786,211,'透气'),
(11874,786,210,'商场同款(线上线下都销售)'),
(11875,786,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11876,786,208,'PLAYBOY/花花公子'),
(11877,786,207,'低跟(1-3cm)'),
(11878,786,206,'日常休闲'),
(11879,786,205,'夏季'),
(11880,786,204,'布'),
(11881,786,203,'纯色'),
(11882,786,202,'布鞋'),
(11883,786,201,'2016年夏季'),
(11884,786,200,'蓝色 棕色 灰色'),
(11885,786,199,'橡胶'),
(11886,786,198,'布鞋'),
(11887,786,197,'布'),
(11888,786,196,'休闲'),
(11889,787,220,'日常'),
(11890,787,219,'布'),
(11891,787,218,'圆头'),
(11892,787,217,'LS39537'),
(11893,787,216,'平跟'),
(11894,787,215,'车缝线'),
(11895,787,214,'松紧带'),
(11896,787,213,'38 39 40 41 42 43 44'),
(11897,787,212,'胶粘鞋'),
(11898,787,211,'透气'),
(11899,787,210,'商场同款(线上线下都销售)'),
(11900,787,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11901,787,208,'PLAYBOY/花花公子'),
(11902,787,207,'低跟(1-3cm)'),
(11903,787,206,'日常休闲'),
(11904,787,205,'夏季'),
(11905,787,204,'布'),
(11906,787,203,'纯色'),
(11907,787,202,'布鞋'),
(11908,787,201,'2016年夏季'),
(11909,787,200,'蓝色 棕色 灰色'),
(11910,787,199,'橡胶'),
(11911,787,198,'布鞋'),
(11912,787,197,'布'),
(11913,787,196,'休闲'),
(11914,788,220,'日常'),
(11915,788,219,'布'),
(11916,788,218,'圆头'),
(11917,788,217,'LS39537'),
(11918,788,216,'平跟'),
(11919,788,215,'车缝线'),
(11920,788,214,'松紧带'),
(11921,788,213,'38 39 40 41 42 43 44'),
(11922,788,212,'胶粘鞋'),
(11923,788,211,'透气'),
(11924,788,210,'商场同款(线上线下都销售)'),
(11925,788,209,'青年（18-40周岁） 中年（40-60周岁） 老年（60周岁以上）'),
(11926,788,208,'PLAYBOY/花花公子'),
(11927,788,207,'低跟(1-3cm)'),
(11928,788,206,'日常休闲'),
(11929,788,205,'夏季'),
(11930,788,204,'布'),
(11931,788,203,'纯色'),
(11932,788,202,'布鞋'),
(11933,788,201,'2016年夏季'),
(11934,788,200,'蓝色 棕色 灰色'),
(11935,788,199,'橡胶'),
(11936,788,198,'布鞋'),
(11937,788,197,'布'),
(11938,788,196,'休闲'),
(11939,789,227,'聚酯纤维100%'),
(11940,789,226,'Emyche/艾米秋'),
(11941,789,225,'129668'),
(11942,789,224,'L M S XL XXL'),
(11943,789,223,'2016年夏季'),
(11944,789,222,'白色 黑色 浅蓝'),
(11945,789,221,'18-25周岁'),
(11946,790,227,'聚酯纤维100%'),
(11947,790,226,'Emyche/艾米秋'),
(11948,790,225,'129668'),
(11949,790,224,'L M S XL XXL'),
(11950,790,223,'2016年夏季'),
(11951,790,222,'白色 黑色 浅蓝'),
(11952,790,221,'18-25周岁'),
(11953,791,227,'聚酯纤维100%'),
(11954,791,226,'Emyche/艾米秋'),
(11955,791,225,'129668'),
(11956,791,224,'L M S XL XXL'),
(11957,791,223,'2016年夏季'),
(11958,791,222,'白色 黑色 浅蓝'),
(11959,791,221,'18-25周岁'),
(11960,792,227,'聚酯纤维100%'),
(11961,792,226,'Emyche/艾米秋'),
(11962,792,225,'129668'),
(11963,792,224,'L M S XL XXL'),
(11964,792,223,'2016年夏季'),
(11965,792,222,'白色 黑色 浅蓝'),
(11966,792,221,'18-25周岁'),
(11967,793,227,'聚酯纤维100%'),
(11968,793,226,'Emyche/艾米秋'),
(11969,793,225,'129668'),
(11970,793,224,'L M S XL XXL'),
(11971,793,223,'2016年夏季'),
(11972,793,222,'白色 黑色 浅蓝'),
(11973,793,221,'18-25周岁'),
(11974,794,227,'聚酯纤维100%'),
(11975,794,226,'Emyche/艾米秋'),
(11976,794,225,'129668'),
(11977,794,224,'L M S XL XXL'),
(11978,794,223,'2016年夏季'),
(11979,794,222,'白色 黑色 浅蓝'),
(11980,794,221,'18-25周岁'),
(11981,795,227,'聚酯纤维100%'),
(11982,795,226,'Emyche/艾米秋'),
(11983,795,225,'129668'),
(11984,795,224,'L M S XL XXL'),
(11985,795,223,'2016年夏季'),
(11986,795,222,'白色 黑色 浅蓝'),
(11987,795,221,'18-25周岁'),
(11988,796,227,'聚酯纤维100%'),
(11989,796,226,'Emyche/艾米秋'),
(11990,796,225,'129668'),
(11991,796,224,'L M S XL XXL'),
(11992,796,223,'2016年夏季'),
(11993,796,222,'白色 黑色 浅蓝'),
(11994,796,221,'18-25周岁'),
(11995,797,227,'聚酯纤维100%'),
(11996,797,226,'Emyche/艾米秋'),
(11997,797,225,'129668'),
(11998,797,224,'L M S XL XXL'),
(11999,797,223,'2016年夏季'),
(12000,797,222,'白色 黑色 浅蓝'),
(12001,797,221,'18-25周岁'),
(12002,798,227,'聚酯纤维100%'),
(12003,798,226,'Emyche/艾米秋'),
(12004,798,225,'129668'),
(12005,798,224,'L M S XL XXL'),
(12006,798,223,'2016年夏季'),
(12007,798,222,'白色 黑色 浅蓝'),
(12008,798,221,'18-25周岁'),
(12009,799,227,'聚酯纤维100%'),
(12010,799,226,'Emyche/艾米秋'),
(12011,799,225,'129668'),
(12012,799,224,'L M S XL XXL'),
(12013,799,223,'2016年夏季'),
(12014,799,222,'白色 黑色 浅蓝'),
(12015,799,221,'18-25周岁'),
(12016,800,227,'聚酯纤维100%'),
(12017,800,226,'Emyche/艾米秋'),
(12018,800,225,'129668'),
(12019,800,224,'L M S XL XXL'),
(12020,800,223,'2016年夏季'),
(12021,800,222,'白色 黑色 浅蓝'),
(12022,800,221,'18-25周岁'),
(12023,801,227,'聚酯纤维100%'),
(12024,801,226,'Emyche/艾米秋'),
(12025,801,225,'129668'),
(12026,801,224,'L M S XL XXL'),
(12027,801,223,'2016年夏季'),
(12028,801,222,'白色 黑色 浅蓝'),
(12029,801,221,'18-25周岁'),
(12030,802,227,'聚酯纤维100%'),
(12031,802,226,'Emyche/艾米秋'),
(12032,802,225,'129668'),
(12033,802,224,'L M S XL XXL'),
(12034,802,223,'2016年夏季'),
(12035,802,222,'白色 黑色 浅蓝'),
(12036,802,221,'18-25周岁'),
(12037,803,227,'聚酯纤维100%'),
(12038,803,226,'Emyche/艾米秋'),
(12039,803,225,'129668'),
(12040,803,224,'L M S XL XXL'),
(12041,803,223,'2016年夏季'),
(12042,803,222,'白色 黑色 浅蓝'),
(12043,803,221,'18-25周岁'),
(12044,804,227,'聚酯纤维100%'),
(12045,804,226,'Emyche/艾米秋'),
(12046,804,225,'129668'),
(12047,804,224,'L M S XL XXL'),
(12048,804,223,'2016年夏季'),
(12049,804,222,'白色 黑色 浅蓝'),
(12050,804,221,'18-25周岁'),
(12051,805,227,'聚酯纤维100%'),
(12052,805,226,'Emyche/艾米秋'),
(12053,805,225,'129668'),
(12054,805,224,'L M S XL XXL'),
(12055,805,223,'2016年夏季'),
(12056,805,222,'白色 黑色 浅蓝'),
(12057,805,221,'18-25周岁'),
(12058,806,227,'聚酯纤维100%'),
(12059,806,226,'Emyche/艾米秋'),
(12060,806,225,'129668'),
(12061,806,224,'L M S XL XXL'),
(12062,806,223,'2016年夏季'),
(12063,806,222,'白色 黑色 浅蓝'),
(12064,806,221,'18-25周岁'),
(12065,807,227,'聚酯纤维100%'),
(12066,807,226,'Emyche/艾米秋'),
(12067,807,225,'129668'),
(12068,807,224,'L M S XL XXL'),
(12069,807,223,'2016年夏季'),
(12070,807,222,'白色 黑色 浅蓝'),
(12071,807,221,'18-25周岁'),
(12072,808,227,'聚酯纤维100%'),
(12073,808,226,'Emyche/艾米秋'),
(12074,808,225,'129668'),
(12075,808,224,'L M S XL XXL'),
(12076,808,223,'2016年夏季'),
(12077,808,222,'白色 黑色 浅蓝'),
(12078,808,221,'18-25周岁'),
(12079,809,227,'聚酯纤维100%'),
(12080,809,226,'Emyche/艾米秋'),
(12081,809,225,'129668'),
(12082,809,224,'L M S XL XXL'),
(12083,809,223,'2016年夏季'),
(12084,809,222,'白色 黑色 浅蓝'),
(12085,809,221,'18-25周岁'),
(12086,810,227,'聚酯纤维100%'),
(12087,810,226,'Emyche/艾米秋'),
(12088,810,225,'129668'),
(12089,810,224,'L M S XL XXL'),
(12090,810,223,'2016年夏季'),
(12091,810,222,'白色 黑色 浅蓝'),
(12092,810,221,'18-25周岁'),
(12093,811,227,'聚酯纤维100%'),
(12094,811,226,'Emyche/艾米秋'),
(12095,811,225,'129668'),
(12096,811,224,'L M S XL XXL'),
(12097,811,223,'2016年夏季'),
(12098,811,222,'白色 黑色 浅蓝'),
(12099,811,221,'18-25周岁'),
(12100,812,227,'聚酯纤维100%'),
(12101,812,226,'Emyche/艾米秋'),
(12102,812,225,'129668'),
(12103,812,224,'L M S XL XXL'),
(12104,812,223,'2016年夏季'),
(12105,812,222,'白色 黑色 浅蓝'),
(12106,812,221,'18-25周岁'),
(12107,813,227,'聚酯纤维100%'),
(12108,813,226,'Emyche/艾米秋'),
(12109,813,225,'129668'),
(12110,813,224,'L M S XL XXL'),
(12111,813,223,'2016年夏季'),
(12112,813,222,'白色 黑色 浅蓝'),
(12113,813,221,'18-25周岁'),
(12114,814,227,'聚酯纤维100%'),
(12115,814,226,'Emyche/艾米秋'),
(12116,814,225,'129668'),
(12117,814,224,'L M S XL XXL'),
(12118,814,223,'2016年夏季'),
(12119,814,222,'白色 黑色 浅蓝'),
(12120,814,221,'18-25周岁'),
(12121,815,227,'聚酯纤维100%'),
(12122,815,226,'Emyche/艾米秋'),
(12123,815,225,'129668'),
(12124,815,224,'L M S XL XXL'),
(12125,815,223,'2016年夏季'),
(12126,815,222,'白色 黑色 浅蓝'),
(12127,815,221,'18-25周岁'),
(12128,816,227,'聚酯纤维100%'),
(12129,816,226,'Emyche/艾米秋'),
(12130,816,225,'129668'),
(12131,816,224,'L M S XL XXL'),
(12132,816,223,'2016年夏季'),
(12133,816,222,'白色 黑色 浅蓝'),
(12134,816,221,'18-25周岁'),
(12135,817,227,'聚酯纤维100%'),
(12136,817,226,'Emyche/艾米秋'),
(12137,817,225,'129668'),
(12138,817,224,'L M S XL XXL'),
(12139,817,223,'2016年夏季'),
(12140,817,222,'白色 黑色 浅蓝'),
(12141,817,221,'18-25周岁'),
(12142,818,227,'聚酯纤维100%'),
(12143,818,226,'Emyche/艾米秋'),
(12144,818,225,'129668'),
(12145,818,224,'L M S XL XXL'),
(12146,818,223,'2016年夏季'),
(12147,818,222,'白色 黑色 浅蓝'),
(12148,818,221,'18-25周岁'),
(12149,819,227,'聚酯纤维100%'),
(12150,819,226,'Emyche/艾米秋'),
(12151,819,225,'129668'),
(12152,819,224,'L M S XL XXL'),
(12153,819,223,'2016年夏季'),
(12154,819,222,'白色 黑色 浅蓝'),
(12155,819,221,'18-25周岁'),
(12156,820,227,'聚酯纤维100%'),
(12157,820,226,'Emyche/艾米秋'),
(12158,820,225,'129668'),
(12159,820,224,'L M S XL XXL'),
(12160,820,223,'2016年夏季'),
(12161,820,222,'白色 黑色 浅蓝'),
(12162,820,221,'18-25周岁'),
(12163,821,227,'聚酯纤维100%'),
(12164,821,226,'Emyche/艾米秋'),
(12165,821,225,'129668'),
(12166,821,224,'L M S XL XXL'),
(12167,821,223,'2016年夏季'),
(12168,821,222,'白色 黑色 浅蓝'),
(12169,821,221,'18-25周岁'),
(12170,822,227,'聚酯纤维100%'),
(12171,822,226,'Emyche/艾米秋'),
(12172,822,225,'129668'),
(12173,822,224,'L M S XL XXL'),
(12174,822,223,'2016年夏季'),
(12175,822,222,'白色 黑色 浅蓝'),
(12176,822,221,'18-25周岁'),
(12177,823,227,'聚酯纤维100%'),
(12178,823,226,'Emyche/艾米秋'),
(12179,823,225,'129668'),
(12180,823,224,'L M S XL XXL'),
(12181,823,223,'2016年夏季'),
(12182,823,222,'白色 黑色 浅蓝'),
(12183,823,221,'18-25周岁'),
(12184,824,227,'聚酯纤维100%'),
(12185,824,226,'Emyche/艾米秋'),
(12186,824,225,'129668'),
(12187,824,224,'L M S XL XXL'),
(12188,824,223,'2016年夏季'),
(12189,824,222,'白色 黑色 浅蓝'),
(12190,824,221,'18-25周岁'),
(12191,825,227,'聚酯纤维100%'),
(12192,825,226,'Emyche/艾米秋'),
(12193,825,225,'129668'),
(12194,825,224,'L M S XL XXL'),
(12195,825,223,'2016年夏季'),
(12196,825,222,'白色 黑色 浅蓝'),
(12197,825,221,'18-25周岁'),
(12198,826,227,'聚酯纤维100%'),
(12199,826,226,'Emyche/艾米秋'),
(12200,826,225,'129668'),
(12201,826,224,'L M S XL XXL'),
(12202,826,223,'2016年夏季'),
(12203,826,222,'白色 黑色 浅蓝'),
(12204,826,221,'18-25周岁'),
(12205,827,227,'聚酯纤维100%'),
(12206,827,226,'Emyche/艾米秋'),
(12207,827,225,'129668'),
(12208,827,224,'L M S XL XXL'),
(12209,827,223,'2016年夏季'),
(12210,827,222,'白色 黑色 浅蓝'),
(12211,827,221,'18-25周岁'),
(12212,828,227,'聚酯纤维100%'),
(12213,828,226,'Emyche/艾米秋'),
(12214,828,225,'129668'),
(12215,828,224,'L M S XL XXL'),
(12216,828,223,'2016年夏季'),
(12217,828,222,'白色 黑色 浅蓝'),
(12218,828,221,'18-25周岁'),
(12219,829,227,'聚酯纤维100%'),
(12220,829,226,'Emyche/艾米秋'),
(12221,829,225,'129668'),
(12222,829,224,'L M S XL XXL'),
(12223,829,223,'2016年夏季'),
(12224,829,222,'白色 黑色 浅蓝'),
(12225,829,221,'18-25周岁'),
(12226,830,227,'聚酯纤维100%'),
(12227,830,226,'Emyche/艾米秋'),
(12228,830,225,'129668'),
(12229,830,224,'L M S XL XXL'),
(12230,830,223,'2016年夏季'),
(12231,830,222,'白色 黑色 浅蓝'),
(12232,830,221,'18-25周岁'),
(12233,831,227,'聚酯纤维100%'),
(12234,831,226,'Emyche/艾米秋'),
(12235,831,225,'129668'),
(12236,831,224,'L M S XL XXL'),
(12237,831,223,'2016年夏季'),
(12238,831,222,'白色 黑色 浅蓝'),
(12239,831,221,'18-25周岁'),
(12240,832,227,'聚酯纤维100%'),
(12241,832,226,'Emyche/艾米秋'),
(12242,832,225,'129668'),
(12243,832,224,'L M S XL XXL'),
(12244,832,223,'2016年夏季'),
(12245,832,222,'白色 黑色 浅蓝'),
(12246,832,221,'18-25周岁'),
(12247,833,227,'聚酯纤维100%'),
(12248,833,226,'Emyche/艾米秋'),
(12249,833,225,'129668'),
(12250,833,224,'L M S XL XXL'),
(12251,833,223,'2016年夏季'),
(12252,833,222,'白色 黑色 浅蓝'),
(12253,833,221,'18-25周岁'),
(12254,834,227,'聚酯纤维100%'),
(12255,834,226,'Emyche/艾米秋'),
(12256,834,225,'129668'),
(12257,834,224,'L M S XL XXL'),
(12258,834,223,'2016年夏季'),
(12259,834,222,'白色 黑色 浅蓝'),
(12260,834,221,'18-25周岁'),
(12261,835,227,'聚酯纤维100%'),
(12262,835,226,'Emyche/艾米秋'),
(12263,835,225,'129668'),
(12264,835,224,'L M S XL XXL'),
(12265,835,223,'2016年夏季'),
(12266,835,222,'白色 黑色 浅蓝'),
(12267,835,221,'18-25周岁'),
(12268,836,227,'聚酯纤维100%'),
(12269,836,226,'Emyche/艾米秋'),
(12270,836,225,'129668'),
(12271,836,224,'L M S XL XXL'),
(12272,836,223,'2016年夏季'),
(12273,836,222,'白色 黑色 浅蓝'),
(12274,836,221,'18-25周岁'),
(12275,837,227,'聚酯纤维100%'),
(12276,837,226,'Emyche/艾米秋'),
(12277,837,225,'129668'),
(12278,837,224,'L M S XL XXL'),
(12279,837,223,'2016年夏季'),
(12280,837,222,'白色 黑色 浅蓝'),
(12281,837,221,'18-25周岁'),
(12282,838,227,'聚酯纤维100%'),
(12283,838,226,'Emyche/艾米秋'),
(12284,838,225,'129668'),
(12285,838,224,'L M S XL XXL'),
(12286,838,223,'2016年夏季'),
(12287,838,222,'白色 黑色 浅蓝'),
(12288,838,221,'18-25周岁'),
(12289,839,227,'聚酯纤维100%'),
(12290,839,226,'Emyche/艾米秋'),
(12291,839,225,'129668'),
(12292,839,224,'L M S XL XXL'),
(12293,839,223,'2016年夏季'),
(12294,839,222,'白色 黑色 浅蓝'),
(12295,839,221,'18-25周岁'),
(12296,840,227,'聚酯纤维100%'),
(12297,840,226,'Emyche/艾米秋'),
(12298,840,225,'129668'),
(12299,840,224,'L M S XL XXL'),
(12300,840,223,'2016年夏季'),
(12301,840,222,'白色 黑色 浅蓝'),
(12302,840,221,'18-25周岁'),
(12303,841,227,'聚酯纤维100%'),
(12304,841,226,'Emyche/艾米秋'),
(12305,841,225,'129668'),
(12306,841,224,'L M S XL XXL'),
(12307,841,223,'2016年夏季'),
(12308,841,222,'白色 黑色 浅蓝'),
(12309,841,221,'18-25周岁'),
(12310,842,227,'聚酯纤维100%'),
(12311,842,226,'Emyche/艾米秋'),
(12312,842,225,'129668'),
(12313,842,224,'L M S XL XXL'),
(12314,842,223,'2016年夏季'),
(12315,842,222,'白色 黑色 浅蓝'),
(12316,842,221,'18-25周岁'),
(12317,843,227,'聚酯纤维100%'),
(12318,843,226,'Emyche/艾米秋'),
(12319,843,225,'129668'),
(12320,843,224,'L M S XL XXL'),
(12321,843,223,'2016年夏季'),
(12322,843,222,'白色 黑色 浅蓝'),
(12323,843,221,'18-25周岁'),
(12324,844,227,'聚酯纤维100%'),
(12325,844,226,'Emyche/艾米秋'),
(12326,844,225,'129668'),
(12327,844,224,'L M S XL XXL'),
(12328,844,223,'2016年夏季'),
(12329,844,222,'白色 黑色 浅蓝'),
(12330,844,221,'18-25周岁'),
(12331,845,227,'聚酯纤维100%'),
(12332,845,226,'Emyche/艾米秋'),
(12333,845,225,'129668'),
(12334,845,224,'L M S XL XXL'),
(12335,845,223,'2016年夏季'),
(12336,845,222,'白色 黑色 浅蓝'),
(12337,845,221,'18-25周岁'),
(12338,846,227,'聚酯纤维100%'),
(12339,846,226,'Emyche/艾米秋'),
(12340,846,225,'129668'),
(12341,846,224,'L M S XL XXL'),
(12342,846,223,'2016年夏季'),
(12343,846,222,'白色 黑色 浅蓝'),
(12344,846,221,'18-25周岁'),
(12345,847,227,'聚酯纤维100%'),
(12346,847,226,'Emyche/艾米秋'),
(12347,847,225,'129668'),
(12348,847,224,'L M S XL XXL'),
(12349,847,223,'2016年夏季'),
(12350,847,222,'白色 黑色 浅蓝'),
(12351,847,221,'18-25周岁'),
(12352,848,227,'聚酯纤维100%'),
(12353,848,226,'Emyche/艾米秋'),
(12354,848,225,'129668'),
(12355,848,224,'L M S XL XXL'),
(12356,848,223,'2016年夏季'),
(12357,848,222,'白色 黑色 浅蓝'),
(12358,848,221,'18-25周岁'),
(12359,849,242,'圆脸 长脸 方脸 椭圆形脸'),
(12360,849,241,'镜面弧度 镜架松紧'),
(12361,849,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12362,849,239,'8009'),
(12363,849,238,'其他'),
(12364,849,237,'否'),
(12365,849,236,'镜布 镜盒'),
(12366,849,235,'100 - 200元'),
(12367,849,234,'个性 舒适 运动'),
(12368,849,233,'男'),
(12369,849,232,'防UVA 防UVB 偏光'),
(12370,849,231,'8009'),
(12371,849,230,'2014年春夏季'),
(12372,849,229,'厦门'),
(12373,849,228,'PARZIN/帕森'),
(12374,850,242,'圆脸 长脸 方脸 椭圆形脸'),
(12375,850,241,'镜面弧度 镜架松紧'),
(12376,850,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12377,850,239,'8009'),
(12378,850,238,'其他'),
(12379,850,237,'否'),
(12380,850,236,'镜布 镜盒'),
(12381,850,235,'100 - 200元'),
(12382,850,234,'个性 舒适 运动'),
(12383,850,233,'男'),
(12384,850,232,'防UVA 防UVB 偏光'),
(12385,850,231,'8009'),
(12386,850,230,'2014年春夏季'),
(12387,850,229,'厦门'),
(12388,850,228,'PARZIN/帕森'),
(12389,851,242,'圆脸 长脸 方脸 椭圆形脸'),
(12390,851,241,'镜面弧度 镜架松紧'),
(12391,851,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12392,851,239,'8009'),
(12393,851,238,'其他'),
(12394,851,237,'否'),
(12395,851,236,'镜布 镜盒'),
(12396,851,235,'100 - 200元'),
(12397,851,234,'个性 舒适 运动'),
(12398,851,233,'男'),
(12399,851,232,'防UVA 防UVB 偏光'),
(12400,851,231,'8009'),
(12401,851,230,'2014年春夏季'),
(12402,851,229,'厦门'),
(12403,851,228,'PARZIN/帕森'),
(12404,852,242,'圆脸 长脸 方脸 椭圆形脸'),
(12405,852,241,'镜面弧度 镜架松紧'),
(12406,852,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12407,852,239,'8009'),
(12408,852,238,'其他'),
(12409,852,237,'否'),
(12410,852,236,'镜布 镜盒'),
(12411,852,235,'100 - 200元'),
(12412,852,234,'个性 舒适 运动'),
(12413,852,233,'男'),
(12414,852,232,'防UVA 防UVB 偏光'),
(12415,852,231,'8009'),
(12416,852,230,'2014年春夏季'),
(12417,852,229,'厦门'),
(12418,852,228,'PARZIN/帕森'),
(12419,853,242,'圆脸 长脸 方脸 椭圆形脸'),
(12420,853,241,'镜面弧度 镜架松紧'),
(12421,853,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12422,853,239,'8009'),
(12423,853,238,'其他'),
(12424,853,237,'否'),
(12425,853,236,'镜布 镜盒'),
(12426,853,235,'100 - 200元'),
(12427,853,234,'个性 舒适 运动'),
(12428,853,233,'男'),
(12429,853,232,'防UVA 防UVB 偏光'),
(12430,853,231,'8009'),
(12431,853,230,'2014年春夏季'),
(12432,853,229,'厦门'),
(12433,853,228,'PARZIN/帕森'),
(12434,854,242,'圆脸 长脸 方脸 椭圆形脸'),
(12435,854,241,'镜面弧度 镜架松紧'),
(12436,854,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12437,854,239,'8009'),
(12438,854,238,'其他'),
(12439,854,237,'否'),
(12440,854,236,'镜布 镜盒'),
(12441,854,235,'100 - 200元'),
(12442,854,234,'个性 舒适 运动'),
(12443,854,233,'男'),
(12444,854,232,'防UVA 防UVB 偏光'),
(12445,854,231,'8009'),
(12446,854,230,'2014年春夏季'),
(12447,854,229,'厦门'),
(12448,854,228,'PARZIN/帕森'),
(12449,855,242,'圆脸 长脸 方脸 椭圆形脸'),
(12450,855,241,'镜面弧度 镜架松紧'),
(12451,855,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12452,855,239,'8009'),
(12453,855,238,'其他'),
(12454,855,237,'否'),
(12455,855,236,'镜布 镜盒'),
(12456,855,235,'100 - 200元'),
(12457,855,234,'个性 舒适 运动'),
(12458,855,233,'男'),
(12459,855,232,'防UVA 防UVB 偏光'),
(12460,855,231,'8009'),
(12461,855,230,'2014年春夏季'),
(12462,855,229,'厦门'),
(12463,855,228,'PARZIN/帕森'),
(12464,856,242,'圆脸 长脸 方脸 椭圆形脸'),
(12465,856,241,'镜面弧度 镜架松紧'),
(12466,856,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12467,856,239,'8009'),
(12468,856,238,'其他'),
(12469,856,237,'否'),
(12470,856,236,'镜布 镜盒'),
(12471,856,235,'100 - 200元'),
(12472,856,234,'个性 舒适 运动'),
(12473,856,233,'男'),
(12474,856,232,'防UVA 防UVB 偏光'),
(12475,856,231,'8009'),
(12476,856,230,'2014年春夏季'),
(12477,856,229,'厦门'),
(12478,856,228,'PARZIN/帕森'),
(12479,857,242,'圆脸 长脸 方脸 椭圆形脸'),
(12480,857,241,'镜面弧度 镜架松紧'),
(12481,857,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12482,857,239,'8009'),
(12483,857,238,'其他'),
(12484,857,237,'否'),
(12485,857,236,'镜布 镜盒'),
(12486,857,235,'100 - 200元'),
(12487,857,234,'个性 舒适 运动'),
(12488,857,233,'男'),
(12489,857,232,'防UVA 防UVB 偏光'),
(12490,857,231,'8009'),
(12491,857,230,'2014年春夏季'),
(12492,857,229,'厦门'),
(12493,857,228,'PARZIN/帕森'),
(12494,858,242,'圆脸 长脸 方脸 椭圆形脸'),
(12495,858,241,'镜面弧度 镜架松紧'),
(12496,858,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12497,858,239,'8009'),
(12498,858,238,'其他'),
(12499,858,237,'否'),
(12500,858,236,'镜布 镜盒'),
(12501,858,235,'100 - 200元'),
(12502,858,234,'个性 舒适 运动'),
(12503,858,233,'男'),
(12504,858,232,'防UVA 防UVB 偏光'),
(12505,858,231,'8009'),
(12506,858,230,'2014年春夏季'),
(12507,858,229,'厦门'),
(12508,858,228,'PARZIN/帕森'),
(12509,859,242,'圆脸 长脸 方脸 椭圆形脸'),
(12510,859,241,'镜面弧度 镜架松紧'),
(12511,859,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12512,859,239,'8009'),
(12513,859,238,'其他'),
(12514,859,237,'否'),
(12515,859,236,'镜布 镜盒'),
(12516,859,235,'100 - 200元'),
(12517,859,234,'个性 舒适 运动'),
(12518,859,233,'男'),
(12519,859,232,'防UVA 防UVB 偏光'),
(12520,859,231,'8009'),
(12521,859,230,'2014年春夏季'),
(12522,859,229,'厦门'),
(12523,859,228,'PARZIN/帕森'),
(12524,860,242,'圆脸 长脸 方脸 椭圆形脸'),
(12525,860,241,'镜面弧度 镜架松紧'),
(12526,860,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12527,860,239,'8009'),
(12528,860,238,'其他'),
(12529,860,237,'否'),
(12530,860,236,'镜布 镜盒'),
(12531,860,235,'100 - 200元'),
(12532,860,234,'个性 舒适 运动'),
(12533,860,233,'男'),
(12534,860,232,'防UVA 防UVB 偏光'),
(12535,860,231,'8009'),
(12536,860,230,'2014年春夏季'),
(12537,860,229,'厦门'),
(12538,860,228,'PARZIN/帕森'),
(12539,861,242,'圆脸 长脸 方脸 椭圆形脸'),
(12540,861,241,'镜面弧度 镜架松紧'),
(12541,861,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12542,861,239,'8009'),
(12543,861,238,'其他'),
(12544,861,237,'否'),
(12545,861,236,'镜布 镜盒'),
(12546,861,235,'100 - 200元'),
(12547,861,234,'个性 舒适 运动'),
(12548,861,233,'男'),
(12549,861,232,'防UVA 防UVB 偏光'),
(12550,861,231,'8009'),
(12551,861,230,'2014年春夏季'),
(12552,861,229,'厦门'),
(12553,861,228,'PARZIN/帕森'),
(12554,862,242,'圆脸 长脸 方脸 椭圆形脸'),
(12555,862,241,'镜面弧度 镜架松紧'),
(12556,862,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12557,862,239,'8009'),
(12558,862,238,'其他'),
(12559,862,237,'否'),
(12560,862,236,'镜布 镜盒'),
(12561,862,235,'100 - 200元'),
(12562,862,234,'个性 舒适 运动'),
(12563,862,233,'男'),
(12564,862,232,'防UVA 防UVB 偏光'),
(12565,862,231,'8009'),
(12566,862,230,'2014年春夏季'),
(12567,862,229,'厦门'),
(12568,862,228,'PARZIN/帕森'),
(12569,863,242,'圆脸 长脸 方脸 椭圆形脸'),
(12570,863,241,'镜面弧度 镜架松紧'),
(12571,863,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12572,863,239,'8009'),
(12573,863,238,'其他'),
(12574,863,237,'否'),
(12575,863,236,'镜布 镜盒'),
(12576,863,235,'100 - 200元'),
(12577,863,234,'个性 舒适 运动'),
(12578,863,233,'男'),
(12579,863,232,'防UVA 防UVB 偏光'),
(12580,863,231,'8009'),
(12581,863,230,'2014年春夏季'),
(12582,863,229,'厦门'),
(12583,863,228,'PARZIN/帕森'),
(12584,864,242,'圆脸 长脸 方脸 椭圆形脸'),
(12585,864,241,'镜面弧度 镜架松紧'),
(12586,864,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12587,864,239,'8009'),
(12588,864,238,'其他'),
(12589,864,237,'否'),
(12590,864,236,'镜布 镜盒'),
(12591,864,235,'100 - 200元'),
(12592,864,234,'个性 舒适 运动'),
(12593,864,233,'男'),
(12594,864,232,'防UVA 防UVB 偏光'),
(12595,864,231,'8009'),
(12596,864,230,'2014年春夏季'),
(12597,864,229,'厦门'),
(12598,864,228,'PARZIN/帕森'),
(12599,865,242,'圆脸 长脸 方脸 椭圆形脸'),
(12600,865,241,'镜面弧度 镜架松紧'),
(12601,865,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12602,865,239,'8009'),
(12603,865,238,'其他'),
(12604,865,237,'否'),
(12605,865,236,'镜布 镜盒'),
(12606,865,235,'100 - 200元'),
(12607,865,234,'个性 舒适 运动'),
(12608,865,233,'男'),
(12609,865,232,'防UVA 防UVB 偏光'),
(12610,865,231,'8009'),
(12611,865,230,'2014年春夏季'),
(12612,865,229,'厦门'),
(12613,865,228,'PARZIN/帕森'),
(12614,866,242,'圆脸 长脸 方脸 椭圆形脸'),
(12615,866,241,'镜面弧度 镜架松紧'),
(12616,866,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12617,866,239,'8009'),
(12618,866,238,'其他'),
(12619,866,237,'否'),
(12620,866,236,'镜布 镜盒'),
(12621,866,235,'100 - 200元'),
(12622,866,234,'个性 舒适 运动'),
(12623,866,233,'男'),
(12624,866,232,'防UVA 防UVB 偏光'),
(12625,866,231,'8009'),
(12626,866,230,'2014年春夏季'),
(12627,866,229,'厦门'),
(12628,866,228,'PARZIN/帕森'),
(12629,867,242,'圆脸 长脸 方脸 椭圆形脸'),
(12630,867,241,'镜面弧度 镜架松紧'),
(12631,867,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12632,867,239,'8009'),
(12633,867,238,'其他'),
(12634,867,237,'否'),
(12635,867,236,'镜布 镜盒'),
(12636,867,235,'100 - 200元'),
(12637,867,234,'个性 舒适 运动'),
(12638,867,233,'男'),
(12639,867,232,'防UVA 防UVB 偏光'),
(12640,867,231,'8009'),
(12641,867,230,'2014年春夏季'),
(12642,867,229,'厦门'),
(12643,867,228,'PARZIN/帕森'),
(12644,868,242,'圆脸 长脸 方脸 椭圆形脸'),
(12645,868,241,'镜面弧度 镜架松紧'),
(12646,868,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12647,868,239,'8009'),
(12648,868,238,'其他'),
(12649,868,237,'否'),
(12650,868,236,'镜布 镜盒'),
(12651,868,235,'100 - 200元'),
(12652,868,234,'个性 舒适 运动'),
(12653,868,233,'男'),
(12654,868,232,'防UVA 防UVB 偏光'),
(12655,868,231,'8009'),
(12656,868,230,'2014年春夏季'),
(12657,868,229,'厦门'),
(12658,868,228,'PARZIN/帕森'),
(12659,869,242,'圆脸 长脸 方脸 椭圆形脸'),
(12660,869,241,'镜面弧度 镜架松紧'),
(12661,869,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12662,869,239,'8009'),
(12663,869,238,'其他'),
(12664,869,237,'否'),
(12665,869,236,'镜布 镜盒'),
(12666,869,235,'100 - 200元'),
(12667,869,234,'个性 舒适 运动'),
(12668,869,233,'男'),
(12669,869,232,'防UVA 防UVB 偏光'),
(12670,869,231,'8009'),
(12671,869,230,'2014年春夏季'),
(12672,869,229,'厦门'),
(12673,869,228,'PARZIN/帕森'),
(12674,870,242,'圆脸 长脸 方脸 椭圆形脸'),
(12675,870,241,'镜面弧度 镜架松紧'),
(12676,870,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12677,870,239,'8009'),
(12678,870,238,'其他'),
(12679,870,237,'否'),
(12680,870,236,'镜布 镜盒'),
(12681,870,235,'100 - 200元'),
(12682,870,234,'个性 舒适 运动'),
(12683,870,233,'男'),
(12684,870,232,'防UVA 防UVB 偏光'),
(12685,870,231,'8009'),
(12686,870,230,'2014年春夏季'),
(12687,870,229,'厦门'),
(12688,870,228,'PARZIN/帕森'),
(12689,871,242,'圆脸 长脸 方脸 椭圆形脸'),
(12690,871,241,'镜面弧度 镜架松紧'),
(12691,871,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12692,871,239,'8009'),
(12693,871,238,'其他'),
(12694,871,237,'否'),
(12695,871,236,'镜布 镜盒'),
(12696,871,235,'100 - 200元'),
(12697,871,234,'个性 舒适 运动'),
(12698,871,233,'男'),
(12699,871,232,'防UVA 防UVB 偏光'),
(12700,871,231,'8009'),
(12701,871,230,'2014年春夏季'),
(12702,871,229,'厦门'),
(12703,871,228,'PARZIN/帕森'),
(12704,872,242,'圆脸 长脸 方脸 椭圆形脸'),
(12705,872,241,'镜面弧度 镜架松紧'),
(12706,872,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12707,872,239,'8009'),
(12708,872,238,'其他'),
(12709,872,237,'否'),
(12710,872,236,'镜布 镜盒'),
(12711,872,235,'100 - 200元'),
(12712,872,234,'个性 舒适 运动'),
(12713,872,233,'男'),
(12714,872,232,'防UVA 防UVB 偏光'),
(12715,872,231,'8009'),
(12716,872,230,'2014年春夏季'),
(12717,872,229,'厦门'),
(12718,872,228,'PARZIN/帕森'),
(12719,873,242,'圆脸 长脸 方脸 椭圆形脸'),
(12720,873,241,'镜面弧度 镜架松紧'),
(12721,873,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12722,873,239,'8009'),
(12723,873,238,'其他'),
(12724,873,237,'否'),
(12725,873,236,'镜布 镜盒'),
(12726,873,235,'100 - 200元'),
(12727,873,234,'个性 舒适 运动'),
(12728,873,233,'男'),
(12729,873,232,'防UVA 防UVB 偏光'),
(12730,873,231,'8009'),
(12731,873,230,'2014年春夏季'),
(12732,873,229,'厦门'),
(12733,873,228,'PARZIN/帕森'),
(12734,874,242,'圆脸 长脸 方脸 椭圆形脸'),
(12735,874,241,'镜面弧度 镜架松紧'),
(12736,874,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12737,874,239,'8009'),
(12738,874,238,'其他'),
(12739,874,237,'否'),
(12740,874,236,'镜布 镜盒'),
(12741,874,235,'100 - 200元'),
(12742,874,234,'个性 舒适 运动'),
(12743,874,233,'男'),
(12744,874,232,'防UVA 防UVB 偏光'),
(12745,874,231,'8009'),
(12746,874,230,'2014年春夏季'),
(12747,874,229,'厦门'),
(12748,874,228,'PARZIN/帕森'),
(12749,875,242,'圆脸 长脸 方脸 椭圆形脸'),
(12750,875,241,'镜面弧度 镜架松紧'),
(12751,875,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12752,875,239,'8009'),
(12753,875,238,'其他'),
(12754,875,237,'否'),
(12755,875,236,'镜布 镜盒'),
(12756,875,235,'100 - 200元'),
(12757,875,234,'个性 舒适 运动'),
(12758,875,233,'男'),
(12759,875,232,'防UVA 防UVB 偏光'),
(12760,875,231,'8009'),
(12761,875,230,'2014年春夏季'),
(12762,875,229,'厦门'),
(12763,875,228,'PARZIN/帕森'),
(12764,876,242,'圆脸 长脸 方脸 椭圆形脸'),
(12765,876,241,'镜面弧度 镜架松紧'),
(12766,876,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12767,876,239,'8009'),
(12768,876,238,'其他'),
(12769,876,237,'否'),
(12770,876,236,'镜布 镜盒'),
(12771,876,235,'100 - 200元'),
(12772,876,234,'个性 舒适 运动'),
(12773,876,233,'男'),
(12774,876,232,'防UVA 防UVB 偏光'),
(12775,876,231,'8009'),
(12776,876,230,'2014年春夏季'),
(12777,876,229,'厦门'),
(12778,876,228,'PARZIN/帕森'),
(12779,877,242,'圆脸 长脸 方脸 椭圆形脸'),
(12780,877,241,'镜面弧度 镜架松紧'),
(12781,877,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12782,877,239,'8009'),
(12783,877,238,'其他'),
(12784,877,237,'否'),
(12785,877,236,'镜布 镜盒'),
(12786,877,235,'100 - 200元'),
(12787,877,234,'个性 舒适 运动'),
(12788,877,233,'男'),
(12789,877,232,'防UVA 防UVB 偏光'),
(12790,877,231,'8009'),
(12791,877,230,'2014年春夏季'),
(12792,877,229,'厦门'),
(12793,877,228,'PARZIN/帕森'),
(12794,878,242,'圆脸 长脸 方脸 椭圆形脸'),
(12795,878,241,'镜面弧度 镜架松紧'),
(12796,878,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12797,878,239,'8009'),
(12798,878,238,'其他'),
(12799,878,237,'否'),
(12800,878,236,'镜布 镜盒'),
(12801,878,235,'100 - 200元'),
(12802,878,234,'个性 舒适 运动'),
(12803,878,233,'男'),
(12804,878,232,'防UVA 防UVB 偏光'),
(12805,878,231,'8009'),
(12806,878,230,'2014年春夏季'),
(12807,878,229,'厦门'),
(12808,878,228,'PARZIN/帕森'),
(12809,879,242,'圆脸 长脸 方脸 椭圆形脸'),
(12810,879,241,'镜面弧度 镜架松紧'),
(12811,879,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12812,879,239,'8009'),
(12813,879,238,'其他'),
(12814,879,237,'否'),
(12815,879,236,'镜布 镜盒'),
(12816,879,235,'100 - 200元'),
(12817,879,234,'个性 舒适 运动'),
(12818,879,233,'男'),
(12819,879,232,'防UVA 防UVB 偏光'),
(12820,879,231,'8009'),
(12821,879,230,'2014年春夏季'),
(12822,879,229,'厦门'),
(12823,879,228,'PARZIN/帕森'),
(12824,880,242,'圆脸 长脸 方脸 椭圆形脸'),
(12825,880,241,'镜面弧度 镜架松紧'),
(12826,880,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12827,880,239,'8009'),
(12828,880,238,'其他'),
(12829,880,237,'否'),
(12830,880,236,'镜布 镜盒'),
(12831,880,235,'100 - 200元'),
(12832,880,234,'个性 舒适 运动'),
(12833,880,233,'男'),
(12834,880,232,'防UVA 防UVB 偏光'),
(12835,880,231,'8009'),
(12836,880,230,'2014年春夏季'),
(12837,880,229,'厦门'),
(12838,880,228,'PARZIN/帕森'),
(12839,881,242,'圆脸 长脸 方脸 椭圆形脸'),
(12840,881,241,'镜面弧度 镜架松紧'),
(12841,881,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12842,881,239,'8009'),
(12843,881,238,'其他'),
(12844,881,237,'否'),
(12845,881,236,'镜布 镜盒'),
(12846,881,235,'100 - 200元'),
(12847,881,234,'个性 舒适 运动'),
(12848,881,233,'男'),
(12849,881,232,'防UVA 防UVB 偏光'),
(12850,881,231,'8009'),
(12851,881,230,'2014年春夏季'),
(12852,881,229,'厦门'),
(12853,881,228,'PARZIN/帕森'),
(12854,882,242,'圆脸 长脸 方脸 椭圆形脸'),
(12855,882,241,'镜面弧度 镜架松紧'),
(12856,882,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12857,882,239,'8009'),
(12858,882,238,'其他'),
(12859,882,237,'否'),
(12860,882,236,'镜布 镜盒'),
(12861,882,235,'100 - 200元'),
(12862,882,234,'个性 舒适 运动'),
(12863,882,233,'男'),
(12864,882,232,'防UVA 防UVB 偏光'),
(12865,882,231,'8009'),
(12866,882,230,'2014年春夏季'),
(12867,882,229,'厦门'),
(12868,882,228,'PARZIN/帕森'),
(12869,883,242,'圆脸 长脸 方脸 椭圆形脸'),
(12870,883,241,'镜面弧度 镜架松紧'),
(12871,883,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12872,883,239,'8009'),
(12873,883,238,'其他'),
(12874,883,237,'否'),
(12875,883,236,'镜布 镜盒'),
(12876,883,235,'100 - 200元'),
(12877,883,234,'个性 舒适 运动'),
(12878,883,233,'男'),
(12879,883,232,'防UVA 防UVB 偏光'),
(12880,883,231,'8009'),
(12881,883,230,'2014年春夏季'),
(12882,883,229,'厦门'),
(12883,883,228,'PARZIN/帕森'),
(12884,884,242,'圆脸 长脸 方脸 椭圆形脸'),
(12885,884,241,'镜面弧度 镜架松紧'),
(12886,884,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12887,884,239,'8009'),
(12888,884,238,'其他'),
(12889,884,237,'否'),
(12890,884,236,'镜布 镜盒'),
(12891,884,235,'100 - 200元'),
(12892,884,234,'个性 舒适 运动'),
(12893,884,233,'男'),
(12894,884,232,'防UVA 防UVB 偏光'),
(12895,884,231,'8009'),
(12896,884,230,'2014年春夏季'),
(12897,884,229,'厦门'),
(12898,884,228,'PARZIN/帕森'),
(12899,885,242,'圆脸 长脸 方脸 椭圆形脸'),
(12900,885,241,'镜面弧度 镜架松紧'),
(12901,885,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12902,885,239,'8009'),
(12903,885,238,'其他'),
(12904,885,237,'否'),
(12905,885,236,'镜布 镜盒'),
(12906,885,235,'100 - 200元'),
(12907,885,234,'个性 舒适 运动'),
(12908,885,233,'男'),
(12909,885,232,'防UVA 防UVB 偏光'),
(12910,885,231,'8009'),
(12911,885,230,'2014年春夏季'),
(12912,885,229,'厦门'),
(12913,885,228,'PARZIN/帕森'),
(12914,886,242,'圆脸 长脸 方脸 椭圆形脸'),
(12915,886,241,'镜面弧度 镜架松紧'),
(12916,886,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12917,886,239,'8009'),
(12918,886,238,'其他'),
(12919,886,237,'否'),
(12920,886,236,'镜布 镜盒'),
(12921,886,235,'100 - 200元'),
(12922,886,234,'个性 舒适 运动'),
(12923,886,233,'男'),
(12924,886,232,'防UVA 防UVB 偏光'),
(12925,886,231,'8009'),
(12926,886,230,'2014年春夏季'),
(12927,886,229,'厦门'),
(12928,886,228,'PARZIN/帕森'),
(12929,887,242,'圆脸 长脸 方脸 椭圆形脸'),
(12930,887,241,'镜面弧度 镜架松紧'),
(12931,887,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12932,887,239,'8009'),
(12933,887,238,'其他'),
(12934,887,237,'否'),
(12935,887,236,'镜布 镜盒'),
(12936,887,235,'100 - 200元'),
(12937,887,234,'个性 舒适 运动'),
(12938,887,233,'男'),
(12939,887,232,'防UVA 防UVB 偏光'),
(12940,887,231,'8009'),
(12941,887,230,'2014年春夏季'),
(12942,887,229,'厦门'),
(12943,887,228,'PARZIN/帕森'),
(12944,888,242,'圆脸 长脸 方脸 椭圆形脸'),
(12945,888,241,'镜面弧度 镜架松紧'),
(12946,888,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12947,888,239,'8009'),
(12948,888,238,'其他'),
(12949,888,237,'否'),
(12950,888,236,'镜布 镜盒'),
(12951,888,235,'100 - 200元'),
(12952,888,234,'个性 舒适 运动'),
(12953,888,233,'男'),
(12954,888,232,'防UVA 防UVB 偏光'),
(12955,888,231,'8009'),
(12956,888,230,'2014年春夏季'),
(12957,888,229,'厦门'),
(12958,888,228,'PARZIN/帕森'),
(12959,889,242,'圆脸 长脸 方脸 椭圆形脸'),
(12960,889,241,'镜面弧度 镜架松紧'),
(12961,889,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12962,889,239,'8009'),
(12963,889,238,'其他'),
(12964,889,237,'否'),
(12965,889,236,'镜布 镜盒'),
(12966,889,235,'100 - 200元'),
(12967,889,234,'个性 舒适 运动'),
(12968,889,233,'男'),
(12969,889,232,'防UVA 防UVB 偏光'),
(12970,889,231,'8009'),
(12971,889,230,'2014年春夏季'),
(12972,889,229,'厦门'),
(12973,889,228,'PARZIN/帕森'),
(12974,890,242,'圆脸 长脸 方脸 椭圆形脸'),
(12975,890,241,'镜面弧度 镜架松紧'),
(12976,890,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12977,890,239,'8009'),
(12978,890,238,'其他'),
(12979,890,237,'否'),
(12980,890,236,'镜布 镜盒'),
(12981,890,235,'100 - 200元'),
(12982,890,234,'个性 舒适 运动'),
(12983,890,233,'男'),
(12984,890,232,'防UVA 防UVB 偏光'),
(12985,890,231,'8009'),
(12986,890,230,'2014年春夏季'),
(12987,890,229,'厦门'),
(12988,890,228,'PARZIN/帕森'),
(12989,891,242,'圆脸 长脸 方脸 椭圆形脸'),
(12990,891,241,'镜面弧度 镜架松紧'),
(12991,891,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(12992,891,239,'8009'),
(12993,891,238,'其他'),
(12994,891,237,'否'),
(12995,891,236,'镜布 镜盒'),
(12996,891,235,'100 - 200元'),
(12997,891,234,'个性 舒适 运动'),
(12998,891,233,'男'),
(12999,891,232,'防UVA 防UVB 偏光'),
(13000,891,231,'8009'),
(13001,891,230,'2014年春夏季'),
(13002,891,229,'厦门'),
(13003,891,228,'PARZIN/帕森'),
(13004,892,242,'圆脸 长脸 方脸 椭圆形脸'),
(13005,892,241,'镜面弧度 镜架松紧'),
(13006,892,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(13007,892,239,'8009'),
(13008,892,238,'其他'),
(13009,892,237,'否'),
(13010,892,236,'镜布 镜盒'),
(13011,892,235,'100 - 200元'),
(13012,892,234,'个性 舒适 运动'),
(13013,892,233,'男'),
(13014,892,232,'防UVA 防UVB 偏光'),
(13015,892,231,'8009'),
(13016,892,230,'2014年春夏季'),
(13017,892,229,'厦门'),
(13018,892,228,'PARZIN/帕森'),
(13019,893,242,'圆脸 长脸 方脸 椭圆形脸'),
(13020,893,241,'镜面弧度 镜架松紧'),
(13021,893,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(13022,893,239,'8009'),
(13023,893,238,'其他'),
(13024,893,237,'否'),
(13025,893,236,'镜布 镜盒'),
(13026,893,235,'100 - 200元'),
(13027,893,234,'个性 舒适 运动'),
(13028,893,233,'男'),
(13029,893,232,'防UVA 防UVB 偏光'),
(13030,893,231,'8009'),
(13031,893,230,'2014年春夏季'),
(13032,893,229,'厦门'),
(13033,893,228,'PARZIN/帕森'),
(13034,894,242,'圆脸 长脸 方脸 椭圆形脸'),
(13035,894,241,'镜面弧度 镜架松紧'),
(13036,894,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(13037,894,239,'8009'),
(13038,894,238,'其他'),
(13039,894,237,'否'),
(13040,894,236,'镜布 镜盒'),
(13041,894,235,'100 - 200元'),
(13042,894,234,'个性 舒适 运动'),
(13043,894,233,'男'),
(13044,894,232,'防UVA 防UVB 偏光'),
(13045,894,231,'8009'),
(13046,894,230,'2014年春夏季'),
(13047,894,229,'厦门'),
(13048,894,228,'PARZIN/帕森'),
(13049,895,242,'圆脸 长脸 方脸 椭圆形脸'),
(13050,895,241,'镜面弧度 镜架松紧'),
(13051,895,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(13052,895,239,'8009'),
(13053,895,238,'其他'),
(13054,895,237,'否'),
(13055,895,236,'镜布 镜盒'),
(13056,895,235,'100 - 200元'),
(13057,895,234,'个性 舒适 运动'),
(13058,895,233,'男'),
(13059,895,232,'防UVA 防UVB 偏光'),
(13060,895,231,'8009'),
(13061,895,230,'2014年春夏季'),
(13062,895,229,'厦门'),
(13063,895,228,'PARZIN/帕森'),
(13064,896,242,'圆脸 长脸 方脸 椭圆形脸'),
(13065,896,241,'镜面弧度 镜架松紧'),
(13066,896,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(13067,896,239,'8009'),
(13068,896,238,'其他'),
(13069,896,237,'否'),
(13070,896,236,'镜布 镜盒'),
(13071,896,235,'100 - 200元'),
(13072,896,234,'个性 舒适 运动'),
(13073,896,233,'男'),
(13074,896,232,'防UVA 防UVB 偏光'),
(13075,896,231,'8009'),
(13076,896,230,'2014年春夏季'),
(13077,896,229,'厦门'),
(13078,896,228,'PARZIN/帕森'),
(13079,897,242,'圆脸 长脸 方脸 椭圆形脸'),
(13080,897,241,'镜面弧度 镜架松紧'),
(13081,897,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(13082,897,239,'8009'),
(13083,897,238,'其他'),
(13084,897,237,'否'),
(13085,897,236,'镜布 镜盒'),
(13086,897,235,'100 - 200元'),
(13087,897,234,'个性 舒适 运动'),
(13088,897,233,'男'),
(13089,897,232,'防UVA 防UVB 偏光'),
(13090,897,231,'8009'),
(13091,897,230,'2014年春夏季'),
(13092,897,229,'厦门'),
(13093,897,228,'PARZIN/帕森'),
(13094,898,242,'圆脸 长脸 方脸 椭圆形脸'),
(13095,898,241,'镜面弧度 镜架松紧'),
(13096,898,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(13097,898,239,'8009'),
(13098,898,238,'其他'),
(13099,898,237,'否'),
(13100,898,236,'镜布 镜盒'),
(13101,898,235,'100 - 200元'),
(13102,898,234,'个性 舒适 运动'),
(13103,898,233,'男'),
(13104,898,232,'防UVA 防UVB 偏光'),
(13105,898,231,'8009'),
(13106,898,230,'2014年春夏季'),
(13107,898,229,'厦门'),
(13108,898,228,'PARZIN/帕森'),
(13109,899,242,'圆脸 长脸 方脸 椭圆形脸'),
(13110,899,241,'镜面弧度 镜架松紧'),
(13111,899,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(13112,899,239,'8009'),
(13113,899,238,'其他'),
(13114,899,237,'否'),
(13115,899,236,'镜布 镜盒'),
(13116,899,235,'100 - 200元'),
(13117,899,234,'个性 舒适 运动'),
(13118,899,233,'男'),
(13119,899,232,'防UVA 防UVB 偏光'),
(13120,899,231,'8009'),
(13121,899,230,'2014年春夏季'),
(13122,899,229,'厦门'),
(13123,899,228,'PARZIN/帕森'),
(13124,900,242,'圆脸 长脸 方脸 椭圆形脸'),
(13125,900,241,'镜面弧度 镜架松紧'),
(13126,900,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(13127,900,239,'8009'),
(13128,900,238,'其他'),
(13129,900,237,'否'),
(13130,900,236,'镜布 镜盒'),
(13131,900,235,'100 - 200元'),
(13132,900,234,'个性 舒适 运动'),
(13133,900,233,'男'),
(13134,900,232,'防UVA 防UVB 偏光'),
(13135,900,231,'8009'),
(13136,900,230,'2014年春夏季'),
(13137,900,229,'厦门'),
(13138,900,228,'PARZIN/帕森'),
(13139,901,242,'圆脸 长脸 方脸 椭圆形脸'),
(13140,901,241,'镜面弧度 镜架松紧'),
(13141,901,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(13142,901,239,'8009'),
(13143,901,238,'其他'),
(13144,901,237,'否'),
(13145,901,236,'镜布 镜盒'),
(13146,901,235,'100 - 200元'),
(13147,901,234,'个性 舒适 运动'),
(13148,901,233,'男'),
(13149,901,232,'防UVA 防UVB 偏光'),
(13150,901,231,'8009'),
(13151,901,230,'2014年春夏季'),
(13152,901,229,'厦门'),
(13153,901,228,'PARZIN/帕森'),
(13154,902,242,'圆脸 长脸 方脸 椭圆形脸'),
(13155,902,241,'镜面弧度 镜架松紧'),
(13156,902,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(13157,902,239,'8009'),
(13158,902,238,'其他'),
(13159,902,237,'否'),
(13160,902,236,'镜布 镜盒'),
(13161,902,235,'100 - 200元'),
(13162,902,234,'个性 舒适 运动'),
(13163,902,233,'男'),
(13164,902,232,'防UVA 防UVB 偏光'),
(13165,902,231,'8009'),
(13166,902,230,'2014年春夏季'),
(13167,902,229,'厦门'),
(13168,902,228,'PARZIN/帕森'),
(13169,903,242,'圆脸 长脸 方脸 椭圆形脸'),
(13170,903,241,'镜面弧度 镜架松紧'),
(13171,903,240,'黑框黑灰片 枪框渐灰片 银框反光膜天蓝片 金框G15片'),
(13172,903,239,'8009'),
(13173,903,238,'其他'),
(13174,903,237,'否'),
(13175,903,236,'镜布 镜盒'),
(13176,903,235,'100 - 200元'),
(13177,903,234,'个性 舒适 运动'),
(13178,903,233,'男'),
(13179,903,232,'防UVA 防UVB 偏光'),
(13180,903,231,'8009'),
(13181,903,230,'2014年春夏季'),
(13182,903,229,'厦门'),
(13183,903,228,'PARZIN/帕森'),
(13184,904,257,'6周岁以下'),
(13185,904,256,'Baby first/宝贝第一'),
(13186,904,255,'五点式'),
(13187,904,254,'机动车儿童乘员用约束系统'),
(13188,904,253,'坐式'),
(13189,904,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13190,904,251,'麦克英孚(宁波)婴童用品有限公司'),
(13191,904,250,'太空城堡'),
(13192,904,249,'2014092207000022'),
(13193,904,248,'25KG以下'),
(13194,904,247,'Isofix接口'),
(13195,904,246,'麦克英孚(宁波)婴童用品有限公司'),
(13196,904,245,'R102A太空城堡儿童约束系统'),
(13197,904,244,'有效'),
(13198,904,243,'中国大陆'),
(13199,905,257,'6周岁以下'),
(13200,905,256,'Baby first/宝贝第一'),
(13201,905,255,'五点式'),
(13202,905,254,'机动车儿童乘员用约束系统'),
(13203,905,253,'坐式'),
(13204,905,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13205,905,251,'麦克英孚(宁波)婴童用品有限公司'),
(13206,905,250,'太空城堡'),
(13207,905,249,'2014092207000022'),
(13208,905,248,'25KG以下'),
(13209,905,247,'Isofix接口'),
(13210,905,246,'麦克英孚(宁波)婴童用品有限公司'),
(13211,905,245,'R102A太空城堡儿童约束系统'),
(13212,905,244,'有效'),
(13213,905,243,'中国大陆'),
(13214,906,257,'6周岁以下'),
(13215,906,256,'Baby first/宝贝第一'),
(13216,906,255,'五点式'),
(13217,906,254,'机动车儿童乘员用约束系统'),
(13218,906,253,'坐式'),
(13219,906,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13220,906,251,'麦克英孚(宁波)婴童用品有限公司'),
(13221,906,250,'太空城堡'),
(13222,906,249,'2014092207000022'),
(13223,906,248,'25KG以下'),
(13224,906,247,'Isofix接口'),
(13225,906,246,'麦克英孚(宁波)婴童用品有限公司'),
(13226,906,245,'R102A太空城堡儿童约束系统'),
(13227,906,244,'有效'),
(13228,906,243,'中国大陆'),
(13229,907,257,'6周岁以下'),
(13230,907,256,'Baby first/宝贝第一'),
(13231,907,255,'五点式'),
(13232,907,254,'机动车儿童乘员用约束系统'),
(13233,907,253,'坐式'),
(13234,907,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13235,907,251,'麦克英孚(宁波)婴童用品有限公司'),
(13236,907,250,'太空城堡'),
(13237,907,249,'2014092207000022'),
(13238,907,248,'25KG以下'),
(13239,907,247,'Isofix接口'),
(13240,907,246,'麦克英孚(宁波)婴童用品有限公司'),
(13241,907,245,'R102A太空城堡儿童约束系统'),
(13242,907,244,'有效'),
(13243,907,243,'中国大陆'),
(13244,908,257,'6周岁以下'),
(13245,908,256,'Baby first/宝贝第一'),
(13246,908,255,'五点式'),
(13247,908,254,'机动车儿童乘员用约束系统'),
(13248,908,253,'坐式'),
(13249,908,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13250,908,251,'麦克英孚(宁波)婴童用品有限公司'),
(13251,908,250,'太空城堡'),
(13252,908,249,'2014092207000022'),
(13253,908,248,'25KG以下'),
(13254,908,247,'Isofix接口'),
(13255,908,246,'麦克英孚(宁波)婴童用品有限公司'),
(13256,908,245,'R102A太空城堡儿童约束系统'),
(13257,908,244,'有效'),
(13258,908,243,'中国大陆'),
(13259,909,257,'6周岁以下'),
(13260,909,256,'Baby first/宝贝第一'),
(13261,909,255,'五点式'),
(13262,909,254,'机动车儿童乘员用约束系统'),
(13263,909,253,'坐式'),
(13264,909,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13265,909,251,'麦克英孚(宁波)婴童用品有限公司'),
(13266,909,250,'太空城堡'),
(13267,909,249,'2014092207000022'),
(13268,909,248,'25KG以下'),
(13269,909,247,'Isofix接口'),
(13270,909,246,'麦克英孚(宁波)婴童用品有限公司'),
(13271,909,245,'R102A太空城堡儿童约束系统'),
(13272,909,244,'有效'),
(13273,909,243,'中国大陆'),
(13274,910,257,'6周岁以下'),
(13275,910,256,'Baby first/宝贝第一'),
(13276,910,255,'五点式'),
(13277,910,254,'机动车儿童乘员用约束系统'),
(13278,910,253,'坐式'),
(13279,910,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13280,910,251,'麦克英孚(宁波)婴童用品有限公司'),
(13281,910,250,'太空城堡'),
(13282,910,249,'2014092207000022'),
(13283,910,248,'25KG以下'),
(13284,910,247,'Isofix接口'),
(13285,910,246,'麦克英孚(宁波)婴童用品有限公司'),
(13286,910,245,'R102A太空城堡儿童约束系统'),
(13287,910,244,'有效'),
(13288,910,243,'中国大陆'),
(13289,911,257,'6周岁以下'),
(13290,911,256,'Baby first/宝贝第一'),
(13291,911,255,'五点式'),
(13292,911,254,'机动车儿童乘员用约束系统'),
(13293,911,253,'坐式'),
(13294,911,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13295,911,251,'麦克英孚(宁波)婴童用品有限公司'),
(13296,911,250,'太空城堡'),
(13297,911,249,'2014092207000022'),
(13298,911,248,'25KG以下'),
(13299,911,247,'Isofix接口'),
(13300,911,246,'麦克英孚(宁波)婴童用品有限公司'),
(13301,911,245,'R102A太空城堡儿童约束系统'),
(13302,911,244,'有效'),
(13303,911,243,'中国大陆'),
(13304,912,257,'6周岁以下'),
(13305,912,256,'Baby first/宝贝第一'),
(13306,912,255,'五点式'),
(13307,912,254,'机动车儿童乘员用约束系统'),
(13308,912,253,'坐式'),
(13309,912,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13310,912,251,'麦克英孚(宁波)婴童用品有限公司'),
(13311,912,250,'太空城堡'),
(13312,912,249,'2014092207000022'),
(13313,912,248,'25KG以下'),
(13314,912,247,'Isofix接口'),
(13315,912,246,'麦克英孚(宁波)婴童用品有限公司'),
(13316,912,245,'R102A太空城堡儿童约束系统'),
(13317,912,244,'有效'),
(13318,912,243,'中国大陆'),
(13319,913,257,'6周岁以下'),
(13320,913,256,'Baby first/宝贝第一'),
(13321,913,255,'五点式'),
(13322,913,254,'机动车儿童乘员用约束系统'),
(13323,913,253,'坐式'),
(13324,913,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13325,913,251,'麦克英孚(宁波)婴童用品有限公司'),
(13326,913,250,'太空城堡'),
(13327,913,249,'2014092207000022'),
(13328,913,248,'25KG以下'),
(13329,913,247,'Isofix接口'),
(13330,913,246,'麦克英孚(宁波)婴童用品有限公司'),
(13331,913,245,'R102A太空城堡儿童约束系统'),
(13332,913,244,'有效'),
(13333,913,243,'中国大陆'),
(13334,914,257,'6周岁以下'),
(13335,914,256,'Baby first/宝贝第一'),
(13336,914,255,'五点式'),
(13337,914,254,'机动车儿童乘员用约束系统'),
(13338,914,253,'坐式'),
(13339,914,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13340,914,251,'麦克英孚(宁波)婴童用品有限公司'),
(13341,914,250,'太空城堡'),
(13342,914,249,'2014092207000022'),
(13343,914,248,'25KG以下'),
(13344,914,247,'Isofix接口'),
(13345,914,246,'麦克英孚(宁波)婴童用品有限公司'),
(13346,914,245,'R102A太空城堡儿童约束系统'),
(13347,914,244,'有效'),
(13348,914,243,'中国大陆'),
(13349,915,257,'6周岁以下'),
(13350,915,256,'Baby first/宝贝第一'),
(13351,915,255,'五点式'),
(13352,915,254,'机动车儿童乘员用约束系统'),
(13353,915,253,'坐式'),
(13354,915,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13355,915,251,'麦克英孚(宁波)婴童用品有限公司'),
(13356,915,250,'太空城堡'),
(13357,915,249,'2014092207000022'),
(13358,915,248,'25KG以下'),
(13359,915,247,'Isofix接口'),
(13360,915,246,'麦克英孚(宁波)婴童用品有限公司'),
(13361,915,245,'R102A太空城堡儿童约束系统'),
(13362,915,244,'有效'),
(13363,915,243,'中国大陆'),
(13364,916,257,'6周岁以下'),
(13365,916,256,'Baby first/宝贝第一'),
(13366,916,255,'五点式'),
(13367,916,254,'机动车儿童乘员用约束系统'),
(13368,916,253,'坐式'),
(13369,916,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13370,916,251,'麦克英孚(宁波)婴童用品有限公司'),
(13371,916,250,'太空城堡'),
(13372,916,249,'2014092207000022'),
(13373,916,248,'25KG以下'),
(13374,916,247,'Isofix接口'),
(13375,916,246,'麦克英孚(宁波)婴童用品有限公司'),
(13376,916,245,'R102A太空城堡儿童约束系统'),
(13377,916,244,'有效'),
(13378,916,243,'中国大陆'),
(13379,917,257,'6周岁以下'),
(13380,917,256,'Baby first/宝贝第一'),
(13381,917,255,'五点式'),
(13382,917,254,'机动车儿童乘员用约束系统'),
(13383,917,253,'坐式'),
(13384,917,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13385,917,251,'麦克英孚(宁波)婴童用品有限公司'),
(13386,917,250,'太空城堡'),
(13387,917,249,'2014092207000022'),
(13388,917,248,'25KG以下'),
(13389,917,247,'Isofix接口'),
(13390,917,246,'麦克英孚(宁波)婴童用品有限公司'),
(13391,917,245,'R102A太空城堡儿童约束系统'),
(13392,917,244,'有效'),
(13393,917,243,'中国大陆'),
(13394,918,257,'6周岁以下'),
(13395,918,256,'Baby first/宝贝第一'),
(13396,918,255,'五点式'),
(13397,918,254,'机动车儿童乘员用约束系统'),
(13398,918,253,'坐式'),
(13399,918,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13400,918,251,'麦克英孚(宁波)婴童用品有限公司'),
(13401,918,250,'太空城堡'),
(13402,918,249,'2014092207000022'),
(13403,918,248,'25KG以下'),
(13404,918,247,'Isofix接口'),
(13405,918,246,'麦克英孚(宁波)婴童用品有限公司'),
(13406,918,245,'R102A太空城堡儿童约束系统'),
(13407,918,244,'有效'),
(13408,918,243,'中国大陆'),
(13409,919,257,'6周岁以下'),
(13410,919,256,'Baby first/宝贝第一'),
(13411,919,255,'五点式'),
(13412,919,254,'机动车儿童乘员用约束系统'),
(13413,919,253,'坐式'),
(13414,919,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13415,919,251,'麦克英孚(宁波)婴童用品有限公司'),
(13416,919,250,'太空城堡'),
(13417,919,249,'2014092207000022'),
(13418,919,248,'25KG以下'),
(13419,919,247,'Isofix接口'),
(13420,919,246,'麦克英孚(宁波)婴童用品有限公司'),
(13421,919,245,'R102A太空城堡儿童约束系统'),
(13422,919,244,'有效'),
(13423,919,243,'中国大陆'),
(13424,920,257,'6周岁以下'),
(13425,920,256,'Baby first/宝贝第一'),
(13426,920,255,'五点式'),
(13427,920,254,'机动车儿童乘员用约束系统'),
(13428,920,253,'坐式'),
(13429,920,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13430,920,251,'麦克英孚(宁波)婴童用品有限公司'),
(13431,920,250,'太空城堡'),
(13432,920,249,'2014092207000022'),
(13433,920,248,'25KG以下'),
(13434,920,247,'Isofix接口'),
(13435,920,246,'麦克英孚(宁波)婴童用品有限公司'),
(13436,920,245,'R102A太空城堡儿童约束系统'),
(13437,920,244,'有效'),
(13438,920,243,'中国大陆'),
(13439,921,257,'6周岁以下'),
(13440,921,256,'Baby first/宝贝第一'),
(13441,921,255,'五点式'),
(13442,921,254,'机动车儿童乘员用约束系统'),
(13443,921,253,'坐式'),
(13444,921,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13445,921,251,'麦克英孚(宁波)婴童用品有限公司'),
(13446,921,250,'太空城堡'),
(13447,921,249,'2014092207000022'),
(13448,921,248,'25KG以下'),
(13449,921,247,'Isofix接口'),
(13450,921,246,'麦克英孚(宁波)婴童用品有限公司'),
(13451,921,245,'R102A太空城堡儿童约束系统'),
(13452,921,244,'有效'),
(13453,921,243,'中国大陆'),
(13454,922,257,'6周岁以下'),
(13455,922,256,'Baby first/宝贝第一'),
(13456,922,255,'五点式'),
(13457,922,254,'机动车儿童乘员用约束系统'),
(13458,922,253,'坐式'),
(13459,922,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13460,922,251,'麦克英孚(宁波)婴童用品有限公司'),
(13461,922,250,'太空城堡'),
(13462,922,249,'2014092207000022'),
(13463,922,248,'25KG以下'),
(13464,922,247,'Isofix接口'),
(13465,922,246,'麦克英孚(宁波)婴童用品有限公司'),
(13466,922,245,'R102A太空城堡儿童约束系统'),
(13467,922,244,'有效'),
(13468,922,243,'中国大陆'),
(13469,923,257,'6周岁以下'),
(13470,923,256,'Baby first/宝贝第一'),
(13471,923,255,'五点式'),
(13472,923,254,'机动车儿童乘员用约束系统'),
(13473,923,253,'坐式'),
(13474,923,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13475,923,251,'麦克英孚(宁波)婴童用品有限公司'),
(13476,923,250,'太空城堡'),
(13477,923,249,'2014092207000022'),
(13478,923,248,'25KG以下'),
(13479,923,247,'Isofix接口'),
(13480,923,246,'麦克英孚(宁波)婴童用品有限公司'),
(13481,923,245,'R102A太空城堡儿童约束系统'),
(13482,923,244,'有效'),
(13483,923,243,'中国大陆'),
(13484,924,257,'6周岁以下'),
(13485,924,256,'Baby first/宝贝第一'),
(13486,924,255,'五点式'),
(13487,924,254,'机动车儿童乘员用约束系统'),
(13488,924,253,'坐式'),
(13489,924,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13490,924,251,'麦克英孚(宁波)婴童用品有限公司'),
(13491,924,250,'太空城堡'),
(13492,924,249,'2014092207000022'),
(13493,924,248,'25KG以下'),
(13494,924,247,'Isofix接口'),
(13495,924,246,'麦克英孚(宁波)婴童用品有限公司'),
(13496,924,245,'R102A太空城堡儿童约束系统'),
(13497,924,244,'有效'),
(13498,924,243,'中国大陆'),
(13499,925,257,'6周岁以下'),
(13500,925,256,'Baby first/宝贝第一'),
(13501,925,255,'五点式'),
(13502,925,254,'机动车儿童乘员用约束系统'),
(13503,925,253,'坐式'),
(13504,925,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13505,925,251,'麦克英孚(宁波)婴童用品有限公司'),
(13506,925,250,'太空城堡'),
(13507,925,249,'2014092207000022'),
(13508,925,248,'25KG以下'),
(13509,925,247,'Isofix接口'),
(13510,925,246,'麦克英孚(宁波)婴童用品有限公司'),
(13511,925,245,'R102A太空城堡儿童约束系统'),
(13512,925,244,'有效'),
(13513,925,243,'中国大陆'),
(13514,926,257,'6周岁以下'),
(13515,926,256,'Baby first/宝贝第一'),
(13516,926,255,'五点式'),
(13517,926,254,'机动车儿童乘员用约束系统'),
(13518,926,253,'坐式'),
(13519,926,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13520,926,251,'麦克英孚(宁波)婴童用品有限公司'),
(13521,926,250,'太空城堡'),
(13522,926,249,'2014092207000022'),
(13523,926,248,'25KG以下'),
(13524,926,247,'Isofix接口'),
(13525,926,246,'麦克英孚(宁波)婴童用品有限公司'),
(13526,926,245,'R102A太空城堡儿童约束系统'),
(13527,926,244,'有效'),
(13528,926,243,'中国大陆'),
(13529,927,257,'6周岁以下'),
(13530,927,256,'Baby first/宝贝第一'),
(13531,927,255,'五点式'),
(13532,927,254,'机动车儿童乘员用约束系统'),
(13533,927,253,'坐式'),
(13534,927,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13535,927,251,'麦克英孚(宁波)婴童用品有限公司'),
(13536,927,250,'太空城堡'),
(13537,927,249,'2014092207000022'),
(13538,927,248,'25KG以下'),
(13539,927,247,'Isofix接口'),
(13540,927,246,'麦克英孚(宁波)婴童用品有限公司'),
(13541,927,245,'R102A太空城堡儿童约束系统'),
(13542,927,244,'有效'),
(13543,927,243,'中国大陆'),
(13544,928,257,'6周岁以下'),
(13545,928,256,'Baby first/宝贝第一'),
(13546,928,255,'五点式'),
(13547,928,254,'机动车儿童乘员用约束系统'),
(13548,928,253,'坐式'),
(13549,928,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13550,928,251,'麦克英孚(宁波)婴童用品有限公司'),
(13551,928,250,'太空城堡'),
(13552,928,249,'2014092207000022'),
(13553,928,248,'25KG以下'),
(13554,928,247,'Isofix接口'),
(13555,928,246,'麦克英孚(宁波)婴童用品有限公司'),
(13556,928,245,'R102A太空城堡儿童约束系统'),
(13557,928,244,'有效'),
(13558,928,243,'中国大陆'),
(13559,929,257,'6周岁以下'),
(13560,929,256,'Baby first/宝贝第一'),
(13561,929,255,'五点式'),
(13562,929,254,'机动车儿童乘员用约束系统'),
(13563,929,253,'坐式'),
(13564,929,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13565,929,251,'麦克英孚(宁波)婴童用品有限公司'),
(13566,929,250,'太空城堡'),
(13567,929,249,'2014092207000022'),
(13568,929,248,'25KG以下'),
(13569,929,247,'Isofix接口'),
(13570,929,246,'麦克英孚(宁波)婴童用品有限公司'),
(13571,929,245,'R102A太空城堡儿童约束系统'),
(13572,929,244,'有效'),
(13573,929,243,'中国大陆'),
(13574,930,257,'6周岁以下'),
(13575,930,256,'Baby first/宝贝第一'),
(13576,930,255,'五点式'),
(13577,930,254,'机动车儿童乘员用约束系统'),
(13578,930,253,'坐式'),
(13579,930,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13580,930,251,'麦克英孚(宁波)婴童用品有限公司'),
(13581,930,250,'太空城堡'),
(13582,930,249,'2014092207000022'),
(13583,930,248,'25KG以下'),
(13584,930,247,'Isofix接口'),
(13585,930,246,'麦克英孚(宁波)婴童用品有限公司'),
(13586,930,245,'R102A太空城堡儿童约束系统'),
(13587,930,244,'有效'),
(13588,930,243,'中国大陆'),
(13589,931,257,'6周岁以下'),
(13590,931,256,'Baby first/宝贝第一'),
(13591,931,255,'五点式'),
(13592,931,254,'机动车儿童乘员用约束系统'),
(13593,931,253,'坐式'),
(13594,931,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13595,931,251,'麦克英孚(宁波)婴童用品有限公司'),
(13596,931,250,'太空城堡'),
(13597,931,249,'2014092207000022'),
(13598,931,248,'25KG以下'),
(13599,931,247,'Isofix接口'),
(13600,931,246,'麦克英孚(宁波)婴童用品有限公司'),
(13601,931,245,'R102A太空城堡儿童约束系统'),
(13602,931,244,'有效'),
(13603,931,243,'中国大陆'),
(13604,932,257,'6周岁以下'),
(13605,932,256,'Baby first/宝贝第一'),
(13606,932,255,'五点式'),
(13607,932,254,'机动车儿童乘员用约束系统'),
(13608,932,253,'坐式'),
(13609,932,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13610,932,251,'麦克英孚(宁波)婴童用品有限公司'),
(13611,932,250,'太空城堡'),
(13612,932,249,'2014092207000022'),
(13613,932,248,'25KG以下'),
(13614,932,247,'Isofix接口'),
(13615,932,246,'麦克英孚(宁波)婴童用品有限公司'),
(13616,932,245,'R102A太空城堡儿童约束系统'),
(13617,932,244,'有效'),
(13618,932,243,'中国大陆'),
(13619,933,257,'6周岁以下'),
(13620,933,256,'Baby first/宝贝第一'),
(13621,933,255,'五点式'),
(13622,933,254,'机动车儿童乘员用约束系统'),
(13623,933,253,'坐式'),
(13624,933,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13625,933,251,'麦克英孚(宁波)婴童用品有限公司'),
(13626,933,250,'太空城堡'),
(13627,933,249,'2014092207000022'),
(13628,933,248,'25KG以下'),
(13629,933,247,'Isofix接口'),
(13630,933,246,'麦克英孚(宁波)婴童用品有限公司'),
(13631,933,245,'R102A太空城堡儿童约束系统'),
(13632,933,244,'有效'),
(13633,933,243,'中国大陆'),
(13634,934,257,'6周岁以下'),
(13635,934,256,'Baby first/宝贝第一'),
(13636,934,255,'五点式'),
(13637,934,254,'机动车儿童乘员用约束系统'),
(13638,934,253,'坐式'),
(13639,934,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13640,934,251,'麦克英孚(宁波)婴童用品有限公司'),
(13641,934,250,'太空城堡'),
(13642,934,249,'2014092207000022'),
(13643,934,248,'25KG以下'),
(13644,934,247,'Isofix接口'),
(13645,934,246,'麦克英孚(宁波)婴童用品有限公司'),
(13646,934,245,'R102A太空城堡儿童约束系统'),
(13647,934,244,'有效'),
(13648,934,243,'中国大陆'),
(13649,935,257,'6周岁以下'),
(13650,935,256,'Baby first/宝贝第一'),
(13651,935,255,'五点式'),
(13652,935,254,'机动车儿童乘员用约束系统'),
(13653,935,253,'坐式'),
(13654,935,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13655,935,251,'麦克英孚(宁波)婴童用品有限公司'),
(13656,935,250,'太空城堡'),
(13657,935,249,'2014092207000022'),
(13658,935,248,'25KG以下'),
(13659,935,247,'Isofix接口'),
(13660,935,246,'麦克英孚(宁波)婴童用品有限公司'),
(13661,935,245,'R102A太空城堡儿童约束系统'),
(13662,935,244,'有效'),
(13663,935,243,'中国大陆'),
(13664,936,257,'6周岁以下'),
(13665,936,256,'Baby first/宝贝第一'),
(13666,936,255,'五点式'),
(13667,936,254,'机动车儿童乘员用约束系统'),
(13668,936,253,'坐式'),
(13669,936,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13670,936,251,'麦克英孚(宁波)婴童用品有限公司'),
(13671,936,250,'太空城堡'),
(13672,936,249,'2014092207000022'),
(13673,936,248,'25KG以下'),
(13674,936,247,'Isofix接口'),
(13675,936,246,'麦克英孚(宁波)婴童用品有限公司'),
(13676,936,245,'R102A太空城堡儿童约束系统'),
(13677,936,244,'有效'),
(13678,936,243,'中国大陆'),
(13679,937,257,'6周岁以下'),
(13680,937,256,'Baby first/宝贝第一'),
(13681,937,255,'五点式'),
(13682,937,254,'机动车儿童乘员用约束系统'),
(13683,937,253,'坐式'),
(13684,937,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13685,937,251,'麦克英孚(宁波)婴童用品有限公司'),
(13686,937,250,'太空城堡'),
(13687,937,249,'2014092207000022'),
(13688,937,248,'25KG以下'),
(13689,937,247,'Isofix接口'),
(13690,937,246,'麦克英孚(宁波)婴童用品有限公司'),
(13691,937,245,'R102A太空城堡儿童约束系统'),
(13692,937,244,'有效'),
(13693,937,243,'中国大陆'),
(13694,938,257,'6周岁以下'),
(13695,938,256,'Baby first/宝贝第一'),
(13696,938,255,'五点式'),
(13697,938,254,'机动车儿童乘员用约束系统'),
(13698,938,253,'坐式'),
(13699,938,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13700,938,251,'麦克英孚(宁波)婴童用品有限公司'),
(13701,938,250,'太空城堡'),
(13702,938,249,'2014092207000022'),
(13703,938,248,'25KG以下'),
(13704,938,247,'Isofix接口'),
(13705,938,246,'麦克英孚(宁波)婴童用品有限公司'),
(13706,938,245,'R102A太空城堡儿童约束系统'),
(13707,938,244,'有效'),
(13708,938,243,'中国大陆'),
(13709,939,257,'6周岁以下'),
(13710,939,256,'Baby first/宝贝第一'),
(13711,939,255,'五点式'),
(13712,939,254,'机动车儿童乘员用约束系统'),
(13713,939,253,'坐式'),
(13714,939,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13715,939,251,'麦克英孚(宁波)婴童用品有限公司'),
(13716,939,250,'太空城堡'),
(13717,939,249,'2014092207000022'),
(13718,939,248,'25KG以下'),
(13719,939,247,'Isofix接口'),
(13720,939,246,'麦克英孚(宁波)婴童用品有限公司'),
(13721,939,245,'R102A太空城堡儿童约束系统'),
(13722,939,244,'有效'),
(13723,939,243,'中国大陆'),
(13724,940,257,'6周岁以下'),
(13725,940,256,'Baby first/宝贝第一'),
(13726,940,255,'五点式'),
(13727,940,254,'机动车儿童乘员用约束系统'),
(13728,940,253,'坐式'),
(13729,940,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13730,940,251,'麦克英孚(宁波)婴童用品有限公司'),
(13731,940,250,'太空城堡'),
(13732,940,249,'2014092207000022'),
(13733,940,248,'25KG以下'),
(13734,940,247,'Isofix接口'),
(13735,940,246,'麦克英孚(宁波)婴童用品有限公司'),
(13736,940,245,'R102A太空城堡儿童约束系统'),
(13737,940,244,'有效'),
(13738,940,243,'中国大陆'),
(13739,941,257,'6周岁以下'),
(13740,941,256,'Baby first/宝贝第一'),
(13741,941,255,'五点式'),
(13742,941,254,'机动车儿童乘员用约束系统'),
(13743,941,253,'坐式'),
(13744,941,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13745,941,251,'麦克英孚(宁波)婴童用品有限公司'),
(13746,941,250,'太空城堡'),
(13747,941,249,'2014092207000022'),
(13748,941,248,'25KG以下'),
(13749,941,247,'Isofix接口'),
(13750,941,246,'麦克英孚(宁波)婴童用品有限公司'),
(13751,941,245,'R102A太空城堡儿童约束系统'),
(13752,941,244,'有效'),
(13753,941,243,'中国大陆'),
(13754,942,257,'6周岁以下'),
(13755,942,256,'Baby first/宝贝第一'),
(13756,942,255,'五点式'),
(13757,942,254,'机动车儿童乘员用约束系统'),
(13758,942,253,'坐式'),
(13759,942,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13760,942,251,'麦克英孚(宁波)婴童用品有限公司'),
(13761,942,250,'太空城堡'),
(13762,942,249,'2014092207000022'),
(13763,942,248,'25KG以下'),
(13764,942,247,'Isofix接口'),
(13765,942,246,'麦克英孚(宁波)婴童用品有限公司'),
(13766,942,245,'R102A太空城堡儿童约束系统'),
(13767,942,244,'有效'),
(13768,942,243,'中国大陆'),
(13769,943,257,'6周岁以下'),
(13770,943,256,'Baby first/宝贝第一'),
(13771,943,255,'五点式'),
(13772,943,254,'机动车儿童乘员用约束系统'),
(13773,943,253,'坐式'),
(13774,943,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13775,943,251,'麦克英孚(宁波)婴童用品有限公司'),
(13776,943,250,'太空城堡'),
(13777,943,249,'2014092207000022'),
(13778,943,248,'25KG以下'),
(13779,943,247,'Isofix接口'),
(13780,943,246,'麦克英孚(宁波)婴童用品有限公司'),
(13781,943,245,'R102A太空城堡儿童约束系统'),
(13782,943,244,'有效'),
(13783,943,243,'中国大陆'),
(13784,944,257,'6周岁以下'),
(13785,944,256,'Baby first/宝贝第一'),
(13786,944,255,'五点式'),
(13787,944,254,'机动车儿童乘员用约束系统'),
(13788,944,253,'坐式'),
(13789,944,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13790,944,251,'麦克英孚(宁波)婴童用品有限公司'),
(13791,944,250,'太空城堡'),
(13792,944,249,'2014092207000022'),
(13793,944,248,'25KG以下'),
(13794,944,247,'Isofix接口'),
(13795,944,246,'麦克英孚(宁波)婴童用品有限公司'),
(13796,944,245,'R102A太空城堡儿童约束系统'),
(13797,944,244,'有效'),
(13798,944,243,'中国大陆'),
(13799,945,257,'6周岁以下'),
(13800,945,256,'Baby first/宝贝第一'),
(13801,945,255,'五点式'),
(13802,945,254,'机动车儿童乘员用约束系统'),
(13803,945,253,'坐式'),
(13804,945,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13805,945,251,'麦克英孚(宁波)婴童用品有限公司'),
(13806,945,250,'太空城堡'),
(13807,945,249,'2014092207000022'),
(13808,945,248,'25KG以下'),
(13809,945,247,'Isofix接口'),
(13810,945,246,'麦克英孚(宁波)婴童用品有限公司'),
(13811,945,245,'R102A太空城堡儿童约束系统'),
(13812,945,244,'有效'),
(13813,945,243,'中国大陆'),
(13814,946,257,'6周岁以下'),
(13815,946,256,'Baby first/宝贝第一'),
(13816,946,255,'五点式'),
(13817,946,254,'机动车儿童乘员用约束系统'),
(13818,946,253,'坐式'),
(13819,946,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13820,946,251,'麦克英孚(宁波)婴童用品有限公司'),
(13821,946,250,'太空城堡'),
(13822,946,249,'2014092207000022'),
(13823,946,248,'25KG以下'),
(13824,946,247,'Isofix接口'),
(13825,946,246,'麦克英孚(宁波)婴童用品有限公司'),
(13826,946,245,'R102A太空城堡儿童约束系统'),
(13827,946,244,'有效'),
(13828,946,243,'中国大陆'),
(13829,947,257,'6周岁以下'),
(13830,947,256,'Baby first/宝贝第一'),
(13831,947,255,'五点式'),
(13832,947,254,'机动车儿童乘员用约束系统'),
(13833,947,253,'坐式'),
(13834,947,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13835,947,251,'麦克英孚(宁波)婴童用品有限公司'),
(13836,947,250,'太空城堡'),
(13837,947,249,'2014092207000022'),
(13838,947,248,'25KG以下'),
(13839,947,247,'Isofix接口'),
(13840,947,246,'麦克英孚(宁波)婴童用品有限公司'),
(13841,947,245,'R102A太空城堡儿童约束系统'),
(13842,947,244,'有效'),
(13843,947,243,'中国大陆'),
(13844,948,257,'6周岁以下'),
(13845,948,256,'Baby first/宝贝第一'),
(13846,948,255,'五点式'),
(13847,948,254,'机动车儿童乘员用约束系统'),
(13848,948,253,'坐式'),
(13849,948,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13850,948,251,'麦克英孚(宁波)婴童用品有限公司'),
(13851,948,250,'太空城堡'),
(13852,948,249,'2014092207000022'),
(13853,948,248,'25KG以下'),
(13854,948,247,'Isofix接口'),
(13855,948,246,'麦克英孚(宁波)婴童用品有限公司'),
(13856,948,245,'R102A太空城堡儿童约束系统'),
(13857,948,244,'有效'),
(13858,948,243,'中国大陆'),
(13859,949,257,'6周岁以下'),
(13860,949,256,'Baby first/宝贝第一'),
(13861,949,255,'五点式'),
(13862,949,254,'机动车儿童乘员用约束系统'),
(13863,949,253,'坐式'),
(13864,949,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13865,949,251,'麦克英孚(宁波)婴童用品有限公司'),
(13866,949,250,'太空城堡'),
(13867,949,249,'2014092207000022'),
(13868,949,248,'25KG以下'),
(13869,949,247,'Isofix接口'),
(13870,949,246,'麦克英孚(宁波)婴童用品有限公司'),
(13871,949,245,'R102A太空城堡儿童约束系统'),
(13872,949,244,'有效'),
(13873,949,243,'中国大陆'),
(13874,950,257,'6周岁以下'),
(13875,950,256,'Baby first/宝贝第一'),
(13876,950,255,'五点式'),
(13877,950,254,'机动车儿童乘员用约束系统'),
(13878,950,253,'坐式'),
(13879,950,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13880,950,251,'麦克英孚(宁波)婴童用品有限公司'),
(13881,950,250,'太空城堡'),
(13882,950,249,'2014092207000022'),
(13883,950,248,'25KG以下'),
(13884,950,247,'Isofix接口'),
(13885,950,246,'麦克英孚(宁波)婴童用品有限公司'),
(13886,950,245,'R102A太空城堡儿童约束系统'),
(13887,950,244,'有效'),
(13888,950,243,'中国大陆'),
(13889,951,257,'6周岁以下'),
(13890,951,256,'Baby first/宝贝第一'),
(13891,951,255,'五点式'),
(13892,951,254,'机动车儿童乘员用约束系统'),
(13893,951,253,'坐式'),
(13894,951,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13895,951,251,'麦克英孚(宁波)婴童用品有限公司'),
(13896,951,250,'太空城堡'),
(13897,951,249,'2014092207000022'),
(13898,951,248,'25KG以下'),
(13899,951,247,'Isofix接口'),
(13900,951,246,'麦克英孚(宁波)婴童用品有限公司'),
(13901,951,245,'R102A太空城堡儿童约束系统'),
(13902,951,244,'有效'),
(13903,951,243,'中国大陆'),
(13904,952,257,'6周岁以下'),
(13905,952,256,'Baby first/宝贝第一'),
(13906,952,255,'五点式'),
(13907,952,254,'机动车儿童乘员用约束系统'),
(13908,952,253,'坐式'),
(13909,952,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13910,952,251,'麦克英孚(宁波)婴童用品有限公司'),
(13911,952,250,'太空城堡'),
(13912,952,249,'2014092207000022'),
(13913,952,248,'25KG以下'),
(13914,952,247,'Isofix接口'),
(13915,952,246,'麦克英孚(宁波)婴童用品有限公司'),
(13916,952,245,'R102A太空城堡儿童约束系统'),
(13917,952,244,'有效'),
(13918,952,243,'中国大陆'),
(13919,953,257,'6周岁以下'),
(13920,953,256,'Baby first/宝贝第一'),
(13921,953,255,'五点式'),
(13922,953,254,'机动车儿童乘员用约束系统'),
(13923,953,253,'坐式'),
(13924,953,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13925,953,251,'麦克英孚(宁波)婴童用品有限公司'),
(13926,953,250,'太空城堡'),
(13927,953,249,'2014092207000022'),
(13928,953,248,'25KG以下'),
(13929,953,247,'Isofix接口'),
(13930,953,246,'麦克英孚(宁波)婴童用品有限公司'),
(13931,953,245,'R102A太空城堡儿童约束系统'),
(13932,953,244,'有效'),
(13933,953,243,'中国大陆'),
(13934,954,257,'6周岁以下'),
(13935,954,256,'Baby first/宝贝第一'),
(13936,954,255,'五点式'),
(13937,954,254,'机动车儿童乘员用约束系统'),
(13938,954,253,'坐式'),
(13939,954,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13940,954,251,'麦克英孚(宁波)婴童用品有限公司'),
(13941,954,250,'太空城堡'),
(13942,954,249,'2014092207000022'),
(13943,954,248,'25KG以下'),
(13944,954,247,'Isofix接口'),
(13945,954,246,'麦克英孚(宁波)婴童用品有限公司'),
(13946,954,245,'R102A太空城堡儿童约束系统'),
(13947,954,244,'有效'),
(13948,954,243,'中国大陆'),
(13949,955,257,'6周岁以下'),
(13950,955,256,'Baby first/宝贝第一'),
(13951,955,255,'五点式'),
(13952,955,254,'机动车儿童乘员用约束系统'),
(13953,955,253,'坐式'),
(13954,955,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13955,955,251,'麦克英孚(宁波)婴童用品有限公司'),
(13956,955,250,'太空城堡'),
(13957,955,249,'2014092207000022'),
(13958,955,248,'25KG以下'),
(13959,955,247,'Isofix接口'),
(13960,955,246,'麦克英孚(宁波)婴童用品有限公司'),
(13961,955,245,'R102A太空城堡儿童约束系统'),
(13962,955,244,'有效'),
(13963,955,243,'中国大陆'),
(13964,956,257,'6周岁以下'),
(13965,956,256,'Baby first/宝贝第一'),
(13966,956,255,'五点式'),
(13967,956,254,'机动车儿童乘员用约束系统'),
(13968,956,253,'坐式'),
(13969,956,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13970,956,251,'麦克英孚(宁波)婴童用品有限公司'),
(13971,956,250,'太空城堡'),
(13972,956,249,'2014092207000022'),
(13973,956,248,'25KG以下'),
(13974,956,247,'Isofix接口'),
(13975,956,246,'麦克英孚(宁波)婴童用品有限公司'),
(13976,956,245,'R102A太空城堡儿童约束系统'),
(13977,956,244,'有效'),
(13978,956,243,'中国大陆'),
(13979,957,257,'6周岁以下'),
(13980,957,256,'Baby first/宝贝第一'),
(13981,957,255,'五点式'),
(13982,957,254,'机动车儿童乘员用约束系统'),
(13983,957,253,'坐式'),
(13984,957,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(13985,957,251,'麦克英孚(宁波)婴童用品有限公司'),
(13986,957,250,'太空城堡'),
(13987,957,249,'2014092207000022'),
(13988,957,248,'25KG以下'),
(13989,957,247,'Isofix接口'),
(13990,957,246,'麦克英孚(宁波)婴童用品有限公司'),
(13991,957,245,'R102A太空城堡儿童约束系统'),
(13992,957,244,'有效'),
(13993,957,243,'中国大陆'),
(13994,958,257,'6周岁以下'),
(13995,958,256,'Baby first/宝贝第一'),
(13996,958,255,'五点式'),
(13997,958,254,'机动车儿童乘员用约束系统'),
(13998,958,253,'坐式'),
(13999,958,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(14000,958,251,'麦克英孚(宁波)婴童用品有限公司'),
(14001,958,250,'太空城堡'),
(14002,958,249,'2014092207000022'),
(14003,958,248,'25KG以下'),
(14004,958,247,'Isofix接口'),
(14005,958,246,'麦克英孚(宁波)婴童用品有限公司'),
(14006,958,245,'R102A太空城堡儿童约束系统'),
(14007,958,244,'有效'),
(14008,958,243,'中国大陆'),
(14009,959,257,'6周岁以下'),
(14010,959,256,'Baby first/宝贝第一'),
(14011,959,255,'五点式'),
(14012,959,254,'机动车儿童乘员用约束系统'),
(14013,959,253,'坐式'),
(14014,959,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(14015,959,251,'麦克英孚(宁波)婴童用品有限公司'),
(14016,959,250,'太空城堡'),
(14017,959,249,'2014092207000022'),
(14018,959,248,'25KG以下'),
(14019,959,247,'Isofix接口'),
(14020,959,246,'麦克英孚(宁波)婴童用品有限公司'),
(14021,959,245,'R102A太空城堡儿童约束系统'),
(14022,959,244,'有效'),
(14023,959,243,'中国大陆'),
(14024,960,257,'6周岁以下'),
(14025,960,256,'Baby first/宝贝第一'),
(14026,960,255,'五点式'),
(14027,960,254,'机动车儿童乘员用约束系统'),
(14028,960,253,'坐式2016'),
(14029,960,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(14030,960,251,'麦克英孚(宁波)婴童用品有限公司'),
(14031,960,250,'太空城堡'),
(14032,960,249,'2014092207000022'),
(14033,960,248,'25KG以下'),
(14034,960,247,'Isofix接口'),
(14035,960,246,'麦克英孚(宁波)婴童用品有限公司'),
(14036,960,245,'R102A太空城堡儿童约束系统'),
(14037,960,244,'有效'),
(14038,960,243,'中国大陆'),
(14039,961,257,'6周岁以下'),
(14040,961,256,'Baby first/宝贝第一'),
(14041,961,255,'五点式'),
(14042,961,254,'机动车儿童乘员用约束系统'),
(14043,961,253,'坐式'),
(14044,961,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(14045,961,251,'麦克英孚(宁波)婴童用品有限公司'),
(14046,961,250,'太空城堡'),
(14047,961,249,'2014092207000022'),
(14048,961,248,'25KG以下'),
(14049,961,247,'Isofix接口'),
(14050,961,246,'麦克英孚(宁波)婴童用品有限公司'),
(14051,961,245,'R102A太空城堡儿童约束系统'),
(14052,961,244,'有效'),
(14053,961,243,'中国大陆'),
(14054,962,257,'6周岁以下'),
(14055,962,256,'Baby first/宝贝第一'),
(14056,962,255,'五点式'),
(14057,962,254,'机动车儿童乘员用约束系统'),
(14058,962,253,'坐式'),
(14059,962,252,'宝塔蓝 橄榄绿 星空蓝 深海蓝 凯旋红 石榴紫 经典红'),
(14060,962,251,'麦克英孚(宁波)婴童用品有限公司'),
(14061,962,250,'太空城堡'),
(14062,962,249,'2014092207000022'),
(14063,962,248,'25KG以下'),
(14064,962,247,'Isofix接口'),
(14065,962,246,'麦克英孚(宁波)婴童用品有限公司'),
(14066,962,245,'R102A太空城堡儿童约束系统'),
(14067,962,244,'有效'),
(14068,962,243,'中国大陆'),
(14069,137,26,'同城物流送货上门'),
(14070,137,25,'3/6L'),
(14071,137,24,'【箭牌头牌 收藏送原装配件 12大中心仓极速发货】 【699元加购箭牌热销花洒AE3310B】 咨询客服，单拍不发货'),
(14072,137,23,'70kg及以上'),
(14073,137,22,'305mm 400mm'),
(14074,137,21,'PP板'),
(14075,137,20,'地排水'),
(14076,137,19,'喷射虹吸式'),
(14077,137,18,'AB1116'),
(14078,137,17,'缓冲'),
(14079,137,16,'连体式'),
(14080,137,15,'上按两端式'),
(14081,137,14,'ARROW/箭牌'),
(14082,484,122,'约10~16m2'),
(14083,484,121,'大1匹'),
(14084,484,120,'三级'),
(14085,484,119,'Hisense/海信 KFR-26GW/...'),
(14086,484,118,'冷暖电辅'),
(14087,484,117,'变频'),
(14088,484,116,'KFR-26GW/EF16A3z'),
(14089,484,115,'2013010703646857'),
(14090,484,114,'有效'),
(14091,484,113,'壁挂式'),
(14101,963,281,'3'),
(14102,963,280,'冬季'),
(14103,963,279,'韩版'),
(14104,963,278,'纯棉100%'),
(14105,963,277,'有帽子不可拆卸'),
(14106,963,276,'爱意表达'),
(14107,963,275,'无'),
(14108,963,274,'73cm'),
(14109,963,273,'小猴子棉衣红色'),
(14110,963,272,'中性'),
(14111,963,271,'棉100%'),
(14112,963,270,'B类'),
(14113,963,269,'other/其他'),
(14114,964,283,'回家狂欢节'),
(14115,964,282,'水电费第三方'),
(14116,966,281,NULL),
(14117,966,280,NULL),
(14118,966,279,''),
(14119,966,278,NULL),
(14120,966,277,NULL),
(14121,966,276,NULL),
(14122,966,275,NULL),
(14123,966,274,NULL),
(14124,966,273,NULL),
(14125,966,272,''),
(14126,966,271,NULL),
(14127,966,270,NULL),
(14128,966,269,NULL);

/*Table structure for table `review` */

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(4000) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_review_product` (`pid`),
  KEY `fk_review_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `review` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nameId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
