DROP DATABASE IF EXISTS `ssm_crud`;
CREATE DATABASE ssm_crud;
USE ssm_crud;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tbl_dept`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dept`;
CREATE TABLE `tbl_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_dept
-- ----------------------------
INSERT INTO `tbl_dept` VALUES ('1', '开发部');
INSERT INTO `tbl_dept` VALUES ('2', '测试部');
INSERT INTO `tbl_dept` VALUES ('3', '设计部');
INSERT INTO `tbl_dept` VALUES ('4', '运维部');

-- ----------------------------
-- Table structure for `tbl_emp`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_emp`;
CREATE TABLE `tbl_emp` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(255) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `d_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `fk_emp_dept` (`d_id`),
  CONSTRAINT `fk_emp_dept` FOREIGN KEY (`d_id`) REFERENCES `tbl_dept` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_emp
-- ----------------------------
INSERT INTO `tbl_emp` VALUES ('1', '小王', 'M', '123456@qq.com', '2');
INSERT INTO `tbl_emp` VALUES ('2', '小张', 'F', '234567@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('3', '小曾', 'F', '345678@qq.com', '3');
INSERT INTO `tbl_emp` VALUES ('4', '小吴', 'F', '456789@qq.com', '4');
INSERT INTO `tbl_emp` VALUES ('5', '小龚', 'M', '567890@163.com', '1');
INSERT INTO `tbl_emp` VALUES ('6', '小廖', 'M', '13579@163.com', '4');
INSERT INTO `tbl_emp` VALUES ('7', '小申', 'F', '24680@163.com', '2');
INSERT INTO `tbl_emp` VALUES ('8', '小马', 'M', '09876@qq.com', '3');
INSERT INTO `tbl_emp` VALUES ('9', '小李', 'F', '98765@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('10', '小边', 'M', '87654@163.com', '3');
INSERT INTO `tbl_emp` VALUES ('11', '小白', 'M', '76543@163.com', '2');
INSERT INTO `tbl_emp` VALUES ('12', '小刘', 'F', '65432@qq.com', '4');
INSERT INTO `tbl_emp` VALUES ('13', '小欧', 'F', '54321@qq.com', '3');
INSERT INTO `tbl_emp` VALUES ('14', '小涂', 'F', '08642@163.com', '1');
INSERT INTO `tbl_emp` VALUES ('15', '小郑', 'F', '97531@163.com', '2');
INSERT INTO `tbl_emp` VALUES ('16', '小何', 'F', '14701@163.com', '4');
INSERT INTO `tbl_emp` VALUES ('17', '小程', 'F', '25825@163.com', '1');
INSERT INTO `tbl_emp` VALUES ('18', '小易', 'M', '36936@163.com', '1');