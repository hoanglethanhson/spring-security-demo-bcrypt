/*
 Navicat Premium Data Transfer

 Source Server         : spring_security
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : spring_security_demo_bcrypt

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 27/02/2020 17:36:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for authorities
-- ----------------------------
DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities`  (
  `username` varchar(50) CHARACTER SET latin1  NOT NULL,
  `authority` varchar(50) CHARACTER SET latin1  NOT NULL,
  UNIQUE INDEX `authorities_idx_1`(`username`, `authority`) USING BTREE,
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of authorities
-- ----------------------------
INSERT INTO `authorities` VALUES ('john', 'ROLE_EMPLOYEE');
INSERT INTO `authorities` VALUES ('mary', 'ROLE_EMPLOYEE');
INSERT INTO `authorities` VALUES ('mary', 'ROLE_MANAGER');
INSERT INTO `authorities` VALUES ('susan', 'ROLE_ADMIN');
INSERT INTO `authorities` VALUES ('susan', 'ROLE_EMPLOYEE');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET latin1  NOT NULL,
  `password` char(68) CHARACTER SET latin1  NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('john', '{bcrypt}$2a$04$eFytJDGtjbThXa80FyOOBuFdK2IwjyWefYkMpiBEFlpBwDH.5PM0K', 1);
INSERT INTO `users` VALUES ('mary', '{bcrypt}$2a$04$eFytJDGtjbThXa80FyOOBuFdK2IwjyWefYkMpiBEFlpBwDH.5PM0K', 1);
INSERT INTO `users` VALUES ('susan', '{bcrypt}$2a$04$eFytJDGtjbThXa80FyOOBuFdK2IwjyWefYkMpiBEFlpBwDH.5PM0K', 1);

SET FOREIGN_KEY_CHECKS = 1;
