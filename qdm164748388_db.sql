/*
Navicat MySQL Data Transfer

Source Server         : qdm164748388.my3w
Source Server Version : 50148
Source Host           : qdm164748388.my3w.com:3306
Source Database       : qdm164748388_db

Target Server Type    : MYSQL
Target Server Version : 50148
File Encoding         : 65001

Date: 2017-03-14 16:15:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for daypicture
-- ----------------------------
DROP TABLE IF EXISTS `daypicture`;
CREATE TABLE `daypicture` (
  `pid` int(8) NOT NULL,
  `ristTime` datetime DEFAULT NULL,
  KEY `pid` (`pid`),
  CONSTRAINT `daypicture_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `picture` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of daypicture
-- ----------------------------

-- ----------------------------
-- Table structure for genre
-- ----------------------------
DROP TABLE IF EXISTS `genre`;
CREATE TABLE `genre` (
  `gid` int(8) NOT NULL AUTO_INCREMENT,
  `gname` varchar(30) DEFAULT '0',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of genre
-- ----------------------------
INSERT INTO `genre` VALUES ('1', '');
INSERT INTO `genre` VALUES ('2', '影视明星');
INSERT INTO `genre` VALUES ('3', '风光风景');
INSERT INTO `genre` VALUES ('4', '花卉植物');
INSERT INTO `genre` VALUES ('5', '动物宠物');
INSERT INTO `genre` VALUES ('6', '魅力女性');
INSERT INTO `genre` VALUES ('7', '游戏CG');
INSERT INTO `genre` VALUES ('8', '卡通动漫');
INSERT INTO `genre` VALUES ('9', '机车世界');
INSERT INTO `genre` VALUES ('10', '炫彩美图');
INSERT INTO `genre` VALUES ('11', '品牌欣赏');
INSERT INTO `genre` VALUES ('12', '美食天下');
INSERT INTO `genre` VALUES ('13', '影视剧集');
INSERT INTO `genre` VALUES ('14', '美丽文字');
INSERT INTO `genre` VALUES ('15', '体育运动');
INSERT INTO `genre` VALUES ('16', '艺术设计');
INSERT INTO `genre` VALUES ('17', '节庆假日');
INSERT INTO `genre` VALUES ('18', '军事战争');
INSERT INTO `genre` VALUES ('19', '美图杂烩');

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `pid` int(8) NOT NULL AUTO_INCREMENT,
  `sid` int(8) DEFAULT '1',
  `gid` int(8) DEFAULT '1',
  `pdepict` varchar(100) NOT NULL,
  `url` varchar(50) NOT NULL,
  `downloadNum` int(5) DEFAULT '0',
  `collectNum` int(5) DEFAULT '0',
  PRIMARY KEY (`pid`),
  KEY `sid` (`sid`),
  KEY `gid` (`gid`),
  CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `special` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `picture_ibfk_2` FOREIGN KEY (`gid`) REFERENCES `genre` (`gid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES ('1', '2', '1', '大海/沙滩/蓝天/蓝色', 'http://www.723website.top/IMG/336608-106.jpg', '0', '100');
INSERT INTO `picture` VALUES ('2', '2', '1', '唯美的花朵/棕色', 'http://www.723website.top/IMG/335741-106.jpg', '0', '34');
INSERT INTO `picture` VALUES ('3', '2', '1', '花/绿色/红色', 'http://www.723website.top/IMG/336076-106.jpg', '0', '23');
INSERT INTO `picture` VALUES ('4', '2', '1', '大海/房子/蓝色', 'http://www.723website.top/IMG/336687-106.jpg', '0', '90');
INSERT INTO `picture` VALUES ('5', '2', '1', '晚霞/船只/海岸', 'http://www.723website.top/IMG/336594-106.jpg', '0', '8');
INSERT INTO `picture` VALUES ('6', '2', '1', '森林/湖面/蓝色', 'http://www.723website.top/IMG/336936-106.jpg', '0', '66');
INSERT INTO `picture` VALUES ('7', '2', '1', '雪山/蓝色/白色', 'http://www.723website.top/IMG/336582-106.jpg', '0', '78');
INSERT INTO `picture` VALUES ('8', '2', '1', '森林/绿色/湖面', 'http://www.723website.top/IMG/336941-106.jpg', '0', '37');
INSERT INTO `picture` VALUES ('9', '2', '1', '美女/西瓜/夏天', 'http://www.723website.top/IMG/336502-106.jpg', '0', '47');
INSERT INTO `picture` VALUES ('10', '2', '1', '白色的玫瑰/白色', 'http://www.723website.top/IMG/336183-106.jpg', '0', '28');
INSERT INTO `picture` VALUES ('11', '2', '1', '美女/墨镜/牛仔/蓝色', 'http://www.723website.top/IMG/336513-106.jpg', '0', '19');
INSERT INTO `picture` VALUES ('12', '2', '1', '雪山/白云/晚霞', 'http://www.723website.top/IMG/336585-106.jpg', '0', '98');
INSERT INTO `picture` VALUES ('13', '2', '1', '绿意盎然/清新/绿色', 'http://www.723website.top/IMG/336942-106.jpg', '0', '97');
INSERT INTO `picture` VALUES ('14', '2', '1', '小清新', 'http://www.723website.top/IMG/336774-106.jpg', '0', '91');
INSERT INTO `picture` VALUES ('15', '2', '1', '小清新美女/棕色', 'http://www.723website.top/IMG/336469-106.jpg', '0', '48');
INSERT INTO `picture` VALUES ('16', '2', '1', '性感美女/黑色', 'http://www.723website.top/IMG/336723-106.jpg', '0', '29');
INSERT INTO `picture` VALUES ('17', '2', '1', '小清新蒙面美女/唯美美女', 'http://www.723website.top/IMG/336454-106.jpg', '0', '180');
INSERT INTO `picture` VALUES ('18', '2', '1', '小清新美女/白色/绿色', 'http://www.723website.top/IMG/336727-106.jpg', '0', '177');
INSERT INTO `picture` VALUES ('19', '2', '1', '大山/蓝天白云/风景', 'http://www.723website.top/IMG/336575-106.jpg', '0', '31');
INSERT INTO `picture` VALUES ('20', '2', '1', '风景/灯塔/蓝色', 'http://www.723website.top/IMG/336604-106.jpg', '0', '76');
INSERT INTO `picture` VALUES ('21', '2', '1', '小清新/长腿/蕾丝/白色', 'http://www.723website.top/IMG/336498-106.jpg', '0', '53');
INSERT INTO `picture` VALUES ('22', '2', '1', '唯美风景/码头', 'http://www.723website.top/IMG/336595-106.jpg', '0', '34');
INSERT INTO `picture` VALUES ('23', '2', '1', '小清新美女/模糊美女', 'http://www.723website.top/IMG/336390-106.jpg', '0', '22');
INSERT INTO `picture` VALUES ('24', '2', '1', '晚霞/沙滩', 'http://www.723website.top/IMG/336598-106.jpg', '0', '56');
INSERT INTO `picture` VALUES ('25', '2', '1', '大海/白云/蓝色', 'http://www.723website.top/IMG/336602-106.jpg', '0', '43');
INSERT INTO `picture` VALUES ('26', '2', '1', '小猫咪/黑色', 'http://www.723website.top/IMG/337039-106.jpg', '0', '45');
INSERT INTO `picture` VALUES ('27', '2', '1', '小清新帽子美女', 'http://www.723website.top/IMG/336426-106.jpg', '0', '43');
INSERT INTO `picture` VALUES ('28', '2', '1', '小清新西瓜美女', 'http://www.723website.top/IMG/336374-106.jpg', '0', '23');
INSERT INTO `picture` VALUES ('29', '2', '1', '猴子/棕树', 'http://www.723website.top/IMG/337076-106.jpg', '0', '67');
INSERT INTO `picture` VALUES ('30', '2', '1', '高楼大厦/都市/蓝色', 'http://www.723website.top/IMG/337203-106.jpg', '0', '23');
INSERT INTO `picture` VALUES ('31', '2', '1', '帽子/小清新美女', 'http://www.723website.top/IMG/336428-106.jpg', '0', '55');
INSERT INTO `picture` VALUES ('32', '2', '1', '小鸟/树枝', 'http://www.723website.top/IMG/336788-106.jpg', '0', '22');
INSERT INTO `picture` VALUES ('33', '2', '1', '小清新/帽子/美女', 'http://www.723website.top/IMG/336421-106.jpg', '0', '89');
INSERT INTO `picture` VALUES ('34', '2', '1', '晚霞/雪山/蓝色', 'http://www.723website.top/IMG/336578-106.jpg', '0', '54');
INSERT INTO `picture` VALUES ('35', '2', '1', '草原/狐狸/棕色', 'http://www.723website.top/IMG/336816-106.jpg', '0', '23');
INSERT INTO `picture` VALUES ('36', '2', '1', '树叶/白天/小清新/绿色', 'http://www.723website.top/IMG/336696-106.jpg', '0', '11');
INSERT INTO `picture` VALUES ('37', '2', '1', '肥胖的小猫咪/白色', 'http://www.723website.top/IMG/336620-106.jpg', '0', '56');
INSERT INTO `picture` VALUES ('38', '2', '1', '池塘/荷花/荷叶', 'http://www.723website.top/IMG/336242-106.jpg', '0', '23');
INSERT INTO `picture` VALUES ('39', '2', '1', '小鸟站在枝头上/绿色', 'http://www.723website.top/IMG/336888-106.jpg', '0', '16');
INSERT INTO `picture` VALUES ('40', '2', '1', '荷花/黑色', 'http://www.723website.top/IMG/336257-106.jpg', '0', '121');
INSERT INTO `picture` VALUES ('41', '2', '1', '花朵/霓虹灯/红色', 'http://www.723website.top/IMG/336836-106.jpg', '0', '124');
INSERT INTO `picture` VALUES ('42', '2', '1', '小清新/长腿/美女', 'http://www.723website.top/IMG/336487-106.jpg', '0', '56');
INSERT INTO `picture` VALUES ('43', '2', '1', '外国建筑/时钟/天空/异域风情', 'http://www.723website.top/IMG/337201-106.jpg', '0', '43');
INSERT INTO `picture` VALUES ('44', '2', '1', '小清新美女人物头像/蓝色', 'http://www.723website.top/IMG/336380-106.jpg', '0', '64');
INSERT INTO `picture` VALUES ('45', '2', '1', '唯美的小鸟站在石头上', 'http://www.723website.top/IMG/337069-106.jpg', '0', '67');
INSERT INTO `picture` VALUES ('46', '2', '1', '晚安/动漫/芥末绿', 'http://www.723website.top/IMG/337021-106.jpg', '0', '23');
INSERT INTO `picture` VALUES ('47', '2', '1', '狐狸/大雪/守望/白色', 'http://www.723website.top/IMG/336811-106.jpg', '0', '86');
INSERT INTO `picture` VALUES ('48', '2', '1', '大头鸟', 'http://www.723website.top/IMG/336877-106.jpg', '0', '84');
INSERT INTO `picture` VALUES ('49', '2', '1', '樱花树/蓝天/蓝色', 'http://www.723website.top/IMG/336938-106.jpg', '0', '90');
INSERT INTO `picture` VALUES ('50', '2', '1', '蓝天/异域风情/白云/蓝色', 'http://www.723website.top/IMG/337148-106.jpg', '0', '45');
INSERT INTO `picture` VALUES ('51', '2', '1', '异域风情/房屋/绿色', 'http://www.723website.top/IMG/337200-106.jpg', '0', '334');
INSERT INTO `picture` VALUES ('52', '2', '1', '小清新/唯美/植物', 'http://www.723website.top/IMG/336695-106.jpg', '0', '442');
INSERT INTO `picture` VALUES ('53', '1', '6', '小清新/唯美/美女/椅子', 'http://www.723website.top/IMG/335853-106.jpg', '0', '234');
INSERT INTO `picture` VALUES ('54', '1', '6', '小清新/唯美/美女/长发', 'http://www.723website.top/IMG/281098-106.jpg', '0', '267');
INSERT INTO `picture` VALUES ('55', '1', '6', '汽车/美女', 'http://www.723website.top/IMG/288958-106.jpg', '0', '473');
INSERT INTO `picture` VALUES ('56', '1', '6', '唯美/美女/黑色', 'http://www.723website.top/IMG/314943-106.jpg', '0', '358');
INSERT INTO `picture` VALUES ('57', '1', '6', '性感/美女', 'http://www.723website.top/IMG/34569-106.jpg', '0', '135');
INSERT INTO `picture` VALUES ('58', '1', '6', '高圆圆/明星/唯美/美女/夜色', 'http://www.723website.top/IMG/43371-106.jpg', '0', '136');
INSERT INTO `picture` VALUES ('59', '1', '6', '性感/床上/美女', 'http://www.723website.top/IMG/48275-106.jpg', '0', '137');
INSERT INTO `picture` VALUES ('60', '1', '6', '性感/毛衣/美女', 'http://www.723website.top/IMG/54092-106.jpg', '0', '124');
INSERT INTO `picture` VALUES ('61', '1', '6', '小清新/唯美/美女', 'http://www.723website.top/IMG/61887-106.jpg', '0', '536');
INSERT INTO `picture` VALUES ('62', '1', '6', '小清新/唯美/美女/长腿', 'http://www.723website.top/IMG/77650-106.jpg', '0', '23');
INSERT INTO `picture` VALUES ('63', '1', '6', '性感/唯美/美女/丰满', 'http://www.723website.top/IMG/84961-106.jpg', '0', '54');
INSERT INTO `picture` VALUES ('64', '1', '6', '小清新/唯美/美女', 'http://www.723website.top/IMG/98119-106.jpg', '0', '12');
INSERT INTO `picture` VALUES ('65', '1', '6', '小清新/唯美/美女/长发', 'http://www.723website.top/IMG/sl.jpg', '0', '54');
INSERT INTO `picture` VALUES ('66', '1', '6', '小清新/唯美/美女/长发', 'http://www.723website.top/IMG/107645-106.jpg', '0', '53');
INSERT INTO `picture` VALUES ('67', '1', '6', '小清新/唯美/美女/背影', 'http://www.723website.top/IMG/125250-106.jpg', '0', '254');
INSERT INTO `picture` VALUES ('68', '1', '6', '小清新/唯美/湖面/晚霞', 'http://www.723website.top/IMG/125447-106.jpg', '0', '12');
INSERT INTO `picture` VALUES ('69', '1', '6', '高圆圆/明星/唯美/美女', 'http://www.723website.top/IMG/131098-106.jpg', '0', '534');
INSERT INTO `picture` VALUES ('70', '1', '6', '高圆圆/明星/美女/长发', 'http://www.723website.top/IMG/131116-106.jpg', '0', '23');
INSERT INTO `picture` VALUES ('71', '1', '6', '性感/丰满/美女/翘臀', 'http://www.723website.top/IMG/146452-106.jpg', '0', '64');
INSERT INTO `picture` VALUES ('72', '1', '6', '性感/床上/美女/丰满', 'http://www.723website.top/IMG/146457-106.jpg', '0', '67');
INSERT INTO `picture` VALUES ('73', '1', '6', '豪车/唯美/美女/长腿', 'http://www.723website.top/IMG/151832-106.jpg', '0', '89');
INSERT INTO `picture` VALUES ('74', '1', '6', '小清新/唯美/欧美风', 'http://www.723website.top/IMG/204940-106.jpg', '0', '34');
INSERT INTO `picture` VALUES ('75', '1', '6', '小清新/唯美/美女/背影', 'http://www.723website.top/IMG/215024-106.jpg', '0', '235');
INSERT INTO `picture` VALUES ('76', '1', '6', '小清新/唯美/美女/背影/大海/沙滩', 'http://www.723website.top/IMG/218250-106.jpg', '0', '75');
INSERT INTO `picture` VALUES ('77', '1', '6', '小清新/唯美/美女/轨道', 'http://www.723website.top/IMG/232960-106.jpg', '0', '34');
INSERT INTO `picture` VALUES ('78', '1', '6', '小清新/唯美/美女/玫瑰', 'http://www.723website.top/IMG/251753-106.jpg', '0', '78');
INSERT INTO `picture` VALUES ('79', '1', '6', '小清新/唯美/美女/霓虹灯/牛仔', 'http://www.723website.top/IMG/283629-106.jpg', '0', '34');
INSERT INTO `picture` VALUES ('80', '1', '6', '小清新/唯美/美女/长腿', 'http://www.723website.top/IMG/283633-106.jpg', '0', '76');
INSERT INTO `picture` VALUES ('81', '1', '6', '小清新/唯美/美女/吊带/短发', 'http://www.723website.top/IMG/284951-106.jpg', '0', '65');
INSERT INTO `picture` VALUES ('82', '1', '6', '小清新/唯美/美女/欧美/辫子', 'http://www.723website.top/IMG/286967-106.jpg', '0', '65');
INSERT INTO `picture` VALUES ('83', '1', '6', '小清新/唯美/美女/欧美/沙滩', 'http://www.723website.top/IMG/286970-106.jpg', '0', '65');
INSERT INTO `picture` VALUES ('84', '1', '6', '小清新/唯美/美女/背影', 'http://www.723website.top/IMG/292096-106.jpg', '0', '5');
INSERT INTO `picture` VALUES ('85', '1', '6', '小清新/唯美/美女/长腿/帽子', 'http://www.723website.top/IMG/292104-106.jpg', '0', '5');
INSERT INTO `picture` VALUES ('86', '1', '6', '小清新/唯美/美女/阳光/校园', 'http://www.723website.top/IMG/292723-106.jpg', '0', '5');
INSERT INTO `picture` VALUES ('87', '1', '6', '小清新/唯美/美女/阳光/校园', 'http://www.723website.top/IMG/292732-106.jpg', '0', '5');
INSERT INTO `picture` VALUES ('88', '1', '6', '小清新/唯美/美女/阳光/校园', 'http://www.723website.top/IMG/292753-106.jpg', '0', '65');
INSERT INTO `picture` VALUES ('89', '1', '6', '小清新/唯美/美女/旅行/背影', 'http://www.723website.top/IMG/297410-106.jpg', '0', '6');
INSERT INTO `picture` VALUES ('90', '1', '6', '小清新/唯美/美女/围巾/短发', 'http://www.723website.top/IMG/305370-106.jpg', '0', '6');
INSERT INTO `picture` VALUES ('91', '1', '6', '小清新/唯美/美女/欧美', 'http://www.723website.top/IMG/307915-106.jpg', '0', '56');
INSERT INTO `picture` VALUES ('92', '1', '6', '小清新/唯美/美女/图书馆/校园', 'http://www.723website.top/IMG/309772-106.jpg', '0', '5');
INSERT INTO `picture` VALUES ('93', '1', '6', '小清新/唯美/美女/都市/霓虹灯/红唇', 'http://www.723website.top/IMG/309821-106.jpg', '0', '5');
INSERT INTO `picture` VALUES ('94', '1', '6', '小清新/唯美/美女/白色/阳光/长发', 'http://www.723website.top/IMG/314321-106.jpg', '0', '6');
INSERT INTO `picture` VALUES ('95', '1', '6', '性感/唯美/美女/丰满', 'http://www.723website.top/IMG/318062-106.jpg', '0', '6');
INSERT INTO `picture` VALUES ('96', '1', '6', '小清新/唯美/美女/气球/蓝天', 'http://www.723website.top/IMG/318562-106.jpg', '0', '56');
INSERT INTO `picture` VALUES ('97', '1', '6', '小清新/唯美/美女', 'http://www.723website.top/IMG/327099-106.jpg', '0', '5');
INSERT INTO `picture` VALUES ('98', '1', '6', '小清新/唯美/美女/阳光/背影', 'http://www.723website.top/IMG/328440-106.jpg', '0', '5');
INSERT INTO `picture` VALUES ('99', '1', '6', '小清新/唯美/美女/花环/长发', 'http://www.723website.top/IMG/332333-106.jpg', '0', '6');
INSERT INTO `picture` VALUES ('100', '1', '6', '小清新/唯美/美女/性感', 'http://www.723website.top/IMG/332342-106.jpg', '0', '5');
INSERT INTO `picture` VALUES ('101', '1', '6', '小清新/唯美/美女/吊带/黄发', 'http://www.723website.top/IMG/332365-106.jpg', '0', '74');
INSERT INTO `picture` VALUES ('102', '1', '6', '小清新/唯美/美女/黄发', 'http://www.723website.top/IMG/332370-106.jpg', '0', '6');
INSERT INTO `picture` VALUES ('103', '1', '6', '小清新/唯美/美女/花/紫色', 'http://www.723website.top/IMG/335185-106.jpg', '0', '6');
INSERT INTO `picture` VALUES ('104', '1', '6', '小清新/唯美/美女/紫色/阳光', 'http://www.723website.top/IMG/335188-106.jpg', '0', '45');
INSERT INTO `picture` VALUES ('105', '1', '6', '小清新/唯美/美女', 'http://www.723website.top/IMG/335848-106.jpg', '0', '45');
INSERT INTO `picture` VALUES ('106', '1', '6', '小清新/唯美/美女/书房', 'http://www.723website.top/IMG/335850-106.jpg', '0', '34');
INSERT INTO `picture` VALUES ('107', '1', '6', '小清新/唯美/美女/居家', 'http://www.723website.top/IMG/335851-106.jpg', '0', '34');
INSERT INTO `picture` VALUES ('108', '1', '6', '小清新/唯美/美女/帽子', 'http://www.723website.top/IMG/336416-106.jpg', '0', '5');
INSERT INTO `picture` VALUES ('109', '1', '6', '小清新/唯美/美女/相机', 'http://www.723website.top/IMG/337463-106.jpg', '0', '5');
INSERT INTO `picture` VALUES ('110', '1', '1', '', '', '0', '5');

-- ----------------------------
-- Table structure for picture_copy
-- ----------------------------
DROP TABLE IF EXISTS `picture_copy`;
CREATE TABLE `picture_copy` (
  `pid` int(8) NOT NULL AUTO_INCREMENT,
  `sid` int(8) DEFAULT '1',
  `gid` int(8) DEFAULT '1',
  `pdepict` varchar(100) NOT NULL,
  `url` varchar(50) NOT NULL,
  `downloadNum` int(5) DEFAULT '0',
  `collectNum` int(5) DEFAULT '0',
  PRIMARY KEY (`pid`),
  KEY `sid` (`sid`),
  KEY `gid` (`gid`),
  CONSTRAINT `picture_copy_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `special` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `picture_copy_ibfk_2` FOREIGN KEY (`gid`) REFERENCES `genre` (`gid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of picture_copy
-- ----------------------------
INSERT INTO `picture_copy` VALUES ('1', '2', '1', '大海/沙滩/蓝天/蓝色', 'http://www.723website.top/IMG/336608-106.jpg', '0', '100');
INSERT INTO `picture_copy` VALUES ('2', '2', '1', '唯美的花朵/棕色', 'http://www.723website.top/IMG/335741-106.jpg', '0', '34');
INSERT INTO `picture_copy` VALUES ('3', '2', '1', '花/绿色/红色', 'http://www.723website.top/IMG/336076-106.jpg', '0', '23');
INSERT INTO `picture_copy` VALUES ('4', '2', '1', '大海/房子/蓝色', 'http://www.723website.top/IMG/336687-106.jpg', '0', '90');
INSERT INTO `picture_copy` VALUES ('5', '2', '1', '晚霞/船只/海岸', 'http://www.723website.top/IMG/336594-106.jpg', '0', '8');
INSERT INTO `picture_copy` VALUES ('6', '2', '1', '森林/湖面/蓝色', 'http://www.723website.top/IMG/336936-106.jpg', '0', '66');
INSERT INTO `picture_copy` VALUES ('7', '2', '1', '雪山/蓝色/白色', 'http://www.723website.top/IMG/336582-106.jpg', '0', '78');
INSERT INTO `picture_copy` VALUES ('8', '2', '1', '森林/绿色/湖面', 'http://www.723website.top/IMG/336941-106.jpg', '0', '37');
INSERT INTO `picture_copy` VALUES ('9', '2', '1', '美女/西瓜/夏天', 'http://www.723website.top/IMG/336502-106.jpg', '0', '47');
INSERT INTO `picture_copy` VALUES ('10', '2', '1', '白色的玫瑰/白色', 'http://www.723website.top/IMG/336183-106.jpg', '0', '28');
INSERT INTO `picture_copy` VALUES ('11', '2', '1', '美女/墨镜/牛仔/蓝色', 'http://www.723website.top/IMG/336513-106.jpg', '0', '19');
INSERT INTO `picture_copy` VALUES ('12', '2', '1', '雪山/白云/晚霞', 'http://www.723website.top/IMG/336585-106.jpg', '0', '98');
INSERT INTO `picture_copy` VALUES ('13', '2', '1', '绿意盎然/清新/绿色', 'http://www.723website.top/IMG/336942-106.jpg', '0', '97');
INSERT INTO `picture_copy` VALUES ('14', '2', '1', '小清新', 'http://www.723website.top/IMG/336774-106.jpg', '0', '91');
INSERT INTO `picture_copy` VALUES ('15', '2', '1', '小清新美女/棕色', 'http://www.723website.top/IMG/336469-106.jpg', '0', '48');
INSERT INTO `picture_copy` VALUES ('16', '2', '1', '性感美女/黑色', 'http://www.723website.top/IMG/336723-106.jpg', '0', '29');
INSERT INTO `picture_copy` VALUES ('17', '2', '1', '小清新蒙面美女/唯美美女', 'http://www.723website.top/IMG/336454-106.jpg', '0', '180');
INSERT INTO `picture_copy` VALUES ('18', '2', '1', '小清新美女/白色/绿色', 'http://www.723website.top/IMG/336727-106.jpg', '0', '177');
INSERT INTO `picture_copy` VALUES ('19', '2', '1', '大山/蓝天白云/风景', 'http://www.723website.top/IMG/336575-106.jpg', '0', '31');
INSERT INTO `picture_copy` VALUES ('20', '2', '1', '风景/灯塔/蓝色', 'http://www.723website.top/IMG/336604-106.jpg', '0', '76');
INSERT INTO `picture_copy` VALUES ('21', '2', '1', '小清新/长腿/蕾丝/白色', 'http://www.723website.top/IMG/336498-106.jpg', '0', '53');
INSERT INTO `picture_copy` VALUES ('22', '2', '1', '唯美风景/码头', 'http://www.723website.top/IMG/336595-106.jpg', '0', '34');
INSERT INTO `picture_copy` VALUES ('23', '2', '1', '小清新美女/模糊美女', 'http://www.723website.top/IMG/336390-106.jpg', '0', '22');
INSERT INTO `picture_copy` VALUES ('24', '2', '1', '晚霞/沙滩', 'http://www.723website.top/IMG/336598-106.jpg', '0', '56');
INSERT INTO `picture_copy` VALUES ('25', '2', '1', '大海/白云/蓝色', 'http://www.723website.top/IMG/336602-106.jpg', '0', '43');
INSERT INTO `picture_copy` VALUES ('26', '2', '1', '小猫咪/黑色', 'http://www.723website.top/IMG/337039-106.jpg', '0', '45');
INSERT INTO `picture_copy` VALUES ('27', '2', '1', '小清新帽子美女', 'http://www.723website.top/IMG/336426-106.jpg', '0', '43');
INSERT INTO `picture_copy` VALUES ('28', '2', '1', '小清新西瓜美女', 'http://www.723website.top/IMG/336374-106.jpg', '0', '23');
INSERT INTO `picture_copy` VALUES ('29', '2', '1', '猴子/棕树', 'http://www.723website.top/IMG/337076-106.jpg', '0', '67');
INSERT INTO `picture_copy` VALUES ('30', '2', '1', '高楼大厦/都市/蓝色', 'http://www.723website.top/IMG/337203-106.jpg', '0', '23');
INSERT INTO `picture_copy` VALUES ('31', '2', '1', '帽子/小清新美女', 'http://www.723website.top/IMG/336428-106.jpg', '0', '55');
INSERT INTO `picture_copy` VALUES ('32', '2', '1', '小鸟/树枝', 'http://www.723website.top/IMG/336788-106.jpg', '0', '22');
INSERT INTO `picture_copy` VALUES ('33', '2', '1', '小清新/帽子/美女', 'http://www.723website.top/IMG/336421-106.jpg', '0', '89');
INSERT INTO `picture_copy` VALUES ('34', '2', '1', '晚霞/雪山/蓝色', 'http://www.723website.top/IMG/336578-106.jpg', '0', '54');
INSERT INTO `picture_copy` VALUES ('35', '2', '1', '草原/狐狸/棕色', 'http://www.723website.top/IMG/336816-106.jpg', '0', '23');
INSERT INTO `picture_copy` VALUES ('36', '2', '1', '树叶/白天/小清新/绿色', 'http://www.723website.top/IMG/336696-106.jpg', '0', '11');
INSERT INTO `picture_copy` VALUES ('37', '2', '1', '肥胖的小猫咪/白色', 'http://www.723website.top/IMG/336620-106.jpg', '0', '56');
INSERT INTO `picture_copy` VALUES ('38', '2', '1', '池塘/荷花/荷叶', 'http://www.723website.top/IMG/336242-106.jpg', '0', '23');
INSERT INTO `picture_copy` VALUES ('39', '2', '1', '小鸟站在枝头上/绿色', 'http://www.723website.top/IMG/336888-106.jpg', '0', '16');
INSERT INTO `picture_copy` VALUES ('40', '2', '1', '荷花/黑色', 'http://www.723website.top/IMG/336257-106.jpg', '0', '121');
INSERT INTO `picture_copy` VALUES ('41', '2', '1', '花朵/霓虹灯/红色', 'http://www.723website.top/IMG/336836-106.jpg', '0', '124');
INSERT INTO `picture_copy` VALUES ('42', '2', '1', '小清新/长腿/美女', 'http://www.723website.top/IMG/336487-106.jpg', '0', '56');
INSERT INTO `picture_copy` VALUES ('43', '2', '1', '外国建筑/时钟/天空/异域风情', 'http://www.723website.top/IMG/337201-106.jpg', '0', '43');
INSERT INTO `picture_copy` VALUES ('44', '2', '1', '小清新美女人物头像/蓝色', 'http://www.723website.top/IMG/336380-106.jpg', '0', '64');
INSERT INTO `picture_copy` VALUES ('45', '2', '1', '唯美的小鸟站在石头上', 'http://www.723website.top/IMG/337069-106.jpg', '0', '67');
INSERT INTO `picture_copy` VALUES ('46', '2', '1', '晚安/动漫/芥末绿', 'http://www.723website.top/IMG/337021-106.jpg', '0', '23');
INSERT INTO `picture_copy` VALUES ('47', '2', '1', '狐狸/大雪/守望/白色', 'http://www.723website.top/IMG/336811-106.jpg', '0', '86');
INSERT INTO `picture_copy` VALUES ('48', '2', '1', '大头鸟', 'http://www.723website.top/IMG/336877-106.jpg', '0', '84');
INSERT INTO `picture_copy` VALUES ('49', '2', '1', '樱花树/蓝天/蓝色', 'http://www.723website.top/IMG/336938-106.jpg', '0', '90');
INSERT INTO `picture_copy` VALUES ('50', '2', '1', '蓝天/异域风情/白云/蓝色', 'http://www.723website.top/IMG/337148-106.jpg', '0', '45');
INSERT INTO `picture_copy` VALUES ('51', '2', '1', '异域风情/房屋/绿色', 'http://www.723website.top/IMG/337200-106.jpg', '0', '334');
INSERT INTO `picture_copy` VALUES ('52', '2', '1', '小清新/唯美/植物', 'http://www.723website.top/IMG/336695-106.jpg', '0', '442');
INSERT INTO `picture_copy` VALUES ('53', '1', '6', '小清新/唯美/美女/椅子', 'http://www.723website.top/IMG/335853-106.jpg', '0', '234');
INSERT INTO `picture_copy` VALUES ('54', '1', '6', '小清新/唯美/美女/长发', 'http://www.723website.top/IMG/281098-106.jpg', '0', '267');
INSERT INTO `picture_copy` VALUES ('55', '1', '6', '汽车/美女', 'http://www.723website.top/IMG/288958-106.jpg', '0', '473');
INSERT INTO `picture_copy` VALUES ('56', '1', '6', '唯美/美女/黑色', 'http://www.723website.top/IMG/314943-106.jpg', '0', '358');
INSERT INTO `picture_copy` VALUES ('57', '1', '6', '性感/美女', 'http://www.723website.top/IMG/34569-106.jpg', '0', '135');
INSERT INTO `picture_copy` VALUES ('58', '1', '6', '高圆圆/明星/唯美/美女/夜色', 'http://www.723website.top/IMG/43371-106.jpg', '0', '136');
INSERT INTO `picture_copy` VALUES ('59', '1', '6', '性感/床上/美女', 'http://www.723website.top/IMG/48275-106.jpg', '0', '137');
INSERT INTO `picture_copy` VALUES ('60', '1', '6', '性感/毛衣/美女', 'http://www.723website.top/IMG/54092-106.jpg', '0', '124');
INSERT INTO `picture_copy` VALUES ('61', '1', '6', '小清新/唯美/美女', 'http://www.723website.top/IMG/61887-106.jpg', '0', '536');
INSERT INTO `picture_copy` VALUES ('62', '1', '6', '小清新/唯美/美女/长腿', 'http://www.723website.top/IMG/77650-106.jpg', '0', '23');
INSERT INTO `picture_copy` VALUES ('63', '1', '6', '性感/唯美/美女/丰满', 'http://www.723website.top/IMG/84961-106.jpg', '0', '54');
INSERT INTO `picture_copy` VALUES ('64', '1', '6', '小清新/唯美/美女', 'http://www.723website.top/IMG/98119-106.jpg', '0', '12');
INSERT INTO `picture_copy` VALUES ('65', '1', '6', '小清新/唯美/美女/长发', 'http://www.723website.top/IMG/sl.jpg', '0', '54');
INSERT INTO `picture_copy` VALUES ('66', '1', '6', '小清新/唯美/美女/长发', 'http://www.723website.top/IMG/107645-106.jpg', '0', '53');
INSERT INTO `picture_copy` VALUES ('67', '1', '6', '小清新/唯美/美女/背影', 'http://www.723website.top/IMG/125250-106.jpg', '0', '254');
INSERT INTO `picture_copy` VALUES ('68', '1', '6', '小清新/唯美/湖面/晚霞', 'http://www.723website.top/IMG/125447-106.jpg', '0', '12');
INSERT INTO `picture_copy` VALUES ('69', '1', '6', '高圆圆/明星/唯美/美女', 'http://www.723website.top/IMG/131098-106.jpg', '0', '534');
INSERT INTO `picture_copy` VALUES ('70', '1', '6', '高圆圆/明星/美女/长发', 'http://www.723website.top/IMG/131116-106.jpg', '0', '23');
INSERT INTO `picture_copy` VALUES ('71', '1', '6', '性感/丰满/美女/翘臀', 'http://www.723website.top/IMG/146452-106.jpg', '0', '64');
INSERT INTO `picture_copy` VALUES ('72', '1', '6', '性感/床上/美女/丰满', 'http://www.723website.top/IMG/146457-106.jpg', '0', '67');
INSERT INTO `picture_copy` VALUES ('73', '1', '6', '豪车/唯美/美女/长腿', 'http://www.723website.top/IMG/151832-106.jpg', '0', '89');
INSERT INTO `picture_copy` VALUES ('74', '1', '6', '小清新/唯美/欧美风', 'http://www.723website.top/IMG/204940-106.jpg', '0', '34');
INSERT INTO `picture_copy` VALUES ('75', '1', '6', '小清新/唯美/美女/背影', 'http://www.723website.top/IMG/215024-106.jpg', '0', '235');
INSERT INTO `picture_copy` VALUES ('76', '1', '6', '小清新/唯美/美女/背影/大海/沙滩', 'http://www.723website.top/IMG/218250-106.jpg', '0', '75');
INSERT INTO `picture_copy` VALUES ('77', '1', '6', '小清新/唯美/美女/轨道', 'http://www.723website.top/IMG/232960-106.jpg', '0', '34');
INSERT INTO `picture_copy` VALUES ('78', '1', '6', '小清新/唯美/美女/玫瑰', 'http://www.723website.top/IMG/251753-106.jpg', '0', '78');
INSERT INTO `picture_copy` VALUES ('79', '1', '6', '小清新/唯美/美女/霓虹灯/牛仔', 'http://www.723website.top/IMG/283629-106.jpg', '0', '34');
INSERT INTO `picture_copy` VALUES ('80', '1', '6', '小清新/唯美/美女/长腿', 'http://www.723website.top/IMG/283633-106.jpg', '0', '76');
INSERT INTO `picture_copy` VALUES ('81', '1', '6', '小清新/唯美/美女/吊带/短发', 'http://www.723website.top/IMG/284951-106.jpg', '0', '65');
INSERT INTO `picture_copy` VALUES ('82', '1', '6', '小清新/唯美/美女/欧美/辫子', 'http://www.723website.top/IMG/286967-106.jpg', '0', '65');
INSERT INTO `picture_copy` VALUES ('83', '1', '6', '小清新/唯美/美女/欧美/沙滩', 'http://www.723website.top/IMG/286970-106.jpg', '0', '65');
INSERT INTO `picture_copy` VALUES ('84', '1', '6', '小清新/唯美/美女/背影', 'http://www.723website.top/IMG/292096-106.jpg', '0', '5');
INSERT INTO `picture_copy` VALUES ('85', '1', '6', '小清新/唯美/美女/长腿/帽子', 'http://www.723website.top/IMG/292104-106.jpg', '0', '5');
INSERT INTO `picture_copy` VALUES ('86', '1', '6', '小清新/唯美/美女/阳光/校园', 'http://www.723website.top/IMG/292723-106.jpg', '0', '5');
INSERT INTO `picture_copy` VALUES ('87', '1', '6', '小清新/唯美/美女/阳光/校园', 'http://www.723website.top/IMG/292732-106.jpg', '0', '5');
INSERT INTO `picture_copy` VALUES ('88', '1', '6', '小清新/唯美/美女/阳光/校园', 'http://www.723website.top/IMG/292753-106.jpg', '0', '65');
INSERT INTO `picture_copy` VALUES ('89', '1', '6', '小清新/唯美/美女/旅行/背影', 'http://www.723website.top/IMG/297410-106.jpg', '0', '6');
INSERT INTO `picture_copy` VALUES ('90', '1', '6', '小清新/唯美/美女/围巾/短发', 'http://www.723website.top/IMG/305370-106.jpg', '0', '6');
INSERT INTO `picture_copy` VALUES ('91', '1', '6', '小清新/唯美/美女/欧美', 'http://www.723website.top/IMG/307915-106.jpg', '0', '56');
INSERT INTO `picture_copy` VALUES ('92', '1', '6', '小清新/唯美/美女/图书馆/校园', 'http://www.723website.top/IMG/309772-106.jpg', '0', '5');
INSERT INTO `picture_copy` VALUES ('93', '1', '6', '小清新/唯美/美女/都市/霓虹灯/红唇', 'http://www.723website.top/IMG/309821-106.jpg', '0', '5');
INSERT INTO `picture_copy` VALUES ('94', '1', '6', '小清新/唯美/美女/白色/阳光/长发', 'http://www.723website.top/IMG/314321-106.jpg', '0', '6');
INSERT INTO `picture_copy` VALUES ('95', '1', '6', '性感/唯美/美女/丰满', 'http://www.723website.top/IMG/318062-106.jpg', '0', '6');
INSERT INTO `picture_copy` VALUES ('96', '1', '6', '小清新/唯美/美女/气球/蓝天', 'http://www.723website.top/IMG/318562-106.jpg', '0', '56');
INSERT INTO `picture_copy` VALUES ('97', '1', '6', '小清新/唯美/美女', 'http://www.723website.top/IMG/327099-106.jpg', '0', '5');
INSERT INTO `picture_copy` VALUES ('98', '1', '6', '小清新/唯美/美女/阳光/背影', 'http://www.723website.top/IMG/328440-106.jpg', '0', '5');
INSERT INTO `picture_copy` VALUES ('99', '1', '6', '小清新/唯美/美女/花环/长发', 'http://www.723website.top/IMG/332333-106.jpg', '0', '6');
INSERT INTO `picture_copy` VALUES ('100', '1', '6', '小清新/唯美/美女/性感', 'http://www.723website.top/IMG/332342-106.jpg', '0', '5');
INSERT INTO `picture_copy` VALUES ('101', '1', '6', '小清新/唯美/美女/吊带/黄发', 'http://www.723website.top/IMG/332365-106.jpg', '0', '74');
INSERT INTO `picture_copy` VALUES ('102', '1', '6', '小清新/唯美/美女/黄发', 'http://www.723website.top/IMG/332370-106.jpg', '0', '6');
INSERT INTO `picture_copy` VALUES ('103', '1', '6', '小清新/唯美/美女/花/紫色', 'http://www.723website.top/IMG/335185-106.jpg', '0', '6');
INSERT INTO `picture_copy` VALUES ('104', '1', '6', '小清新/唯美/美女/紫色/阳光', 'http://www.723website.top/IMG/335188-106.jpg', '0', '45');
INSERT INTO `picture_copy` VALUES ('105', '1', '6', '小清新/唯美/美女', 'http://www.723website.top/IMG/335848-106.jpg', '0', '45');
INSERT INTO `picture_copy` VALUES ('106', '1', '6', '小清新/唯美/美女/书房', 'http://www.723website.top/IMG/335850-106.jpg', '0', '34');
INSERT INTO `picture_copy` VALUES ('107', '1', '6', '小清新/唯美/美女/居家', 'http://www.723website.top/IMG/335851-106.jpg', '0', '34');
INSERT INTO `picture_copy` VALUES ('108', '1', '6', '小清新/唯美/美女/帽子', 'http://www.723website.top/IMG/336416-106.jpg', '0', '5');
INSERT INTO `picture_copy` VALUES ('109', '1', '6', '小清新/唯美/美女/相机', 'http://www.723website.top/IMG/337463-106.jpg', '0', '5');
INSERT INTO `picture_copy` VALUES ('110', '1', '1', '', '', '0', '5');

-- ----------------------------
-- Table structure for special
-- ----------------------------
DROP TABLE IF EXISTS `special`;
CREATE TABLE `special` (
  `sid` int(8) NOT NULL AUTO_INCREMENT,
  `sname` varchar(30) DEFAULT '0',
  `sdepict` varchar(100) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of special
-- ----------------------------
INSERT INTO `special` VALUES ('1', '', '');
INSERT INTO `special` VALUES ('2', '一周壁纸精选集', '一周里大家喜欢的壁纸都放在这里了，快来看看吧！');
INSERT INTO `special` VALUES ('3', '拜拜！夏天', '天气变得越来越凉爽，夏天悄悄地走了，换换这些壁纸再来感受一下夏季。');
INSERT INTO `special` VALUES ('4', '行万里路', '生活不止眼前的苟且，还有诗和远方的田野');
INSERT INTO `special` VALUES ('5', '开学季', '小伙伴们，好好学习才能读书破万卷，下笔如有神。');
INSERT INTO `special` VALUES ('6', '愿你可以嫁给爱情', '世界那么大，遇见不容易，且行且珍惜！');
INSERT INTO `special` VALUES ('7', '我的世界任你窥探', '在我的世界里，一切都是通透无瑕，没有半点遮掩，存粹而又美好。');
INSERT INTO `special` VALUES ('8', '骑着单车去旅行', '一个人，一辆车，一条路，人在途中，心随景动，如果心在远方，只需要勇敢前行。');
INSERT INTO `special` VALUES ('9', '三只松鼠的动漫小窝', '你以为我们只是好吃吗？NO NO NO 我们还会卖萌。');
INSERT INTO `special` VALUES ('10', '温暖如至', '轻抚脸颊，穿过每一缕发丝、嘴角、那温暖如此美好。');
INSERT INTO `special` VALUES ('11', '雨是伞的情人', '委屈的泪水，在伞的身上肆意流淌，伞替雨抹去泪水，任眼泪洒落在地上，浸泡着心中的无限惆怅。');
INSERT INTO `special` VALUES ('12', '追寻光的方向', '它脸朝太阳，憧憬那份温暖，平明伸长身体去接近那份光芒。');
INSERT INTO `special` VALUES ('13', '五月美图精选', '抓住五月的尾巴，看看有没有你错过的风景。');
INSERT INTO `special` VALUES ('14', '随风舞动的美好', '每当微风拂过，轻盈的旋转，随着风儿药业在蓝天中。');
INSERT INTO `special` VALUES ('15', '为你而剪得短发', '我已剪短我的发剪短了牵挂 剪一地不被爱的分岔 长长短短 短短长长');
INSERT INTO `special` VALUES ('16', '美丽契约', '相遇就像一份契约，美丽而神圣；爱是凝望有离开，不舍却决绝。重庆美眉用相机记录细碎时光，愿与更多的你不期而遇~');
INSERT INTO `special` VALUES ('17', '女人花', '男人似山山似海，女人如花花似梦。请在春光盎然的一偶棒一束花，对她说：谢谢你撑起了半边天。');
INSERT INTO `special` VALUES ('18', '会动的建筑', '建筑的美在于它给你的惊喜永远不止你所见到的。请保持你的好奇心，旋转而上，去发掘出最美的。');
INSERT INTO `special` VALUES ('19', '第N封情书', '将垫底定个在屏幕，把爱情锁入了心房，感谢爱情赐予我们美好，有你的日子，我很知足。——给你的第N封情书');
INSERT INTO `special` VALUES ('20', '静景净晴', '清新盆景，名目舒压。给生活一点生机，给自己一些获利。');
INSERT INTO `special` VALUES ('21', '金秋十月，为国庆庆生', '不同的名族，同一个国家，母亲的生日，同喜同喜。');
INSERT INTO `special` VALUES ('22', '暖房', '被时间遗忘了优雅，被琐碎抛弃了品质。当生活波兰不惊周而复始，你所失去的便是自我。周末到了，放一放忙碌的工作吧，去享受慢生活。');
INSERT INTO `special` VALUES ('23', '玻璃心', '闲暇喜欢摆弄一些瓶瓶罐罐，因为透明的玻璃里面有我欣欣向荣的小梦想，温暖而治愈。');
INSERT INTO `special` VALUES ('24', '调皮捣蛋不听话', '温馨提示：请出示万圣节锁屏壁纸。搜索糖果保平安。');
INSERT INTO `special` VALUES ('25', '品牌的力量', '聚焦品质，说一说你心中最具影响力的品牌是——');
INSERT INTO `special` VALUES ('26', '清除定个人物摄影', '取景器的框框里，存放着无尽的年华与梦想，它将岁月写成一首诗，成为永不退色的青春。');
INSERT INTO `special` VALUES ('27', '仙姿玉色', '仙落凡尘，恋霓裳；一轮明月，照面庞。');
INSERT INTO `special` VALUES ('28', '理想乡', '在纯净的世界里，存粹的活着。——致二次元');
INSERT INTO `special` VALUES ('29', '小玩意儿大世界', '小玩意，大世界，时光岁月，长情陪伴。跟了你最久的东西是这些吗？');
INSERT INTO `special` VALUES ('30', '闲下来/文艺之家', '小资元素文青首选，逼格空间二情必备。独立于喧嚣都市外的文艺气息献给闲适的你。');
INSERT INTO `special` VALUES ('31', '森系美女', '入伏天到~清凉森系文艺风刮来~绿衣婆沙。');
INSERT INTO `special` VALUES ('32', '花里胡哨', '花里胡哨不落俗套，将浮华进行到底');
INSERT INTO `special` VALUES ('33', '废墟上的文明', '在富于浪漫色彩的废墟中，蕴藏着一种令人激越的美丽——威.吉尔伯特');
INSERT INTO `special` VALUES ('34', '咔嚓！文艺妹子', '等不到你长发及腰，直接嫁我好了。因为，短发女孩也可以性感可爱。');
INSERT INTO `special` VALUES ('35', '恋上蓝天碧海', '博大的胸怀中孕育着生命，清凉的温情中沸腾着理想。在烟波浩瀚中，恋上蓝色，恋上奔放而深沉的你。');
INSERT INTO `special` VALUES ('36', '青春散场毕业季', '青春的岁月里，因为一无所有，所以无畏前行，曲折却倔强；未来的日子里，因为一无所知，所以厚积薄发，匍匐但决绝。');
INSERT INTO `special` VALUES ('37', '游走于城市之中', '轰鸣的城市，因为梵花而矗立新房；因荒凉而孤独彷徨。随性生活，随心而活。');
INSERT INTO `special` VALUES ('38', '猫女郎的故事', '喵星人古灵精怪卖萌耍宝，清凉妹子魅力性感秀色可餐，你，能经得住猫女郎的有货吗？');
INSERT INTO `special` VALUES ('39', '趁年轻去旅行', '有些事现在不做，一辈子都不会做了。趁年轻，多出去走走，这个世界能给你的，往往能比我们想象的东西还多。');
INSERT INTO `special` VALUES ('40', '萌宠大比拼', '能呆能萌能搞怪，能文能武能尖叫，自家萌宠挤屏幕啦。');
INSERT INTO `special` VALUES ('41', '美女秀', '秀壁纸秀自己。周末到了，一大波美女闪瞎眼。一起来换个壁纸show出自己吧');

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
) ENGINE=MyISAM AUTO_INCREMENT=170 DEFAULT CHARSET=gbk;

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
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=gbk;

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
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tab_user
-- ----------------------------
INSERT INTO `tab_user` VALUES ('3', '向国平', '1', '1099223026@qq.com', '$2y$13$JsEplb8rDOO5umNdiqNun.BgaStTcEpSwxM6KmqDVCo8R6lfZeM/q');
INSERT INTO `tab_user` VALUES ('1', '李小勇', '0', '1505087161@qq.com', '$2y$13$L3Mr20HBDlMpVFeSeRd4Ge5oeZ/mI3y4saelTCcl84BCsZrvAA/va');
INSERT INTO `tab_user` VALUES ('2', '吴智薪', '0', '1192247166@qq.com', '$2y$13$kM6pR7QuqNtlDDCIZmK77e4nVt435UdEnbeuqvjHM/YovwAyuqpJ.');
INSERT INTO `tab_user` VALUES ('4', '汪玉东', '0', '1028711909@qq.com', '$2y$13$46iBEpQ4lv6XrXjqb5grheJlitxIHWsrg.xOTEm0wq55igx.73EJi');
INSERT INTO `tab_user` VALUES ('5', '戴渝', '0', '269797032@qq.com', '$2y$13$PIXY3dT0nj55upLaRfQMpuI8ANHv0NIfRRBEeCVBxp1cXkxxpoNtm');
INSERT INTO `tab_user` VALUES ('6', '付榆峰', '0', '632844050@qq.com', '$2y$13$o1JH3pPPxidsnYpVwgy1wuGckTZa/6dbzYOTP/yDB39ca2m476Si2');
INSERT INTO `tab_user` VALUES ('92', 'asd', '0', '630873133@qq.com', '$2y$13$q4bC8TpTCRSDFsEAAyBcqeIbVt3AUmJY9p6xvnkR0SieELOcDoWfK');
SET FOREIGN_KEY_CHECKS=1;
