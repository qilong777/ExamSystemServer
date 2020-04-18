/*
Navicat MySQL Data Transfer

Source Server         : connect
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : electronicmall

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2020-01-11 17:38:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classId` int(11) DEFAULT NULL,
  `className` varchar(50) DEFAULT NULL,
  `bigSrc` varchar(255) DEFAULT NULL,
  `smallSrc` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sold` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `del` decimal(10,2) DEFAULT NULL,
  `size` varchar(100) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `score` float(11,1) DEFAULT NULL,
  `commentCount` int(11) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `classId` (`classId`),
  CONSTRAINT `classId` FOREIGN KEY (`classId`) REFERENCES `commodityclass` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES ('1', '1', '休闲鞋', 'https://images.s.cn/images/goods/20160510/ed8c67d2e0482ca1_210.jpg', 'https://images.s.cn/images/20160510/cc8aa0771810a084.jpg', 'LINING李宁 休闲鞋 男 黑色+雪白', '55', '149.00', '299.00', '42、43', 'LINING李宁男子新款经典休闲板鞋时尚潮流小白鞋运动鞋ALCL041', '5.0', '2', '黑色+白色', '李宁');
INSERT INTO `commodity` VALUES ('2', '1', '休闲鞋', 'https://images.s.cn/images/goods/20190305/513b1f4b3b8176c6_210.jpg', 'https://images.s.cn/images/20160428/8117260c69dae01f.jpg', 'NIKE耐克 休闲鞋 男 黑+白', '222', '349.00', '499.00', '39、40、40.5、41、42、42.5、43、44、44.5', 'NIKE耐克男鞋TANJUN透气网面运动鞋休闲情侣跑步鞋812654', '4.1', '19', '黑色+白色', '耐克');
INSERT INTO `commodity` VALUES ('3', '1', '休闲鞋', 'https://images.s.cn/images/goods/20160519/ae780929ffb137a0_210.jpg', 'https://images.s.cn/images/20160127/1a48b9f078be18be.jpg', 'SKECHERS斯凯奇 休闲鞋 女 黑色+白色', '23', '439.00', '599.00', '39', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('4', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180806/cc12c18711773649_210.jpg', 'https://images.s.cn/images/20160408/95828dc59fa79c86.jpg', 'ASICS亚瑟士 休闲鞋 中性 白色+蓝色', '83', '419.00', '590.00', '37、37.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('5', '1', '休闲鞋', 'https://images.s.cn/images/goods/20160401/e20ba8c92c2f222d_210.jpg', 'https://images.s.cn/images/20160401/044543f5225db05e.jpg', 'ASICS亚瑟士 休闲鞋 中性 黑色+蓝色', '1', '249.00', '450.00', '19.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('6', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180806/26d0f3fdc111a8ef_210.jpg', 'https://images.s.cn/images/20140917/3bfb5d2882c9a781.jpg', 'ASICS亚瑟士 休闲鞋 男 白色+淡灰蓝', '103', '529.00', '790.00', '36、37、38、39.5、40.5、41.5、42、42.5、43.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('7', '1', '休闲鞋', 'https://images.s.cn/images/goods/20160520/3ebe9e76dc5f5e34_210.jpg', 'https://images.s.cn/images/20151021/50c7ae87d61eda9b.jpg', 'ASICS亚瑟士 休闲鞋 中性 白色+蓝色', '11', '659.00', '850.00', '41.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('8', '1', '休闲鞋', 'https://images.s.cn/images/goods/20191108/f9030186bb49510d_210.jpg', 'https://images.s.cn/images/20191108/a64d111eb6df3d09.jpg', 'ASICS亚瑟士 休闲鞋 中性 深蓝色+金色', '46', '389.00', '590.00', '36、37', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('9', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180806/c933e4b022e0c50e_210.jpg', 'https://images.s.cn/images/20150212/a5e14263e664038b.jpg', 'ASICS亚瑟士 休闲鞋 男 米灰色+藏青色', '34', '569.00', '790.00', '37', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('10', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180806/97a217acf94af38d_210.jpg', 'https://images.s.cn/images/20190808/17e9ddfb76bb5850.jpg', 'ASICS亚瑟士 休闲鞋 男 白色+深蓝色', '45', '599.00', '850.00', '36、37、37.5、39.5、40.5、41.5、42、42.5、43.5、44', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('11', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180806/1df57798cc119e81_210.jpg', 'https://images.s.cn/images/20130912/47c8d6a0531c7dd9.jpg', 'ASICS亚瑟士 休闲鞋 男 白色+蓝色', '62', '599.00', '850.00', '41.5、42、42.5、43.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('12', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180829/64eff0b3c718fa05_210.jpg', 'https://images.s.cn/images/20180829/05240b16455d6068.jpg', 'LINING李宁 休闲鞋 男 中灰色+藏青蓝+凤凰红', '199', '239.00', '399.00', '39.5、42', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('13', '1', '休闲鞋', 'https://images.s.cn/images/goods/20150312/5750722e6836eb0e_210.jpg', 'https://images.s.cn/images/20150312/1fd1f953f2d97ed7.jpg', 'LINING李宁 休闲鞋 男 凝雪灰+水银灰', '156', '239.00', '399.00', '39、39.5、40、41、41.5、42、43、43.5、44', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('14', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180808/d0acf145cd8a1f1a_210.jpg', 'https://images.s.cn/images/20160408/66a8afa19b055bc0.jpg', 'NIKE耐克 休闲鞋 男 黑+白', '207', '479.00', '649.00', '43、44、44.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('15', '1', '休闲鞋', 'https://images.s.cn/images/goods/20160728/7cfe8c4491e9e6c9_210.jpg', 'https://images.s.cn/images/20160728/84f222ed97ba9c5c.jpg', 'ASICS亚瑟士 休闲鞋 中性 白色+蓝色', '6', '399.00', '550.00', '39、39.5、40.5、41.5、42、42.5、43.5、44', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('16', '1', '休闲鞋', 'https://images.s.cn/images/goods/20160819/86773b56b5ca7202_210.jpg', 'https://images.s.cn/images/20160819/830757753e62b86b.jpg', 'SKECHERS斯凯奇 休闲鞋 男 黑色', '31', '499.00', '599.00', '41、42、43', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('17', '1', '休闲鞋', 'https://images.s.cn/images/goods/20190409/69a517fb4aa0ed4a_210.jpg', 'https://images.s.cn/images/20170224/47d23bffd9b80a36.jpg', 'originals三叶草 休闲鞋 中性 白+白+学院蓝', '17', '539.00', '899.00', '42.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('18', '1', '休闲鞋', 'https://images.s.cn/images/goods/20170405/ede6ffc8391992d3_210.jpg', 'https://images.s.cn/images/20170405/50dee390eaa7cec0.jpg', 'LINING李宁 休闲鞋 女 新基础黑+米白色', '1', '99.00', '369.00', '35、36', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('19', '1', '休闲鞋', 'https://images.s.cn/images/goods/20170421/8f94f84d95ccab26_210.jpg', 'https://images.s.cn/images/20170421/5cd1425aa22071b6.jpg', 'SKECHERS斯凯奇 低帮 男 柠檬色', '0', '99.00', '349.00', '21.5、22.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('20', '1', '休闲鞋', 'https://images.s.cn/images/goods/20170627/a2db5d19e8b24da0_210.jpg', 'https://images.s.cn/images/20170627/0c9a9dc3648a162f.jpg', 'SKECHERS斯凯奇 休闲鞋 女 桃红色+浅紫色', '3', '179.00', '299.00', '20.5、21.5、22.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('21', '1', '休闲鞋', 'https://images.s.cn/images/goods/20170803/30bfe5bc3e24201d_210.jpg', 'https://images.s.cn/images/20170803/13c93c274c7bd6e2.jpg', 'SKECHERS斯凯奇 休闲鞋 男 黑色', '14', '399.00', '499.00', '39.5、41、43', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('22', '1', '休闲鞋', 'https://images.s.cn/images/goods/20170804/db5159a5bb7311b2_210.jpg', 'https://images.s.cn/images/20170804/394c3a102bd2ef99.jpg', 'LINING李宁 休闲鞋 女 新基础黑', '0', '99.00', '299.00', '36', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('23', '1', '休闲鞋', 'https://images.s.cn/images/goods/20170810/b4af00705426056f_210.jpg', 'https://images.s.cn/images/20170810/b6705677f4dcae69.jpg', 'SKECHERS斯凯奇 休闲鞋 男 黑色+宝蓝色', '0', '199.00', '349.00', '24、25.5、26.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('24', '1', '休闲鞋', 'https://images.s.cn/images/goods/20170901/e172c9cb8bb22179_210.jpg', 'https://images.s.cn/images/20170901/1505fd53319628d7.jpg', 'NIKE耐克 休闲鞋 男 黑+白', '53', '499.00', '699.00', '44', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('25', '1', '休闲鞋', 'https://images.s.cn/images/goods/20190426/9ee68500ccc98907_210.jpg', 'https://images.s.cn/images/20190426/e967e9e524b1f933.jpg', 'neo阿迪达斯 休闲鞋 男 一号黑+一号黑+石墨黑', '13', '429.00', '699.00', '43', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('26', '1', '休闲鞋', 'https://images.s.cn/images/goods/20170914/201c99df8c972847_210.jpg', 'https://images.s.cn/images/20170914/64c08fcc1da80480.jpg', 'SKECHERS斯凯奇 休闲鞋 女 黑色+白色', '8', '499.00', '649.00', '35、36、36.5、37、37.5、38、38.5、39', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('27', '1', '休闲鞋', 'https://images.s.cn/images/goods/20170914/7137e04933890b0f_210.jpg', 'https://images.s.cn/images/20170914/e6ac23b9aa2aebe8.jpg', 'SKECHERS斯凯奇 休闲鞋 女 黑色+白色', '19', '479.00', '599.00', '35、39', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('28', '1', '休闲鞋', 'https://images.s.cn/images/goods/20170929/ace36048ee06274a_210.jpg', 'https://images.s.cn/images/20170929/e2f4cf8663797117.jpg', 'NIKE耐克 休闲鞋 男 黑+白', '2', '399.00', '699.00', '36', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('29', '1', '休闲鞋', 'https://images.s.cn/images/goods/20171020/a0b8970f1249d6be_210.jpg', 'https://images.s.cn/images/20171020/cbc47adda1175cd6.jpg', 'SKECHERS斯凯奇 休闲鞋 男 海军蓝色+黑色', '4', '439.00', '549.00', '39.5、41', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('30', '1', '休闲鞋', 'https://images.s.cn/images/goods/20171021/228917a85728b53c_210.jpg', 'https://images.s.cn/images/20171021/fcea9a5fcbb3dfe5.jpg', 'SKECHERS斯凯奇 休闲鞋 中性 白色+黑色', '5', '299.00', '499.00', '27.5、28.5、30、32、33.5、35', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('31', '1', '休闲鞋', 'https://images.s.cn/images/goods/20171025/a7453c6844f504e9_210.jpg', 'https://images.s.cn/images/20171025/2d659fcc7924a99d.jpg', 'SKECHERS斯凯奇 休闲鞋 女 黑色+白色', '1', '569.00', '699.00', '35、36、39', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('32', '1', '休闲鞋', 'https://images.s.cn/images/goods/20171102/ba636194c85b58ff_210.jpg', 'https://images.s.cn/images/20171102/23e23b4c0d9eda00.jpg', 'NIKE耐克 休闲鞋 女 黑+黑+白', '23', '399.00', '799.00', '35.5、36', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('33', '1', '休闲鞋', 'https://images.s.cn/images/goods/20171104/38454a2648fc84db_210.jpg', 'https://images.s.cn/images/20171104/5e9eb40cf942b5dd.jpg', 'neo阿迪达斯 休闲鞋 男 1号黑色+1号黑色+石墨黑', '25', '429.00', '699.00', '44', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('34', '1', '休闲鞋', 'https://images.s.cn/images/goods/20171108/8f501306a8c49e4c_210.jpg', 'https://images.s.cn/images/20171108/659c631d844c1f5b.jpg', 'disney迪士尼 休闲鞋 中性 蓝色', '0', '59.00', '297.50', '', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('35', '1', '休闲鞋', 'https://images.s.cn/images/goods/20190220/595aa06e10e1e3d3_210.jpg', 'https://images.s.cn/images/20190220/9dac87081a9ad0e8.jpg', 'ASICS亚瑟士 休闲鞋 中性 黑色+黑色', '3', '389.00', '690.00', '36、37、37.5、41.5、43.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('36', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180115/ac6e7445c005e910_210.jpg', 'https://images.s.cn/images/20180115/7189ec5b2067d0e6.jpg', 'SKECHERS斯凯奇 休闲鞋 女 白色', '2', '229.00', '499.00', '', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('37', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180122/0ed5331073a52cc9_210.jpg', 'https://images.s.cn/images/20180122/8f8cefeb8a1a7c5e.jpg', 'neo阿迪达斯 休闲鞋 男 1号黑色+亮白', '29', '259.00', '499.00', '36.5、44、44.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('38', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180202/0b990576000ac41b_210.jpg', 'https://images.s.cn/images/20180202/7abc3f29fd536faf.jpg', 'LINING李宁 休闲鞋 男 标准黑+标准白', '2', '239.00', '399.00', '39.5、40、41、41.5、42', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('39', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180202/fc9885622037ab3f_210.jpg', 'https://images.s.cn/images/20180202/c059a937817e6c19.jpg', 'LINING李宁 休闲鞋 女 标准白+珊瑚粉', '6', '139.00', '239.00', '', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('40', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180202/80463dedf4599c6e_210.jpg', 'https://images.s.cn/images/20180202/83047e55a4db3a50.jpg', 'LINING李宁 休闲鞋 女 标准黑+檀黑色', '0', '99.00', '439.00', '', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('41', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180207/a4786b4710648a5a_210.jpg', 'https://images.s.cn/images/20180207/350dc014b159621d.jpg', 'LINING李宁 休闲鞋 女 标准黑', '1', '99.00', '299.00', '', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('42', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180208/7b6ccb97b922dca3_210.jpg', 'https://images.s.cn/images/20180208/b1e3fa760bb3a0e0.jpg', 'New BalanceNB 休闲鞋 女 云雾灰', '3', '299.00', '619.00', '', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('43', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180211/7c0f83f92cdcf1bb_210.jpg', 'https://images.s.cn/images/20180211/0bf6165e929855c3.jpg', 'SKECHERS斯凯奇 休闲鞋 女 粉红色', '0', '449.00', '849.00', '36、38', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('44', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180211/cf6bc4333c858fd5_210.jpg', 'https://images.s.cn/images/20180211/d3ff8d004e140be6.jpg', 'SKECHERS斯凯奇 休闲鞋 女 白色+灰色', '0', '469.00', '549.00', '38.5、39.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('45', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180211/de736e193ddc8a8a_210.jpg', 'https://images.s.cn/images/20180211/2276b97f42264429.jpg', 'SKECHERS斯凯奇 休闲鞋 女 浅粉色', '3', '149.00', '399.00', '30', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('46', '1', '休闲鞋', 'https://images.s.cn/images/goods/20190402/a8803f4d97607b10_210.jpg', 'https://images.s.cn/images/20181030/11a4c96e2102bab8.jpg', 'SKECHERS斯凯奇 休闲鞋 女 白色+珊瑚色', '1', '439.00', '549.00', '35、35.5、36、36.5、37、37.5、38、38.5、39', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('47', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180211/5201b96b360b5ee7_210.jpg', 'https://images.s.cn/images/20180211/f23d5ddce23adfb8.jpg', 'SKECHERS斯凯奇 休闲鞋 男 全黑色', '0', '199.00', '399.00', '27.5、28.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('48', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180211/5a121ef873cfafbf_210.jpg', 'https://images.s.cn/images/20180211/5082621ffe9632fb.jpg', 'SKECHERS斯凯奇 休闲鞋 男 黑色+蓝色+柠檬色', '0', '199.00', '399.00', '27.5、28.5、30', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('49', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180322/bec9c029e305b65f_210.jpg', 'https://images.s.cn/images/20180322/88ad9e91f92bbfe5.jpg', 'SKECHERS斯凯奇 休闲鞋 女 黑色+白色', '0', '269.00', '599.00', '35', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('50', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180322/de4b9e887af56766_210.jpg', 'https://images.s.cn/images/20180322/9a459bee172695a8.jpg', 'SKECHERS斯凯奇 低帮 女 白色', '1', '369.00', '549.00', '39', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('51', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180323/a51d82989a3da61d_210.jpg', 'https://images.s.cn/images/20180323/bb83f6bd97580cd2.jpg', 'SKECHERS斯凯奇 低帮 女 黑色+白色', '0', '329.00', '599.00', '35', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('52', '1', '休闲鞋', 'https://images.s.cn/images/20190717/AA2160-001_210.jpg', 'https://images.s.cn/images/20190717/AA2160-001_210.jpg', 'NIKE耐克 休闲鞋 男 黑+冷灰+白', '36', '379.00', '549.00', '44.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('53', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180330/1706b98ad82c8fc8_210.jpg', 'https://images.s.cn/images/20180330/6deb32cbbb238435.jpg', 'LINING李宁 休闲鞋 男 标准黑+乳白色', '1', '369.00', '499.00', '46', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('54', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180330/966339a3ecc1d2bd_210.jpg', 'https://images.s.cn/images/20180330/5c4494b4b9e371fa.jpg', 'LINING李宁 休闲鞋 女 标准黑+檀黑色', '0', '129.00', '469.00', '35、35.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('55', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180330/93c7e40d16551eee_210.jpg', 'https://images.s.cn/images/20180330/8eff3b4947dd1a25.jpg', 'LINING李宁 休闲鞋 女 标准白', '0', '99.00', '369.00', '', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('56', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180413/2addb91f7a784b11_210.jpg', 'https://images.s.cn/images/20180413/2c554bbc781991fb.jpg', 'SKECHERS斯凯奇 休闲鞋 女 紫色+彩色', '0', '129.00', '169.00', '', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('57', '1', '休闲鞋', 'https://images.s.cn/images/goods/20190612/a7a0facbea35a444_210.jpg', 'https://images.s.cn/images/20190612/82e0f3454c777473.jpg', 'SKECHERS斯凯奇 休闲鞋 女 黑色+桃红色', '9', '239.00', '299.00', '35', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('58', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180418/07f84dccab799fb7_210.jpg', 'https://images.s.cn/images/20180418/931eacf439d7d80c.jpg', 'New BalanceNB 休闲鞋 男 白色+红色', '1', '289.00', '499.00', '38.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('59', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180807/b5c47aff84a38e59_210.jpg', 'https://images.s.cn/images/20180420/09b6917b67fb0083.jpg', 'PUMA彪马 休闲鞋 中性 黑色', '7', '299.00', '969.00', '44', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('60', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180807/0f635787f246ae7d_210.jpg', 'https://images.s.cn/images/20180427/32fd4765e9ac3f4b.jpg', 'NIKE耐克 休闲鞋 女 黑+白+银灰色', '6', '379.00', '549.00', '36.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('61', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180428/c39c20e774f4b92e_210.jpg', 'https://images.s.cn/images/20180428/486482aaa78b465f.jpg', 'LINING李宁 休闲鞋 男 深泽蓝+雪白', '0', '159.00', '269.00', '', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('62', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180508/b6b4301d08b6169b_210.jpg', 'https://images.s.cn/images/20180508/38c48adea5d89920.jpg', 'SKECHERS斯凯奇 低帮 女 白色', '0', '399.00', '699.00', '39', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('63', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180807/6363f872c219b2b9_210.jpg', 'https://images.s.cn/images/20180516/87f044ad63085fd1.jpg', 'PUMA彪马 休闲鞋 中性 黑色', '3', '329.00', '519.00', '43', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('64', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180517/6085c683f664be5f_210.jpg', 'https://images.s.cn/images/20180517/53c066d80a4511f6.jpg', 'New BalanceNB 休闲鞋 女 奶奶灰', '2', '199.00', '999.00', '', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('65', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180517/243e18e6c9d901bd_210.jpg', 'https://images.s.cn/images/20180517/1ab06e8f2b5f14c1.jpg', 'SKECHERS斯凯奇 低帮 男 黑色+浅蓝色', '0', '139.00', '249.00', '22.5、24、25.5、26.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('66', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180531/0ad9f678f10b7b54_210.jpg', 'https://images.s.cn/images/20180531/b9ee673780bc7163.jpg', 'SKECHERS斯凯奇 低帮 女 自然色', '0', '329.00', '699.00', '35', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('67', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180531/099dc24d0849f1ea_210.jpg', 'https://images.s.cn/images/20180531/9122b7f2d759957f.jpg', 'SKECHERS斯凯奇 低帮 女 浅粉色', '0', '429.00', '699.00', '39', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('68', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180531/9cb8743495fbfd83_210.jpg', 'https://images.s.cn/images/20180531/d51f574a55305694.jpg', 'SKECHERS斯凯奇 低帮 女 灰色', '0', '269.00', '369.00', '28.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('69', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180531/062e3df39ee60258_210.jpg', 'https://images.s.cn/images/20180531/c6a240be7de68a2f.jpg', 'SKECHERS斯凯奇 低帮 女 白色', '1', '199.00', '399.00', '27.5、28.5、30', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('70', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180531/c3fdb84ad864819e_210.jpg', 'https://images.s.cn/images/20180531/942dea101dba1c6c.jpg', 'SKECHERS斯凯奇 低帮 男 白色', '0', '199.00', '399.00', '28.5、30', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('71', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180601/08b1e202ea91ffae_210.jpg', 'https://images.s.cn/images/20180601/879ce96cd7bda5da.jpg', 'ASICS亚瑟士 休闲鞋 中性 黑色+黑色', '1', '329.00', '790.00', '40', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('72', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180601/9401e07544bb32f0_210.jpg', 'https://images.s.cn/images/20180601/f7c25f65c6c401b8.jpg', 'ASICS亚瑟士 休闲鞋 中性 奶白+奶白', '1', '319.00', '690.00', '37', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('73', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180611/b5a40d08f92b72ad_210.jpg', 'https://images.s.cn/images/20180611/9681d273b9a05421.jpg', 'SKECHERS斯凯奇 低帮 女 浅灰色+浅绿色', '0', '359.00', '599.00', '39', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('74', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180807/7d82af3f74ea7f67_210.jpg', 'https://images.s.cn/images/20180710/60896d1dc68803ec.jpg', 'SKECHERS斯凯奇 低帮 女 黑色+白色', '1', '359.00', '449.00', '35、36、37、38、39', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('75', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180807/01f6c01b76aaaa3f_210.jpg', 'https://images.s.cn/images/20180710/8751b1c99902db64.jpg', 'SKECHERS斯凯奇 低帮 女 黑色+白色', '2', '299.00', '429.00', '35、35.5、36、36.5、37、37.5、38、38.5、39', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('76', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180807/0105beafa69379a1_210.jpg', 'https://images.s.cn/images/20180710/4ec5fd2ddcf6581e.jpg', 'SKECHERS斯凯奇 低帮 女 黑色', '0', '299.00', '629.00', '36', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('77', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180807/12884354d0f5dee8_210.jpg', 'https://images.s.cn/images/20180710/22e9dd602c4c14f5.jpg', 'SKECHERS斯凯奇 低帮 女 黑色+白色', '0', '299.00', '429.00', '35', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('78', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180807/bff2c84c7665b0d2_210.jpg', 'https://images.s.cn/images/20180710/eff17b8174264107.jpg', 'SKECHERS斯凯奇 低帮 女 白色+灰色+粉色', '1', '569.00', '649.00', '35、36、37、38、39', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('79', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180712/eaa8abd2f4c17949_210.jpg', 'https://images.s.cn/images/20180712/4d11c37cd8ae8cab.jpg', 'NIKE耐克 休闲鞋 女 白+校园红+校园宝蓝', '7', '519.00', '699.00', '36、36.5、37.5、38、38.5、39', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('80', '1', '休闲鞋', 'https://images.s.cn/images/goods/20180712/aff61524623b6f88_210.jpg', 'https://images.s.cn/images/20180712/64cd4894bf0e0e0d.jpg', 'NIKE耐克 休闲鞋 女 玫瑰色+玫瑰色+橡皮浅褐+白', '5', '469.00', '649.00', '35.5、36、36.5、37.5、38、38.5、39', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('81', '2', '跑步鞋', 'https://images.s.cn/images/goods/20160519/48f97c8e2cf755fe_210.jpg', 'https://images.s.cn/images/20160205/b3d3fb986778487a.jpg', 'LINING李宁 跑步鞋 男 新基础黑+白', '35', '239.00', '339.00', '39、39.5、40、41、41.5、42、43、43.5、44、45', 'LINING李宁新款男鞋高达野外跑鞋运动鞋ARDL003', '5.0', '3', '黑色+白色', '李宁');
INSERT INTO `commodity` VALUES ('82', '2', '跑步鞋', 'https://images.s.cn/images/goods/20160726/708649f72ad1d8ae_210.jpg', 'https://images.s.cn/images/20160726/1497412af314b485.jpg', 'LINING李宁 跑步鞋 女 黑+白+微晶灰', '26', '99.00', '369.00', '', 'LINING李宁女子辉煌96复古经典跑鞋女时尚休闲透气运动鞋ARCL022', '5.0', '2', '黑色+白色+灰色', '李宁');
INSERT INTO `commodity` VALUES ('83', '2', '跑步鞋', 'https://images.s.cn/images/goods/20161226/34ae9effc71d440b_210.jpg', 'https://images.s.cn/images/20161226/14f78565ba14390c.jpg', 'SKECHERS斯凯奇 跑步鞋 男 黑色+灰色+红色', '0', '99.00', '369.00', '20.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('84', '2', '跑步鞋', 'https://images.s.cn/images/goods/20170118/2f2a249e07d9d2ce_210.jpg', 'https://images.s.cn/images/20170118/7806f65a197c1470.jpg', 'LINING李宁 跑步鞋 男 探戈红+黑', '1', '219.00', '399.00', '45', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('85', '2', '跑步鞋', 'https://images.s.cn/images/goods/20170122/a18814346fd51fe5_210.jpg', 'https://images.s.cn/images/20170122/0191f441bba8d9f6.jpg', 'SKECHERS斯凯奇 跑步鞋 男 海军蓝色+橘色', '0', '99.00', '339.00', '20.5、21.5、22.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('86', '2', '跑步鞋', 'https://images.s.cn/images/goods/20170803/183f4623b3cbcb78_210.jpg', 'https://images.s.cn/images/20170803/a800bec202e1e257.jpg', 'SKECHERS斯凯奇 跑步鞋 女 黑色+白色', '4', '299.00', '649.00', '35', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('87', '2', '跑步鞋', 'https://images.s.cn/images/goods/20170803/9d565f1068dafbf2_210.jpg', 'https://images.s.cn/images/20170803/628c7e0bcbe5e921.jpg', 'SKECHERS斯凯奇 跑步鞋 男 黑色+灰色', '17', '339.00', '599.00', '43.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('88', '2', '跑步鞋', 'https://images.s.cn/images/goods/20170804/e296871bfbc0d69c_210.jpg', 'https://images.s.cn/images/20170804/217f0664b8dc6e86.jpg', 'LINING李宁 跑步鞋 男 标准黑+铁青灰', '40', '249.00', '539.00', '40、41、43、43.5、44', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('89', '2', '跑步鞋', 'https://images.s.cn/images/goods/20170815/a64913a24d230bf8_210.jpg', 'https://images.s.cn/images/20170815/b28d7e1235c9a4f5.jpg', 'LINING李宁 跑步鞋 男 新基础黑+银色', '31', '159.00', '299.00', '41.5、43.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('90', '2', '跑步鞋', 'https://images.s.cn/images/goods/20170930/525cadaa2df29ed4_210.jpg', 'https://images.s.cn/images/20170930/750bc2d8db5cbe4e.jpg', 'New BalanceNB 跑步鞋 女 黑色', '1', '199.00', '719.00', '35', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('91', '2', '跑步鞋', 'https://images.s.cn/images/goods/20171012/62bbaf52f592bacd_210.jpg', 'https://images.s.cn/images/20171012/61190c333b7bb522.jpg', 'adidas阿迪达斯 跑步鞋 女 一号黑色+亮白', '2', '489.00', '799.00', '36、36.5、37、38、38.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('92', '2', '跑步鞋', 'https://images.s.cn/images/goods/20181107/7e8aa547a5923f7e_210.jpg', 'https://images.s.cn/images/20171018/95a90b76bea017aa.jpg', 'adidas阿迪达斯 跑步鞋 女 一号黑+亮白', '4', '299.00', '699.00', '36、36.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('93', '2', '跑步鞋', 'https://images.s.cn/images/goods/20171024/14c2b75771f7bed9_210.jpg', 'https://images.s.cn/images/20171024/929d05d5f48082fd.jpg', 'LINING李宁 跑步鞋 男 标准黑+藏黑蓝', '2', '139.00', '299.00', '', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('94', '2', '跑步鞋', 'https://images.s.cn/images/goods/20171228/6a784390f4183197_210.jpg', 'https://images.s.cn/images/20171228/93b73d75ee2bd4d4.jpg', 'New BalanceNB 跑步鞋 女 黑色', '2', '289.00', '719.00', '36、36.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('95', '2', '跑步鞋', 'https://images.s.cn/images/goods/20171229/21cdcd3088257e4e_210.jpg', 'https://images.s.cn/images/20171229/8eac68f9fbb5a1b0.jpg', 'adidas阿迪达斯 跑步鞋 女 一号黑色', '1', '669.00', '1299.00', '36、36.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('96', '2', '跑步鞋', 'https://images.s.cn/images/goods/20171229/16f372d8cbacd24c_210.jpg', 'https://images.s.cn/images/20171229/e6fbc4c0449dca63.jpg', 'adidas阿迪达斯 跑步鞋 女 黑色+白色', '2', '389.00', '629.00', '36、36.5、37、38、38.5、39', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('97', '2', '跑步鞋', 'https://images.s.cn/images/goods/20171229/c0497d331ae88759_210.jpg', 'https://images.s.cn/images/20171229/f7a35f5d67e2406b.jpg', 'adidas阿迪达斯 跑步鞋 男 1号黑色+碳黑', '50', '479.00', '899.00', '44', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('98', '2', '跑步鞋', 'https://images.s.cn/images/goods/20180806/947860b072d92c4d_210.jpg', 'https://images.s.cn/images/20180713/8ded516785b464e5.jpg', 'adidas阿迪达斯 跑步鞋 男 黑色+白色', '12', '389.00', '629.00', '39、40、40.5、41、42、42.5、43、44、44.5、45', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('99', '2', '跑步鞋', 'https://images.s.cn/images/goods/20180806/5e4c240850df9c3e_210.jpg', 'https://images.s.cn/images/20190510/8589e20d797e8198.jpg', 'SKECHERS斯凯奇 跑步鞋 女 黑色+白色', '7', '399.00', '499.00', '35、35.5、36、36.5、37、37.5、38、38.5、39', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('100', '2', '跑步鞋', 'https://images.s.cn/images/goods/20190402/8e32f3a32d28c0bf_210.jpg', 'https://images.s.cn/images/20190717/54354-BKW_210.jpg', 'SKECHERS斯凯奇 跑步鞋 男 黑色+白色', '15', '399.00', '499.00', '39.5、40、41、42、42.5、43、43.5、44、44.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('101', '2', '跑步鞋', 'https://images.s.cn/images/goods/20190409/ab2f8bf2eed85b4e_210.jpg', 'https://images.s.cn/images/20180116/d0a22a238996952f.jpg', 'NIKE耐克 跑步鞋 男 黑+白+煤黑', '115', '329.00', '499.00', '42.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('102', '2', '跑步鞋', 'https://images.s.cn/images/20190717/908996-001_210.jpg', 'https://images.s.cn/images/20190717/908996-001_210.jpg', 'NIKE耐克 跑步鞋 女 黑+白+白', '59', '249.00', '499.00', '', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('103', '2', '跑步鞋', 'https://images.s.cn/images/goods/20180205/df115ce2c9ead14a_210.jpg', 'https://images.s.cn/images/20180205/74e78919fab9c462.jpg', 'LINING李宁 跑步鞋 女 标准黑+冷灰', '2', '149.00', '599.00', '37', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('104', '2', '跑步鞋', 'https://images.s.cn/images/goods/20180211/65d672c94d1f3a19_210.jpg', 'https://images.s.cn/images/20180211/8dec349a8200c50d.jpg', 'SKECHERS斯凯奇 跑步鞋 男 黑色+白色', '3', '419.00', '699.00', '43.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('105', '2', '跑步鞋', 'https://images.s.cn/images/goods/20190403/15edc5ec805570cb_210.jpg', 'https://images.s.cn/images/20190403/86e6af844e1d84e9.jpg', 'adidas阿迪达斯 跑步鞋 女 黑色+金属影迹灰', '0', '469.00', '899.00', '36.5、37', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('106', '2', '跑步鞋', 'https://images.s.cn/images/goods/20180315/0bd647ce697816d6_210.jpg', 'https://images.s.cn/images/20180315/2b27920061881d7c.jpg', 'New BalanceNB 跑步鞋 女 黑色+亮粉色', '6', '199.00', '499.00', '', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('107', '2', '跑步鞋', 'https://images.s.cn/images/goods/20181015/dc05d9a0610743f5_210.jpg', 'https://images.s.cn/images/20181015/959fb766225c852b.jpg', 'adidas阿迪达斯 跑步鞋 男 亮白+一度灰', '6', '709.00', '1099.00', '', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('108', '2', '跑步鞋', 'https://images.s.cn/images/goods/20180330/bbfff85d534b4142_210.jpg', 'https://images.s.cn/images/20180330/69c78a856d8fa793.jpg', 'LINING李宁 跑步鞋 男 新基础黑+凝雪灰+基础白', '0', '269.00', '499.00', '44', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('109', '2', '跑步鞋', 'https://images.s.cn/images/goods/20180330/036f3bbaffe93b8b_210.jpg', 'https://images.s.cn/images/20180330/b98e98d8c7efa41f.jpg', 'LINING李宁 跑步鞋 男 夜影蓝+焰橙色+新基础黑', '17', '299.00', '439.00', '', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('110', '2', '跑步鞋', 'https://images.s.cn/images/goods/20180402/b3497e4928463f11_210.jpg', 'https://images.s.cn/images/20180402/0632f259ea68528d.jpg', 'adidas阿迪达斯 跑步鞋 中性 一号黑+FTWR 白+一号黑', '8', '379.00', '699.00', '44', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('111', '2', '跑步鞋', 'https://images.s.cn/images/goods/20180417/9db8883f0f6c02a1_210.jpg', 'https://images.s.cn/images/20180417/a9b613e76d2d5978.jpg', 'SKECHERS斯凯奇 跑步鞋 女 黑色+白色', '0', '269.00', '599.00', '35', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('112', '2', '跑步鞋', 'https://images.s.cn/images/goods/20180806/38cb19df9ec6621f_210.jpg', 'https://images.s.cn/images/20180419/1810bdf58d40125f.jpg', 'SKECHERS斯凯奇 低帮 女 黑色+白色', '2', '439.00', '549.00', '35', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('113', '2', '跑步鞋', 'https://images.s.cn/images/goods/20180807/a6815d6714cff2d8_210.jpg', 'https://images.s.cn/images/20180425/d0684d1817f92515.jpg', 'New BalanceNB 跑步鞋 女 海盐粉', '3', '199.00', '719.00', '36', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('114', '2', '跑步鞋', 'https://images.s.cn/images/goods/20180427/9aac2d66ee6b4b98_210.jpg', 'https://images.s.cn/images/20180427/14f0d2c188266892.jpg', 'NIKE耐克 跑步鞋 男 黑+黑+煤黑', '14', '299.00', '499.00', '40', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('115', '2', '跑步鞋', 'https://images.s.cn/images/goods/20180428/0c1f430eba6223d8_210.jpg', 'https://images.s.cn/images/20180428/96de43e697c2d0ad.jpg', 'New BalanceNB 跑步鞋 女 沉浮粉', '1', '349.00', '559.00', '35、36.5、39', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('116', '2', '跑步鞋', 'https://images.s.cn/images/goods/20180507/c4c7e58d66f33ba9_210.jpg', 'https://images.s.cn/images/20180507/214f708a2ea80cb4.jpg', 'NIKE耐克 跑步鞋 女 黑+白', '27', '299.00', '899.00', '', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('117', '2', '跑步鞋', 'https://images.s.cn/images/goods/20180807/5bb4c606faa2c275_210.jpg', 'https://images.s.cn/images/20180510/69b08cce490bbee3.jpg', 'adidas阿迪达斯 跑步鞋 女 一号黑色+亮白', '4', '329.00', '929.00', '36', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('118', '2', '跑步鞋', 'https://images.s.cn/images/goods/20180604/15c492fef140df54_210.jpg', 'https://images.s.cn/images/20180604/28ec89e8efe6b445.jpg', 'adidas阿迪达斯 跑步鞋 女 一号黑色+碳黑+银金属', '1', '489.00', '1099.00', '36.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('119', '2', '跑步鞋', 'https://images.s.cn/images/goods/20180807/a8663b83250204b4_210.jpg', 'https://images.s.cn/images/20180622/a0ad3778d024981e.jpg', 'adidas阿迪达斯 跑步鞋 女 一号黑色+亮白', '1', '329.00', '799.00', '36', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('120', '2', '跑步鞋', 'https://images.s.cn/images/goods/20180807/398081158a145070_210.jpg', 'https://images.s.cn/images/20180622/f0b02f560ecbfc01.jpg', 'adidas阿迪达斯 跑步鞋 中性 1号黑色+亮白', '104', '469.00', '799.00', '44', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('121', '2', '跑步鞋', 'https://images.s.cn/images/20190717/AQ0326_210.jpg', 'https://images.s.cn/images/20190717/AQ0326_210.jpg', 'adidas阿迪达斯 跑步鞋 男 黑色+亮白', '28', '369.00', '899.00', '39', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('122', '2', '跑步鞋', 'https://images.s.cn/images/goods/20181015/c2ed68a80f567123_210.jpg', 'https://images.s.cn/images/20181015/b433cde65e7c06bc.jpg', 'adidas阿迪达斯 跑步鞋 男 一号黑色', '8', '419.00', '899.00', '40.5、41', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('123', '2', '跑步鞋', 'https://images.s.cn/images/20190717/942855-001_210.jpg', 'https://images.s.cn/images/20190717/942855-001_210.jpg', 'NIKE耐克 跑步鞋 女 黑+白+枪灰黑+石油灰', '24', '399.00', '899.00', '36', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('124', '2', '跑步鞋', 'https://images.s.cn/images/goods/20180704/35631cee8993678c_210.jpg', 'https://images.s.cn/images/20180704/16bfb318bfba9633.jpg', 'adidas阿迪达斯 跑步鞋 女 亮白+一号黑色', '0', '169.00', '529.00', '28', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('125', '2', '跑步鞋', 'https://images.s.cn/images/goods/20180709/ac1088307cce8f5f_210.jpg', 'https://images.s.cn/images/20180709/263b99c044ab44a7.jpg', 'adidas阿迪达斯 跑步鞋 男 一号黑色+四度灰', '0', '599.00', '1299.00', '44', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('126', '2', '跑步鞋', 'https://images.s.cn/images/goods/20180807/a30a2f8ab1312b68_210.jpg', 'https://images.s.cn/images/20180710/297b1159d655e19b.jpg', 'SKECHERS斯凯奇 低帮 女 黑色+白色', '4', '299.00', '599.00', '35、37', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('127', '2', '跑步鞋', 'https://images.s.cn/images/goods/20181015/1f6ebaaf61c1d9ac_210.jpg', 'https://images.s.cn/images/20181015/064ce396c8f008cf.jpg', 'SKECHERS斯凯奇 低帮 女 黑色+白色', '4', '339.00', '629.00', '35', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('128', '2', '跑步鞋', 'https://images.s.cn/images/goods/20180905/8a40bc22543af4b6_210.jpg', 'https://images.s.cn/images/20180905/c20d04b36b448d89.jpg', 'adidas阿迪达斯 跑步鞋 男 黑色+五度灰', '16', '339.00', '699.00', '44.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('129', '2', '跑步鞋', 'https://images.s.cn/images/goods/20180724/efad62ff8fa57570_210.jpg', 'https://images.s.cn/images/20180724/118c0677361dcf8a.jpg', 'LINING李宁 跑步鞋 女 水晶粉', '5', '159.00', '299.00', '35.5、37、37.5、38', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('130', '2', '跑步鞋', 'https://images.s.cn/images/goods/20180824/78ef3f97469ffbf4_210.jpg', 'https://images.s.cn/images/20180905/338dcce4f884ea88.jpg', 'adidas阿迪达斯 跑步鞋 女 碳黑+黑色+暗银金属', '3', '259.00', '699.00', '36', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('131', '2', '跑步鞋', 'https://images.s.cn/images/goods/20180904/29486b1e0ec5add6_210.jpg', 'https://images.s.cn/images/20180904/ea82d1bd2ad45deb.jpg', 'adidas阿迪达斯 跑步鞋 女 黑色+灰色', '1', '549.00', '999.00', '36', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('132', '2', '跑步鞋', 'https://images.s.cn/images/goods/20190428/c1e41798b53aaf59_210.jpg', 'https://images.s.cn/images/20180815/695018f7572627cc.jpg', 'ASICS亚瑟士 跑步鞋 男 黑色+白色', '7', '319.00', '790.00', '39.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('133', '2', '跑步鞋', 'https://images.s.cn/images/goods/20181015/9071fe92c285f338_210.jpg', 'https://images.s.cn/images/20181015/ed0c045220abe2df.jpg', 'ASICS亚瑟士 跑步鞋 女 白色+灰色', '1', '219.00', '690.00', '39.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('134', '2', '跑步鞋', 'https://images.s.cn/images/goods/20180905/9980f04d024743c7_210.jpg', 'https://images.s.cn/images/20190808/a7f4d47c27aba6f5.jpg', 'adidas阿迪达斯 跑步鞋 男 碳黑+黑色', '29', '439.00', '929.00', '39、40、40.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('135', '2', '跑步鞋', 'https://images.s.cn/images/goods/20180925/602d785a699c6531_210.jpg', 'https://images.s.cn/images/20180925/371424412d876a7a.jpg', 'SKECHERS斯凯奇 低帮 女 黑色+灰色', '0', '569.00', '599.00', '38', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('136', '2', '跑步鞋', 'https://images.s.cn/images/goods/20181122/2732da4dec5258bf_210.jpg', 'https://images.s.cn/images/20190808/d4bbc0637cac55c7.jpg', 'adidas阿迪达斯 跑步鞋 男 黑色', '22', '489.00', '899.00', '36、40', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('137', '2', '跑步鞋', 'https://images.s.cn/images/goods/20181018/be7f602dcc5aa3e7_210.jpg', 'https://images.s.cn/images/20180912/dd3d11fd417ff701.jpg', 'SKECHERS斯凯奇 跑步鞋 男 黑色+白色', '1', '439.00', '749.00', '39.5、41、42.5、43.5、44', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('138', '2', '跑步鞋', 'https://images.s.cn/images/goods/20181023/d375c4c208ac6e5f_210.jpg', 'https://images.s.cn/images/20181023/7acc4852f8b0bc2b.jpg', 'adidas阿迪达斯 跑步鞋 女 黑色', '1', '599.00', '1499.00', '37', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('139', '2', '跑步鞋', 'https://images.s.cn/images/goods/20181023/c790858e87193911_210.jpg', 'https://images.s.cn/images/20181023/1eda6ad9dd3e3678.jpg', 'adidas阿迪达斯 跑步鞋 男 暗红', '0', '819.00', '1699.00', '', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('140', '2', '跑步鞋', 'https://images.s.cn/images/goods/20190409/482fa2778a6afc34_210.jpg', 'https://images.s.cn/images/20190717/AA7403-001_210.jpg', 'NIKE耐克 跑步鞋 男 黑+金属银+深灰+煤黑+白', '28', '419.00', '599.00', '42、42.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('141', '2', '跑步鞋', 'https://images.s.cn/images/20190717/AA7400-001_210.jpg', 'https://images.s.cn/images/20190717/AA7400-001_210.jpg', 'NIKE耐克 跑步鞋 男 黑+白+煤黑', '5', '329.00', '669.00', '41、42、44', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('142', '2', '跑步鞋', 'https://images.s.cn/images/goods/20181107/e7bff667d2fd34a3_210.jpg', 'https://images.s.cn/images/20181026/182196908499df9f.jpg', 'NIKE耐克 跑步鞋 女 黑+白+铁架黑', '0', '649.00', '999.00', '36.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('143', '2', '跑步鞋', 'https://images.s.cn/images/goods/20181122/8d01789eac345c25_210.jpg', 'https://images.s.cn/images/20181122/d7a4ca3ce10df296.jpg', 'adidas阿迪达斯 跑步鞋 女 黑色+亮白', '0', '339.00', '829.00', '36', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('144', '2', '跑步鞋', 'https://images.s.cn/images/20190717/BB6583_210.jpg', 'https://images.s.cn/images/20190717/BB6583_210.jpg', 'adidas阿迪达斯 跑步鞋 男 黑色+金属暗灰', '8', '399.00', '869.00', '42、42.5、43、44、44.5', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('145', '2', '跑步鞋', 'https://images.s.cn/images/20190717/AA1636-002_210.jpg', 'https://images.s.cn/images/20190717/AA1636-002_210.jpg', 'NIKE耐克 跑步鞋 男 黑+白+铁架黑', '9', '699.00', '999.00', '42、42.5、43、44', null, null, null, null, null);
INSERT INTO `commodity` VALUES ('146', '2', '跑步鞋', 'https://images.s.cn/images/goods/20181109/6e7ec8e743449ab7_210.jpg', 'https://images.s.cn/images/20181109/7b7f9ff7f1934c6b.jpg', 'LINING李宁 跑步鞋 女 新基础黑+白', '3', '159.00', '299.00', '35、36', null, null, null, null, null);

-- ----------------------------
-- Table structure for commodityclass
-- ----------------------------
DROP TABLE IF EXISTS `commodityclass`;
CREATE TABLE `commodityclass` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commodityclass
-- ----------------------------
INSERT INTO `commodityclass` VALUES ('1', '休闲鞋');
INSERT INTO `commodityclass` VALUES ('2', '跑步鞋');

-- ----------------------------
-- Table structure for shopcart
-- ----------------------------
DROP TABLE IF EXISTS `shopcart`;
CREATE TABLE `shopcart` (
  `username` varchar(50) DEFAULT NULL,
  `commodityId` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `selectSize` varchar(50) DEFAULT NULL,
  `isSelect` tinyint(1) DEFAULT NULL,
  KEY `username` (`username`),
  KEY `commodityId` (`commodityId`),
  CONSTRAINT `commodityId` FOREIGN KEY (`commodityId`) REFERENCES `commodity` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopcart
-- ----------------------------
INSERT INTO `shopcart` VALUES ('qilong', '1', '3', '42', '0');
INSERT INTO `shopcart` VALUES ('qilong', '82', '3', '42', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('qilong', '1635889910@qq.com', 'e10adc3949ba59abbe56e057f20f883e');
