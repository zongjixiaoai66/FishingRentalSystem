/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `t005`;
CREATE DATABASE IF NOT EXISTS `t005` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t005`;

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `create_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建时间',
  `pid` int DEFAULT NULL COMMENT '父级id',
  `userid` int DEFAULT NULL COMMENT '留言用户id',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '留言用户',
  `reply_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '回复给',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `comment`;
INSERT INTO `comment` (`id`, `name`, `content`, `create_time`, `pid`, `userid`, `user`, `reply_user`) VALUES
	(61, '管理员的留言', 'helloworld', '2023-03-18 21:06:14', NULL, 1, '管理员', NULL),
	(62, '管理员的留言', '渔具最新的多少钱？', '2023-03-18 21:07:20', NULL, 1, '管理员', NULL),
	(63, '11的留言', '1111', '2023-03-18 21:10:59', 62, 4, '11', '管理员'),
	(64, '11的留言', '222', '2023-12-05 12:33:23', NULL, 4, '11', NULL),
	(65, '管理员的留言', '5555', '2023-12-05 12:34:06', NULL, 1, '管理员', NULL),
	(66, '666', NULL, '2023-12-05 12:34:33', NULL, 1, '管理员', NULL);

DROP TABLE IF EXISTS `guihuan`;
CREATE TABLE IF NOT EXISTS `guihuan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL COMMENT '用户id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '归还渔具名称',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `guihuan`;
INSERT INTO `guihuan` (`id`, `userid`, `name`, `create_time`, `username`) VALUES
	(21, 4, '1', '2023-03-11 13:42:28', 'test'),
	(22, 4, '1', '2023-03-11 13:42:28', 'test'),
	(23, 4, '1', '2023-03-11 13:42:29', 'test'),
	(24, 4, '1', '2023-03-11 13:42:29', 'test'),
	(25, 3, 'ee', '2023-03-11 13:56:09', 'wang'),
	(26, 5, '1', '2023-03-11 23:35:34', 'www'),
	(27, 5, '1', '2023-03-11 23:35:35', 'www'),
	(28, 5, '1', '2023-03-11 23:35:35', 'www'),
	(29, 5, 'ee', '2023-03-11 23:35:36', 'www'),
	(30, 5, 'ee', '2023-03-11 23:35:36', 'www'),
	(31, 5, 'ee', '2023-03-11 23:35:37', 'www'),
	(32, 1, 'ee', '2023-03-12 00:03:52', 'admin'),
	(33, 1, 'ee', '2023-03-12 00:03:54', 'admin'),
	(34, 1, 'ee', '2023-03-12 00:03:55', 'admin'),
	(35, 1, 'ee', '2023-03-12 00:03:55', 'admin'),
	(36, 1, 'ee', '2023-03-12 00:03:56', 'admin'),
	(37, 1, 'ee', '2023-03-12 00:03:57', 'admin'),
	(38, 1, 'ee', '2023-03-12 00:05:38', 'admin'),
	(39, 1, 'ee', '2023-03-12 00:05:40', 'admin'),
	(40, 1, 'ee', '2023-03-12 00:05:41', 'admin'),
	(41, 1, 'ee', '2023-03-12 00:05:41', 'admin'),
	(42, 1, 'ee', '2023-03-12 00:05:41', 'admin'),
	(43, 1, 'ee', '2023-03-12 00:05:42', 'admin'),
	(44, 1, 'ee', '2023-03-12 00:05:42', 'admin'),
	(45, 1, 'ee', '2023-03-12 00:05:47', 'admin'),
	(46, 6, 'ee', '2023-03-12 00:07:47', 'test11'),
	(47, 6, 'ee', '2023-03-12 00:07:47', 'test11'),
	(48, 6, 'ee', '2023-03-12 00:07:49', 'test11'),
	(49, 1, '1', '2023-03-18 13:07:43', 'admin'),
	(50, 1, '鱼钩', '2023-03-18 13:07:44', 'admin'),
	(51, 1, '鱼钩', '2023-03-18 13:07:45', 'admin'),
	(52, 4, '鱼钩', '2023-12-05 04:33:39', 'test'),
	(53, 4, '鱼钩', '2023-12-05 04:35:14', 'test');

DROP TABLE IF EXISTS `notice`;
CREATE TABLE IF NOT EXISTS `notice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '封面',
  `type` int DEFAULT NULL COMMENT '1-简单的公告，2富文本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `notice`;
INSERT INTO `notice` (`id`, `name`, `content`, `img`, `type`) VALUES
	(14, 'sd', '<p>12</p>', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 2),
	(15, '11', '<p>1212111<img src="https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png" contenteditable="false" style="font-size: 14px; max-width: 100%;"/></p>', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 2),
	(16, '测试数据', '<p>121<img src="https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png" contenteditable="false" style="font-size: 14px; max-width: 100%;"/></p>', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 2);

DROP TABLE IF EXISTS `rentpurchase`;
CREATE TABLE IF NOT EXISTS `rentpurchase` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL COMMENT '用户id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '渔具名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '购买或者租赁',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `rentpurchase`;
INSERT INTO `rentpurchase` (`id`, `userid`, `name`, `type`, `price`, `username`) VALUES
	(31, 4, 'ee', '购买', 111.00, 'test'),
	(32, 4, 'ee', '购买', 111.00, 'test'),
	(38, 5, 'ee', '购买', 111.00, 'www'),
	(39, 5, '1', '购买', 120.00, 'www'),
	(40, 5, '1', '购买', 120.00, 'www'),
	(41, 5, '1', '购买', 120.00, 'www'),
	(62, 6, '鱼钩', '租赁', 120.00, 'test11'),
	(63, 6, '鱼竿', '购买', 500.00, 'test11'),
	(69, 4, '11', '购买', 120.00, 'test'),
	(71, 4, '鱼钩', '购买', 1200.00, 'test'),
	(73, 4, '鱼钩', '购买', 1200.00, 'test');

DROP TABLE IF EXISTS `shoucang`;
CREATE TABLE IF NOT EXISTS `shoucang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL COMMENT '用户id',
  `yujuid` int DEFAULT NULL COMMENT '渔具id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `shoucang`;
INSERT INTO `shoucang` (`id`, `userid`, `yujuid`) VALUES
	(12, 4, 4),
	(13, 1, 3),
	(14, 4, 3);

DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE IF NOT EXISTS `sys_dict` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `sys_dict`;
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES
	(1, 'user', 'el-icon-user', 'icon'),
	(2, 'house', 'el-icon-house', 'icon'),
	(3, 'menu', 'el-icon-menu', 'icon'),
	(4, 's-custom', 'el-icon-s-custom', 'icon'),
	(5, 's-grid', 'el-icon-s-grid', 'icon'),
	(6, 'document', 'el-icon-document', 'icon'),
	(7, 'coffee', 'el-icon-coffee\r\n', 'icon'),
	(8, 's-marketing', 'el-icon-s-marketing', 'icon'),
	(9, 'phone-outline', 'el-icon-phone-outline', 'icon'),
	(10, 'platform-eleme', 'el-icon-platform-eleme', 'icon'),
	(11, 'eleme', 'el-icon-eleme', 'icon'),
	(12, 'delete-solid', 'el-icon-delete-solid', 'icon'),
	(13, 'delete', 'el-icon-delete', 'icon'),
	(14, 's-tools', 'el-icon-s-tools', 'icon'),
	(15, 'setting', 'el-icon-setting', 'icon'),
	(16, 'user-solid', 'el-icon-user-solid', 'icon'),
	(17, 'phone', 'el-icon-phone', 'icon'),
	(18, 'more', 'el-icon-more', 'icon'),
	(19, 'more-outline', 'el-icon-more-outline', 'icon'),
	(20, 'star-on', 'el-icon-star-on', 'icon'),
	(21, 'star-off', 'el-icon-star-off', 'icon'),
	(22, 's-goods', 'el-icon-s-goods', 'icon'),
	(23, 'goods', 'el-icon-goods', 'icon'),
	(24, 'warning', 'el-icon-warning', 'icon'),
	(25, 'warning-outline', 'el-icon-warning-outline', 'icon'),
	(26, 'question', 'el-icon-question', 'icon'),
	(27, 'info', 'el-icon-info', 'icon'),
	(28, 'remove', 'el-icon-remove', 'icon'),
	(29, 'circle-plus', 'el-icon-circle-plus', 'icon'),
	(30, 'success', 'el-icon-success', 'icon'),
	(31, 'error', 'el-icon-error', 'icon'),
	(32, 'zoom-in', 'el-icon-zoom-in', 'icon'),
	(33, 'zoom-out', 'el-icon-zoom-out', 'icon'),
	(34, 'remove-outline', 'el-icon-remove-outline', 'icon'),
	(35, 'circle-plus-outline', 'el-icon-circle-plus-outline', 'icon'),
	(36, 'circle-check', 'el-icon-circle-check', 'icon'),
	(37, 'circle-close', 'el-icon-circle-close', 'icon'),
	(38, 's-help', 'el-icon-s-help', 'icon'),
	(39, 'help', 'el-icon-help', 'icon'),
	(40, 'minus', 'el-icon-minus', 'icon'),
	(41, 'plus', 'el-icon-plus', 'icon'),
	(42, 'check', 'el-icon-check', 'icon'),
	(43, 'close', 'el-icon-close', 'icon'),
	(44, 'picture', 'el-icon-picture', 'icon'),
	(45, 'picture-outline', 'el-icon-picture-outline', 'icon'),
	(46, 'picture-outline-round', 'el-icon-picture-outline-round', 'icon'),
	(47, 'upload', 'el-icon-upload', 'icon'),
	(48, 'upload2', 'el-icon-upload2', 'icon'),
	(49, 'download', 'el-icon-download', 'icon'),
	(50, 'camera-solid', 'el-icon-camera-solid', 'icon'),
	(51, 'camera', 'el-icon-camera', 'icon'),
	(52, 'video-camera-solid', 'el-icon-video-camera-solid', 'icon'),
	(53, 'video-camera', 'el-icon-video-camera', 'icon'),
	(54, 'message-solid', 'el-icon-message-solid', 'icon'),
	(55, 'bell', 'el-icon-bell', 'icon'),
	(56, 's-cooperation', 'el-icon-s-cooperation', 'icon'),
	(57, 's-order', 'el-icon-s-order', 'icon'),
	(58, 's-platform', 'el-icon-s-platform', 'icon'),
	(59, 's-fold', 'el-icon-s-fold', 'icon'),
	(60, 's-unfold', 'el-icon-s-unfold', 'icon'),
	(61, 's-operation', 'el-icon-s-operation', 'icon'),
	(62, 's-promotion', 'el-icon-s-promotion', 'icon'),
	(63, 's-home', 'el-icon-s-home', 'icon'),
	(64, 's-release', 'el-icon-s-release', 'icon'),
	(65, 's-ticket', 'el-icon-s-ticket', 'icon'),
	(66, 's-management', 'el-icon-s-management', 'icon'),
	(67, 's-open', 'el-icon-s-open', 'icon'),
	(68, 's-shop', 'el-icon-s-shop', 'icon'),
	(69, 's-flag', 'el-icon-s-flag', 'icon'),
	(70, 's-comment', 'el-icon-s-comment', 'icon'),
	(71, 's-finance', 'el-icon-s-finance', 'icon'),
	(72, 's-claim', 'el-icon-s-claim', 'icon'),
	(73, 's-opportunity', 'el-icon-s-opportunity', 'icon'),
	(74, 's-data', 'el-icon-s-data', 'icon'),
	(75, 's-check', 'el-icon-s-check', 'icon'),
	(76, 'share', 'el-icon-share', 'icon'),
	(77, 'd-caret', 'el-icon-d-caret', 'icon'),
	(78, 'caret-left', 'el-icon-caret-left', 'icon'),
	(79, 'caret-right', 'el-icon-caret-right', 'icon'),
	(80, 'caret-bottom', 'el-icon-caret-bottom', 'icon'),
	(81, 'caret-top', 'el-icon-caret-top', 'icon'),
	(82, 'bottom-left', 'el-icon-bottom-left', 'icon'),
	(83, 'bottom-right', 'el-icon-bottom-right', 'icon'),
	(84, 'back', 'el-icon-back', 'icon'),
	(85, 'right', 'el-icon-right', 'icon'),
	(86, 'bottom', 'el-icon-bottom', 'icon'),
	(87, 'top', 'el-icon-top', 'icon'),
	(88, 'top-left', 'el-icon-top-left', 'icon'),
	(89, 'top-right', 'el-icon-top-right', 'icon'),
	(90, 'arrow-left', 'el-icon-arrow-left', 'icon'),
	(91, 'arrow-right', 'el-icon-arrow-right', 'icon'),
	(92, 'arrow-down', 'el-icon-arrow-down', 'icon'),
	(93, 'arrow-up', 'el-icon-arrow-up', 'icon'),
	(94, 'd-arrow-left', 'el-icon-d-arrow-left', 'icon'),
	(95, 'd-arrow-right', 'el-icon-d-arrow-right', 'icon'),
	(96, 'video-pause', 'el-icon-video-pause', 'icon'),
	(97, 'video-play', 'el-icon-video-play', 'icon'),
	(98, 'refresh', 'el-icon-refresh', 'icon'),
	(99, 'refresh-right', 'el-icon-refresh-right', 'icon'),
	(100, 'refresh-left', 'el-icon-refresh-left', 'icon'),
	(101, 'finished', 'el-icon-finished', 'icon'),
	(102, 'sort', 'el-icon-sort', 'icon'),
	(103, 'sort-up', 'el-icon-sort-up', 'icon'),
	(104, 'sort-down', 'el-icon-sort-down', 'icon'),
	(105, 'rank', 'el-icon-rank', 'icon'),
	(106, 'loading', 'el-icon-loading', 'icon'),
	(107, 'view', 'el-icon-view', 'icon'),
	(108, 'c-scale-to-original', 'el-icon-c-scale-to-original', 'icon'),
	(109, 'date', 'el-icon-date', 'icon'),
	(110, 'edit', 'el-icon-edit', 'icon'),
	(111, 'edit-outline', 'el-icon-edit-outline', 'icon'),
	(112, 'folder', 'el-icon-folder', 'icon'),
	(113, 'folder-opened', 'el-icon-folder-opened', 'icon'),
	(114, 'folder-add', 'el-icon-folder-add', 'icon'),
	(115, 'folder-remove', 'el-icon-folder-remove', 'icon'),
	(116, 'folder-delete', 'el-icon-folder-delete', 'icon'),
	(117, 'folder-checked', 'el-icon-folder-checked', 'icon'),
	(118, 'tickets', 'el-icon-tickets', 'icon'),
	(119, 'document-remove', 'el-icon-document-remove', 'icon'),
	(120, 'document-delete', 'el-icon-document-delete', 'icon'),
	(121, 'document-copy', 'el-icon-document-copy', 'icon'),
	(122, 'document-checked', 'el-icon-document-checked', 'icon'),
	(123, 'document-add', 'el-icon-document-add', 'icon'),
	(124, 'printer', 'el-icon-printer', 'icon'),
	(125, 'paperclip', 'el-icon-paperclip', 'icon'),
	(126, 'takeaway-box', 'el-icon-takeaway-box', 'icon'),
	(127, 'search', 'el-icon-search', 'icon'),
	(128, 'monitor', 'el-icon-monitor', 'icon'),
	(129, 'attract', 'el-icon-attract', 'icon'),
	(130, 'mobile', 'el-icon-mobile', 'icon'),
	(131, 'scissors', 'el-icon-scissors', 'icon'),
	(132, 'umbrella', 'el-icon-umbrella', 'icon'),
	(133, 'headset', 'el-icon-headset', 'icon'),
	(134, 'brush', 'el-icon-brush', 'icon'),
	(135, 'mouse', 'el-icon-mouse', 'icon'),
	(136, 'coordinate', 'el-icon-coordinate', 'icon'),
	(137, 'magic-stick', 'el-icon-magic-stick', 'icon'),
	(138, 'reading', 'el-icon-reading', 'icon'),
	(139, 'data-line', 'el-icon-data-line', 'icon'),
	(140, 'data-board', 'el-icon-data-board', 'icon'),
	(141, 'pie-chart', 'el-icon-pie-chart', 'icon'),
	(142, 'data-analysis', 'el-icon-data-analysis', 'icon'),
	(143, 'collection-tag', 'el-icon-collection-tag', 'icon'),
	(144, 'film', 'el-icon-film', 'icon'),
	(145, 'suitcase', 'el-icon-suitcase', 'icon'),
	(146, 'suitcase-1', 'el-icon-suitcase-1', 'icon'),
	(147, 'receiving', 'el-icon-receiving', 'icon'),
	(148, 'collection', 'el-icon-collection', 'icon'),
	(149, 'files', 'el-icon-files', 'icon'),
	(150, 'notebook-1', 'el-icon-notebook-1', 'icon'),
	(151, 'notebook-2', 'el-icon-notebook-2', 'icon'),
	(152, 'toilet-paper', 'el-icon-toilet-paper', 'icon'),
	(153, 'office-building', 'el-icon-office-building', 'icon'),
	(154, 'school', 'el-icon-school', 'icon'),
	(155, 'table-lamp', 'el-icon-table-lamp', 'icon'),
	(156, 'no-smoking', 'el-icon-no-smoking', 'icon'),
	(157, 'smoking', 'el-icon-smoking', 'icon'),
	(158, 'shopping-cart-full', 'el-icon-shopping-cart-full', 'icon'),
	(159, 'shopping-cart-1', 'el-icon-shopping-cart-1', 'icon'),
	(160, 'shopping-cart-2', 'el-icon-shopping-cart-2', 'icon'),
	(161, 'shopping-bag-1', 'el-icon-shopping-bag-1', 'icon'),
	(162, 'shopping-bag-2', 'el-icon-shopping-bag-2', 'icon'),
	(163, 'sold-out', 'el-icon-sold-out', 'icon'),
	(164, 'sell', 'el-icon-sell', 'icon'),
	(165, 'present', 'el-icon-present', 'icon'),
	(166, 'box', 'el-icon-box', 'icon'),
	(167, 'bank-card', 'el-icon-bank-card', 'icon'),
	(168, 'money', 'el-icon-money', 'icon'),
	(169, 'coin', 'el-icon-coin', 'icon'),
	(170, 'wallet', 'el-icon-wallet', 'icon'),
	(171, 'discount', 'el-icon-discount', 'icon'),
	(172, 'price-tag', 'el-icon-price-tag', 'icon'),
	(173, 'news', 'el-icon-news', 'icon'),
	(174, 'guide', 'el-icon-guide', 'icon'),
	(175, 'male', 'el-icon-male', 'icon'),
	(176, 'female', 'el-icon-female', 'icon'),
	(177, 'thumb', 'el-icon-thumb', 'icon'),
	(178, 'cpu', 'el-icon-cpu', 'icon'),
	(179, 'link', 'el-icon-link', 'icon'),
	(180, 'connection', 'el-icon-connection', 'icon'),
	(181, 'open', 'el-icon-open', 'icon'),
	(182, 'turn-off', 'el-icon-turn-off', 'icon'),
	(183, 'set-up', 'el-icon-set-up', 'icon'),
	(184, 'chat-round', 'el-icon-chat-round', 'icon'),
	(185, 'chat-line-round', 'el-icon-chat-line-round', 'icon'),
	(186, 'chat-square', 'el-icon-chat-square', 'icon'),
	(187, 'chat-dot-round', 'el-icon-chat-dot-round', 'icon'),
	(188, 'chat-dot-square', 'el-icon-chat-dot-square', 'icon'),
	(189, 'chat-line-square', 'el-icon-chat-line-square', 'icon'),
	(190, 'message', 'el-icon-message', 'icon'),
	(191, 'postcard', 'el-icon-postcard', 'icon'),
	(192, 'position', 'el-icon-position', 'icon'),
	(193, 'turn-off-microphone', 'el-icon-turn-off-microphone', 'icon'),
	(194, 'microphone', 'el-icon-microphone', 'icon'),
	(195, 'close-notification', 'el-icon-close-notification', 'icon'),
	(196, 'bangzhu', 'el-icon-bangzhu', 'icon'),
	(197, 'time', 'el-icon-time', 'icon'),
	(198, 'odometer', 'el-icon-odometer', 'icon'),
	(199, 'crop', 'el-icon-crop', 'icon'),
	(200, 'aim', 'el-icon-aim', 'icon'),
	(201, 'switch-button', 'el-icon-switch-button', 'icon'),
	(202, 'full-screen', 'el-icon-full-screen', 'icon'),
	(203, 'copy-document', 'el-icon-copy-document', 'icon'),
	(204, 'mic', 'el-icon-mic', 'icon'),
	(205, 'stopwatch', 'el-icon-stopwatch', 'icon'),
	(206, 'medal-1', 'el-icon-medal-1', 'icon'),
	(207, 'medal', 'el-icon-medal', 'icon'),
	(208, 'trophy', 'el-icon-trophy', 'icon'),
	(209, 'trophy-1', 'el-icon-trophy-1', 'icon'),
	(210, 'first-aid-kit', 'el-icon-first-aid-kit', 'icon'),
	(211, 'discover', 'el-icon-discover', 'icon'),
	(212, 'place', 'el-icon-place', 'icon'),
	(213, 'location', 'el-icon-location', 'icon'),
	(214, 'location-outline', 'el-icon-location-outline', 'icon'),
	(215, 'location-information', 'el-icon-location-information', 'icon'),
	(216, 'add-location', 'el-icon-add-location', 'icon'),
	(217, 'delete-location', 'el-icon-delete-location', 'icon'),
	(218, 'map-location', 'el-icon-map-location', 'icon'),
	(219, 'alarm-clock', 'el-icon-alarm-clock', 'icon'),
	(220, 'timer', 'el-icon-timer', 'icon'),
	(221, 'watch-1', 'el-icon-watch-1', 'icon'),
	(222, 'watch', 'el-icon-watch', 'icon'),
	(223, 'lock', 'el-icon-lock', 'icon'),
	(224, 'unlock', 'el-icon-unlock', 'icon'),
	(225, 'key', 'el-icon-key', 'icon'),
	(226, 'service', 'el-icon-service', 'icon'),
	(227, 'mobile-phone', 'el-icon-mobile-phone', 'icon'),
	(228, 'bicycle', 'el-icon-bicycle', 'icon'),
	(229, 'truck', 'el-icon-truck', 'icon'),
	(230, 'ship', 'el-icon-ship', 'icon'),
	(231, 'basketball', 'el-icon-basketball', 'icon'),
	(232, 'football', 'el-icon-football', 'icon'),
	(233, 'soccer', 'el-icon-soccer', 'icon'),
	(234, 'baseball', 'el-icon-baseball', 'icon'),
	(235, 'wind-power', 'el-icon-wind-power', 'icon'),
	(236, 'light-rain', 'el-icon-light-rain', 'icon'),
	(237, 'lightning', 'el-icon-lightning', 'icon'),
	(238, 'heavy-rain', 'el-icon-heavy-rain', 'icon'),
	(239, 'sunrise', 'el-icon-sunrise', 'icon'),
	(240, 'sunrise-1', 'el-icon-sunrise-1', 'icon'),
	(241, 'sunset', 'el-icon-sunset', 'icon'),
	(242, 'sunny', 'el-icon-sunny', 'icon'),
	(243, 'cloudy', 'el-icon-cloudy', 'icon'),
	(244, 'partly-cloudy', 'el-icon-partly-cloudy', 'icon'),
	(245, 'cloudy-and-sunny', 'el-icon-cloudy-and-sunny', 'icon'),
	(246, 'moon', 'el-icon-moon', 'icon'),
	(247, 'moon-night', 'el-icon-moon-night', 'icon'),
	(248, 'dish', 'el-icon-dish', 'icon'),
	(249, 'dish-1', 'el-icon-dish-1', 'icon'),
	(250, 'food', 'el-icon-food', 'icon'),
	(251, 'chicken', 'el-icon-chicken', 'icon'),
	(252, 'fork-spoon', 'el-icon-fork-spoon', 'icon'),
	(253, 'knife-fork', 'el-icon-knife-fork', 'icon'),
	(254, 'burger', 'el-icon-burger', 'icon'),
	(255, 'tableware', 'el-icon-tableware', 'icon'),
	(256, 'sugar', 'el-icon-sugar', 'icon'),
	(257, 'dessert', 'el-icon-dessert', 'icon'),
	(258, 'ice-cream', 'el-icon-ice-cream', 'icon'),
	(259, 'hot-water', 'el-icon-hot-water', 'icon'),
	(260, 'water-cup', 'el-icon-water-cup', 'icon'),
	(261, 'coffee-cup', 'el-icon-coffee-cup', 'icon'),
	(262, 'cold-drink', 'el-icon-cold-drink', 'icon'),
	(263, 'goblet', 'el-icon-goblet', 'icon'),
	(264, 'goblet-full', 'el-icon-goblet-full', 'icon'),
	(265, 'goblet-square', 'el-icon-goblet-square', 'icon'),
	(266, 'goblet-square-full', 'el-icon-goblet-square-full', 'icon'),
	(267, 'refrigerator', 'el-icon-refrigerator', 'icon'),
	(268, 'grape', 'el-icon-grape', 'icon'),
	(269, 'watermelon', 'el-icon-watermelon', 'icon'),
	(270, 'cherry', 'el-icon-cherry', 'icon'),
	(271, 'apple', 'el-icon-apple', 'icon'),
	(272, 'pear', 'el-icon-pear', 'icon'),
	(273, 'orange', 'el-icon-orange', 'icon'),
	(274, 'ice-tea', 'el-icon-ice-tea', 'icon'),
	(275, 'ice-drink', 'el-icon-ice-drink', 'icon'),
	(276, 'milk-tea', 'el-icon-milk-tea', 'icon'),
	(277, 'potato-strips', 'el-icon-potato-strips', 'icon'),
	(278, 'lollipop', 'el-icon-lollipop', 'icon'),
	(279, 'ice-cream-square', 'el-icon-ice-cream-square', 'icon'),
	(280, 'ice-cream-round', 'el-icon-ice-cream-round', 'icon');

DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE IF NOT EXISTS `sys_file` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件类型',
  `size` bigint DEFAULT NULL COMMENT '文件大小(kb)',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '下载链接',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件md5',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `enable` tinyint(1) DEFAULT '1' COMMENT '是否禁用链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `sys_file`;
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES
	(1, '2030220-20210804132331135-323956010.png', 'png', 7, 'http://localhost:9999/file/a70357f4b27c415aa1979688c0838f4f.png', 'd475b4fff504f22726935dccce8c34af', 0, 1),
	(2, 'image-20220512130454565.png', 'png', 52, 'http://localhost:9999/file/0f32728331ee416cb7958591964313a2.png', '5b7c31da2d39d5e0554666650db91f6d', 0, 1),
	(3, 'image-20220512130525573.png', 'png', 74, 'http://localhost:9999/file/25fe50a5141440c384515088517123ae.png', 'a88810537c3432f4937469851410c0de', 0, 1),
	(4, 'image-20220512130638761.png', 'png', 106, 'http://localhost:9999/file/c6e356d54e8f46f0b04047fae3098b55.png', 'c235f45dae03665ac5bfbd90630a80ba', 0, 1),
	(5, 'image-20220512114107825.png', 'png', 7, 'http://localhost:9999/file/03518d37b37d45c9a7ea5d0a842ddeea.png', '1934eaae17f3bbda950e0aca01fcecab', 0, 1),
	(6, 'image-20220512130454565.png', 'png', 52, 'http://localhost:9999/file/0f32728331ee416cb7958591964313a2.png', '5b7c31da2d39d5e0554666650db91f6d', 0, 1),
	(7, 'image-20220512130638761.png', 'png', 106, 'http://localhost:9999/file/c6e356d54e8f46f0b04047fae3098b55.png', 'c235f45dae03665ac5bfbd90630a80ba', 0, 1),
	(8, 'image-20220512130211309.png', 'png', 67, 'http://localhost:9999/file/390ea512943042ecb48e3d7bcab51981.png', '1e8be0597ed5c1eb360f0a6f7968faec', 0, 1),
	(9, '5d3e9b81eb054c1dbff075a4171eb4a4.mp4', 'mp4', 9276, 'http://localhost:8999/file/3f63cc96cc8146a3921ecbec4ef58d2b.mp4', '1f337f424a75f8fb8a9f696590f4c80e', 0, 1),
	(10, 'ea0b47804da148c9bc0cd50a1c4bc5a7.png', 'png', 7, 'http://localhost:9999/file/a70357f4b27c415aa1979688c0838f4f.png', 'd475b4fff504f22726935dccce8c34af', 0, 1),
	(11, '7f974b59585643eb997be3ae42722606.png', 'png', 52, 'http://localhost:9999/file/0f32728331ee416cb7958591964313a2.png', '5b7c31da2d39d5e0554666650db91f6d', 0, 1),
	(12, 'a447751969a54d5a82369a42dbf75770.png', 'png', 74, 'http://localhost:9999/file/25fe50a5141440c384515088517123ae.png', 'a88810537c3432f4937469851410c0de', 0, 1),
	(13, 'a447751969a54d5a82369a42dbf75770.png', 'png', 74, 'http://localhost:9999/file/25fe50a5141440c384515088517123ae.png', 'a88810537c3432f4937469851410c0de', 0, 1),
	(14, '5ecbed28ab6e48ba8f70512d22b3397b.png', 'png', 102, 'http://localhost:9999/file/098bc0ea23604fab9df76d6242709fe5.png', 'b8c8919bb4b64a652d6034bc60d87d85', 0, 1),
	(15, '5ecbed28ab6e48ba8f70512d22b3397b.png', 'png', 102, 'http://localhost:9999/file/098bc0ea23604fab9df76d6242709fe5.png', 'b8c8919bb4b64a652d6034bc60d87d85', 0, 1),
	(16, '7f974b59585643eb997be3ae42722606.png', 'png', 52, 'http://localhost:9999/file/0f32728331ee416cb7958591964313a2.png', '5b7c31da2d39d5e0554666650db91f6d', 0, 1),
	(17, 'a447751969a54d5a82369a42dbf75770.png', 'png', 74, 'http://localhost:9999/file/25fe50a5141440c384515088517123ae.png', 'a88810537c3432f4937469851410c0de', 0, 1),
	(18, '7f974b59585643eb997be3ae42722606.png', 'png', 52, 'http://localhost:9999/file/0f32728331ee416cb7958591964313a2.png', '5b7c31da2d39d5e0554666650db91f6d', 0, 1),
	(19, '5ecbed28ab6e48ba8f70512d22b3397b.png', 'png', 102, 'http://localhost:9999/file/098bc0ea23604fab9df76d6242709fe5.png', 'b8c8919bb4b64a652d6034bc60d87d85', 0, 1),
	(20, '7f974b59585643eb997be3ae42722606.png', 'png', 52, 'http://localhost:9999/file/0f32728331ee416cb7958591964313a2.png', '5b7c31da2d39d5e0554666650db91f6d', 0, 1),
	(21, '5ecbed28ab6e48ba8f70512d22b3397b.png', 'png', 102, 'http://localhost:9999/file/098bc0ea23604fab9df76d6242709fe5.png', 'b8c8919bb4b64a652d6034bc60d87d85', 0, 1),
	(22, '5ecbed28ab6e48ba8f70512d22b3397b.png', 'png', 102, 'http://localhost:9999/file/098bc0ea23604fab9df76d6242709fe5.png', 'b8c8919bb4b64a652d6034bc60d87d85', 0, 1),
	(23, '7f974b59585643eb997be3ae42722606.png', 'png', 52, 'http://localhost:9999/file/0f32728331ee416cb7958591964313a2.png', '5b7c31da2d39d5e0554666650db91f6d', 0, 1),
	(24, '5ecbed28ab6e48ba8f70512d22b3397b.png', 'png', 102, 'http://localhost:9999/file/098bc0ea23604fab9df76d6242709fe5.png', 'b8c8919bb4b64a652d6034bc60d87d85', 0, 1),
	(25, '7f974b59585643eb997be3ae42722606.png', 'png', 52, 'http://localhost:9999/file/0f32728331ee416cb7958591964313a2.png', '5b7c31da2d39d5e0554666650db91f6d', 0, 1),
	(26, '7f974b59585643eb997be3ae42722606.png', 'png', 52, 'http://localhost:9999/file/0f32728331ee416cb7958591964313a2.png', '5b7c31da2d39d5e0554666650db91f6d', 0, 1),
	(27, '5ecbed28ab6e48ba8f70512d22b3397b.png', 'png', 102, 'http://localhost:9999/file/098bc0ea23604fab9df76d6242709fe5.png', 'b8c8919bb4b64a652d6034bc60d87d85', 0, 1),
	(28, '098bc0ea23604fab9df76d6242709fe5.png', 'png', 102, 'http://localhost:9999/file/098bc0ea23604fab9df76d6242709fe5.png', 'b8c8919bb4b64a652d6034bc60d87d85', 0, 1),
	(29, '5d3e9b81eb054c1dbff075a4171eb4a4.mp4', 'mp4', 9276, 'http://localhost:8999/file/3f63cc96cc8146a3921ecbec4ef58d2b.mp4', '1f337f424a75f8fb8a9f696590f4c80e', 0, 1),
	(30, 'a447751969a54d5a82369a42dbf75770.png', 'png', 74, 'http://localhost:9999/file/25fe50a5141440c384515088517123ae.png', 'a88810537c3432f4937469851410c0de', 0, 1),
	(31, 'a447751969a54d5a82369a42dbf75770.png', 'png', 74, 'http://localhost:9999/file/25fe50a5141440c384515088517123ae.png', 'a88810537c3432f4937469851410c0de', 0, 1),
	(32, 'a447751969a54d5a82369a42dbf75770.png', 'png', 74, 'http://localhost:9999/file/25fe50a5141440c384515088517123ae.png', 'a88810537c3432f4937469851410c0de', 0, 1),
	(33, '5d3e9b81eb054c1dbff075a4171eb4a4.mp4', 'mp4', 9276, 'http://localhost:8999/file/3f63cc96cc8146a3921ecbec4ef58d2b.mp4', '1f337f424a75f8fb8a9f696590f4c80e', 0, 1),
	(34, '5ecbed28ab6e48ba8f70512d22b3397b.png', 'png', 102, 'http://localhost:9999/file/098bc0ea23604fab9df76d6242709fe5.png', 'b8c8919bb4b64a652d6034bc60d87d85', 0, 1),
	(35, 'ea0b47804da148c9bc0cd50a1c4bc5a7.png', 'png', 7, 'http://localhost:9999/file/a70357f4b27c415aa1979688c0838f4f.png', 'd475b4fff504f22726935dccce8c34af', 0, 1),
	(36, 'a447751969a54d5a82369a42dbf75770.png', 'png', 74, 'http://localhost:9999/file/25fe50a5141440c384515088517123ae.png', 'a88810537c3432f4937469851410c0de', 0, 1),
	(37, '0d0eee686d9144ff8401c9af156ad85c.png', 'png', 67, 'http://localhost:9999/file/390ea512943042ecb48e3d7bcab51981.png', '1e8be0597ed5c1eb360f0a6f7968faec', 0, 1),
	(38, '5ecbed28ab6e48ba8f70512d22b3397b.png', 'png', 102, 'http://localhost:9999/file/098bc0ea23604fab9df76d6242709fe5.png', 'b8c8919bb4b64a652d6034bc60d87d85', 0, 1),
	(39, '5d3e9b81eb054c1dbff075a4171eb4a4.mp4', 'mp4', 9276, 'http://localhost:8999/file/3f63cc96cc8146a3921ecbec4ef58d2b.mp4', '1f337f424a75f8fb8a9f696590f4c80e', 0, 1),
	(40, 'a447751969a54d5a82369a42dbf75770.png', 'png', 74, 'http://localhost:9999/file/25fe50a5141440c384515088517123ae.png', 'a88810537c3432f4937469851410c0de', 0, 1),
	(41, 'a447751969a54d5a82369a42dbf75770.png', 'png', 74, 'http://localhost:9999/file/25fe50a5141440c384515088517123ae.png', 'a88810537c3432f4937469851410c0de', 0, 1),
	(42, 'logo.png', 'png', 6, 'http://localhost:9999/file/9a5cd023527d4724a3a34853c6cd3599.png', '82b9c7a5a3f405032b1db71a25f67021', 0, 1),
	(43, 'logo1.png', 'png', 100, 'http://localhost:9999/file/eb51911fe5504e81bd2ff362f3911ed2.png', '0f1337b5c0ebf68f67718fcf42d1322f', 0, 1);

DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE IF NOT EXISTS `sys_menu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `pid` int DEFAULT NULL COMMENT '父级id',
  `page_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '页面路径',
  `sort_num` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `sys_menu`;
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES
	(4, '系统管理', NULL, 'el-icon-s-grid', NULL, NULL, NULL, 9999),
	(5, '用户管理', '/user', 'el-icon-user', NULL, 4, 'User', 301),
	(6, '角色管理', '/role', 'el-icon-s-custom', NULL, 4, 'Role', 302),
	(7, '菜单管理', '/menu', 'el-icon-menu', NULL, 4, 'Menu', 303),
	(10, '企业简介', '/home', 'el-icon-house', NULL, NULL, 'Home', 0),
	(11, '渔具管理', '/yuju', 'el-icon-menu', NULL, NULL, 'Yuju', 999),
	(14, '租赁购买记录管理', '/rentpurchase', 'el-icon-menu', NULL, NULL, 'Rentpurchase', 999),
	(15, '归还记录管理', '/guihuan', 'el-icon-menu', NULL, NULL, 'Guihuan', 999),
	(16, '留言管理', '/comment', 'el-icon-menu', NULL, NULL, 'Comment', 999),
	(17, '收藏管理', '/shoucang', 'el-icon-menu', NULL, NULL, 'Shoucang', 999),
	(18, '在线留言', '/comments', 'el-icon-menu', NULL, NULL, 'Comments', 11),
	(19, '论坛管理', '/notice', 'el-icon-menu', NULL, NULL, 'Notice', 999);

DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE IF NOT EXISTS `sys_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `flag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `sys_role`;
INSERT INTO `sys_role` (`id`, `name`, `description`, `flag`) VALUES
	(1, '管理员', '管理员', 'ROLE_ADMIN'),
	(2, '普通用户', '普通用户', 'ROLE_USER');

DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE IF NOT EXISTS `sys_role_menu` (
  `role_id` int NOT NULL COMMENT '角色id',
  `menu_id` int NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='角色菜单关系表';

DELETE FROM `sys_role_menu`;
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES
	(1, 4),
	(1, 5),
	(1, 6),
	(1, 7),
	(1, 10),
	(1, 11),
	(1, 14),
	(1, 15),
	(1, 16),
	(1, 17),
	(1, 18),
	(1, 19),
	(2, 10),
	(2, 11),
	(2, 14),
	(2, 15),
	(2, 17),
	(2, 18),
	(2, 19);

DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE IF NOT EXISTS `sys_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色',
  `money` decimal(10,2) unsigned zerofill DEFAULT '00000000.00' COMMENT '账户余额',
  PRIMARY KEY (`id`,`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `sys_user`;
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `role`, `money`) VALUES
	(1, 'admin', '123456', '管理员', 'admin@qq.com', '13988997788', '安徽合肥1', '2022-01-22 13:10:27', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 'ROLE_ADMIN', NULL),
	(2, 'zhang', '123456', '张三', 'zhang@qq.com', '13677889900', '南京', '2022-02-26 14:10:14', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 'ROLE_USER', NULL),
	(3, 'wang', '123456', '王五', 'wang@qq.com', '13877668855', '上海', '2022-02-26 14:10:18', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 'ROLE_USER', 00000001.00),
	(4, 'test', '123456', '11', '11', '11', '11', '2023-03-11 12:35:33', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 'ROLE_USER', 00096220.00),
	(5, 'www', '123456', '11', '11', '11', '11', '2023-03-11 23:34:23', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 'ROLE_USER', 00000093.00),
	(6, 'test11', '123456', 'test11', NULL, NULL, NULL, '2023-03-12 00:06:18', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 'ROLE_USER', 00000107.00);

DROP TABLE IF EXISTS `yuju`;
CREATE TABLE IF NOT EXISTS `yuju` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '渔具名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类型',
  `renttotal` int DEFAULT '0' COMMENT '租赁数量',
  `rentprice` decimal(10,2) DEFAULT NULL COMMENT '租赁价格',
  `purchasetotal` int DEFAULT '0' COMMENT '购买数量',
  `purchaseprice` decimal(10,2) DEFAULT NULL COMMENT '购买价格',
  `img` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `yuju`;
INSERT INTO `yuju` (`id`, `name`, `type`, `renttotal`, `rentprice`, `purchasetotal`, `purchaseprice`, `img`) VALUES
	(1, '1', '1', 0, 120.00, 0, 120.00, 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png'),
	(2, 'ee', '1', 1, 11.00, 11, 111.00, 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png'),
	(3, '鱼竿', '钓鱼', 100, 100.00, 200, 500.00, 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png'),
	(4, '鱼钩', '钓鱼', 120, 120.00, 200, 1200.00, 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
