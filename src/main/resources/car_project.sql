/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : car_project

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-05-04 17:10:55
数据库为 car_project
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL COMMENT '用户id',
  `shop_id` varchar(255) NOT NULL COMMENT '商家id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '2', '1');

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `car_id` varchar(255) NOT NULL COMMENT '车辆id,uuid随机生成',
  `car_brand` varchar(255) NOT NULL COMMENT '车辆品牌',
  `car_name` varchar(255) NOT NULL COMMENT '车辆的名称',
  `car_type` varchar(255) NOT NULL COMMENT '车型',
  `car_image` varchar(255) NOT NULL COMMENT '车辆图片，关联图片的路径及名称',
  `car_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '车辆价格',
  `car_amount` int(11) NOT NULL COMMENT '车的数量',
  `car_people` int(11) NOT NULL COMMENT '载人数',
  `car_good` decimal(10,2) NOT NULL COMMENT '载货量',
  `car_info` varchar(255) NOT NULL COMMENT '车的描述信息',
  `rent_count` int(10) NOT NULL COMMENT '租赁次数',
  `shop_id` varchar(255) NOT NULL COMMENT '商家id',
  `car_milage` decimal(10,2) NOT NULL COMMENT '里程数',
  `car_time` date NOT NULL COMMENT '购买日期',
  `user_id` varchar(255) NOT NULL COMMENT '上传者id',
  PRIMARY KEY (`car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES ('1', '宝马', 'x4', 'suv', 'car1.jpg,car4.jpg', '500.00', '5', '5', '10.00', '新车', '3', '1', '600.00', '2018-04-10', '2');
INSERT INTO `car` VALUES ('1cde1a81-c785-4dfc-b514-2fae14371424', 'Jeep', '自由者', '轿车', 'Jeep自由者0.png,Jeep自由者1.png', '120.00', '5', '5', '0.00', '车型很好，美观                    ', '1', '1', '4520.00', '2018-02-08', '2');
INSERT INTO `car` VALUES ('2', '奔驰', 's5', '跑车', 'car3.jpg', '60.00', '3', '5', '0.00', '半新车', '4', '2', '8000.00', '2017-03-10', '0');
INSERT INTO `car` VALUES ('245aad1d-4733-4dfa-bb6b-1dd5000684b0', '马自达', 'a6', '轿车', 'car5.jpg', '80.00', '5', '5', '0.00', '新车', '0', '1', '1500.00', '2017-10-28', '1');
INSERT INTO `car` VALUES ('3', '宝马', 'q7', '跑车', 'car2.jpg', '300.00', '2', '2', '0.00', '新车', '0', '1', '100.00', '2018-04-12', '0');
INSERT INTO `car` VALUES ('32e89174-83f0-45be-ada9-ca404229b612', '马自达', 'a6', '轿车', 'car7.jpg', '80.00', '2', '5', '0.00', '新车', '0', '1', '1500.00', '2017-10-28', '1');
INSERT INTO `car` VALUES ('4', '标致', 'RCZ', '跑车', 'biaozhipaoche.jpg,car2.jpg', '400.00', '2', '2', '0.00', '新车', '0', '1', '0.00', '2018-04-14', '1');
INSERT INTO `car` VALUES ('40c2edcc-945b-4d20-a37d-8ec79189d18f', '马自达', 'a6', '轿车', 'car8.jpg,car5.jpg', '80.00', '5', '5', '0.00', '新车', '0', '1', '1500.00', '2017-10-28', '1');
INSERT INTO `car` VALUES ('5', '本田', 's7', '跑车', 'car5.jpg,car11.jpg', '10.00', '0', '4', '0.00', '旧车', '9', '2', '11560.00', '2018-04-14', '2');
INSERT INTO `car` VALUES ('51e0703b-f436-4b9b-9d8c-107e68582f9d', '马自达', 'a6', '轿车', 'car9.jpg', '80.00', '5', '5', '0.00', '新车', '0', '1', '1500.00', '2017-10-28', '1');
INSERT INTO `car` VALUES ('51fff6b2-8117-4819-b832-52cdfcd54147', '别克', 'GL6', 'MPV', 'ba889710-be32-4236-ab5e-924a0715f5a90.png,ba889710-be32-4236-ab5e-924a0715f5a91.png,ba889710-be32-4236-ab5e-924a0715f5a92.png,ba889710-be32-4236-ab5e-924a0715f5a93.png', '120.00', '2', '8', '0.00', '好                    ', '0', '1', '1200.00', '2018-05-01', '2');
INSERT INTO `car` VALUES ('59ba3914-8d99-4b26-8e2a-1358a50fe929', '福特', 'q8', '皮卡', ',5823f0bc-988c-494c-aeb9-5dbe9e16c4e30.png,e6cc0e4c-b3af-4a4a-9506-07b889ea51bd1.png', '200.00', '8', '5', '1.00', '                        安安稳稳                \r\n                    \r\n                    ', '0', '1', '1200.00', '2018-05-14', '2');
INSERT INTO `car` VALUES ('5b3cf95e-fbab-4aac-9ea6-10713f54487a', '马自达', 'a6', '轿车', 'car10.jpg,car5.jpg', '80.00', '5', '5', '0.00', '新车', '0', '1', '1500.00', '2017-10-28', '1');
INSERT INTO `car` VALUES ('6', '特斯拉', 'q1', '跑车', 'car6.jpg', '60.00', '2', '2', '0.00', '新车', '2', '1', '1400.00', '2018-04-10', '1');
INSERT INTO `car` VALUES ('65378f4f-48cb-4b06-aafc-4ba3d72399ef', '标致', 'm2', 'suv', 'car11.jpg,car5.jpg', '100.00', '3', '5', '0.00', '刚提的车                    ', '0', '1', '7800.00', '2018-04-04', '2');
INSERT INTO `car` VALUES ('9f5ad2e3-2fdc-42d0-977e-23e01f9366af', '马自达', 'x7', '跑车', 'car7.jpg', '120.00', '2', '2', '0.00', '半新车                   ', '0', '1', '4500.00', '2018-02-08', '1');
INSERT INTO `car` VALUES ('b397605b-3f87-44bb-86d3-d73a23030c35', '日产', 'a3', 'mpv', 'car7.jpg,car5.jpg', '200.00', '3', '7', '0.00', '经济适用                    ', '0', '1', '4500.00', '2018-02-15', '1');
INSERT INTO `car` VALUES ('f030f877-3859-4336-9145-066f0ced8881', '马自达', 'a6', '轿车', 'default.png', '80.00', '5', '5', '0.00', '新车', '0', '1', '1500.00', '2017-10-28', '1');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` varchar(255) NOT NULL COMMENT '订单id。uuid随机生成',
  `user_id` varchar(255) NOT NULL COMMENT '用户id',
  `shop_id` varchar(255) DEFAULT NULL COMMENT '商家id',
  `car_id` varchar(255) NOT NULL COMMENT '车辆id',
  `price` decimal(10,2) NOT NULL,
  `order_time` date DEFAULT NULL COMMENT '订单创建时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('58df35c7-7b36-4055-baaf-def9a8b2a581', '3', '1', '1cde1a81-c785-4dfc-b514-2fae14371424', '120.00', '2018-05-03');
INSERT INTO `order` VALUES ('687bc6c1-3946-453b-a051-fece841092c1', '0e97312f-11b2-4496-882f-a30e123e3928', '2', '2', '60.00', '2018-05-04');
INSERT INTO `order` VALUES ('bbe23f4c-0db6-4c98-a736-d0b1526d1d6a', '3', '1', '32e89174-83f0-45be-ada9-ca404229b612', '160.00', '2018-04-24');
INSERT INTO `order` VALUES ('c6cc40f3-afe2-4cab-b28e-a967c8e9d2ba', '3', '2', '2', '60.00', '2018-05-03');
INSERT INTO `order` VALUES ('d064cd10-d8b4-4550-881c-69938972b3a7', '3', '2', '2', '60.00', '2018-04-24');
INSERT INTO `order` VALUES ('d706caf9-4423-49b3-a09e-8cd0d085e4f0', '3', '2', '2', '600.00', '2018-04-24');

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `shop_id` varchar(255) NOT NULL DEFAULT '' COMMENT '商家id，uuid随机生成',
  `shop_name` varchar(255) NOT NULL COMMENT '商家名',
  `shop_phone` varchar(255) NOT NULL COMMENT '联系电话',
  `shop_email` varchar(255) NOT NULL,
  `shop_location` varchar(255) NOT NULL COMMENT '经纬度坐标',
  `jingdu` decimal(10,7) NOT NULL,
  `weidu` decimal(10,7) NOT NULL,
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('1', '测试商家1', 'a123456789', '77897@qq.com', '青岛市市南区1', '120.4001890', '36.0582080');
INSERT INTO `shop` VALUES ('2', '测试商家2', 'b123456789', '778982137@qq.com', '济南市高新区海关办事处', '117.2209940', '36.6759640');
INSERT INTO `shop` VALUES ('4d9f0258-66aa-446d-bf1e-45a072986e1a', '商家3', '111111111', '778982137@qq.com', '山东省临沂市沂南县', '118.4665360', '35.5582130');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('1', '测试1');
INSERT INTO `test` VALUES ('2', '测试2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(255) NOT NULL COMMENT '用户id，uuid随机生成',
  `user_count` varchar(255) NOT NULL COMMENT '用户账号',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户昵称，默认为用户邮箱',
  `user_email` varchar(255) DEFAULT NULL COMMENT '用户注册邮箱',
  `user_password` varchar(255) NOT NULL COMMENT '密码',
  `user_registration` date DEFAULT NULL COMMENT '用户注册时间',
  `is_active` int(11) unsigned zerofill DEFAULT '00000000000' COMMENT '是否被激活，激活为1，未激活为0。',
  `rent_count` int(11) unsigned zerofill DEFAULT '00000000000' COMMENT '租车次数',
  `user_image` varchar(255) DEFAULT NULL COMMENT '用户头像，关联的uuid',
  `is_admin` int(11) unsigned zerofill NOT NULL DEFAULT '00000000000' COMMENT '是否为管理员，默认为0。1为管理员，2为超级管理员',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0e97312f-11b2-4496-882f-a30e123e3928', 'admin@liunaijie.cn', '测试用户', 'admin@liunaijie.cn', '123456', '2018-05-04', '00000000001', '00000000001', 'default.png', '00000000000');
INSERT INTO `user` VALUES ('1', 'A123456', '2-超级管理员', '111@qq.com', '123456', '2018-03-27', '00000000001', '00000000001', 'default.png', '00000000002');
INSERT INTO `user` VALUES ('2', 'B123456', '1-管理员', '123@163.com', '123456', '2018-04-06', '00000000001', '00000000002', 'default.png', '00000000001');
INSERT INTO `user` VALUES ('3', 'w111', '0-用户', '17862962270@163.com', 'qwerqwer', '2018-03-28', '00000000001', '00000000009', 'default.png', '00000000000');
INSERT INTO `user` VALUES ('adddcd81-4ba4-4442-8459-c040fe819530', 'q111', '用户测试1', '777@qq.com', 'qwerqwer', '2018-05-04', '00000000000', '00000000000', 'sign.png', '00000000000');
INSERT INTO `user` VALUES ('c931e91f-645b-4da1-afdc-5fda1194b8dd', 'q111', '用户测试1', '777@qq.com', 'qwerqwer', '2018-04-24', '00000000001', '00000000003', 'sign.png', '00000000000');
INSERT INTO `user` VALUES ('de14e9ab-0036-4599-a2da-a0a1f61058f0', 'w111', '用户测试2', '888@qq.com', 'qwerqwer', '2018-05-04', '00000000000', '00000000000', 'sign.png', '00000000000');
