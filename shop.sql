/*
Navicat MySQL Data Transfer

Source Server         : dk
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2018-07-03 15:19:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for shop_cart
-- ----------------------------
DROP TABLE IF EXISTS `shop_cart`;
CREATE TABLE `shop_cart` (
  `id` varchar(50) NOT NULL,
  `shop_product_id` varchar(50) NOT NULL,
  `count` int(11) NOT NULL,
  `sys_user_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_cart
-- ----------------------------

-- ----------------------------
-- Table structure for shop_order
-- ----------------------------
DROP TABLE IF EXISTS `shop_order`;
CREATE TABLE `shop_order` (
  `id` varchar(50) NOT NULL,
  `sys_user_id` varchar(50) NOT NULL,
  `receiver` varchar(20) NOT NULL,
  `province` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `area` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `ticket` varchar(50) DEFAULT NULL COMMENT '如果不用开发票就指定为空，如果需要开发票就指定发票表的id',
  `shop_order_product_id` varchar(50) NOT NULL,
  `state` tinyint(4) NOT NULL COMMENT '1、未支付；2、支付成功；3、订单取消；4、待发货；5、已发货；6、交易成功',
  `state_operate_time` datetime NOT NULL COMMENT '订单刚创建为未支付状态，未支持状态的操作时间等同于订单创建时间',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_order
-- ----------------------------

-- ----------------------------
-- Table structure for shop_order_product
-- ----------------------------
DROP TABLE IF EXISTS `shop_order_product`;
CREATE TABLE `shop_order_product` (
  `id` varchar(50) NOT NULL,
  `shop_product_id` varchar(50) NOT NULL,
  `name` varchar(20) NOT NULL,
  `count` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_order_product
-- ----------------------------

-- ----------------------------
-- Table structure for shop_product
-- ----------------------------
DROP TABLE IF EXISTS `shop_product`;
CREATE TABLE `shop_product` (
  `id` varchar(50) NOT NULL,
  `pic_url` varchar(255) NOT NULL,
  `flag` tinyint(4) NOT NULL COMMENT '1、热销；2、新品；3、普通',
  `name` varchar(20) NOT NULL,
  `introduction` varchar(255) NOT NULL COMMENT '1、有效；2、无效',
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `recommend` tinyint(4) NOT NULL COMMENT '1、推荐商品（显示在顶部并滚动的大图）；2、非推荐商品',
  `number` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `shop_product_category_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_product
-- ----------------------------

-- ----------------------------
-- Table structure for shop_product_category
-- ----------------------------
DROP TABLE IF EXISTS `shop_product_category`;
CREATE TABLE `shop_product_category` (
  `id` varchar(50) NOT NULL,
  `pid` varchar(50) DEFAULT NULL,
  `category_name` varchar(20) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1、启用；2、禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_product_category
-- ----------------------------

-- ----------------------------
-- Table structure for shop_receive_address
-- ----------------------------
DROP TABLE IF EXISTS `shop_receive_address`;
CREATE TABLE `shop_receive_address` (
  `id` varchar(50) NOT NULL,
  `receiver` varchar(20) NOT NULL,
  `province` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `area` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `sys_user_id` varchar(50) NOT NULL,
  `is_default` tinyint(4) NOT NULL COMMENT '1、是；2、否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_receive_address
-- ----------------------------

-- ----------------------------
-- Table structure for shop_ticket
-- ----------------------------
DROP TABLE IF EXISTS `shop_ticket`;
CREATE TABLE `shop_ticket` (
  `id` varchar(50) NOT NULL,
  `title_type` tinyint(4) NOT NULL COMMENT '1、单位；2、个人',
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_ticket
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(50) NOT NULL,
  `pid` varchar(50) DEFAULT NULL COMMENT '指定当前菜单的上一级',
  `name` varchar(20) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(50) NOT NULL,
  `name` varchar(20) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1、启用；2、禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` varchar(50) NOT NULL,
  `sys_menu_id` varchar(50) NOT NULL,
  `sys_role_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `username` varchar(20) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1、启用；2、禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` varchar(50) NOT NULL,
  `sys_user_id` varchar(50) NOT NULL,
  `sys_role_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
