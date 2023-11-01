/*
 Navicat Premium Data Transfer

 Source Server         : w2gd
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : geek-temp

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 01/11/2023 11:39:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_manager
-- ----------------------------
DROP TABLE IF EXISTS `sys_manager`;
CREATE TABLE `sys_manager` (
  `pk_id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `username` varchar(60) NOT NULL COMMENT '账号',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `real_name` varchar(50) NOT NULL COMMENT '真实姓名',
  `avatar` varchar(255) NOT NULL COMMENT '头像',
  `super_admin` tinyint NOT NULL DEFAULT '1' COMMENT '超级管理员(0：否，1：是)',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态(0：停用，1：正常)',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除(0-未删除，1-删除)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10013 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_manager
-- ----------------------------
BEGIN;
INSERT INTO `sys_manager` (`pk_id`, `username`, `password`, `real_name`, `avatar`, `super_admin`, `status`, `delete_flag`, `create_time`, `update_time`) VALUES (1, 'admin', '{bcrypt}$2a$10$mW/yJPHjyueQ1g26WNBz0uxVPa0GQdJO1fFZmqdkqgMTGnyszlXxu', '王亖', 'https://cdn.jsdelivr.net/gh/wardendon/wiki-image@main/img/xinyeai.jpg', 1, 1, 0, '2023-07-11 15:45:40', '2023-10-30 15:35:25');
INSERT INTO `sys_manager` (`pk_id`, `username`, `password`, `real_name`, `avatar`, `super_admin`, `status`, `delete_flag`, `create_time`, `update_time`) VALUES (2, 'wangdong', '{bcrypt}$2a$10$mW/yJPHjyueQ1g26WNBz0uxVPa0GQdJO1fFZmqdkqgMTGnyszlXxu', '王東', 'https://tainuanxin.oss-cn-hangzhou.aliyuncs.com/2023/10/30/8360bc71-9c7a-41f6-8fed-deb41e925392.png', 0, 1, 0, '2023-07-11 15:45:40', '2023-10-30 15:38:05');
COMMIT;

-- ----------------------------
-- Table structure for sys_manager_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_manager_role`;
CREATE TABLE `sys_manager_role` (
  `pk_id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `manager_id` int NOT NULL COMMENT '管理员id',
  `role_id` int NOT NULL COMMENT '角色id',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除（0-未删除，1-删除）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_manager_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_manager_role` (`pk_id`, `manager_id`, `role_id`, `delete_flag`, `create_time`, `update_time`) VALUES (1, 1, 1, 0, '2023-07-11 15:47:03', '2023-07-11 16:05:15');
INSERT INTO `sys_manager_role` (`pk_id`, `manager_id`, `role_id`, `delete_flag`, `create_time`, `update_time`) VALUES (2, 2, 1, 0, '2023-07-12 10:57:04', '2023-08-10 00:09:23');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `pk_id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `parent_id` int NOT NULL DEFAULT '0' COMMENT '父级id',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '名称',
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '标题',
  `path` varchar(200) NOT NULL DEFAULT '' COMMENT '路径',
  `component` varchar(200) NOT NULL DEFAULT '' COMMENT '组件路径',
  `type` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单类型 menu: 菜单 button: 按钮',
  `open_type` varchar(50) NOT NULL DEFAULT '' COMMENT '打开类型 tab: 选项卡 url: 外链',
  `url` varchar(500) NOT NULL DEFAULT '' COMMENT '外链地址',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `auth` varchar(500) NOT NULL DEFAULT '' COMMENT '授权标识(多个用逗号分隔，如：sys:menu:list,sys:menu:save)',
  `keepalive` tinyint NOT NULL DEFAULT '0' COMMENT '是否缓存 0:true 1:false',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除(0-未删除，1-删除)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `hide` tinyint NOT NULL DEFAULT '1' COMMENT '是否隐藏（0:true,1fasle）',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (1, 0, 'system', '系统管理', '/system', '', 'MENU_DIR', '', '', 'HomeFilled', '', 0, 1, 0, '2023-07-11 15:36:12', '2023-11-01 11:24:33', 1);
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (2, 1, 'Manager', '管理员管理', '/system/manager', '/System/Manager', 'MENU', 'TAB', '', 'HomeFilled', 'sys:manager:list', 0, 1, 0, '2023-07-11 15:37:01', '2023-07-27 09:23:53', 1);
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (3, 1, 'Role', '角色管理', '/system/role', '/System/Role', 'MENU', 'TAB', '', 'BellFilled', 'sys:role:list', 0, 2, 0, '2023-07-11 15:37:01', '2023-07-27 09:35:51', 1);
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (4, 1, 'Menu', '菜单管理', '/system/menu', '/System/Menu', 'MENU', 'TAB', '', 'HomeFilled', '', 0, 3, 0, '2023-07-11 15:37:01', '2023-07-26 15:29:58', 1);
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (8, 4, 'view', '查看', '', '', 'BUTTON', '', '', '', 'sys:menu:view', 1, 0, 0, '2023-07-11 15:37:19', '2023-07-26 15:29:58', 1);
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (9, 4, 'add', '新增', '', '', 'BUTTON', '', '', '', 'sys:menu:add', 1, 1, 0, '2023-07-11 15:37:19', '2023-07-26 15:29:59', 1);
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (10, 4, 'edit', '编辑', '', '', 'BUTTON', '', '', '', 'sys:menu:edit', 1, 2, 0, '2023-07-11 15:37:19', '2023-07-26 15:29:59', 1);
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (11, 4, 'remove', '删除', '', '', 'BUTTON', '', '', '', 'sys:menu:remove', 1, 3, 0, '2023-07-11 15:37:19', '2023-07-26 15:30:00', 1);
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (12, 3, 'view', '查看', '', '', 'BUTTON', '', '', '', 'sys:role:view', 1, 0, 0, '2023-07-11 15:37:19', '2023-07-26 15:30:00', 1);
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (13, 3, 'add', '新增', '', '', 'BUTTON', '', '', '', 'sys:role:add', 1, 1, 0, '2023-07-11 15:37:19', '2023-07-26 15:30:01', 1);
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (14, 3, 'edit', '编辑', '', '', 'BUTTON', '', '', '', 'sys:role:edit', 1, 2, 0, '2023-07-11 15:37:19', '2023-07-26 15:30:01', 1);
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (15, 3, 'remove', '删除', '', '', 'BUTTON', '', '', '', 'sys:role:remove', 1, 3, 0, '2023-07-11 15:37:19', '2023-07-26 15:30:02', 1);
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (38, 0, 'platform', '平台管理', '/platform', '', 'MENU_DIR', '', '', 'Operation', '', 0, 2, 0, '2023-07-11 15:37:19', '2023-11-01 11:24:38', 1);
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (39, 38, 'ProtocolView', '协议管理', '/platform/protocol', '/Platform/ProtocolView', 'MENU', 'TAB', '', 'DocumentCopy', 'sys:protocol:list', 0, 1, 0, '2023-07-11 15:37:19', '2023-10-30 17:02:14', 1);
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (42, 0, 'user', '用户管理', '/user', '', 'MENU_DIR', '', '', 'UserFilled', '', 1, 3, 0, '2023-07-11 15:37:19', '2023-11-01 11:24:43', 1);
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (43, 42, 'UserManage', '用户管理', '/user/user_manage', '/User/UserManage', 'MENU', 'TAB', '', 'User', 'sys:user:list', 0, 1, 0, '2023-07-11 15:37:19', '2023-07-27 09:29:53', 1);
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (49, 38, 'Version', '版本管理', '/platform/version', '/Platform/Version', 'MENU', 'TAB', '', 'Flag', 'platform:version:list', 0, 4, 0, '2023-07-15 14:13:02', '2023-07-27 09:06:29', 1);
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (67, 43, 'export', '导出', '', '', 'BUTTON', '', '', '', 'sys:user:export', 1, 0, 0, '2023-07-26 16:55:32', '2023-07-26 16:55:32', 1);
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (68, 2, 'add', '新增', '', '', 'BUTTON', '', '', '', 'sys:manager:add', 1, 0, 0, '2023-07-26 17:01:40', '2023-07-26 17:01:40', 1);
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (69, 2, 'view', '查看', '', '', 'BUTTON', '', '', '', 'sys:manager:view', 1, 1, 0, '2023-07-26 17:02:05', '2023-07-26 17:02:05', 1);
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (70, 2, 'edit', '编辑', '', '', 'BUTTON', '', '', '', 'sys:manager:edit', 1, 2, 0, '2023-07-26 17:02:21', '2023-07-26 17:02:21', 1);
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (71, 2, 'reset-psw', '重置密码', '', '', 'BUTTON', '', '', '', 'sys:manager:reset-psw', 1, 3, 0, '2023-07-26 17:03:16', '2023-07-26 17:03:16', 1);
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (72, 2, 'remove', '删除', '', '', 'BUTTON', '', '', '', 'sys:manager:remove', 1, 4, 0, '2023-07-26 17:03:33', '2023-07-26 17:03:33', 1);
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (78, 49, 'add', '新增', '', '', 'BUTTON', '', '', '', 'platform:version:add', 1, 0, 0, '2023-07-26 17:11:31', '2023-07-26 17:11:31', 1);
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (79, 49, 'view', '查看', '', '', 'BUTTON', '', '', '', 'platform:version:view', 1, 1, 0, '2023-07-26 17:11:49', '2023-07-26 17:11:49', 1);
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (80, 49, 'edit', '编辑', '', '', 'BUTTON', '', '', '', 'platform:version:edit', 1, 2, 0, '2023-07-26 17:12:24', '2023-07-26 17:12:24', 1);
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (81, 49, 'remove', '删除', '', '', 'BUTTON', '', '', '', 'platform:version:remove', 1, 3, 0, '2023-07-26 17:12:48', '2023-07-26 17:12:48', 1);
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (107, 39, 'save', '保存', '', '', 'BUTTON', '', '', '', 'sys:protocol:edit', 1, 1, 0, '2023-10-30 17:03:09', '2023-10-30 17:03:09', 1);
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (108, 0, 'home', '首页', '/home', '/Home/Home', 'MENU', 'TAB', '', 'Menu', 'none', 1, 0, 1, '2023-11-01 11:24:13', '2023-11-01 11:26:53', 0);
INSERT INTO `sys_menu` (`pk_id`, `parent_id`, `name`, `title`, `path`, `component`, `type`, `open_type`, `url`, `icon`, `auth`, `keepalive`, `sort`, `delete_flag`, `create_time`, `update_time`, `hide`) VALUES (109, 0, 'home', '首页', '/home', '/Home/Home', 'MENU', 'TAB', '', 'HomeFilled', 'none', 1, 0, 0, '2023-11-01 11:38:01', '2023-11-01 11:38:36', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_menu_two
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_two`;
CREATE TABLE `sys_menu_two` (
  `pk_id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `parent_id` int NOT NULL DEFAULT '0' COMMENT '父级id',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '路由菜单访问路径',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '路由 name',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '组件路径',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单类型: MENU_DIR 目录、 MENU 菜单 、BUTTON 按钮',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '菜单图标',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `is_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '外链地址',
  `is_hide` tinyint NOT NULL DEFAULT '1' COMMENT '是否隐藏（0:true,1fasle）',
  `is_keepalive` tinyint NOT NULL DEFAULT '1' COMMENT '是否缓存 0:true 1:false',
  `is_affix` tinyint NOT NULL DEFAULT '1' COMMENT '是否固定 0:true 1:false',
  `is_full` tinyint NOT NULL DEFAULT '1' COMMENT '是否全屏 0:true 1:false',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除(0-未删除，1-删除)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `auth` varchar(255) DEFAULT NULL COMMENT '授权标识(多个用逗号分隔，如：sys:menu:list,sys:menu:save)',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_menu_two
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu_two` (`pk_id`, `parent_id`, `path`, `name`, `component`, `type`, `icon`, `title`, `is_link`, `is_hide`, `is_keepalive`, `is_affix`, `is_full`, `sort`, `delete_flag`, `create_time`, `update_time`, `auth`) VALUES (1, 0, '/system', 'system', '', 'MENU_DIR', 'HomeFilled', '系统管理', '', 1, 0, 1, 1, 0, 0, '2023-07-11 15:36:12', '2023-10-26 11:59:56', NULL);
INSERT INTO `sys_menu_two` (`pk_id`, `parent_id`, `path`, `name`, `component`, `type`, `icon`, `title`, `is_link`, `is_hide`, `is_keepalive`, `is_affix`, `is_full`, `sort`, `delete_flag`, `create_time`, `update_time`, `auth`) VALUES (2, 1, '/system/manager', 'Manager', '/System/Manager', 'MENU', 'HomeFilled', '管理员管理?3', '', 1, 1, 1, 1, 0, 0, '2023-07-11 15:37:01', '2023-10-27 12:03:40', NULL);
INSERT INTO `sys_menu_two` (`pk_id`, `parent_id`, `path`, `name`, `component`, `type`, `icon`, `title`, `is_link`, `is_hide`, `is_keepalive`, `is_affix`, `is_full`, `sort`, `delete_flag`, `create_time`, `update_time`, `auth`) VALUES (3, 1, '/system/role', 'Role', '/System/Role', 'MENU', 'BellFilled', '角色管理', '', 1, 0, 1, 1, 2, 0, '2023-07-11 15:37:01', '2023-10-26 11:59:58', NULL);
INSERT INTO `sys_menu_two` (`pk_id`, `parent_id`, `path`, `name`, `component`, `type`, `icon`, `title`, `is_link`, `is_hide`, `is_keepalive`, `is_affix`, `is_full`, `sort`, `delete_flag`, `create_time`, `update_time`, `auth`) VALUES (4, 1, '/system/menu', 'Menu', '/System/Menu', 'MENU', 'HomeFilled', '菜单管理', '', 1, 0, 1, 1, 3, 0, '2023-07-11 15:37:01', '2023-10-26 11:59:58', NULL);
INSERT INTO `sys_menu_two` (`pk_id`, `parent_id`, `path`, `name`, `component`, `type`, `icon`, `title`, `is_link`, `is_hide`, `is_keepalive`, `is_affix`, `is_full`, `sort`, `delete_flag`, `create_time`, `update_time`, `auth`) VALUES (8, 4, '', 'view', '', 'BUTTON', '', '查看', '', 1, 1, 1, 1, 0, 0, '2023-07-11 15:37:19', '2023-10-26 11:59:59', NULL);
INSERT INTO `sys_menu_two` (`pk_id`, `parent_id`, `path`, `name`, `component`, `type`, `icon`, `title`, `is_link`, `is_hide`, `is_keepalive`, `is_affix`, `is_full`, `sort`, `delete_flag`, `create_time`, `update_time`, `auth`) VALUES (9, 4, '', 'add', '', 'BUTTON', '', '新增', '', 1, 1, 1, 1, 1, 0, '2023-07-11 15:37:19', '2023-10-26 11:59:59', NULL);
INSERT INTO `sys_menu_two` (`pk_id`, `parent_id`, `path`, `name`, `component`, `type`, `icon`, `title`, `is_link`, `is_hide`, `is_keepalive`, `is_affix`, `is_full`, `sort`, `delete_flag`, `create_time`, `update_time`, `auth`) VALUES (10, 4, '', 'edit', '', 'BUTTON', '', '编辑', '', 1, 1, 1, 1, 2, 0, '2023-07-11 15:37:19', '2023-10-26 12:00:00', NULL);
INSERT INTO `sys_menu_two` (`pk_id`, `parent_id`, `path`, `name`, `component`, `type`, `icon`, `title`, `is_link`, `is_hide`, `is_keepalive`, `is_affix`, `is_full`, `sort`, `delete_flag`, `create_time`, `update_time`, `auth`) VALUES (11, 4, '', 'remove', '', 'BUTTON', '', '删除', '', 1, 1, 1, 1, 3, 0, '2023-07-11 15:37:19', '2023-10-26 12:00:00', NULL);
INSERT INTO `sys_menu_two` (`pk_id`, `parent_id`, `path`, `name`, `component`, `type`, `icon`, `title`, `is_link`, `is_hide`, `is_keepalive`, `is_affix`, `is_full`, `sort`, `delete_flag`, `create_time`, `update_time`, `auth`) VALUES (12, 3, '', 'view', '', 'BUTTON', '', '查看', '', 1, 1, 1, 1, 0, 0, '2023-07-11 15:37:19', '2023-10-26 12:00:00', NULL);
INSERT INTO `sys_menu_two` (`pk_id`, `parent_id`, `path`, `name`, `component`, `type`, `icon`, `title`, `is_link`, `is_hide`, `is_keepalive`, `is_affix`, `is_full`, `sort`, `delete_flag`, `create_time`, `update_time`, `auth`) VALUES (13, 3, '', 'add', '', 'BUTTON', '', '新增', '', 1, 1, 1, 1, 1, 0, '2023-07-11 15:37:19', '2023-10-26 12:00:01', NULL);
INSERT INTO `sys_menu_two` (`pk_id`, `parent_id`, `path`, `name`, `component`, `type`, `icon`, `title`, `is_link`, `is_hide`, `is_keepalive`, `is_affix`, `is_full`, `sort`, `delete_flag`, `create_time`, `update_time`, `auth`) VALUES (14, 3, '', 'edit', '', 'BUTTON', '', '编辑', '', 1, 1, 1, 1, 2, 0, '2023-07-11 15:37:19', '2023-10-26 12:00:01', NULL);
INSERT INTO `sys_menu_two` (`pk_id`, `parent_id`, `path`, `name`, `component`, `type`, `icon`, `title`, `is_link`, `is_hide`, `is_keepalive`, `is_affix`, `is_full`, `sort`, `delete_flag`, `create_time`, `update_time`, `auth`) VALUES (15, 3, '', 'remove', '', 'BUTTON', '', '删除', '', 1, 1, 1, 1, 3, 0, '2023-07-11 15:37:19', '2023-10-26 12:00:02', NULL);
INSERT INTO `sys_menu_two` (`pk_id`, `parent_id`, `path`, `name`, `component`, `type`, `icon`, `title`, `is_link`, `is_hide`, `is_keepalive`, `is_affix`, `is_full`, `sort`, `delete_flag`, `create_time`, `update_time`, `auth`) VALUES (38, 0, '/platform', 'platform', '', 'MENU_DIR', 'Operation', '平台管理', '', 1, 0, 1, 1, 0, 0, '2023-07-11 15:37:19', '2023-10-26 12:00:02', NULL);
INSERT INTO `sys_menu_two` (`pk_id`, `parent_id`, `path`, `name`, `component`, `type`, `icon`, `title`, `is_link`, `is_hide`, `is_keepalive`, `is_affix`, `is_full`, `sort`, `delete_flag`, `create_time`, `update_time`, `auth`) VALUES (39, 38, '/platform/protocol', 'ProtocolView', '/Platform/ProtocolView', 'MENU', 'DocumentCopy', '协议管理', '', 1, 0, 1, 1, 1, 0, '2023-07-11 15:37:19', '2023-10-26 12:00:03', NULL);
INSERT INTO `sys_menu_two` (`pk_id`, `parent_id`, `path`, `name`, `component`, `type`, `icon`, `title`, `is_link`, `is_hide`, `is_keepalive`, `is_affix`, `is_full`, `sort`, `delete_flag`, `create_time`, `update_time`, `auth`) VALUES (42, 0, '/user', 'user', '', 'MENU_DIR', 'UserFilled', '用户管理', '', 1, 1, 1, 1, 2, 0, '2023-07-11 15:37:19', '2023-10-26 12:00:03', NULL);
INSERT INTO `sys_menu_two` (`pk_id`, `parent_id`, `path`, `name`, `component`, `type`, `icon`, `title`, `is_link`, `is_hide`, `is_keepalive`, `is_affix`, `is_full`, `sort`, `delete_flag`, `create_time`, `update_time`, `auth`) VALUES (43, 42, '/user/user_manage', 'UserManage', '/User/UserManage', 'MENU', 'User', '用户管理', '', 1, 0, 1, 1, 1, 0, '2023-07-11 15:37:19', '2023-10-26 12:00:03', NULL);
INSERT INTO `sys_menu_two` (`pk_id`, `parent_id`, `path`, `name`, `component`, `type`, `icon`, `title`, `is_link`, `is_hide`, `is_keepalive`, `is_affix`, `is_full`, `sort`, `delete_flag`, `create_time`, `update_time`, `auth`) VALUES (49, 38, '/platform/version', 'Version', '/Platform/Version', 'MENU', 'Flag', '版本管理', '', 1, 0, 1, 1, 4, 0, '2023-07-15 14:13:02', '2023-10-26 12:00:04', NULL);
INSERT INTO `sys_menu_two` (`pk_id`, `parent_id`, `path`, `name`, `component`, `type`, `icon`, `title`, `is_link`, `is_hide`, `is_keepalive`, `is_affix`, `is_full`, `sort`, `delete_flag`, `create_time`, `update_time`, `auth`) VALUES (67, 43, '', 'export', '', 'BUTTON', '', '导出', '', 1, 1, 1, 1, 0, 0, '2023-07-26 16:55:32', '2023-10-26 12:00:04', NULL);
INSERT INTO `sys_menu_two` (`pk_id`, `parent_id`, `path`, `name`, `component`, `type`, `icon`, `title`, `is_link`, `is_hide`, `is_keepalive`, `is_affix`, `is_full`, `sort`, `delete_flag`, `create_time`, `update_time`, `auth`) VALUES (68, 2, '', 'add', '', 'BUTTON', '', '新增', '', 1, 1, 1, 1, 0, 0, '2023-07-26 17:01:40', '2023-10-26 12:00:04', NULL);
INSERT INTO `sys_menu_two` (`pk_id`, `parent_id`, `path`, `name`, `component`, `type`, `icon`, `title`, `is_link`, `is_hide`, `is_keepalive`, `is_affix`, `is_full`, `sort`, `delete_flag`, `create_time`, `update_time`, `auth`) VALUES (69, 2, '', 'view', '', 'BUTTON', '', '查看', '', 1, 1, 1, 1, 1, 0, '2023-07-26 17:02:05', '2023-10-26 12:00:05', NULL);
INSERT INTO `sys_menu_two` (`pk_id`, `parent_id`, `path`, `name`, `component`, `type`, `icon`, `title`, `is_link`, `is_hide`, `is_keepalive`, `is_affix`, `is_full`, `sort`, `delete_flag`, `create_time`, `update_time`, `auth`) VALUES (70, 2, '', 'edit', '', 'BUTTON', '', '编辑', '', 1, 1, 1, 1, 2, 0, '2023-07-26 17:02:21', '2023-10-26 12:00:05', NULL);
INSERT INTO `sys_menu_two` (`pk_id`, `parent_id`, `path`, `name`, `component`, `type`, `icon`, `title`, `is_link`, `is_hide`, `is_keepalive`, `is_affix`, `is_full`, `sort`, `delete_flag`, `create_time`, `update_time`, `auth`) VALUES (71, 2, '', 'reset-psw', '', 'BUTTON', '', '重置密码', '', 1, 1, 1, 1, 3, 0, '2023-07-26 17:03:16', '2023-10-26 12:00:05', NULL);
INSERT INTO `sys_menu_two` (`pk_id`, `parent_id`, `path`, `name`, `component`, `type`, `icon`, `title`, `is_link`, `is_hide`, `is_keepalive`, `is_affix`, `is_full`, `sort`, `delete_flag`, `create_time`, `update_time`, `auth`) VALUES (72, 2, '', 'remove', '', 'BUTTON', '', '删除', '', 1, 1, 1, 1, 4, 0, '2023-07-26 17:03:33', '2023-10-26 12:00:06', NULL);
INSERT INTO `sys_menu_two` (`pk_id`, `parent_id`, `path`, `name`, `component`, `type`, `icon`, `title`, `is_link`, `is_hide`, `is_keepalive`, `is_affix`, `is_full`, `sort`, `delete_flag`, `create_time`, `update_time`, `auth`) VALUES (78, 49, '', 'add', '', 'BUTTON', '', '新增', '', 1, 1, 1, 1, 0, 0, '2023-07-26 17:11:31', '2023-10-26 12:00:06', NULL);
INSERT INTO `sys_menu_two` (`pk_id`, `parent_id`, `path`, `name`, `component`, `type`, `icon`, `title`, `is_link`, `is_hide`, `is_keepalive`, `is_affix`, `is_full`, `sort`, `delete_flag`, `create_time`, `update_time`, `auth`) VALUES (79, 49, '', 'view', '', 'BUTTON', '', '查看', '', 1, 1, 1, 1, 1, 0, '2023-07-26 17:11:49', '2023-10-26 12:00:07', NULL);
INSERT INTO `sys_menu_two` (`pk_id`, `parent_id`, `path`, `name`, `component`, `type`, `icon`, `title`, `is_link`, `is_hide`, `is_keepalive`, `is_affix`, `is_full`, `sort`, `delete_flag`, `create_time`, `update_time`, `auth`) VALUES (80, 49, '', 'edit', '', 'BUTTON', '', '编辑', '', 1, 1, 1, 1, 2, 0, '2023-07-26 17:12:24', '2023-10-26 12:00:07', NULL);
INSERT INTO `sys_menu_two` (`pk_id`, `parent_id`, `path`, `name`, `component`, `type`, `icon`, `title`, `is_link`, `is_hide`, `is_keepalive`, `is_affix`, `is_full`, `sort`, `delete_flag`, `create_time`, `update_time`, `auth`) VALUES (81, 49, '', 'remove', '', 'BUTTON', '', '删除', '', 1, 1, 1, 1, 3, 0, '2023-07-26 17:12:48', '2023-10-26 12:00:08', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `pk_id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `name` varchar(16) NOT NULL COMMENT '角色名称',
  `remark` varchar(30) NOT NULL COMMENT '角色描述',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除(0：正常 1：已删除'')',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`pk_id`, `name`, `remark`, `delete_flag`, `create_time`, `update_time`) VALUES (1, '超级管理员', '超级管理员', 0, '2023-07-11 15:26:00', '2023-10-30 18:06:08');
INSERT INTO `sys_role` (`pk_id`, `name`, `remark`, `delete_flag`, `create_time`, `update_time`) VALUES (6, '测试角色', '测试角色', 0, '2023-07-12 10:53:23', '2023-10-30 17:03:56');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `pk_id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `role_id` int NOT NULL DEFAULT '0' COMMENT '角色id',
  `menu_id` int NOT NULL DEFAULT '0' COMMENT '菜单id',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除(0-未删除，1-删除)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (177, 1, 1, 0, '2023-08-10 00:29:30', '2023-08-10 00:29:30');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (178, 1, 2, 0, '2023-08-10 00:29:30', '2023-08-10 00:29:30');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (179, 1, 68, 1, '2023-08-10 00:29:30', '2023-10-30 18:06:02');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (180, 1, 69, 1, '2023-08-10 00:29:30', '2023-10-30 15:32:16');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (181, 1, 70, 0, '2023-08-10 00:29:30', '2023-08-10 00:29:30');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (182, 1, 71, 0, '2023-08-10 00:29:30', '2023-08-10 00:29:30');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (183, 1, 72, 0, '2023-08-10 00:29:30', '2023-08-10 00:29:30');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (184, 1, 3, 0, '2023-08-10 00:29:30', '2023-08-10 00:29:30');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (185, 1, 12, 0, '2023-08-10 00:29:30', '2023-08-10 00:29:30');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (186, 1, 13, 0, '2023-08-10 00:29:30', '2023-08-10 00:29:30');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (187, 1, 14, 0, '2023-08-10 00:29:30', '2023-08-10 00:29:30');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (188, 1, 15, 0, '2023-08-10 00:29:30', '2023-08-10 00:29:30');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (189, 1, 38, 0, '2023-08-10 00:29:30', '2023-08-10 00:29:30');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (190, 1, 39, 0, '2023-08-10 00:29:30', '2023-08-10 00:29:30');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (191, 1, 49, 0, '2023-08-10 00:29:30', '2023-08-10 00:29:30');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (192, 1, 78, 0, '2023-08-10 00:29:30', '2023-08-10 00:29:30');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (193, 1, 79, 0, '2023-08-10 00:29:30', '2023-08-10 00:29:30');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (194, 1, 80, 0, '2023-08-10 00:29:30', '2023-08-10 00:29:30');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (195, 1, 81, 0, '2023-08-10 00:29:30', '2023-08-10 00:29:30');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (196, 1, 42, 0, '2023-08-10 00:29:30', '2023-08-10 00:29:30');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (197, 1, 43, 0, '2023-08-10 00:29:30', '2023-08-10 00:29:30');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (198, 1, 67, 0, '2023-08-10 00:29:30', '2023-08-10 00:29:30');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (199, 6, 38, 0, '2023-08-10 00:29:37', '2023-08-10 00:29:37');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (200, 6, 39, 0, '2023-08-10 00:29:37', '2023-08-10 00:29:37');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (201, 6, 49, 0, '2023-08-10 00:29:37', '2023-08-10 00:29:37');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (202, 6, 78, 0, '2023-08-10 00:29:37', '2023-08-10 00:29:37');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (203, 6, 79, 0, '2023-08-10 00:29:37', '2023-08-10 00:29:37');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (204, 6, 80, 0, '2023-08-10 00:29:37', '2023-08-10 00:29:37');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (205, 6, 81, 0, '2023-08-10 00:29:37', '2023-08-10 00:29:37');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (206, 6, 42, 0, '2023-08-10 00:29:37', '2023-08-10 00:29:37');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (207, 6, 43, 0, '2023-08-10 00:29:37', '2023-08-10 00:29:37');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (208, 6, 67, 0, '2023-08-10 00:29:37', '2023-08-10 00:29:37');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (209, 6, 69, 0, '2023-10-30 15:32:23', '2023-10-30 15:32:23');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (210, 6, 1, 0, '2023-10-30 15:32:23', '2023-10-30 15:32:23');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (211, 6, 2, 0, '2023-10-30 15:32:23', '2023-10-30 15:32:23');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (212, 6, 68, 0, '2023-10-30 17:03:56', '2023-10-30 17:03:56');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (213, 6, 70, 0, '2023-10-30 17:03:56', '2023-10-30 17:03:56');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (214, 6, 71, 0, '2023-10-30 17:03:56', '2023-10-30 17:03:56');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (215, 6, 72, 0, '2023-10-30 17:03:56', '2023-10-30 17:03:56');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (216, 6, 3, 0, '2023-10-30 17:03:56', '2023-10-30 17:03:56');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (217, 6, 12, 0, '2023-10-30 17:03:56', '2023-10-30 17:03:56');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (218, 6, 13, 0, '2023-10-30 17:03:56', '2023-10-30 17:03:56');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (219, 6, 14, 0, '2023-10-30 17:03:56', '2023-10-30 17:03:56');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (220, 6, 15, 0, '2023-10-30 17:03:56', '2023-10-30 17:03:56');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (221, 6, 107, 0, '2023-10-30 17:03:56', '2023-10-30 17:03:56');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (222, 1, 69, 1, '2023-10-30 17:03:58', '2023-10-30 18:06:02');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (223, 1, 107, 0, '2023-10-30 17:03:58', '2023-10-30 17:03:58');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (224, 1, 68, 0, '2023-10-30 18:06:08', '2023-10-30 18:06:08');
INSERT INTO `sys_role_menu` (`pk_id`, `role_id`, `menu_id`, `delete_flag`, `create_time`, `update_time`) VALUES (225, 1, 69, 0, '2023-10-30 18:06:08', '2023-10-30 18:06:08');
COMMIT;

-- ----------------------------
-- Table structure for t_app_version
-- ----------------------------
DROP TABLE IF EXISTS `t_app_version`;
CREATE TABLE `t_app_version` (
  `pk_id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `platform` varchar(255) NOT NULL COMMENT '平台',
  `summary` varchar(255) NOT NULL COMMENT '描述',
  `min_version` varchar(255) NOT NULL DEFAULT '0' COMMENT '最小版本',
  `max_version` varchar(255) NOT NULL DEFAULT '0' COMMENT '最大版本',
  `url` varchar(255) NOT NULL COMMENT '更新地址',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除(0-未删除，1-删除)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of t_app_version
-- ----------------------------
BEGIN;
INSERT INTO `t_app_version` (`pk_id`, `platform`, `summary`, `min_version`, `max_version`, `url`, `delete_flag`, `create_time`, `update_time`) VALUES (1, 'ios', '新测试', '1.0.2', '1.0.4', 'https://www.baidu.com', 0, '2023-07-12 15:49:51', '2023-07-16 10:16:26');
INSERT INTO `t_app_version` (`pk_id`, `platform`, `summary`, `min_version`, `max_version`, `url`, `delete_flag`, `create_time`, `update_time`) VALUES (2, '安卓', '新增', '1.1', '1.2', 'https://www.baidu.com', 1, '2023-07-13 17:26:33', '2023-07-19 13:50:41');
INSERT INTO `t_app_version` (`pk_id`, `platform`, `summary`, `min_version`, `max_version`, `url`, `delete_flag`, `create_time`, `update_time`) VALUES (3, 'ios', '新增', '1.0.0', '1.1.1', 'w2gd.top', 1, '2023-07-15 15:25:53', '2023-07-15 15:26:01');
COMMIT;

-- ----------------------------
-- Table structure for t_privacy
-- ----------------------------
DROP TABLE IF EXISTS `t_privacy`;
CREATE TABLE `t_privacy` (
  `pk_id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '隐私类型(0：隐私协议，1：用户协议，2：关于我们)',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '隐私内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of t_privacy
-- ----------------------------
BEGIN;
INSERT INTO `t_privacy` (`pk_id`, `type`, `content`, `create_time`, `update_time`) VALUES (1, 0, '<p>隐私协议-2</p>', '2023-07-11 11:11:34', '2023-07-11 11:11:34');
INSERT INTO `t_privacy` (`pk_id`, `type`, `content`, `create_time`, `update_time`) VALUES (2, 1, '<p>用户-协议</p>', '2023-07-11 11:11:45', '2023-07-11 11:11:45');
INSERT INTO `t_privacy` (`pk_id`, `type`, `content`, `create_time`, `update_time`) VALUES (3, 2, '<p>关于我们-协议</p>', '2023-07-11 11:11:51', '2023-07-11 11:11:51');
COMMIT;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `pk_id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `account` varchar(60) NOT NULL COMMENT '账号',
  `nickname` varchar(60) DEFAULT NULL COMMENT '昵称',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) DEFAULT NULL COMMENT '盐值',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `company` varchar(255) DEFAULT NULL COMMENT '工作单位',
  `gender` tinyint DEFAULT '0' COMMENT '性别(0：男，1：女，2：保密)',
  `end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '会员结束时间',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除(0-未删除，1-删除)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of t_user
-- ----------------------------
BEGIN;
INSERT INTO `t_user` (`pk_id`, `account`, `nickname`, `password`, `salt`, `avatar`, `phone`, `company`, `gender`, `end_time`, `delete_flag`, `create_time`, `update_time`) VALUES (4, '17314433312', '王東', 'a7ba89d5e5761b8ca07fcfb0c70a97f6547f12c1cff9694679bc2ce7293cb6886a73821798b5b75bcd2a4f05a70326f506b70d8bba42b11b2323158a98c609d0', 'c68252efe28a09a4fffa60e00cff29ea', 'https://ycshang123.oss-cn-hangzhou.aliyuncs.com/2023/07/13/fa272d53-42c5-4eaf-8503-ac624d865005.gif', '17314433312', '南京搬豆网络科技有限公司', 1, '2023-08-10 00:54:45', 0, '2023-07-11 18:55:29', '2023-08-10 00:54:45');
INSERT INTO `t_user` (`pk_id`, `account`, `nickname`, `password`, `salt`, `avatar`, `phone`, `company`, `gender`, `end_time`, `delete_flag`, `create_time`, `update_time`) VALUES (10, '15195757885', '15195757885', 'd125de646b8c317cf5f9f2878cf95bdde5df213ec15308c400272ec47bae24acc4948004cccc1250011e971e41a839cad0153fc551adf19612792563d31d09fc', '5e8815d4da6bf327f3c1790524276427', NULL, '15195757885', NULL, 0, '2023-08-10 00:54:20', 0, '2023-07-14 10:18:22', '2023-08-10 00:54:20');
INSERT INTO `t_user` (`pk_id`, `account`, `nickname`, `password`, `salt`, `avatar`, `phone`, `company`, `gender`, `end_time`, `delete_flag`, `create_time`, `update_time`) VALUES (11, '18761663770', 'Ertiao', '44dba0ce957dbd0b48aafaf378239d2ae3d42544e0ea0b1c433d5c9efcc2f4711c0f48cebb6bd9b31eaab15f2b12fe364455eeddc02ab52cc529b45fd840b47f', '7c2f8c4980b959b57bb7d57692317976', NULL, '15252984005', 'Haoweili', 0, '2023-08-10 00:54:18', 0, '2023-07-14 10:19:30', '2023-08-10 00:54:18');
INSERT INTO `t_user` (`pk_id`, `account`, `nickname`, `password`, `salt`, `avatar`, `phone`, `company`, `gender`, `end_time`, `delete_flag`, `create_time`, `update_time`) VALUES (12, '18761663770', 'Baidawei ', 'e7a26d01de243542b0f9f3545c2dc6baab3542b30ab86d45cea5a4f47947465c3036f8098890bb36f24e22afd9a3fe727a638fd0c46dca1615e4cfef1e707541', '8fdb5ad118211448a169efc9abc21017', NULL, '18761663770', '', 0, '2023-08-10 00:54:15', 0, '2023-07-14 11:47:51', '2023-08-10 00:54:15');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
