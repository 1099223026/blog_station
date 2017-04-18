/*
Navicat MySQL Data Transfer

Source Server         : tx_centOS
Source Server Version : 50173
Source Host           : 123.206.81.240:3306
Source Database       : diandi

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-04-18 10:27:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tab_ad
-- ----------------------------
DROP TABLE IF EXISTS `tab_ad`;
CREATE TABLE `tab_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_ad
-- ----------------------------

-- ----------------------------
-- Table structure for tab_article
-- ----------------------------
DROP TABLE IF EXISTS `tab_article`;
CREATE TABLE `tab_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(6) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_article
-- ----------------------------
INSERT INTO `tab_article` VALUES ('1', '消费系统正式发布', '向国平', null, '2016-12-04 00:00:00', '');

-- ----------------------------
-- Table structure for tab_asset
-- ----------------------------
DROP TABLE IF EXISTS `tab_asset`;
CREATE TABLE `tab_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of tab_asset
-- ----------------------------

-- ----------------------------
-- Table structure for tab_auth_access
-- ----------------------------
DROP TABLE IF EXISTS `tab_auth_access`;
CREATE TABLE `tab_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of tab_auth_access
-- ----------------------------

-- ----------------------------
-- Table structure for tab_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `tab_auth_rule`;
CREATE TABLE `tab_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=183 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of tab_auth_rule
-- ----------------------------
INSERT INTO `tab_auth_rule` VALUES ('1', 'Admin', 'admin_url', 'admin/content/default', null, '内容管理', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('2', 'Api', 'admin_url', 'api/guestbookadmin/index', null, '所有留言', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('3', 'Api', 'admin_url', 'api/guestbookadmin/delete', null, '删除网站留言', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('4', 'Comment', 'admin_url', 'comment/commentadmin/index', null, '评论管理', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('5', 'Comment', 'admin_url', 'comment/commentadmin/delete', null, '删除评论', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('6', 'Comment', 'admin_url', 'comment/commentadmin/check', null, '评论审核', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('7', 'Portal', 'admin_url', 'portal/adminpost/index', null, '文章管理', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('8', 'Portal', 'admin_url', 'portal/adminpost/listorders', null, '文章排序', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('9', 'Portal', 'admin_url', 'portal/adminpost/top', null, '文章置顶', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('10', 'Portal', 'admin_url', 'portal/adminpost/recommend', null, '文章推荐', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('11', 'Portal', 'admin_url', 'portal/adminpost/move', null, '批量移动', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('12', 'Portal', 'admin_url', 'portal/adminpost/check', null, '文章审核', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('13', 'Portal', 'admin_url', 'portal/adminpost/delete', null, '删除文章', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('14', 'Portal', 'admin_url', 'portal/adminpost/edit', null, '编辑文章', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('15', 'Portal', 'admin_url', 'portal/adminpost/edit_post', null, '提交编辑', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('16', 'Portal', 'admin_url', 'portal/adminpost/add', null, '添加文章', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('17', 'Portal', 'admin_url', 'portal/adminpost/add_post', null, '提交添加', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('18', 'Portal', 'admin_url', 'portal/adminterm/index', null, '分类管理', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('19', 'Portal', 'admin_url', 'portal/adminterm/listorders', null, '文章分类排序', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('20', 'Portal', 'admin_url', 'portal/adminterm/delete', null, '删除分类', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('21', 'Portal', 'admin_url', 'portal/adminterm/edit', null, '编辑分类', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('22', 'Portal', 'admin_url', 'portal/adminterm/edit_post', null, '提交编辑', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('23', 'Portal', 'admin_url', 'portal/adminterm/add', null, '添加分类', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('24', 'Portal', 'admin_url', 'portal/adminterm/add_post', null, '提交添加', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('25', 'Portal', 'admin_url', 'portal/adminpage/index', null, '页面管理', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('26', 'Portal', 'admin_url', 'portal/adminpage/listorders', null, '页面排序', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('27', 'Portal', 'admin_url', 'portal/adminpage/delete', null, '删除页面', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('28', 'Portal', 'admin_url', 'portal/adminpage/edit', null, '编辑页面', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('29', 'Portal', 'admin_url', 'portal/adminpage/edit_post', null, '提交编辑', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('30', 'Portal', 'admin_url', 'portal/adminpage/add', null, '添加页面', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('31', 'Portal', 'admin_url', 'portal/adminpage/add_post', null, '提交添加', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('32', 'Admin', 'admin_url', 'admin/recycle/default', null, '回收站', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('33', 'Portal', 'admin_url', 'portal/adminpost/recyclebin', null, '文章回收', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('34', 'Portal', 'admin_url', 'portal/adminpost/restore', null, '文章还原', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('35', 'Portal', 'admin_url', 'portal/adminpost/clean', null, '彻底删除', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('36', 'Portal', 'admin_url', 'portal/adminpage/recyclebin', null, '页面回收', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('37', 'Portal', 'admin_url', 'portal/adminpage/clean', null, '彻底删除', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('38', 'Portal', 'admin_url', 'portal/adminpage/restore', null, '页面还原', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('39', 'Admin', 'admin_url', 'admin/extension/default', null, '扩展工具', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('40', 'Admin', 'admin_url', 'admin/backup/default', null, '备份管理', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('41', 'Admin', 'admin_url', 'admin/backup/restore', null, '数据还原', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('42', 'Admin', 'admin_url', 'admin/backup/index', null, '数据备份', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('43', 'Admin', 'admin_url', 'admin/backup/index_post', null, '提交数据备份', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('44', 'Admin', 'admin_url', 'admin/backup/download', null, '下载备份', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('45', 'Admin', 'admin_url', 'admin/backup/del_backup', null, '删除备份', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('46', 'Admin', 'admin_url', 'admin/backup/import', null, '数据备份导入', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('47', 'Admin', 'admin_url', 'admin/plugin/index', null, '插件管理', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('48', 'Admin', 'admin_url', 'admin/plugin/toggle', null, '插件启用切换', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('49', 'Admin', 'admin_url', 'admin/plugin/setting', null, '插件设置', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('50', 'Admin', 'admin_url', 'admin/plugin/setting_post', null, '插件设置提交', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('51', 'Admin', 'admin_url', 'admin/plugin/install', null, '插件安装', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('52', 'Admin', 'admin_url', 'admin/plugin/uninstall', null, '插件卸载', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('53', 'Admin', 'admin_url', 'admin/slide/default', null, '幻灯片', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('54', 'Admin', 'admin_url', 'admin/slide/index', null, '幻灯片管理', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('55', 'Admin', 'admin_url', 'admin/slide/listorders', null, '幻灯片排序', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('56', 'Admin', 'admin_url', 'admin/slide/toggle', null, '幻灯片显示切换', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('57', 'Admin', 'admin_url', 'admin/slide/delete', null, '删除幻灯片', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('58', 'Admin', 'admin_url', 'admin/slide/edit', null, '编辑幻灯片', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('59', 'Admin', 'admin_url', 'admin/slide/edit_post', null, '提交编辑', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('60', 'Admin', 'admin_url', 'admin/slide/add', null, '添加幻灯片', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('61', 'Admin', 'admin_url', 'admin/slide/add_post', null, '提交添加', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('62', 'Admin', 'admin_url', 'admin/slidecat/index', null, '幻灯片分类', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('63', 'Admin', 'admin_url', 'admin/slidecat/delete', null, '删除分类', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('64', 'Admin', 'admin_url', 'admin/slidecat/edit', null, '编辑分类', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('65', 'Admin', 'admin_url', 'admin/slidecat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('66', 'Admin', 'admin_url', 'admin/slidecat/add', null, '添加分类', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('67', 'Admin', 'admin_url', 'admin/slidecat/add_post', null, '提交添加', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('68', 'Admin', 'admin_url', 'admin/ad/index', null, '网站广告', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('69', 'Admin', 'admin_url', 'admin/ad/toggle', null, '广告显示切换', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('70', 'Admin', 'admin_url', 'admin/ad/delete', null, '删除广告', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('71', 'Admin', 'admin_url', 'admin/ad/edit', null, '编辑广告', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('72', 'Admin', 'admin_url', 'admin/ad/edit_post', null, '提交编辑', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('73', 'Admin', 'admin_url', 'admin/ad/add', null, '添加广告', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('74', 'Admin', 'admin_url', 'admin/ad/add_post', null, '提交添加', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('75', 'Admin', 'admin_url', 'admin/link/index', null, '友情链接', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('76', 'Admin', 'admin_url', 'admin/link/listorders', null, '友情链接排序', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('77', 'Admin', 'admin_url', 'admin/link/toggle', null, '友链显示切换', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('78', 'Admin', 'admin_url', 'admin/link/delete', null, '删除友情链接', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('79', 'Admin', 'admin_url', 'admin/link/edit', null, '编辑友情链接', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('80', 'Admin', 'admin_url', 'admin/link/edit_post', null, '提交编辑', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('81', 'Admin', 'admin_url', 'admin/link/add', null, '添加友情链接', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('82', 'Admin', 'admin_url', 'admin/link/add_post', null, '提交添加', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('83', 'Api', 'admin_url', 'api/oauthadmin/setting', null, '第三方登陆', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('84', 'Api', 'admin_url', 'api/oauthadmin/setting_post', null, '提交设置', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('85', 'Admin', 'admin_url', 'admin/menu/default', null, '菜单管理', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('86', 'Admin', 'admin_url', 'admin/navcat/default1', null, '前台菜单', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('87', 'Admin', 'admin_url', 'admin/nav/index', null, '菜单管理', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('88', 'Admin', 'admin_url', 'admin/nav/listorders', null, '前台导航排序', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('89', 'Admin', 'admin_url', 'admin/nav/delete', null, '删除菜单', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('90', 'Admin', 'admin_url', 'admin/nav/edit', null, '编辑菜单', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('91', 'Admin', 'admin_url', 'admin/nav/edit_post', null, '提交编辑', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('92', 'Admin', 'admin_url', 'admin/nav/add', null, '添加菜单', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('93', 'Admin', 'admin_url', 'admin/nav/add_post', null, '提交添加', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('94', 'Admin', 'admin_url', 'admin/navcat/index', null, '菜单分类', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('95', 'Admin', 'admin_url', 'admin/navcat/delete', null, '删除分类', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('96', 'Admin', 'admin_url', 'admin/navcat/edit', null, '编辑分类', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('97', 'Admin', 'admin_url', 'admin/navcat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('98', 'Admin', 'admin_url', 'admin/navcat/add', null, '添加分类', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('99', 'Admin', 'admin_url', 'admin/navcat/add_post', null, '提交添加', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('100', 'Admin', 'admin_url', 'admin/menu/index', null, '后台菜单', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('101', 'Admin', 'admin_url', 'admin/menu/add', null, '添加菜单', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('102', 'Admin', 'admin_url', 'admin/menu/add_post', null, '提交添加', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('103', 'Admin', 'admin_url', 'admin/menu/listorders', null, '后台菜单排序', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('104', 'Admin', 'admin_url', 'admin/menu/export_menu', null, '菜单备份', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('105', 'Admin', 'admin_url', 'admin/menu/edit', null, '编辑菜单', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('106', 'Admin', 'admin_url', 'admin/menu/edit_post', null, '提交编辑', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('107', 'Admin', 'admin_url', 'admin/menu/delete', null, '删除菜单', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('108', 'Admin', 'admin_url', 'admin/menu/lists', null, '所有菜单', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('109', 'Admin', 'admin_url', 'admin/setting/default', null, '设置', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('110', 'Admin', 'admin_url', 'admin/setting/userdefault', null, '个人信息', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('111', 'Admin', 'admin_url', 'admin/user/userinfo', null, '修改信息', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('112', 'Admin', 'admin_url', 'admin/user/userinfo_post', null, '修改信息提交', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('113', 'Admin', 'admin_url', 'admin/setting/password', null, '修改密码', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('114', 'Admin', 'admin_url', 'admin/setting/password_post', null, '提交修改', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('115', 'Admin', 'admin_url', 'admin/setting/site', null, '网站信息', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('116', 'Admin', 'admin_url', 'admin/setting/site_post', null, '提交修改', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('117', 'Admin', 'admin_url', 'admin/route/index', null, '路由列表', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('118', 'Admin', 'admin_url', 'admin/route/add', null, '路由添加', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('119', 'Admin', 'admin_url', 'admin/route/add_post', null, '路由添加提交', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('120', 'Admin', 'admin_url', 'admin/route/edit', null, '路由编辑', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('121', 'Admin', 'admin_url', 'admin/route/edit_post', null, '路由编辑提交', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('122', 'Admin', 'admin_url', 'admin/route/delete', null, '路由删除', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('123', 'Admin', 'admin_url', 'admin/route/ban', null, '路由禁止', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('124', 'Admin', 'admin_url', 'admin/route/open', null, '路由启用', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('125', 'Admin', 'admin_url', 'admin/route/listorders', null, '路由排序', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('126', 'Admin', 'admin_url', 'admin/mailer/default', null, '邮箱配置', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('127', 'Admin', 'admin_url', 'admin/mailer/index', null, 'SMTP配置', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('128', 'Admin', 'admin_url', 'admin/mailer/index_post', null, '提交配置', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('129', 'Admin', 'admin_url', 'admin/mailer/active', null, '注册邮件模板', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('130', 'Admin', 'admin_url', 'admin/mailer/active_post', null, '提交模板', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('131', 'Admin', 'admin_url', 'admin/setting/clearcache', null, '清除缓存', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('132', 'User', 'admin_url', 'user/indexadmin/default', null, '用户管理', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('133', 'User', 'admin_url', 'user/indexadmin/default1', null, '用户组', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('134', 'User', 'admin_url', 'user/indexadmin/index', null, '本站用户', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('135', 'User', 'admin_url', 'user/indexadmin/ban', null, '拉黑会员', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('136', 'User', 'admin_url', 'user/indexadmin/cancelban', null, '启用会员', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('137', 'User', 'admin_url', 'user/oauthadmin/index', null, '第三方用户', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('138', 'User', 'admin_url', 'user/oauthadmin/delete', null, '第三方用户解绑', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('139', 'User', 'admin_url', 'user/indexadmin/default3', null, '管理组', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('140', 'Admin', 'admin_url', 'admin/rbac/index', null, '角色管理', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('141', 'Admin', 'admin_url', 'admin/rbac/member', null, '成员管理', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('142', 'Admin', 'admin_url', 'admin/rbac/authorize', null, '权限设置', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('143', 'Admin', 'admin_url', 'admin/rbac/authorize_post', null, '提交设置', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('144', 'Admin', 'admin_url', 'admin/rbac/roleedit', null, '编辑角色', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('145', 'Admin', 'admin_url', 'admin/rbac/roleedit_post', null, '提交编辑', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('146', 'Admin', 'admin_url', 'admin/rbac/roledelete', null, '删除角色', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('147', 'Admin', 'admin_url', 'admin/rbac/roleadd', null, '添加角色', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('148', 'Admin', 'admin_url', 'admin/rbac/roleadd_post', null, '提交添加', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('149', 'Admin', 'admin_url', 'admin/user/index', null, '管理员', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('150', 'Admin', 'admin_url', 'admin/user/delete', null, '删除管理员', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('151', 'Admin', 'admin_url', 'admin/user/edit', null, '管理员编辑', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('152', 'Admin', 'admin_url', 'admin/user/edit_post', null, '编辑提交', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('153', 'Admin', 'admin_url', 'admin/user/add', null, '管理员添加', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('154', 'Admin', 'admin_url', 'admin/user/add_post', null, '添加提交', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('155', 'Admin', 'admin_url', 'admin/plugin/update', null, '插件更新', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('156', 'Admin', 'admin_url', 'admin/storage/index', null, '文件存储', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('157', 'Admin', 'admin_url', 'admin/storage/setting_post', null, '文件存储设置提交', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('158', 'Admin', 'admin_url', 'admin/slide/ban', null, '禁用幻灯片', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('159', 'Admin', 'admin_url', 'admin/slide/cancelban', null, '启用幻灯片', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('160', 'Admin', 'admin_url', 'admin/user/ban', null, '禁用管理员', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('161', 'Admin', 'admin_url', 'admin/user/cancelban', null, '启用管理员', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('162', 'Demo', 'admin_url', 'demo/adminindex/index', null, '', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('163', 'Demo', 'admin_url', 'demo/adminindex/last', null, '', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('166', 'Admin', 'admin_url', 'admin/mailer/test', null, '测试邮件', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('167', 'Admin', 'admin_url', 'admin/setting/upload', null, '上传设置', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('168', 'Admin', 'admin_url', 'admin/setting/upload_post', null, '上传设置提交', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('169', 'Portal', 'admin_url', 'portal/adminpost/copy', null, '文章批量复制', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('170', 'Admin', 'admin_url', 'admin/menu/backup_menu', null, '备份菜单', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('171', 'Admin', 'admin_url', 'admin/menu/export_menu_lang', null, '导出后台菜单多语言包', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('172', 'Admin', 'admin_url', 'admin/menu/restore_menu', null, '还原菜单', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('173', 'Admin', 'admin_url', 'admin/menu/getactions', null, '导入新菜单', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('174', 'bill', 'admin_url', 'bill/index/index', null, '账单录入', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('175', 'bill', 'admin_url', 'bill/index/pay', null, '支出录入', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('176', 'bill', 'admin_url', 'bill/index/income', null, '缴费录入', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('177', 'room', 'admin_url', 'room/index/index', null, '室员管理', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('178', 'report', 'admin_url', 'report/index/index', null, '报表管理', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('179', 'consume', 'admin_url', 'consume/index/index', null, '消费管理', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('180', 'Consume', 'admin_url', 'consume/index/pay', null, '消费查看', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('181', 'Consume', 'admin_url', 'consume/index/income', null, '缴费查看', '1', '');
INSERT INTO `tab_auth_rule` VALUES ('182', 'article', 'admin_url', 'article/index/index', null, '文章管理', '1', '');

-- ----------------------------
-- Table structure for tab_comments
-- ----------------------------
DROP TABLE IF EXISTS `tab_comments`;
CREATE TABLE `tab_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of tab_comments
-- ----------------------------

-- ----------------------------
-- Table structure for tab_common_action_log
-- ----------------------------
DROP TABLE IF EXISTS `tab_common_action_log`;
CREATE TABLE `tab_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='访问记录表';

-- ----------------------------
-- Records of tab_common_action_log
-- ----------------------------
INSERT INTO `tab_common_action_log` VALUES ('1', '1', 'posts4', 'Portal-Article-do_like', '4', '1491360816', '127.0.0.1');

-- ----------------------------
-- Table structure for tab_consume
-- ----------------------------
DROP TABLE IF EXISTS `tab_consume`;
CREATE TABLE `tab_consume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `name` varchar(15) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `number` int(11) NOT NULL,
  `money` decimal(5,2) NOT NULL,
  `taker` varchar(10) DEFAULT NULL,
  `quarter` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=175 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tab_consume
-- ----------------------------
INSERT INTO `tab_consume` VALUES ('1', '2015-09-12', '电费', '100.00', '1', '100.00', '向国平', '1');
INSERT INTO `tab_consume` VALUES ('2', '2015-09-12', '桶装水', '7.00', '1', '7.00', '向国平', '1');
INSERT INTO `tab_consume` VALUES ('3', '2015-09-15', '桶装水', '7.00', '1', '7.00', '向国平', '1');
INSERT INTO `tab_consume` VALUES ('4', '2015-09-18', '桶装水', '7.00', '1', '7.00', '向国平', '1');
INSERT INTO `tab_consume` VALUES ('5', '2015-09-25', '卷纸', '27.00', '1', '27.00', '向国平', '1');
INSERT INTO `tab_consume` VALUES ('6', '2015-09-24', '桶装水', '7.00', '1', '7.00', '向国平', '1');
INSERT INTO `tab_consume` VALUES ('7', '2015-09-28', '洗衣粉', '20.00', '1', '20.00', '向国平', '1');
INSERT INTO `tab_consume` VALUES ('8', '2015-09-28', '洗发水', '45.00', '1', '45.00', '向国平', '1');
INSERT INTO `tab_consume` VALUES ('9', '2015-09-28', '桶装水', '7.00', '1', '7.00', '向国平', '1');
INSERT INTO `tab_consume` VALUES ('10', '2015-10-07', '桶装水', '7.00', '1', '7.00', '向国平', '1');
INSERT INTO `tab_consume` VALUES ('11', '2015-10-09', '茶叶', '13.00', '1', '13.00', '向国平', '1');
INSERT INTO `tab_consume` VALUES ('12', '2015-10-10', '桶装水', '7.00', '1', '7.00', '向国平', '1');
INSERT INTO `tab_consume` VALUES ('13', '2015-10-13', '桶装水', '7.00', '1', '7.00', '向国平', '1');
INSERT INTO `tab_consume` VALUES ('14', '2015-10-15', '桶装水', '7.00', '1', '7.00', '向国平', '1');
INSERT INTO `tab_consume` VALUES ('15', '2015-10-19', '桶装水', '7.00', '1', '7.00', '向国平', '1');
INSERT INTO `tab_consume` VALUES ('16', '2015-10-22', '桶装水', '7.00', '1', '7.00', '向国平', '1');
INSERT INTO `tab_consume` VALUES ('17', '2015-10-26', '桶装水', '7.00', '1', '7.00', '向国平', '1');
INSERT INTO `tab_consume` VALUES ('18', '2015-11-02', '桶装水', '7.00', '1', '7.00', '向国平', '1');
INSERT INTO `tab_consume` VALUES ('19', '2015-11-07', '桶装水', '7.00', '1', '7.00', '向国平', '1');
INSERT INTO `tab_consume` VALUES ('20', '2015-11-14', '农夫山泉', '2.00', '6', '12.00', '向国平', '1');
INSERT INTO `tab_consume` VALUES ('21', '2015-11-16', '桶装水', '7.00', '1', '7.00', '向国平', '1');
INSERT INTO `tab_consume` VALUES ('22', '2015-11-17', '洗发水', '40.00', '1', '40.00', '向国平', '1');
INSERT INTO `tab_consume` VALUES ('23', '2015-11-22', '桶装水', '7.00', '1', '7.00', '向国平', '1');
INSERT INTO `tab_consume` VALUES ('24', '2015-11-26', '桶装水', '7.00', '1', '7.00', '向国平', '1');
INSERT INTO `tab_consume` VALUES ('25', '2015-11-24', '聚餐', '115.00', '1', '115.00', '汪玉东', '1');
INSERT INTO `tab_consume` VALUES ('26', '2015-11-25', '沐浴露', '40.00', '1', '40.00', '付榆峰', '1');
INSERT INTO `tab_consume` VALUES ('27', '2015-10-29', '卷纸', '27.00', '1', '27.00', '向国平', '1');
INSERT INTO `tab_consume` VALUES ('28', '2015-11-28', '卷纸', '27.00', '1', '27.00', '向国平', '1');
INSERT INTO `tab_consume` VALUES ('29', '2015-11-27', '电费', '50.00', '1', '50.00', '向国平', '2');
INSERT INTO `tab_consume` VALUES ('30', '2015-11-28', '洗衣粉', '23.00', '1', '23.00', '向国平', '2');
INSERT INTO `tab_consume` VALUES ('31', '2015-12-02', '桶装水', '7.00', '1', '7.00', '向国平', '2');
INSERT INTO `tab_consume` VALUES ('32', '2015-12-06', '桶装水', '7.00', '1', '7.00', '向国平', '2');
INSERT INTO `tab_consume` VALUES ('33', '2015-12-10', '桶装水', '7.00', '1', '7.00', '向国平', '2');
INSERT INTO `tab_consume` VALUES ('34', '2015-12-14', '桶装水', '7.00', '1', '7.00', '向国平', '2');
INSERT INTO `tab_consume` VALUES ('35', '2015-12-17', '桶装水', '7.00', '1', '7.00', '向国平', '2');
INSERT INTO `tab_consume` VALUES ('36', '2015-12-17', '菊花、枸杞', '13.00', '1', '13.00', '付榆峰', '2');
INSERT INTO `tab_consume` VALUES ('37', '2015-12-20', '桶装水', '7.00', '1', '7.00', '向国平', '2');
INSERT INTO `tab_consume` VALUES ('38', '2015-12-26', '枸杞、金银花', '10.00', '1', '10.00', '戴渝', '2');
INSERT INTO `tab_consume` VALUES ('39', '2015-12-29', '水卡', '50.00', '1', '50.00', '向国平', '2');
INSERT INTO `tab_consume` VALUES ('40', '2015-12-29', '洗发水', '45.00', '1', '45.00', '向国平', '2');
INSERT INTO `tab_consume` VALUES ('41', '2015-12-29', '桶装水', '7.00', '1', '7.00', '向国平', '2');
INSERT INTO `tab_consume` VALUES ('42', '2015-12-31', '电费', '50.00', '1', '50.00', '向国平', '2');
INSERT INTO `tab_consume` VALUES ('43', '2016-01-03', '卷纸', '27.00', '1', '27.00', '向国平', '2');
INSERT INTO `tab_consume` VALUES ('44', '2016-01-04', '牙膏', '12.00', '1', '12.00', '向国平', '3');
INSERT INTO `tab_consume` VALUES ('45', '2016-01-04', '洗衣粉', '15.00', '1', '15.00', '向国平', '3');
INSERT INTO `tab_consume` VALUES ('46', '2016-01-08', '桶装水', '7.00', '1', '7.00', '汪玉东', '3');
INSERT INTO `tab_consume` VALUES ('47', '2016-01-13', '桶装水', '7.00', '1', '7.00', '向国平', '3');
INSERT INTO `tab_consume` VALUES ('48', '2016-01-18', '桶装水', '7.00', '1', '7.00', '向国平', '3');
INSERT INTO `tab_consume` VALUES ('49', '2016-01-18', '电费', '50.00', '1', '50.00', '汪玉东', '3');
INSERT INTO `tab_consume` VALUES ('50', '2016-02-28', '桶装水', '7.00', '1', '7.00', '汪玉东', '3');
INSERT INTO `tab_consume` VALUES ('51', '2016-02-29', '水卡', '50.00', '1', '50.00', '汪玉东', '3');
INSERT INTO `tab_consume` VALUES ('52', '2016-03-02', '电费', '100.00', '1', '100.00', '向国平', '3');
INSERT INTO `tab_consume` VALUES ('53', '2016-03-04', '桶装水', '7.00', '1', '7.00', '向国平', '3');
INSERT INTO `tab_consume` VALUES ('54', '2016-03-06', '沐浴露', '35.00', '1', '35.00', '向国平', '3');
INSERT INTO `tab_consume` VALUES ('55', '2016-03-06', '卷纸', '25.00', '1', '25.00', '向国平', '3');
INSERT INTO `tab_consume` VALUES ('56', '2016-03-06', '红枣、枸杞', '11.00', '1', '11.00', '向国平', '3');
INSERT INTO `tab_consume` VALUES ('57', '2016-03-07', '双面胶', '1.00', '1', '1.00', '向国平', '3');
INSERT INTO `tab_consume` VALUES ('58', '2016-03-09', '桶装水', '7.00', '1', '7.00', '向国平', '3');
INSERT INTO `tab_consume` VALUES ('59', '2016-03-10', '洗发水', '60.00', '1', '60.00', '向国平', '3');
INSERT INTO `tab_consume` VALUES ('60', '2016-03-13', '桶装水', '7.00', '1', '7.00', '向国平', '3');
INSERT INTO `tab_consume` VALUES ('61', '2016-03-14', '水卡', '40.00', '1', '40.00', '向国平', '3');
INSERT INTO `tab_consume` VALUES ('62', '2016-03-17', '桶装水', '7.00', '1', '7.00', '向国平', '3');
INSERT INTO `tab_consume` VALUES ('63', '2016-03-21', '桶装水', '7.00', '1', '7.00', '向国平', '3');
INSERT INTO `tab_consume` VALUES ('64', '2016-03-25', '桶装水', '7.00', '1', '7.00', '向国平', '3');
INSERT INTO `tab_consume` VALUES ('65', '2016-03-31', '桶装水', '7.00', '1', '7.00', '向国平', '3');
INSERT INTO `tab_consume` VALUES ('66', '2016-04-04', '桶装水', '7.00', '1', '7.00', '向国平', '3');
INSERT INTO `tab_consume` VALUES ('67', '2016-04-08', '桶装水', '7.00', '1', '7.00', '向国平', '3');
INSERT INTO `tab_consume` VALUES ('68', '2016-04-11', '桶装水', '7.00', '1', '7.00', '向国平', '3');
INSERT INTO `tab_consume` VALUES ('69', '2016-04-14', '卷纸', '25.00', '1', '25.00', '向国平', '3');
INSERT INTO `tab_consume` VALUES ('70', '2016-04-14', '洗衣粉', '15.00', '1', '15.00', '向国平', '3');
INSERT INTO `tab_consume` VALUES ('71', '2016-04-16', '桶装水', '7.00', '1', '7.00', '向国平', '3');
INSERT INTO `tab_consume` VALUES ('72', '2016-04-20', '牙膏', '9.50', '2', '19.00', '向国平', '3');
INSERT INTO `tab_consume` VALUES ('73', '2016-04-21', '桶装水', '7.00', '1', '7.00', '向国平', '3');
INSERT INTO `tab_consume` VALUES ('74', '2016-04-24', '桶装水', '7.00', '1', '7.00', '向国平', '3');
INSERT INTO `tab_consume` VALUES ('75', '2016-04-26', '洗发水', '55.00', '1', '55.00', '向国平', '3');
INSERT INTO `tab_consume` VALUES ('76', '2016-04-29', '桶装水', '7.00', '1', '7.00', '向国平', '4');
INSERT INTO `tab_consume` VALUES ('77', '2016-05-03', '桶装水', '7.00', '1', '7.00', '向国平', '4');
INSERT INTO `tab_consume` VALUES ('78', '2016-05-06', '桶装水', '7.00', '1', '7.00', '向国平', '4');
INSERT INTO `tab_consume` VALUES ('79', '2016-05-11', '桶装水', '7.00', '1', '7.00', '向国平', '4');
INSERT INTO `tab_consume` VALUES ('80', '2016-05-09', '桶装水', '7.00', '1', '7.00', '向国平', '4');
INSERT INTO `tab_consume` VALUES ('81', '2016-05-15', '桶装水', '7.00', '1', '7.00', '向国平', '4');
INSERT INTO `tab_consume` VALUES ('96', '2016-05-29', '桶装水', '7.00', '1', '7.00', '向国平', '4');
INSERT INTO `tab_consume` VALUES ('95', '2016-05-25', '水卡', '50.00', '1', '50.00', '向国平', '4');
INSERT INTO `tab_consume` VALUES ('94', '2016-05-23', '洗衣粉', '12.00', '1', '12.00', '向国平', '4');
INSERT INTO `tab_consume` VALUES ('92', '2016-05-21', '桶装水', '7.00', '1', '7.00', '向国平', '4');
INSERT INTO `tab_consume` VALUES ('93', '2016-05-22', '卷纸', '25.00', '1', '25.00', '向国平', '4');
INSERT INTO `tab_consume` VALUES ('97', '2016-05-31', '沐浴露', '30.00', '1', '30.00', '向国平', '4');
INSERT INTO `tab_consume` VALUES ('98', '2016-05-31', '牙膏', '8.00', '1', '8.00', '向国平', '4');
INSERT INTO `tab_consume` VALUES ('99', '2016-06-01', '桶装水', '7.00', '1', '7.00', '向国平', '4');
INSERT INTO `tab_consume` VALUES ('100', '2016-06-06', '桶装水', '7.00', '1', '7.00', '向国平', '4');
INSERT INTO `tab_consume` VALUES ('101', '2016-06-07', '水卡', '50.00', '1', '50.00', '向国平', '4');
INSERT INTO `tab_consume` VALUES ('102', '2016-06-11', '沐浴、洗发露', '55.00', '1', '55.00', '向国平', '4');
INSERT INTO `tab_consume` VALUES ('113', '2016-06-13', '电费', '50.00', '1', '50.00', '向国平', '5');
INSERT INTO `tab_consume` VALUES ('112', '2016-06-12', '蚊香', '4.50', '1', '4.50', '向国平', '5');
INSERT INTO `tab_consume` VALUES ('114', '2016-06-12', '桶装水', '7.00', '1', '7.00', '向国平', '5');
INSERT INTO `tab_consume` VALUES ('115', '2016-06-17', '桶装水', '7.00', '1', '7.00', '向国平', '5');
INSERT INTO `tab_consume` VALUES ('121', '2016-06-23', '桶装水', '7.00', '1', '7.00', '向国平', '5');
INSERT INTO `tab_consume` VALUES ('122', '2016-06-17', '牙膏', '9.00', '1', '9.00', '向国平', '5');
INSERT INTO `tab_consume` VALUES ('123', '2016-07-02', '牙膏', '9.00', '1', '9.00', '向国平', '5');
INSERT INTO `tab_consume` VALUES ('124', '2016-07-04', '桶装水', '7.00', '1', '7.00', '向国平', '5');
INSERT INTO `tab_consume` VALUES ('125', '2016-07-08', '桶装水', '7.00', '1', '7.00', '向国平', '5');
INSERT INTO `tab_consume` VALUES ('126', '2016-07-13', '桶装水', '7.00', '1', '7.00', '向国平', '5');
INSERT INTO `tab_consume` VALUES ('127', '2016-07-15', '洗衣粉', '13.00', '1', '13.00', '向国平', '5');
INSERT INTO `tab_consume` VALUES ('128', '2016-07-15', '卷纸', '12.00', '1', '12.00', '向国平', '5');
INSERT INTO `tab_consume` VALUES ('129', '2016-07-18', '电费', '50.00', '1', '50.00', '向国平', '5');
INSERT INTO `tab_consume` VALUES ('130', '2016-08-28', '桶装水', '7.00', '1', '7.00', '向国平', '5');
INSERT INTO `tab_consume` VALUES ('131', '2016-09-04', '洗发露', '59.80', '1', '59.80', '向国平', '5');
INSERT INTO `tab_consume` VALUES ('132', '2016-09-05', '卷纸', '23.00', '1', '23.00', '向国平', '5');
INSERT INTO `tab_consume` VALUES ('133', '2016-09-05', '水卡', '50.00', '1', '50.00', '向国平', '5');
INSERT INTO `tab_consume` VALUES ('134', '2016-09-07', '桶装水', '7.00', '1', '7.00', '向国平', '6');
INSERT INTO `tab_consume` VALUES ('135', '2016-09-08', '电费', '50.00', '1', '50.00', '向国平', '6');
INSERT INTO `tab_consume` VALUES ('136', '2016-09-11', '桶装水', '7.00', '1', '7.00', '向国平', '6');
INSERT INTO `tab_consume` VALUES ('137', '2016-09-16', '桶装水', '7.00', '1', '7.00', '向国平', '6');
INSERT INTO `tab_consume` VALUES ('138', '2016-09-18', '洗衣粉', '10.00', '1', '10.00', '向国平', '6');
INSERT INTO `tab_consume` VALUES ('139', '2016-09-23', '电费', '50.00', '1', '50.00', '向国平', '6');
INSERT INTO `tab_consume` VALUES ('140', '2016-09-23', '水卡', '50.00', '1', '50.00', '向国平', '6');
INSERT INTO `tab_consume` VALUES ('141', '2016-09-25', '桶装水', '7.00', '1', '7.00', '向国平', '6');
INSERT INTO `tab_consume` VALUES ('142', '2016-10-05', '桶装水', '7.00', '1', '7.00', '向国平', '6');
INSERT INTO `tab_consume` VALUES ('143', '2016-10-13', '桶装水', '7.00', '1', '7.00', '向国平', '6');
INSERT INTO `tab_consume` VALUES ('144', '2016-10-19', '洗衣粉', '15.00', '1', '7.00', '向国平', '6');
INSERT INTO `tab_consume` VALUES ('145', '2016-10-20', '桶装水', '7.00', '1', '7.00', '向国平', '6');
INSERT INTO `tab_consume` VALUES ('146', '2016-10-26', '桶装水', '7.00', '1', '7.00', '向国平', '6');
INSERT INTO `tab_consume` VALUES ('147', '2016-10-30', '桶装水', '7.00', '1', '7.00', '向国平', '6');
INSERT INTO `tab_consume` VALUES ('148', '2016-11-04', '桶装水', '7.00', '1', '7.00', '向国平', '6');
INSERT INTO `tab_consume` VALUES ('149', '2016-11-11', '桶装水', '7.00', '1', '7.00', '向国平', '6');
INSERT INTO `tab_consume` VALUES ('150', '2016-11-05', '卷纸', '25.00', '1', '25.00', '向国平', '6');
INSERT INTO `tab_consume` VALUES ('151', '2016-11-15', '桶装水', '7.00', '1', '7.00', '向国平', '6');
INSERT INTO `tab_consume` VALUES ('152', '2016-11-20', '桶装水', '7.00', '1', '7.00', '向国平', '6');
INSERT INTO `tab_consume` VALUES ('153', '2016-11-24', '桶装水', '7.00', '1', '7.00', '向国平', '6');
INSERT INTO `tab_consume` VALUES ('154', '2016-12-01', '桶装水', '7.00', '1', '7.00', '向国平', '6');
INSERT INTO `tab_consume` VALUES ('155', '2016-12-06', '桶装水', '7.00', '1', '7.00', '向国平', '6');
INSERT INTO `tab_consume` VALUES ('156', '2016-12-11', '桶装水', '7.00', '1', '7.00', '向国平', '6');
INSERT INTO `tab_consume` VALUES ('157', '2016-12-15', '卷纸', '25.00', '1', '25.00', '向国平', '6');
INSERT INTO `tab_consume` VALUES ('158', '2016-12-16', '电费', '50.00', '1', '50.00', '向国平', '6');
INSERT INTO `tab_consume` VALUES ('160', '2016-12-17', '桶装水', '7.00', '1', '7.00', '向国平', '7');
INSERT INTO `tab_consume` VALUES ('161', '2016-12-22', '桶装水', '7.00', '1', '7.00', '向国平', '7');
INSERT INTO `tab_consume` VALUES ('162', '2016-12-28', '洗衣粉', '12.00', '1', '12.00', '向国平', '7');
INSERT INTO `tab_consume` VALUES ('163', '2016-12-29', '桶装水', '7.00', '1', '7.00', '向国平', '7');
INSERT INTO `tab_consume` VALUES ('164', '2017-01-05', '桶装水', '7.00', '1', '7.00', '向国平', '7');
INSERT INTO `tab_consume` VALUES ('165', '2017-01-17', '桶装水', '7.00', '1', '7.00', '向国平', '7');
INSERT INTO `tab_consume` VALUES ('166', '2017-02-18', '卷纸', '25.00', '1', '25.00', '向国平', '7');
INSERT INTO `tab_consume` VALUES ('167', '2017-02-18', '拖把', '13.00', '1', '13.00', '向国平', '7');
INSERT INTO `tab_consume` VALUES ('168', '2017-02-20', '桶装水', '7.00', '1', '7.00', '向国平', '7');
INSERT INTO `tab_consume` VALUES ('169', '2017-02-25', '桶装水', '7.00', '1', '7.00', '向国平', '7');

-- ----------------------------
-- Table structure for tab_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `tab_guestbook`;
CREATE TABLE `tab_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言表';

-- ----------------------------
-- Records of tab_guestbook
-- ----------------------------

-- ----------------------------
-- Table structure for tab_links
-- ----------------------------
DROP TABLE IF EXISTS `tab_links`;
CREATE TABLE `tab_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of tab_links
-- ----------------------------
INSERT INTO `tab_links` VALUES ('1', 'http://www.thinkcmf.com', 'ThinkCMF', '', '_blank', '', '1', '0', '', '0');

-- ----------------------------
-- Table structure for tab_login_log
-- ----------------------------
DROP TABLE IF EXISTS `tab_login_log`;
CREATE TABLE `tab_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_date` datetime NOT NULL,
  `client_ip` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_login_log
-- ----------------------------
INSERT INTO `tab_login_log` VALUES ('1', '0000-00-00 00:00:00', '2', '3');

-- ----------------------------
-- Table structure for tab_menu
-- ----------------------------
DROP TABLE IF EXISTS `tab_menu`;
CREATE TABLE `tab_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` varchar(30) NOT NULL DEFAULT '' COMMENT '应用名称app',
  `model` varchar(30) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称',
  `data` varchar(50) NOT NULL DEFAULT '' COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=196 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of tab_menu
-- ----------------------------
INSERT INTO `tab_menu` VALUES ('1', '0', 'Admin', 'Content', 'default', '', '0', '1', '内容管理', 'th', '', '30');
INSERT INTO `tab_menu` VALUES ('2', '1', 'Api', 'Guestbookadmin', 'index', '', '1', '1', '所有留言', '', '', '0');
INSERT INTO `tab_menu` VALUES ('3', '2', 'Api', 'Guestbookadmin', 'delete', '', '1', '0', '删除网站留言', '', '', '0');
INSERT INTO `tab_menu` VALUES ('4', '1', 'Comment', 'Commentadmin', 'index', '', '1', '1', '评论管理', '', '', '0');
INSERT INTO `tab_menu` VALUES ('5', '4', 'Comment', 'Commentadmin', 'delete', '', '1', '0', '删除评论', '', '', '0');
INSERT INTO `tab_menu` VALUES ('6', '4', 'Comment', 'Commentadmin', 'check', '', '1', '0', '评论审核', '', '', '0');
INSERT INTO `tab_menu` VALUES ('7', '1', 'Portal', 'AdminPost', 'index', '', '1', '1', '文章管理', '', '', '1');
INSERT INTO `tab_menu` VALUES ('8', '7', 'Portal', 'AdminPost', 'listorders', '', '1', '0', '文章排序', '', '', '0');
INSERT INTO `tab_menu` VALUES ('9', '7', 'Portal', 'AdminPost', 'top', '', '1', '0', '文章置顶', '', '', '0');
INSERT INTO `tab_menu` VALUES ('10', '7', 'Portal', 'AdminPost', 'recommend', '', '1', '0', '文章推荐', '', '', '0');
INSERT INTO `tab_menu` VALUES ('11', '7', 'Portal', 'AdminPost', 'move', '', '1', '0', '批量移动', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('12', '7', 'Portal', 'AdminPost', 'check', '', '1', '0', '文章审核', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('13', '7', 'Portal', 'AdminPost', 'delete', '', '1', '0', '删除文章', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('14', '7', 'Portal', 'AdminPost', 'edit', '', '1', '0', '编辑文章', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('15', '14', 'Portal', 'AdminPost', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `tab_menu` VALUES ('16', '7', 'Portal', 'AdminPost', 'add', '', '1', '0', '添加文章', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('17', '16', 'Portal', 'AdminPost', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `tab_menu` VALUES ('18', '1', 'Portal', 'AdminTerm', 'index', '', '0', '1', '分类管理', '', '', '2');
INSERT INTO `tab_menu` VALUES ('19', '18', 'Portal', 'AdminTerm', 'listorders', '', '1', '0', '文章分类排序', '', '', '0');
INSERT INTO `tab_menu` VALUES ('20', '18', 'Portal', 'AdminTerm', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('21', '18', 'Portal', 'AdminTerm', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('22', '21', 'Portal', 'AdminTerm', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `tab_menu` VALUES ('23', '18', 'Portal', 'AdminTerm', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('24', '23', 'Portal', 'AdminTerm', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `tab_menu` VALUES ('25', '1', 'Portal', 'AdminPage', 'index', '', '1', '1', '页面管理', '', '', '3');
INSERT INTO `tab_menu` VALUES ('26', '25', 'Portal', 'AdminPage', 'listorders', '', '1', '0', '页面排序', '', '', '0');
INSERT INTO `tab_menu` VALUES ('27', '25', 'Portal', 'AdminPage', 'delete', '', '1', '0', '删除页面', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('28', '25', 'Portal', 'AdminPage', 'edit', '', '1', '0', '编辑页面', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('29', '28', 'Portal', 'AdminPage', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `tab_menu` VALUES ('30', '25', 'Portal', 'AdminPage', 'add', '', '1', '0', '添加页面', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('31', '30', 'Portal', 'AdminPage', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `tab_menu` VALUES ('32', '1', 'Admin', 'Recycle', 'default', '', '1', '1', '回收站', '', '', '4');
INSERT INTO `tab_menu` VALUES ('33', '32', 'Portal', 'AdminPost', 'recyclebin', '', '1', '1', '文章回收', '', '', '0');
INSERT INTO `tab_menu` VALUES ('34', '33', 'Portal', 'AdminPost', 'restore', '', '1', '0', '文章还原', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('35', '33', 'Portal', 'AdminPost', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('36', '32', 'Portal', 'AdminPage', 'recyclebin', '', '1', '1', '页面回收', '', '', '1');
INSERT INTO `tab_menu` VALUES ('37', '36', 'Portal', 'AdminPage', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('38', '36', 'Portal', 'AdminPage', 'restore', '', '1', '0', '页面还原', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('39', '0', 'Admin', 'Extension', 'default', '', '0', '1', '扩展工具', 'cloud', '', '40');
INSERT INTO `tab_menu` VALUES ('40', '39', 'Admin', 'Backup', 'default', '', '1', '0', '备份管理', '', '', '0');
INSERT INTO `tab_menu` VALUES ('41', '40', 'Admin', 'Backup', 'restore', '', '1', '1', '数据还原', '', '', '0');
INSERT INTO `tab_menu` VALUES ('42', '40', 'Admin', 'Backup', 'index', '', '1', '1', '数据备份', '', '', '0');
INSERT INTO `tab_menu` VALUES ('43', '42', 'Admin', 'Backup', 'index_post', '', '1', '0', '提交数据备份', '', '', '0');
INSERT INTO `tab_menu` VALUES ('44', '40', 'Admin', 'Backup', 'download', '', '1', '0', '下载备份', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('45', '40', 'Admin', 'Backup', 'del_backup', '', '1', '0', '删除备份', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('46', '40', 'Admin', 'Backup', 'import', '', '1', '0', '数据备份导入', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('47', '39', 'Admin', 'Plugin', 'index', '', '1', '1', '插件管理', '', '', '0');
INSERT INTO `tab_menu` VALUES ('48', '47', 'Admin', 'Plugin', 'toggle', '', '1', '0', '插件启用切换', '', '', '0');
INSERT INTO `tab_menu` VALUES ('49', '47', 'Admin', 'Plugin', 'setting', '', '1', '0', '插件设置', '', '', '0');
INSERT INTO `tab_menu` VALUES ('50', '49', 'Admin', 'Plugin', 'setting_post', '', '1', '0', '插件设置提交', '', '', '0');
INSERT INTO `tab_menu` VALUES ('51', '47', 'Admin', 'Plugin', 'install', '', '1', '0', '插件安装', '', '', '0');
INSERT INTO `tab_menu` VALUES ('52', '47', 'Admin', 'Plugin', 'uninstall', '', '1', '0', '插件卸载', '', '', '0');
INSERT INTO `tab_menu` VALUES ('53', '39', 'Admin', 'Slide', 'default', '', '1', '1', '幻灯片', '', '', '1');
INSERT INTO `tab_menu` VALUES ('54', '53', 'Admin', 'Slide', 'index', '', '1', '1', '幻灯片管理', '', '', '0');
INSERT INTO `tab_menu` VALUES ('55', '54', 'Admin', 'Slide', 'listorders', '', '1', '0', '幻灯片排序', '', '', '0');
INSERT INTO `tab_menu` VALUES ('56', '54', 'Admin', 'Slide', 'toggle', '', '1', '0', '幻灯片显示切换', '', '', '0');
INSERT INTO `tab_menu` VALUES ('57', '54', 'Admin', 'Slide', 'delete', '', '1', '0', '删除幻灯片', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('58', '54', 'Admin', 'Slide', 'edit', '', '1', '0', '编辑幻灯片', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('59', '58', 'Admin', 'Slide', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `tab_menu` VALUES ('60', '54', 'Admin', 'Slide', 'add', '', '1', '0', '添加幻灯片', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('61', '60', 'Admin', 'Slide', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `tab_menu` VALUES ('62', '53', 'Admin', 'Slidecat', 'index', '', '1', '1', '幻灯片分类', '', '', '0');
INSERT INTO `tab_menu` VALUES ('63', '62', 'Admin', 'Slidecat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('64', '62', 'Admin', 'Slidecat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('65', '64', 'Admin', 'Slidecat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `tab_menu` VALUES ('66', '62', 'Admin', 'Slidecat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('67', '66', 'Admin', 'Slidecat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `tab_menu` VALUES ('68', '39', 'Admin', 'Ad', 'index', '', '1', '1', '网站广告', '', '', '2');
INSERT INTO `tab_menu` VALUES ('69', '68', 'Admin', 'Ad', 'toggle', '', '1', '0', '广告显示切换', '', '', '0');
INSERT INTO `tab_menu` VALUES ('70', '68', 'Admin', 'Ad', 'delete', '', '1', '0', '删除广告', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('71', '68', 'Admin', 'Ad', 'edit', '', '1', '0', '编辑广告', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('72', '71', 'Admin', 'Ad', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `tab_menu` VALUES ('73', '68', 'Admin', 'Ad', 'add', '', '1', '0', '添加广告', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('74', '73', 'Admin', 'Ad', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `tab_menu` VALUES ('75', '39', 'Admin', 'Link', 'index', '', '0', '1', '友情链接', '', '', '3');
INSERT INTO `tab_menu` VALUES ('76', '75', 'Admin', 'Link', 'listorders', '', '1', '0', '友情链接排序', '', '', '0');
INSERT INTO `tab_menu` VALUES ('77', '75', 'Admin', 'Link', 'toggle', '', '1', '0', '友链显示切换', '', '', '0');
INSERT INTO `tab_menu` VALUES ('78', '75', 'Admin', 'Link', 'delete', '', '1', '0', '删除友情链接', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('79', '75', 'Admin', 'Link', 'edit', '', '1', '0', '编辑友情链接', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('80', '79', 'Admin', 'Link', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `tab_menu` VALUES ('81', '75', 'Admin', 'Link', 'add', '', '1', '0', '添加友情链接', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('82', '81', 'Admin', 'Link', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `tab_menu` VALUES ('83', '39', 'Api', 'Oauthadmin', 'setting', '', '1', '1', '第三方登陆', 'leaf', '', '4');
INSERT INTO `tab_menu` VALUES ('84', '83', 'Api', 'Oauthadmin', 'setting_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `tab_menu` VALUES ('85', '0', 'Admin', 'Menu', 'default', '', '1', '1', '菜单管理', 'list', '', '20');
INSERT INTO `tab_menu` VALUES ('86', '85', 'Admin', 'Navcat', 'default1', '', '1', '1', '前台菜单', '', '', '0');
INSERT INTO `tab_menu` VALUES ('87', '86', 'Admin', 'Nav', 'index', '', '1', '1', '菜单管理', '', '', '0');
INSERT INTO `tab_menu` VALUES ('88', '87', 'Admin', 'Nav', 'listorders', '', '1', '0', '前台导航排序', '', '', '0');
INSERT INTO `tab_menu` VALUES ('89', '87', 'Admin', 'Nav', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('90', '87', 'Admin', 'Nav', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('91', '90', 'Admin', 'Nav', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `tab_menu` VALUES ('92', '87', 'Admin', 'Nav', 'add', '', '1', '0', '添加菜单', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('93', '92', 'Admin', 'Nav', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `tab_menu` VALUES ('94', '86', 'Admin', 'Navcat', 'index', '', '1', '1', '菜单分类', '', '', '0');
INSERT INTO `tab_menu` VALUES ('95', '94', 'Admin', 'Navcat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('96', '94', 'Admin', 'Navcat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('97', '96', 'Admin', 'Navcat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `tab_menu` VALUES ('98', '94', 'Admin', 'Navcat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('99', '98', 'Admin', 'Navcat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `tab_menu` VALUES ('100', '85', 'Admin', 'Menu', 'index', '', '1', '1', '后台菜单', '', '', '0');
INSERT INTO `tab_menu` VALUES ('101', '100', 'Admin', 'Menu', 'add', '', '1', '0', '添加菜单', '', '', '0');
INSERT INTO `tab_menu` VALUES ('102', '101', 'Admin', 'Menu', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `tab_menu` VALUES ('103', '100', 'Admin', 'Menu', 'listorders', '', '1', '0', '后台菜单排序', '', '', '0');
INSERT INTO `tab_menu` VALUES ('104', '100', 'Admin', 'Menu', 'export_menu', '', '1', '0', '菜单备份', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('105', '100', 'Admin', 'Menu', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('106', '105', 'Admin', 'Menu', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `tab_menu` VALUES ('107', '100', 'Admin', 'Menu', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('108', '100', 'Admin', 'Menu', 'lists', '', '1', '0', '所有菜单', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('109', '0', 'Admin', 'Setting', 'default', '', '0', '1', '设置', 'cogs', '', '0');
INSERT INTO `tab_menu` VALUES ('110', '109', 'Admin', 'Setting', 'userdefault', '', '0', '1', '个人信息', '', '', '0');
INSERT INTO `tab_menu` VALUES ('111', '110', 'Admin', 'User', 'userinfo', '', '1', '1', '修改信息', '', '', '0');
INSERT INTO `tab_menu` VALUES ('112', '111', 'Admin', 'User', 'userinfo_post', '', '1', '0', '修改信息提交', '', '', '0');
INSERT INTO `tab_menu` VALUES ('113', '110', 'Admin', 'Setting', 'password', '', '1', '1', '修改密码', '', '', '0');
INSERT INTO `tab_menu` VALUES ('114', '113', 'Admin', 'Setting', 'password_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `tab_menu` VALUES ('115', '109', 'Admin', 'Setting', 'site', '', '1', '1', '网站信息', '', '', '0');
INSERT INTO `tab_menu` VALUES ('116', '115', 'Admin', 'Setting', 'site_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `tab_menu` VALUES ('117', '115', 'Admin', 'Route', 'index', '', '1', '0', '路由列表', '', '', '0');
INSERT INTO `tab_menu` VALUES ('118', '115', 'Admin', 'Route', 'add', '', '1', '0', '路由添加', '', '', '0');
INSERT INTO `tab_menu` VALUES ('119', '118', 'Admin', 'Route', 'add_post', '', '1', '0', '路由添加提交', '', '', '0');
INSERT INTO `tab_menu` VALUES ('120', '115', 'Admin', 'Route', 'edit', '', '1', '0', '路由编辑', '', '', '0');
INSERT INTO `tab_menu` VALUES ('121', '120', 'Admin', 'Route', 'edit_post', '', '1', '0', '路由编辑提交', '', '', '0');
INSERT INTO `tab_menu` VALUES ('122', '115', 'Admin', 'Route', 'delete', '', '1', '0', '路由删除', '', '', '0');
INSERT INTO `tab_menu` VALUES ('123', '115', 'Admin', 'Route', 'ban', '', '1', '0', '路由禁止', '', '', '0');
INSERT INTO `tab_menu` VALUES ('124', '115', 'Admin', 'Route', 'open', '', '1', '0', '路由启用', '', '', '0');
INSERT INTO `tab_menu` VALUES ('125', '115', 'Admin', 'Route', 'listorders', '', '1', '0', '路由排序', '', '', '0');
INSERT INTO `tab_menu` VALUES ('126', '109', 'Admin', 'Mailer', 'default', '', '1', '1', '邮箱配置', '', '', '0');
INSERT INTO `tab_menu` VALUES ('127', '126', 'Admin', 'Mailer', 'index', '', '1', '1', 'SMTP配置', '', '', '0');
INSERT INTO `tab_menu` VALUES ('128', '127', 'Admin', 'Mailer', 'index_post', '', '1', '0', '提交配置', '', '', '0');
INSERT INTO `tab_menu` VALUES ('129', '126', 'Admin', 'Mailer', 'active', '', '1', '1', '注册邮件模板', '', '', '0');
INSERT INTO `tab_menu` VALUES ('130', '129', 'Admin', 'Mailer', 'active_post', '', '1', '0', '提交模板', '', '', '0');
INSERT INTO `tab_menu` VALUES ('131', '109', 'Admin', 'Setting', 'clearcache', '', '1', '1', '清除缓存', '', '', '1');
INSERT INTO `tab_menu` VALUES ('132', '0', 'User', 'Indexadmin', 'default', '', '1', '1', '用户管理', 'group', '', '10');
INSERT INTO `tab_menu` VALUES ('133', '132', 'User', 'Indexadmin', 'default1', '', '1', '1', '用户组', '', '', '0');
INSERT INTO `tab_menu` VALUES ('134', '133', 'User', 'Indexadmin', 'index', '', '1', '1', '本站用户', 'leaf', '', '0');
INSERT INTO `tab_menu` VALUES ('135', '134', 'User', 'Indexadmin', 'ban', '', '1', '0', '拉黑会员', '', '', '0');
INSERT INTO `tab_menu` VALUES ('136', '134', 'User', 'Indexadmin', 'cancelban', '', '1', '0', '启用会员', '', '', '0');
INSERT INTO `tab_menu` VALUES ('137', '133', 'User', 'Oauthadmin', 'index', '', '1', '1', '第三方用户', 'leaf', '', '0');
INSERT INTO `tab_menu` VALUES ('138', '137', 'User', 'Oauthadmin', 'delete', '', '1', '0', '第三方用户解绑', '', '', '0');
INSERT INTO `tab_menu` VALUES ('139', '132', 'User', 'Indexadmin', 'default3', '', '1', '1', '管理组', '', '', '0');
INSERT INTO `tab_menu` VALUES ('140', '139', 'Admin', 'Rbac', 'index', '', '1', '1', '角色管理', '', '', '0');
INSERT INTO `tab_menu` VALUES ('141', '140', 'Admin', 'Rbac', 'member', '', '1', '0', '成员管理', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('142', '140', 'Admin', 'Rbac', 'authorize', '', '1', '0', '权限设置', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('143', '142', 'Admin', 'Rbac', 'authorize_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `tab_menu` VALUES ('144', '140', 'Admin', 'Rbac', 'roleedit', '', '1', '0', '编辑角色', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('145', '144', 'Admin', 'Rbac', 'roleedit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `tab_menu` VALUES ('146', '140', 'Admin', 'Rbac', 'roledelete', '', '1', '1', '删除角色', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('147', '140', 'Admin', 'Rbac', 'roleadd', '', '1', '1', '添加角色', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('148', '147', 'Admin', 'Rbac', 'roleadd_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `tab_menu` VALUES ('149', '139', 'Admin', 'User', 'index', '', '1', '1', '管理员', '', '', '0');
INSERT INTO `tab_menu` VALUES ('150', '149', 'Admin', 'User', 'delete', '', '1', '0', '删除管理员', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('151', '149', 'Admin', 'User', 'edit', '', '1', '0', '管理员编辑', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('152', '151', 'Admin', 'User', 'edit_post', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `tab_menu` VALUES ('153', '149', 'Admin', 'User', 'add', '', '1', '0', '管理员添加', '', '', '1000');
INSERT INTO `tab_menu` VALUES ('154', '153', 'Admin', 'User', 'add_post', '', '1', '0', '添加提交', '', '', '0');
INSERT INTO `tab_menu` VALUES ('155', '47', 'Admin', 'Plugin', 'update', '', '1', '0', '插件更新', '', '', '0');
INSERT INTO `tab_menu` VALUES ('156', '109', 'Admin', 'Storage', 'index', '', '1', '1', '文件存储', '', '', '0');
INSERT INTO `tab_menu` VALUES ('157', '156', 'Admin', 'Storage', 'setting_post', '', '1', '0', '文件存储设置提交', '', '', '0');
INSERT INTO `tab_menu` VALUES ('158', '54', 'Admin', 'Slide', 'ban', '', '1', '0', '禁用幻灯片', '', '', '0');
INSERT INTO `tab_menu` VALUES ('159', '54', 'Admin', 'Slide', 'cancelban', '', '1', '0', '启用幻灯片', '', '', '0');
INSERT INTO `tab_menu` VALUES ('160', '149', 'Admin', 'User', 'ban', '', '1', '0', '禁用管理员', '', '', '0');
INSERT INTO `tab_menu` VALUES ('161', '149', 'Admin', 'User', 'cancelban', '', '1', '0', '启用管理员', '', '', '0');
INSERT INTO `tab_menu` VALUES ('166', '127', 'Admin', 'Mailer', 'test', '', '1', '0', '测试邮件', '', '', '0');
INSERT INTO `tab_menu` VALUES ('167', '109', 'Admin', 'Setting', 'upload', '', '1', '1', '上传设置', '', '', '0');
INSERT INTO `tab_menu` VALUES ('168', '167', 'Admin', 'Setting', 'upload_post', '', '1', '0', '上传设置提交', '', '', '0');
INSERT INTO `tab_menu` VALUES ('169', '7', 'Portal', 'AdminPost', 'copy', '', '1', '0', '文章批量复制', '', '', '0');
INSERT INTO `tab_menu` VALUES ('174', '100', 'Admin', 'Menu', 'backup_menu', '', '1', '0', '备份菜单', '', '', '0');
INSERT INTO `tab_menu` VALUES ('175', '100', 'Admin', 'Menu', 'export_menu_lang', '', '1', '0', '导出后台菜单多语言包', '', '', '0');
INSERT INTO `tab_menu` VALUES ('176', '100', 'Admin', 'Menu', 'restore_menu', '', '1', '0', '还原菜单', '', '', '0');
INSERT INTO `tab_menu` VALUES ('177', '100', 'Admin', 'Menu', 'getactions', '', '1', '0', '导入新菜单', '', '', '0');
INSERT INTO `tab_menu` VALUES ('187', '0', 'bill', 'index', 'index', '', '1', '1', '账单录入', 'file-text-o', '', '0');
INSERT INTO `tab_menu` VALUES ('188', '187', 'bill', 'index', 'pay', '', '1', '1', '支出录入', '', '', '0');
INSERT INTO `tab_menu` VALUES ('189', '187', 'bill', 'index', 'income', '', '1', '1', '缴费录入', '', '', '0');
INSERT INTO `tab_menu` VALUES ('190', '0', 'room', 'index', 'index', '', '1', '1', '室员管理', 'user', '', '0');
INSERT INTO `tab_menu` VALUES ('194', '192', 'Consume', 'index', 'income', '', '1', '1', '缴费查看', '', '', '0');
INSERT INTO `tab_menu` VALUES ('192', '0', 'consume', 'index', 'index', '', '1', '1', '消费管理', 'dollar', '', '0');
INSERT INTO `tab_menu` VALUES ('193', '192', 'Consume', 'index', 'pay', '', '1', '1', '消费查看', '', '', '0');

-- ----------------------------
-- Table structure for tab_message
-- ----------------------------
DROP TABLE IF EXISTS `tab_message`;
CREATE TABLE `tab_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(30) NOT NULL,
  `content` varchar(300) NOT NULL,
  `thumb` int(11) DEFAULT '0',
  `time` datetime NOT NULL,
  `headImg` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_message
-- ----------------------------
INSERT INTO `tab_message` VALUES ('24', '向国平', 'red place', '38', '2017-02-05 12:54:33', 'img/user-img.jpg');
INSERT INTO `tab_message` VALUES ('25', 'ぁ丶X. G. 平つ', '登录成功，开始留言咯', '1', '2017-02-05 14:57:34', 'http://q.qlogo.cn/qqapp/101330327/41DB19D5600BC7C1FF8E0AB981B4F807/100');
INSERT INTO `tab_message` VALUES ('26', '怪人多怪怪', 'nihao a ', '1', '2017-02-05 15:15:19', 'http://tva2.sinaimg.cn/default/images/default_avatar_male_50.gif');
INSERT INTO `tab_message` VALUES ('27', 'asdf', 'nihaoa asfd', '0', '2017-02-05 16:18:09', 'img/user-img.jpg');
INSERT INTO `tab_message` VALUES ('28', '客人', '抢一个沙发', '0', '2017-02-05 17:14:49', 'img/user-img.jpg');
INSERT INTO `tab_message` VALUES ('29', '怪人多怪怪', '嘿嘿，上线咯', '0', '2017-02-07 11:08:53', 'http://tva2.sinaimg.cn/default/images/default_avatar_male_50.gif');
INSERT INTO `tab_message` VALUES ('30', '向国平', '上线第一发', '1', '2017-02-07 11:21:58', 'img/user-img.jpg');
INSERT INTO `tab_message` VALUES ('31', '怪人多怪怪', '你好呀，新的一天', '0', '2017-02-08 11:52:54', 'http://tva2.sinaimg.cn/default/images/default_avatar_male_50.gif');
INSERT INTO `tab_message` VALUES ('32', '怪人多怪怪', '又来一弹幕', '1', '2017-02-14 19:55:44', 'http://tva2.sinaimg.cn/default/images/default_avatar_male_50.gif');
INSERT INTO `tab_message` VALUES ('33', '怪人多怪怪', '又来啦，嘿嘿', '0', '2017-02-20 09:03:04', 'http://tva2.sinaimg.cn/default/images/default_avatar_male_50.gif');
INSERT INTO `tab_message` VALUES ('20', '怪人多怪怪', 'asdfasdf', '12', '2017-02-04 17:38:32', 'http://tva2.sinaimg.cn/default/images/default_avatar_male_50.gif');
INSERT INTO `tab_message` VALUES ('21', '向国平', 'asdfffff', '12', '2017-02-05 11:41:21', 'img/user-img.jpg');
INSERT INTO `tab_message` VALUES ('22', '向国平', '你好，世界', '14', '2017-02-05 12:46:33', 'img/user-img.jpg');
INSERT INTO `tab_message` VALUES ('23', '向国平', '你好，世界', '6', '2017-02-05 12:52:26', 'img/user-img.jpg');
INSERT INTO `tab_message` VALUES ('34', 'xgp', '可以发送邮件咯', '0', '2017-02-22 06:22:23', 'img/user-img.jpg');

-- ----------------------------
-- Table structure for tab_nav
-- ----------------------------
DROP TABLE IF EXISTS `tab_nav`;
CREATE TABLE `tab_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='前台导航表';

-- ----------------------------
-- Records of tab_nav
-- ----------------------------
INSERT INTO `tab_nav` VALUES ('1', '1', '0', '首页', '', 'home', '', '1', '0', '0-1');
INSERT INTO `tab_nav` VALUES ('2', '1', '0', '列表演示', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"1\";}}', '', '1', '0', '0-2');
INSERT INTO `tab_nav` VALUES ('3', '1', '0', '瀑布流', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"2\";}}', '', '1', '0', '0-3');

-- ----------------------------
-- Table structure for tab_nav_cat
-- ----------------------------
DROP TABLE IF EXISTS `tab_nav_cat`;
CREATE TABLE `tab_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否为主菜单，1是，0不是',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='前台导航分类表';

-- ----------------------------
-- Records of tab_nav_cat
-- ----------------------------
INSERT INTO `tab_nav_cat` VALUES ('1', '主导航', '1', '主导航');

-- ----------------------------
-- Table structure for tab_oauth_user
-- ----------------------------
DROP TABLE IF EXISTS `tab_oauth_user`;
CREATE TABLE `tab_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方用户表';

-- ----------------------------
-- Records of tab_oauth_user
-- ----------------------------

-- ----------------------------
-- Table structure for tab_options
-- ----------------------------
DROP TABLE IF EXISTS `tab_options`;
CREATE TABLE `tab_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='全站配置表';

-- ----------------------------
-- Records of tab_options
-- ----------------------------
INSERT INTO `tab_options` VALUES ('1', 'member_email_active', '{\"title\":\"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.thinkcmf.com\\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}', '1');
INSERT INTO `tab_options` VALUES ('6', 'site_options', '            {\n            		\"site_name\":\"点滴网后台管理\",\n            		\"site_host\":\"http://think.cmf.com/\",\n            		\"site_root\":\"\",\n            		\"site_icp\":\"\",\n            		\"site_admin_email\":\"1099223026@qq.com\",\n            		\"site_tongji\":\"\",\n            		\"site_copyright\":\"\",\n            		\"site_seo_title\":\"点滴网后台管理\",\n            		\"site_seo_keywords\":\"ThinkCMF,php,内容管理框架,cmf,cms,简约风, simplewind,framework\",\n            		\"site_seo_description\":\"记录数据，操作数据\"\n        }', '1');

-- ----------------------------
-- Table structure for tab_pay
-- ----------------------------
DROP TABLE IF EXISTS `tab_pay`;
CREATE TABLE `tab_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `money` decimal(5,2) NOT NULL,
  `taker` varchar(10) NOT NULL,
  `quarter` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=114 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tab_pay
-- ----------------------------
INSERT INTO `tab_pay` VALUES ('1', '2015-09-10', '100.00', '李小勇', '1');
INSERT INTO `tab_pay` VALUES ('2', '2015-09-10', '100.00', '吴智薪', '1');
INSERT INTO `tab_pay` VALUES ('3', '2015-09-10', '100.00', '汪玉东', '1');
INSERT INTO `tab_pay` VALUES ('4', '2015-09-10', '100.00', '向国平', '1');
INSERT INTO `tab_pay` VALUES ('5', '2015-09-10', '100.00', '戴渝', '1');
INSERT INTO `tab_pay` VALUES ('6', '2015-09-10', '100.00', '付榆峰', '1');
INSERT INTO `tab_pay` VALUES ('7', '2015-12-15', '50.00', '向国平', '2');
INSERT INTO `tab_pay` VALUES ('8', '2015-12-15', '50.00', '汪玉东', '2');
INSERT INTO `tab_pay` VALUES ('9', '2015-12-15', '50.00', '吴智薪', '2');
INSERT INTO `tab_pay` VALUES ('10', '2015-12-15', '50.00', '李小勇', '2');
INSERT INTO `tab_pay` VALUES ('11', '2015-12-15', '50.00', '戴渝', '2');
INSERT INTO `tab_pay` VALUES ('12', '2015-12-15', '50.00', '付榆峰', '2');
INSERT INTO `tab_pay` VALUES ('13', '2016-03-06', '100.00', '向国平', '3');
INSERT INTO `tab_pay` VALUES ('14', '2016-03-06', '100.00', '汪玉东', '3');
INSERT INTO `tab_pay` VALUES ('15', '2016-03-06', '100.00', '吴智薪', '3');
INSERT INTO `tab_pay` VALUES ('16', '2016-03-06', '100.00', '戴渝', '3');
INSERT INTO `tab_pay` VALUES ('17', '2016-03-06', '100.00', '付榆峰', '3');
INSERT INTO `tab_pay` VALUES ('18', '2016-03-06', '100.00', '李小勇', '3');
INSERT INTO `tab_pay` VALUES ('68', '2016-05-25', '50.00', '向国平', '4');
INSERT INTO `tab_pay` VALUES ('69', '2016-05-25', '50.00', '付榆峰', '4');
INSERT INTO `tab_pay` VALUES ('70', '2016-05-25', '50.00', '汪玉东', '4');
INSERT INTO `tab_pay` VALUES ('71', '2016-05-25', '50.00', '李小勇', '4');
INSERT INTO `tab_pay` VALUES ('72', '2016-06-06', '50.00', '吴智薪', '4');
INSERT INTO `tab_pay` VALUES ('73', '2016-06-12', '50.00', '戴渝', '4');
INSERT INTO `tab_pay` VALUES ('80', '2016-06-15', '50.00', '向国平', '5');
INSERT INTO `tab_pay` VALUES ('81', '2016-06-15', '50.00', '汪玉东', '5');
INSERT INTO `tab_pay` VALUES ('82', '2016-06-15', '50.00', '李晓勇', '5');
INSERT INTO `tab_pay` VALUES ('90', '2016-06-29', '50.00', '付榆峰', '5');
INSERT INTO `tab_pay` VALUES ('91', '2016-06-20', '50.00', '吴智薪', '5');
INSERT INTO `tab_pay` VALUES ('92', '2016-06-21', '50.00', '戴渝', '5');
INSERT INTO `tab_pay` VALUES ('93', '2016-09-18', '50.00', '向国平', '6');
INSERT INTO `tab_pay` VALUES ('94', '2016-09-21', '50.00', '戴渝', '6');
INSERT INTO `tab_pay` VALUES ('95', '2016-09-18', '50.00', '付榆峰', '6');
INSERT INTO `tab_pay` VALUES ('96', '2016-09-18', '50.00', '汪玉东', '6');
INSERT INTO `tab_pay` VALUES ('97', '2016-09-21', '50.00', '李小勇', '6');
INSERT INTO `tab_pay` VALUES ('98', '2016-09-21', '50.00', '吴智薪', '6');
INSERT INTO `tab_pay` VALUES ('99', '2016-12-18', '50.00', '戴渝', '7');
INSERT INTO `tab_pay` VALUES ('105', '2016-12-18', '50.00', '向国平', '7');
INSERT INTO `tab_pay` VALUES ('106', '2016-12-20', '50.00', '汪玉东', '7');
INSERT INTO `tab_pay` VALUES ('107', '2016-12-28', '50.00', '付榆峰', '7');
INSERT INTO `tab_pay` VALUES ('108', '2017-02-18', '50.00', '吴智薪', '7');
INSERT INTO `tab_pay` VALUES ('109', '2017-02-18', '50.00', '李小勇', '7');
INSERT INTO `tab_pay` VALUES ('112', '2017-03-24', '50.00', '李小勇', '8');
INSERT INTO `tab_pay` VALUES ('113', '2017-03-24', '50.00', '向国平', '8');

-- ----------------------------
-- Table structure for tab_plugins
-- ----------------------------
DROP TABLE IF EXISTS `tab_plugins`;
CREATE TABLE `tab_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of tab_plugins
-- ----------------------------

-- ----------------------------
-- Table structure for tab_posts
-- ----------------------------
DROP TABLE IF EXISTS `tab_posts`;
CREATE TABLE `tab_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` date DEFAULT '2000-01-01' COMMENT 'post发布日期',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核,3删除',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT '1' COMMENT 'post类型，1文章,2页面',
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Portal文章表';

-- ----------------------------
-- Records of tab_posts
-- ----------------------------
INSERT INTO `tab_posts` VALUES ('8', '1', 'coreseek搜索技术', '无', '2017-04-17', '<p>从coreseek4.1开始就可以用实时索引（rt）生产环境了，在这之前的版本的话，大部分都是用的“全索引+增量索引”来完成实时索引的。此站不涉及商业用途，对实时更新的要求不是很高，所以就才用定时重建索引的方法来完成实时的需求。</p><p><br/></p><p><strong>配置环境：</strong>lamp+centos2.6.32-504.30.3.el6.x86_64</p><p><span style=\"color: rgb(97, 97, 103); font-family: Georgia, &quot;Xin Gothic&quot;, &quot;Hiragino Sans GB&quot;, &quot;Droid Sans Fallback&quot;, &quot;Microsoft YaHei&quot;, sans-serif; background-color: rgb(255, 255, 255);\"><br/></span></p><p><strong># 开机启动coreseek服务</strong></p><p>[root@E coreseek]# vi /etc/rc.local&nbsp;# 编辑rc.local文件</p><p><strong># 增加内容&nbsp;</strong></p><p>/usr/local/coreseek/bin/searchd –-config /usr/local/coreseek/etc/csft.conf --pidfile /usr/local/coreseek/var/log/searchd.pid</p><p><br/></p><p><strong># 半个小时重建索引 如果你的目录下没有build_index.sh文件，请不要担心，它可能是隐藏的</strong></p><p>[root@E coreseek]# vi /usr/local/coreseek/bin/build_index.sh</p><p><strong># 增加内容</strong>&nbsp;</p><p>/usr/local/coreseek/bin/indexer -c /usr/local/coreseek/etc/csft.conf --rotate --all --quiet</p><p><br/></p><p><strong># 修改build_index.sh文件的执行权限</strong></p><p>[root@E coreseek]# chmod +x /usr/local/coreseek/bin/build_index.sh</p><p><br/></p><p><strong># 修改crontab</strong></p><p>[root@E coreseek]# crontab -e</p><p><strong># 增加内容</strong></p><p>*/30 * * * * /bin/bash /usr/local/coreseek/bin/build_index.sh</p><p><br/></p><p><span style=\"color: rgb(255, 0, 0);\">*注：&quot;[root@E&nbsp;coreseek]#&quot;是虚构的，真是机器上并不是这样的目录。</span></p><p><br/></p>', 'coreseek定时重建索引', '从coreseek4.1开始就可以用实时索引（rt）生产环境了，在这之前的版本的话，大部分都是用的“全索引+增量索引”来完成实时索引的。此站不涉及商业用途，对实时更新的要求不是很高，所以就才用定时重建索引的方法来完成实时的需求...', '1', '1', '2017-04-17 11:03:34', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/www.donep.cn\\/blog_back\\/data\\/upload\\/portal\\/\\/20170417\\/58f4301daec36.jpg\",\"alt\":\"bc30a3fb2975fdd190085809b64586fe92efc64817fda-EjCuzw_fw658.jpg\"}]}', '0', '0', '1', '1');
INSERT INTO `tab_posts` VALUES ('9', '2', 'web html css', '原创', '2017-04-17', '<p><strong>一、Html标签</strong></p><p>（1）Html的标签分为块级标签和非块级标签，其中又有语义化标签和非语义化标签。</p><p style=\"margin-top: 5px;\">（2）双标签&lt;p&gt;&lt;/p&gt;</p><p style=\"margin-top: 5px;\">（3）单标签&lt;img/&gt;</p><p style=\"margin-top: 5px;\">（4）元素标签&lt;meta&gt;</p><p style=\"margin-top: 5px;\"><br/></p><p style=\"margin-top: 5px;\"><strong>二、元素分类</strong></p><p style=\"margin-top: 5px;\">（1）行内元素：不能设置宽高和上下边界</p><p style=\"margin-top: 5px;\">（2）块级元素：独占一行或多行，上下间距塌陷（小的间距被大的间距包含）。</p><p style=\"margin-top: 5px;\">（3）行块元素：前后可以有元素，也可以设置宽高，并且默认有左右边界。</p><p style=\"margin-top: 5px;\"><br/></p><p style=\"margin-top: 5px;\"><strong>三、表单：&lt;form method = &quot;get/post&quot; action = &quot;&quot;&gt;</strong></p><p style=\"margin-top: 5px;\">get:信息附在地址栏</p><p style=\"margin-top: 5px;\">post:封装成包</p><p style=\"margin-top: 5px;\">action:负责接收的文件</p><p style=\"margin-top: 5px;\"><br/></p><p style=\"margin-top: 5px;\"><strong>四、选择器</strong></p><p style=\"margin-top: 5px;\">（1）标签选择器：p{ &nbsp; }</p><p style=\"margin-top: 5px;\">（2）类选择器: .class{&nbsp;&nbsp;&nbsp;&nbsp;}</p><p style=\"margin-top: 5px;\">（3）id选择器: #id{&nbsp;&nbsp;&nbsp;&nbsp;}</p><p style=\"margin-top: 5px;\">（4）子选择器:只能选择当前类下一级标签。 .food &gt; li</p><p style=\"margin-top: 5px;\">（5）后代选择器: 可选择类后面所有的后代。 .first span</p><p style=\"margin-top: 5px;\">（6）通用选择器: *{&nbsp;&nbsp;&nbsp;&nbsp;}</p><p style=\"margin-top: 5px;\">（7）伪类选择器:与类不同，它是一种行为。 a:hover</p><p style=\"margin-top: 5px;\"><br/></p>', 'Web入门第一课', '一、Html标签\r\n（1）Html的标签分为块级标签和非块级标签，其中又有语义化标签和非语义化标签。\r\n（2）双标签&lt;p&gt;&lt;/p&gt;\r\n（3）单标签&lt;img/&gt;\r\n（4）元素标签&lt;meta&gt;...', '1', '1', '2017-04-17 18:01:11', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\",\"photo\":[{\"url\":\"http://www.donep.cn/blog_back/data/upload/portal/\\/20170417\\/58f491bad6701.png\",\"alt\":\"T)3%%~@[HP}2_RLXGOG3{RC.png\"}]}', '0', '0', '1', '1');
INSERT INTO `tab_posts` VALUES ('6', '1', '环境搭建', '已经过验证', '2017-04-08', '<p>博客系统后面会有很多的博文，为方便搜索，想通过sphinx全文搜索引擎来提高文章的搜索速度，coreseek是基于sphinx开发的，特别是coreseek的中文分词，要比sphinx本身的强大一些；sphinx只支持mysql数据源，而coreseek支持更多。<br/></p><p><br/></p><p><strong>配置环境：</strong>lamp+centos2.6.32-504.30.3.el6.x86_64</p><p><br/></p><p><span style=\"color: rgb(68, 68, 68); font-family: Simsun; font-size: 14px;\"></span></p><p style=\"line-height: 1.75em;\"><strong># 安装依赖包</strong></p><p style=\"line-height: 1.75em;\">[root@E sphinx]# yum install make gcc g++ gcc-c++ libtool autoconf automake imake mysql-devel libxml2-devel expat-devel</p><p><br/></p><p style=\"line-height: 1.75em;\">#在百度云盘下载资源：&nbsp;<a href=\"http://pan.baidu.com/share/link?shareid=1802381382&uk=1829018343&fid=936699396\" target=\"_blank\" style=\"white-space: normal;\">coreseek4.1</a></p><p><br/></p><p style=\"line-height: 1.75em;\"><strong># 解压缩</strong></p><p style=\"line-height: 1.75em;\">[root@E sphinx]# tar zxvf coreseek-4.1-beta.tar.gz</p><p><br/></p><p style=\"line-height: 1.75em;\"><strong># 安装mmseg</strong></p><p style=\"line-height: 1.75em;\">[root@E sphinx]# cd coreseek-4.1-beta/mmseg-3.2.14/</p><p style=\"line-height: 1.75em;\"><strong># 测试系统是否满足安装</strong></p><p style=\"line-height: 1.75em;\">[root@E mmseg-3.2.14]# ./bootstrap &nbsp;&nbsp;&nbsp;&nbsp;# 出现-bash: ./bootstrap: Permission denied &nbsp;解决办法：chmod +x bootstrap</p><p style=\"line-height: 1.75em;\"><strong># 执行配置检测</strong></p><p style=\"line-height: 1.75em;\">[root@E mmseg-3.2.14]# ./configure --prefix=/usr/local/mmseg3</p><p style=\"line-height: 1.75em;\">[root@E mmseg-3.2.14]# make &amp;&amp; make install</p><p style=\"line-height: 1.75em;\">[root@E mmseg-3.2.14]# cd ..</p><p><br/></p><p style=\"line-height: 1.75em;\"><strong># 安装coreseek</strong></p><p style=\"line-height: 1.75em;\">[root@E coreseek-4.1-beta]# cd csft-4.1/</p><p style=\"line-height: 1.75em;\">[root@E csft-4.1]# sh buildconf.sh # 输出的warning信息可以忽略，如果出现error则需要解决</p><p style=\"line-height: 1.75em;\">[root@E csft-4.1]# ./configure --prefix=/usr/local/coreseek --without-unixodbc --with-mmseg --with-mmseg-includes=/usr/local/mmseg3/include/mmseg/ --with-mmseg-libs=/usr/local/mmseg3/lib/ --with-mysql</p><p style=\"line-height: 1.75em;\">[root@E csft-4.1]# make &amp;&amp; make install</p><p style=\"line-height: 1.75em;\">[root@E csft-4.1]# cd ..</p><p style=\"line-height: 1.75em;\"><br/></p><p><strong># 测试mmseg分词</strong></p><p>[root@E coreseek-4.1-beta]# cd testpack/</p><p>[root@E testpack]# cat var/test/test.xml #此时应该正确显示中文</p><p><br/></p><p><strong># mmseg程序 -d 词库目录 指定数据源</strong></p><p>[root@E testpack]# /usr/local/mmseg3/bin/mmseg -d /usr/local/mmseg3/etc var/test/test.xml</p><p><br/></p><p><strong># 创建索引</strong></p><p>[root@E testpack]# /usr/local/coreseek/bin/indexer -c etc/csft.conf --all #也可以进入目录./indexer --all</p><p><br/></p><p><strong># 执行搜索测试</strong></p><p>[root@E testpack]# /usr/local/coreseek/bin/search -c etc/csft.conf 网络搜索 #也能进入目录./search 网络搜索</p><p><br/></p><p><strong># 测试成功</strong></p><p>Coreseek Fulltext 4.1 [ Sphinx 2.0.2-dev (r2922)]</p><p>Copyright (c) 2007-2011,</p><p>Beijing Choice Software Technologies Inc (http://www.coreseek.com)</p><p>&nbsp;using config file &#39;etc/csft.conf&#39;...</p><p>index &#39;xml&#39;: query &#39;网络搜索 &#39;: returned 1 matches of 1 total in 0.000 sec</p><p>displaying matches:</p><ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p>document=1, weight=1590, published=Thu Apr 1 22:20:07 2010, author_id=1</p></li></ol><p><br/></p><p><strong># 配置csft.conf文件</strong></p><p>详情参考官方文档&nbsp;<a href=\"http://www.coreseek.cn/docs/coreseek_4.1-sphinx_2.0.1-beta.html\" target=\"_blank\">coreseek4.1</a><br/></p><p><br/></p><p>#以下操作可以查询资料，下面不一定准确</p><p><strong># 下载php扩展</strong></p><p>php &nbsp;<a href=\"http://pecl.php.net/package/sphinx\" target=\"_blank\">sphinx扩展下载</a></p><p><br/></p><p><strong># libsphinxclient 安装（PHP模块需要）</strong></p><p>[root@...]# cd /var/install/coreseek-4.1-beta/csft-4.1/api/libsphinxclient/</p><p>[root@...]#&nbsp;./configure --with-php-config=/usr/bin/php-config --with-sphinx=/usr/local/sphinx/</p><p>&nbsp; &nbsp; extension=&quot;/usr/local/php/lib/php/extensions/no-debug-zts-20131226/sphinx.so&quot;;&nbsp;</p><p><span style=\"color: rgb(68, 68, 68); font-family: Simsun; font-size: 14px;\"></span>[root@...]#&nbsp;make &amp;&amp; make install</p><p><br/></p><p><strong># 安装php拓展</strong></p><p>[root@...]# cd /usr/local/src/sphinx-1.2.0</p><p>[root@...]#&nbsp;/usr/local/php/bin/phpize</p><p>[root@...]#&nbsp;./configure --with-php-config=/usr/local/php/bin/php-config --with-sphinx</p><p>[root@...]#&nbsp;make &amp;&amp; make install<br/></p><p><br/></p><p><strong># 修改php.ini配置文件&nbsp;</strong><a href=\"http://\" _src=\"http://\"></a></p><p>#添加配置项</p><p>extension=&quot;sphinx.so&quot;; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; extension=&quot;/usr/local/php/lib/php/extensions/no-debug-zts-20131226/sphinx.so&quot;;</p><p><br/></p>', 'coreseek4.1-beta/sphinx2.0.1环境搭建', '博客系统后面会有很多的博文，为方便搜索，想通过sphinx全文搜索引擎来提高文章的搜索速度，coreseek是基于sphinx开发的，特别是coreseek的中文分词，要比sphinx本身的强大一些；sphinx只支持mysql数据源，而coreseek支持更多...', '1', '1', '2017-04-17 11:03:49', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/www.donep.cn\\/blog_back\\/data\\/upload\\/portal\\/\\/20170416\\/58f2d0c9dd0b2.jpg\",\"alt\":\"sphinx_install.jpg\"}]}', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for tab_role
-- ----------------------------
DROP TABLE IF EXISTS `tab_role`;
CREATE TABLE `tab_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of tab_role
-- ----------------------------
INSERT INTO `tab_role` VALUES ('1', '超级管理员', '0', '1', '拥有网站最高管理员权限！', '1329633709', '1329633709', '0');

-- ----------------------------
-- Table structure for tab_role_user
-- ----------------------------
DROP TABLE IF EXISTS `tab_role_user`;
CREATE TABLE `tab_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of tab_role_user
-- ----------------------------
INSERT INTO `tab_role_user` VALUES ('1', '2');

-- ----------------------------
-- Table structure for tab_route
-- ----------------------------
DROP TABLE IF EXISTS `tab_route`;
CREATE TABLE `tab_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='url路由表';

-- ----------------------------
-- Records of tab_route
-- ----------------------------

-- ----------------------------
-- Table structure for tab_slide
-- ----------------------------
DROP TABLE IF EXISTS `tab_slide`;
CREATE TABLE `tab_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

-- ----------------------------
-- Records of tab_slide
-- ----------------------------

-- ----------------------------
-- Table structure for tab_slide_cat
-- ----------------------------
DROP TABLE IF EXISTS `tab_slide_cat`;
CREATE TABLE `tab_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片分类表';

-- ----------------------------
-- Records of tab_slide_cat
-- ----------------------------

-- ----------------------------
-- Table structure for tab_term_relationships
-- ----------------------------
DROP TABLE IF EXISTS `tab_term_relationships`;
CREATE TABLE `tab_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类对应表';

-- ----------------------------
-- Records of tab_term_relationships
-- ----------------------------
INSERT INTO `tab_term_relationships` VALUES ('14', '6', '8', '0', '1');
INSERT INTO `tab_term_relationships` VALUES ('16', '8', '8', '0', '1');
INSERT INTO `tab_term_relationships` VALUES ('17', '9', '9', '0', '1');

-- ----------------------------
-- Table structure for tab_terms
-- ----------------------------
DROP TABLE IF EXISTS `tab_terms`;
CREATE TABLE `tab_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类表';

-- ----------------------------
-- Records of tab_terms
-- ----------------------------
INSERT INTO `tab_terms` VALUES ('9', 'Web前端', '', 'article', '', '0', '0', '0-9', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `tab_terms` VALUES ('8', 'coreseek/sphinx', '', 'article', '全文搜索引擎', '0', '0', '0-8', '', '', '', 'list', 'article', '0', '1');

-- ----------------------------
-- Table structure for tab_user
-- ----------------------------
DROP TABLE IF EXISTS `tab_user`;
CREATE TABLE `tab_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) DEFAULT NULL,
  `isadmini` int(1) DEFAULT '0',
  `email` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tab_user
-- ----------------------------
INSERT INTO `tab_user` VALUES ('93', '向国平', '1', '1099223026@qq.com', '$2y$13$JsEplb8rDOO5umNdiqNun.BgaStTcEpSwxM6KmqDVCo8R6lfZeM/q');
INSERT INTO `tab_user` VALUES ('2', '吴智薪', '0', '1192247166@qq.com', '$2y$13$kM6pR7QuqNtlDDCIZmK77e4nVt435UdEnbeuqvjHM/YovwAyuqpJ.');
INSERT INTO `tab_user` VALUES ('4', '汪玉东', '0', '1028711909@qq.com', '$2y$13$46iBEpQ4lv6XrXjqb5grheJlitxIHWsrg.xOTEm0wq55igx.73EJi');
INSERT INTO `tab_user` VALUES ('5', '戴渝', '0', '269797032@qq.com', '$2y$13$PIXY3dT0nj55upLaRfQMpuI8ANHv0NIfRRBEeCVBxp1cXkxxpoNtm');
INSERT INTO `tab_user` VALUES ('6', '付榆峰', '0', '632844050@qq.com', '$2y$13$o1JH3pPPxidsnYpVwgy1wuGckTZa/6dbzYOTP/yDB39ca2m476Si2');
INSERT INTO `tab_user` VALUES ('95', '李小勇', '0', '1505087161@qq.com', '$2y$13$JsEplb8rDOO5umNdiqNun.BgaStTcEpSwxM6KmqDVCo8R6lfZeM/q');

-- ----------------------------
-- Table structure for tab_user_favorites
-- ----------------------------
DROP TABLE IF EXISTS `tab_user_favorites`;
CREATE TABLE `tab_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户收藏表';

-- ----------------------------
-- Records of tab_user_favorites
-- ----------------------------
INSERT INTO `tab_user_favorites` VALUES ('1', '1', '特', '/index.php?g=portal&amp;m=article&amp;a=index&amp;id=2&amp;cid=2', null, 'posts', '2', '1491360848');

-- ----------------------------
-- Table structure for tab_users
-- ----------------------------
DROP TABLE IF EXISTS `tab_users`;
CREATE TABLE `tab_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT '2000-01-01' COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of tab_users
-- ----------------------------
INSERT INTO `tab_users` VALUES ('1', 'admin', '###1d156556d37b034eb8752155285e92b6', 'admin', '1099223026@qq.com', '', null, '0', '2000-01-01', null, '221.7.82.195', '2017-04-17 16:38:46', '2017-03-14 05:51:31', '', '1', '0', '1', '0', '');
INSERT INTO `tab_users` VALUES ('2', '半粒糖', '###a832fc886be8c318cf34b737c64ef4d8', '半粒糖', '956168162@qq.com', '', null, '0', '2000-01-01', null, '221.7.82.195', '2017-04-17 17:18:42', '2017-04-17 16:43:34', '', '1', '0', '1', '0', '');

-- ----------------------------
-- View structure for v_article_mesh
-- ----------------------------
DROP VIEW IF EXISTS `v_article_mesh`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_article_mesh` AS select `v_article_term`.`id` AS `id`,group_concat(`v_article_term`.`name` separator ',') AS `name`,`v_article_term`.`post_keywords` AS `post_keywords`,`v_article_term`.`post_source` AS `post_source`,`v_article_term`.`post_date` AS `post_date`,`v_article_term`.`post_content` AS `post_content`,`v_article_term`.`post_excerpt` AS `post_excerpt`,`v_article_term`.`post_title` AS `post_title`,`v_article_term`.`recommended` AS `recommended`,`v_article_term`.`smeta` AS `smeta` from `v_article_term` group by `v_article_term`.`id` ;

-- ----------------------------
-- View structure for v_article_term
-- ----------------------------
DROP VIEW IF EXISTS `v_article_term`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_article_term` AS select `tab_posts`.`id` AS `id`,`tab_posts`.`post_keywords` AS `post_keywords`,`tab_posts`.`post_source` AS `post_source`,`tab_posts`.`post_date` AS `post_date`,`tab_posts`.`post_content` AS `post_content`,`tab_posts`.`post_excerpt` AS `post_excerpt`,`tab_posts`.`smeta` AS `smeta`,`tab_posts`.`post_title` AS `post_title`,`tab_posts`.`recommended` AS `recommended`,`tab_terms`.`name` AS `name` from ((`tab_terms` join `tab_posts`) join `tab_term_relationships`) where ((`tab_posts`.`id` = `tab_term_relationships`.`object_id`) and (`tab_terms`.`term_id` = `tab_term_relationships`.`term_id`)) ;

-- ----------------------------
-- Procedure structure for p_replace_article_mesh
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_replace_article_mesh`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `p_replace_article_mesh`()
BEGIN

# 定义视图是否存在变量
DECLARE is_exist int;

# 利用into为变量赋值
select count(information_schema.VIEWS.TABLE_SCHEMA) into is_exist from information_schema.VIEWS 
where information_schema.VIEWS.TABLE_NAME='v_article_mesh' and (information_schema.VIEWS.TABLE_SCHEMA='diandi');

# 调用p_replace_article_smeta来完成图片地址的重写
CALL p_replace_article_smeta;


# is_exist=1数据库中已经存在 v_article_mesh 视图， is_exist=0尚不存在
IF is_exist THEN

	# 视图存在，更新视图
	CREATE OR REPLACE VIEW v_article_mesh AS SELECT id,GROUP_CONCAT( `name` ) AS `name`,post_keywords,
	post_source,post_date, post_content, post_excerpt, post_title,recommended,smeta 

	FROM v_article_term GROUP BY id;
ELSE

	# 视图不存在，建立视图，保存 v_article_term 表合并后的记录
	CREATE VIEW v_article_mesh AS SELECT id,GROUP_CONCAT( `name` ) AS `name`,post_keywords,post_source,
	post_date, post_content, post_excerpt, post_title,recommended,smeta 
	FROM v_article_term GROUP BY id;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_replace_article_smeta
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_replace_article_smeta`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `p_replace_article_smeta`()
BEGIN

# 找到了不满足条件的字段--正则替换--增加前缀
	UPDATE v_article_term SET v_article_term.smeta = REPLACE(v_article_term.smeta,
	'portal','http://www.donep.cn/blog_back/data/upload/portal/')
	WHERE smeta NOT REGEXP '.*photo.*http:';

END
;;
DELIMITER ;
SET FOREIGN_KEY_CHECKS=1;
