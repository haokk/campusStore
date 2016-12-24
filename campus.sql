-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2016-12-24 13:17:29
-- 服务器版本： 5.7.16-0ubuntu0.16.04.1
-- PHP Version: 7.0.8-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `campus`
--

-- --------------------------------------------------------

--
-- 表的结构 `administrator`
--

CREATE TABLE `administrator` (
  `id` int(11) NOT NULL COMMENT '管理员ID',
  `name` varchar(50) NOT NULL COMMENT '管理员账号',
  `password` varchar(50) NOT NULL COMMENT '管理员密码',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `image` varchar(100) DEFAULT NULL COMMENT '管理员头像'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表';

--
-- 转存表中的数据 `administrator`
--

INSERT INTO `administrator` (`id`, `name`, `password`, `email`, `image`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin@163.com', NULL),
(2, 'zhangjin', 'e10adc3949ba59abbe56e057f20f883e', 'zj_buct@163.com', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `announcement`
--

CREATE TABLE `announcement` (
  `id` int(11) NOT NULL COMMENT '公告ID',
  `title` varchar(100) NOT NULL COMMENT '公告标题',
  `content` text NOT NULL COMMENT '公告内容',
  `time` int(11) NOT NULL COMMENT '公告时间',
  `create_by` int(11) NOT NULL COMMENT '创建者ID',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `is_delete` int(11) DEFAULT NULL COMMENT '是否删除（0:否，1:是）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公告表';

--
-- 转存表中的数据 `announcement`
--

INSERT INTO `announcement` (`id`, `title`, `content`, `time`, `create_by`, `create_time`, `update_by`, `update_time`, `is_delete`) VALUES
(1, '元旦大促销', '元旦大促销', 1483200000, 2, 1482307868, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL COMMENT '品牌ID',
  `name` varchar(50) NOT NULL COMMENT '品牌名称',
  `create_by` int(11) NOT NULL COMMENT '创建者ID',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者ID',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除（0:否，1:是）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='品牌表';

--
-- 转存表中的数据 `brand`
--

INSERT INTO `brand` (`id`, `name`, `create_by`, `create_time`, `update_by`, `update_time`, `is_delete`) VALUES
(1, '晨光', 2, 1482299906, NULL, NULL, 0),
(2, '真彩', 2, 1482299906, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL COMMENT '评论ID',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `commidity_id` int(11) NOT NULL COMMENT '商品id',
  `content` text COMMENT '评论内容',
  `time` int(11) NOT NULL COMMENT '评论时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

--
-- 转存表中的数据 `comment`
--

INSERT INTO `comment` (`id`, `user_id`, `commidity_id`, `content`, `time`) VALUES
(1, 1, 5, '打印很不错', 1482307868);

-- --------------------------------------------------------

--
-- 表的结构 `commidity`
--

CREATE TABLE `commidity` (
  `id` int(11) NOT NULL COMMENT '商品ID',
  `name` varchar(50) NOT NULL COMMENT '商品名称',
  `commidity_type_id` int(11) NOT NULL COMMENT '商品类型ID',
  `brand_id` int(11) DEFAULT NULL COMMENT '品牌ID',
  `picture` varchar(200) DEFAULT NULL COMMENT '商品图片',
  `introduction` text NOT NULL COMMENT '商品介绍',
  `produce_area` varchar(50) DEFAULT NULL COMMENT '商品产地',
  `stocks` int(11) DEFAULT '1' COMMENT '商品库存',
  `sales_volume` int(11) DEFAULT '0' COMMENT '商品销量',
  `price` float NOT NULL COMMENT '商品价格',
  `discount` float NOT NULL DEFAULT '1' COMMENT '打折率',
  `is_new` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否新品(0:否，1:是)',
  `is_recommend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否推荐(0:否，1:是)',
  `extra_info` text COMMENT '商品额外的信息（json字符串，主要针对打印业务）',
  `create_by` int(11) NOT NULL COMMENT '创建者ID',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除（0:否，1:是）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品信息表';

--
-- 转存表中的数据 `commidity`
--

INSERT INTO `commidity` (`id`, `name`, `commidity_type_id`, `brand_id`, `picture`, `introduction`, `produce_area`, `stocks`, `sales_volume`, `price`, `discount`, `is_new`, `is_recommend`, `extra_info`, `create_by`, `create_time`, `update_by`, `update_time`, `is_delete`) VALUES
(1, '论文排版', 1, NULL, NULL, '论文排版不同、打印难度以及是否加急都对价格有影响哦', NULL, 1, 0, 0.5, 1, 1, 0, '{"hard":[0,1,2,3],"fast":[0,1]}', 2, 1482304699, NULL, NULL, 0),
(2, '名片', 2, NULL, NULL, '名片有设计费，也可以覆膜，量大有折扣', NULL, NULL, 0, 15, 1, 1, 0, '{"paste":[0,1,2,3],"paper":[0,1,2,3],"design":[0,1,2,3]}', 2, 1482307868, NULL, NULL, 0),
(3, '横幅', 3, NULL, NULL, '横幅量大有折扣', NULL, NULL, 0, 50, 1, 1, 0, '{"size":[0,1,2,3],"length":[0,1,2,3],"vertical_or_horizontal":[0,1],"hole":[0,1],"background":[0,1,2,3],"fonts_color":[0,1,2,3]}', 2, 1482307868, NULL, NULL, 0),
(4, '装订', 4, NULL, NULL, '装订量大有折扣', NULL, NULL, 0, 2, 1, 1, 0, '{"style":[0,1,2,3],"design":[0,1,2,3],"paste":[0,1,2,3],"think":[0,1]}', 2, 1482307868, NULL, NULL, 0),
(5, '复印', 5, NULL, NULL, '复印量大有折扣', NULL, NULL, 0, 0.5, 1, 1, 0, '{"style":[0,1,2,3],"scale":[0,1,2,3],"single_page":[0,1],"both_page":[0,1],"color":[0,1]}', 2, 1482307868, NULL, NULL, 0),
(6, '简历', 6, NULL, NULL, '简历打印保密', NULL, NULL, 0, 5, 1, 1, 0, '', 2, 1482307868, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `commidity_parent`
--

CREATE TABLE `commidity_parent` (
  `id` int(11) NOT NULL COMMENT '商品父类ID',
  `name` varchar(50) NOT NULL COMMENT '父类名称',
  `create_by` int(11) NOT NULL COMMENT '创建者ID',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除（0:否，1:是）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `commidity_parent`
--

INSERT INTO `commidity_parent` (`id`, `name`, `create_by`, `create_time`, `update_by`, `update_time`, `is_delete`) VALUES
(1, '打印业务', 2, 1482304699, NULL, NULL, 0),
(2, '纸张', 2, 1482304699, NULL, NULL, 0),
(3, '笔记本', 2, 1482304699, NULL, NULL, 0),
(4, '创意文化产品', 2, 1482304699, NULL, NULL, 0),
(5, '笔', 2, 1482304699, NULL, NULL, 0),
(6, '书籍', 2, 1482304699, NULL, NULL, 0),
(7, '电脑配件', 2, 1482304699, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `commidity_type`
--

CREATE TABLE `commidity_type` (
  `id` int(11) NOT NULL COMMENT '商品类型ID',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '类型名称',
  `p_id` int(11) DEFAULT NULL COMMENT '父类ID',
  `create_by` int(11) NOT NULL COMMENT '创建者ID',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除（0:否，1:是）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商品类型表';

--
-- 转存表中的数据 `commidity_type`
--

INSERT INTO `commidity_type` (`id`, `name`, `p_id`, `create_by`, `create_time`, `update_by`, `update_time`, `is_delete`) VALUES
(1, '论文', 1, 2, 1482304699, NULL, NULL, 0),
(2, '名片', 1, 2, 1482304699, NULL, NULL, 0),
(3, '横幅', 1, 2, 1482304699, NULL, NULL, 0),
(4, '装订', 1, 2, 1482304699, NULL, NULL, 0),
(5, '复印', 1, 2, 1482304699, NULL, NULL, 0),
(6, '简历', 1, 2, 1482304699, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `deal`
--

CREATE TABLE `deal` (
  `id` int(11) NOT NULL COMMENT '自动编号',
  `deal_number` varchar(100) NOT NULL COMMENT '订单号',
  `commidity_id` int(11) NOT NULL COMMENT '商品id',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `commidity_num` int(11) NOT NULL COMMENT '商品数量',
  `price` float NOT NULL COMMENT '商品价格',
  `discount` float NOT NULL DEFAULT '1' COMMENT '打折率',
  `total` float NOT NULL COMMENT '消费总额',
  `pay_method` varchar(20) NOT NULL COMMENT '付款方式',
  `delivery_method` varchar(20) NOT NULL COMMENT '送货方式',
  `create_time` int(11) NOT NULL COMMENT '订单生成时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单状态(2:取消，1:成功，0:待付款)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

--
-- 转存表中的数据 `deal`
--

INSERT INTO `deal` (`id`, `deal_number`, `commidity_id`, `user_id`, `commidity_num`, `price`, `discount`, `total`, `pay_method`, `delivery_method`, `create_time`, `status`) VALUES
(1, '201612211635', 5, 1, 10, 5, 1, 50, '支付宝', '自取', 1482307868, 1);

-- --------------------------------------------------------

--
-- 表的结构 `link`
--

CREATE TABLE `link` (
  `id` int(11) NOT NULL COMMENT '链接ID',
  `name` varchar(100) NOT NULL COMMENT '链接名称',
  `url` varchar(200) NOT NULL COMMENT '链接网址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='链接表';

--
-- 转存表中的数据 `link`
--

INSERT INTO `link` (`id`, `name`, `url`) VALUES
(1, '北京化工大学', 'www.buct.edu.cn');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL COMMENT '用户ID',
  `name` varchar(50) NOT NULL COMMENT '用户名称',
  `nickname` varchar(50) NOT NULL COMMENT '用户昵称',
  `password` varchar(50) NOT NULL COMMENT '用户密码',
  `question` varchar(80) DEFAULT NULL COMMENT '密保问题',
  `answer` varchar(80) DEFAULT NULL COMMENT '问题答案',
  `real_name` varchar(20) NOT NULL COMMENT '真实姓名',
  `id_card` varchar(50) NOT NULL COMMENT '身份证号',
  `mobile_phone` varchar(20) NOT NULL COMMENT '手机',
  `phone` varchar(20) DEFAULT NULL COMMENT '座机',
  `email` varchar(80) NOT NULL COMMENT 'Email',
  `QQ` varchar(20) NOT NULL COMMENT 'QQ',
  `postcode` varchar(10) NOT NULL COMMENT '邮编',
  `address` varchar(200) NOT NULL COMMENT '地址',
  `is_freeze` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否冻结（0:否，1:是）',
  `shopping` varchar(200) DEFAULT NULL COMMENT '购物车信息',
  `register_time` int(11) NOT NULL COMMENT '注册时间（时间戳）',
  `image` varchar(100) DEFAULT NULL COMMENT '用户头像'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `name`, `nickname`, `password`, `question`, `answer`, `real_name`, `id_card`, `mobile_phone`, `phone`, `email`, `QQ`, `postcode`, `address`, `is_freeze`, `shopping`, `register_time`, `image`) VALUES
(1, 'zj_buct@163.com', '张金', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '张金', '530129199302132117', '13260212671', NULL, 'zj_buct@163.com', '1013836692', '100029', '北京市朝阳区北三环东路15号北京化工大学', 0, NULL, 1482307868, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `commidity_id` (`commidity_id`);

--
-- Indexes for table `commidity`
--
ALTER TABLE `commidity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `commidity_type_id` (`commidity_type_id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `commidity_parent`
--
ALTER TABLE `commidity_parent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commidity_type`
--
ALTER TABLE `commidity_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `p_id` (`p_id`);

--
-- Indexes for table `deal`
--
ALTER TABLE `deal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commidity_id` (`commidity_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `link`
--
ALTER TABLE `link`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `administrator`
--
ALTER TABLE `administrator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员ID', AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `announcement`
--
ALTER TABLE `announcement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '品牌ID', AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `commidity`
--
ALTER TABLE `commidity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID', AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `commidity_parent`
--
ALTER TABLE `commidity_parent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品父类ID', AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `commidity_type`
--
ALTER TABLE `commidity_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品类型ID', AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `deal`
--
ALTER TABLE `deal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `link`
--
ALTER TABLE `link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '链接ID', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID', AUTO_INCREMENT=2;
--
-- 限制导出的表
--

--
-- 限制表 `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`commidity_id`) REFERENCES `commidity` (`id`);

--
-- 限制表 `commidity`
--
ALTER TABLE `commidity`
  ADD CONSTRAINT `commidity_ibfk_1` FOREIGN KEY (`commidity_type_id`) REFERENCES `commidity_type` (`id`),
  ADD CONSTRAINT `commidity_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`);

--
-- 限制表 `commidity_type`
--
ALTER TABLE `commidity_type`
  ADD CONSTRAINT `commidity_type_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `commidity_parent` (`id`);

--
-- 限制表 `deal`
--
ALTER TABLE `deal`
  ADD CONSTRAINT `deal_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `deal_ibfk_2` FOREIGN KEY (`commidity_id`) REFERENCES `commidity` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
