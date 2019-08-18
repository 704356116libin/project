/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : django

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 18/08/2019 20:59:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add choice', 7, 'add_choice');
INSERT INTO `auth_permission` VALUES (26, 'Can change choice', 7, 'change_choice');
INSERT INTO `auth_permission` VALUES (27, 'Can delete choice', 7, 'delete_choice');
INSERT INTO `auth_permission` VALUES (28, 'Can view choice', 7, 'view_choice');
INSERT INTO `auth_permission` VALUES (29, 'Can add question', 8, 'add_question');
INSERT INTO `auth_permission` VALUES (30, 'Can change question', 8, 'change_question');
INSERT INTO `auth_permission` VALUES (31, 'Can delete question', 8, 'delete_question');
INSERT INTO `auth_permission` VALUES (32, 'Can view question', 8, 'view_question');
INSERT INTO `auth_permission` VALUES (33, 'Can add goods class', 9, 'add_goodsclass');
INSERT INTO `auth_permission` VALUES (34, 'Can change goods class', 9, 'change_goodsclass');
INSERT INTO `auth_permission` VALUES (35, 'Can delete goods class', 9, 'delete_goodsclass');
INSERT INTO `auth_permission` VALUES (36, 'Can view goods class', 9, 'view_goodsclass');
INSERT INTO `auth_permission` VALUES (37, 'Can add goods', 10, 'add_goods');
INSERT INTO `auth_permission` VALUES (38, 'Can change goods', 10, 'change_goods');
INSERT INTO `auth_permission` VALUES (39, 'Can delete goods', 10, 'delete_goods');
INSERT INTO `auth_permission` VALUES (40, 'Can view goods', 10, 'view_goods');
INSERT INTO `auth_permission` VALUES (41, 'Can add factory', 11, 'add_factory');
INSERT INTO `auth_permission` VALUES (42, 'Can change factory', 11, 'change_factory');
INSERT INTO `auth_permission` VALUES (43, 'Can delete factory', 11, 'delete_factory');
INSERT INTO `auth_permission` VALUES (44, 'Can view factory', 11, 'view_factory');
INSERT INTO `auth_permission` VALUES (45, 'Can add goods factory', 12, 'add_goodsfactory');
INSERT INTO `auth_permission` VALUES (46, 'Can change goods factory', 12, 'change_goodsfactory');
INSERT INTO `auth_permission` VALUES (47, 'Can delete goods factory', 12, 'delete_goodsfactory');
INSERT INTO `auth_permission` VALUES (48, 'Can view goods factory', 12, 'view_goodsfactory');
INSERT INTO `auth_permission` VALUES (49, 'Can add demo', 13, 'add_demo');
INSERT INTO `auth_permission` VALUES (50, 'Can change demo', 13, 'change_demo');
INSERT INTO `auth_permission` VALUES (51, 'Can delete demo', 13, 'delete_demo');
INSERT INTO `auth_permission` VALUES (52, 'Can view demo', 13, 'view_demo');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$120000$CcudPlKWtBOk$yK+Z2CzLEy5perXK4nuBzR5vl7XjHyI6wsTGuNGgQgw=', '2019-03-07 12:56:30.636843', 1, 'bin', '', '', '704356116@qq.com', 1, 1, '2019-03-07 12:56:21.312801');
INSERT INTO `auth_user` VALUES (2, 'pbkdf2_sha256$120000$Dog5Iv5Qj7tU$7zy7kYrcLU2j5M4RPlFX6WUFlKRVCv2YrDjMUGHjkSA=', '2019-08-18 12:44:50.930346', 1, 'libin', '', '', '704356116@qq.com', 1, 1, '2019-07-03 13:42:29.306247');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2019-07-04 13:36:02.494575', '2', '平板1\n', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 9, 2);
INSERT INTO `django_admin_log` VALUES (2, '2019-07-07 02:54:49.620675', '3', 'iphone', 1, '[{\"added\": {}}]', 9, 2);
INSERT INTO `django_admin_log` VALUES (3, '2019-07-07 02:55:50.721956', '1', 'Goods object (1)', 1, '[{\"added\": {}}]', 10, 2);
INSERT INTO `django_admin_log` VALUES (4, '2019-07-08 13:27:56.460446', '1', '华为', 1, '[{\"added\": {}}]', 11, 2);
INSERT INTO `django_admin_log` VALUES (5, '2019-07-08 13:28:23.943424', '1', 'GoodsFactory object (1)', 1, '[{\"added\": {}}]', 12, 2);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (13, 'honor', 'demo');
INSERT INTO `django_content_type` VALUES (11, 'honor', 'factory');
INSERT INTO `django_content_type` VALUES (10, 'honor', 'goods');
INSERT INTO `django_content_type` VALUES (9, 'honor', 'goodsclass');
INSERT INTO `django_content_type` VALUES (12, 'honor', 'goodsfactory');
INSERT INTO `django_content_type` VALUES (7, 'polls', 'choice');
INSERT INTO `django_content_type` VALUES (8, 'polls', 'question');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-02-25 13:59:56.984062');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2019-02-25 13:59:57.603913');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2019-02-25 13:59:57.760494');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2019-02-25 13:59:57.770467');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2019-02-25 13:59:57.785426');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2019-02-25 13:59:57.908099');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2019-02-25 13:59:57.981901');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2019-02-25 13:59:58.081634');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2019-02-25 13:59:58.091611');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2019-02-25 13:59:58.154440');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2019-02-25 13:59:58.157432');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2019-02-25 13:59:58.167407');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2019-02-25 13:59:58.245199');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2019-02-25 13:59:58.318999');
INSERT INTO `django_migrations` VALUES (15, 'polls', '0001_initial', '2019-02-25 13:59:58.486551');
INSERT INTO `django_migrations` VALUES (16, 'sessions', '0001_initial', '2019-02-25 13:59:58.535429');
INSERT INTO `django_migrations` VALUES (23, 'honor', '0001_update_honor_goodsclass_table', '2019-07-06 14:16:55.665452');
INSERT INTO `django_migrations` VALUES (24, 'honor', '0002_update_honor_goodsclass_table', '2019-07-06 14:16:55.680413');
INSERT INTO `django_migrations` VALUES (25, 'honor', '0003_add_honor_goods_table', '2019-07-07 02:41:39.367355');
INSERT INTO `django_migrations` VALUES (26, 'honor', '0004_alter_honor_goods_class_table', '2019-07-07 02:48:36.614763');
INSERT INTO `django_migrations` VALUES (27, 'honor', '0005_alter_honor_goods_head_img_table', '2019-07-07 02:58:40.053679');
INSERT INTO `django_migrations` VALUES (28, 'honor', '0006_alter_honor_goods_class_column_name_table', '2019-07-07 03:04:15.985374');
INSERT INTO `django_migrations` VALUES (29, 'honor', '0007_alter_honor_goods_class_column_name', '2019-07-07 03:05:01.466802');
INSERT INTO `django_migrations` VALUES (30, 'honor', '0008_alter_honor_goods_class_column_name', '2019-07-07 03:05:53.222294');
INSERT INTO `django_migrations` VALUES (31, 'honor', '0009_add_factory_table', '2019-07-08 13:26:26.489895');
INSERT INTO `django_migrations` VALUES (32, 'honor', '0010_alter_goods_model_table', '2019-07-08 14:01:52.053280');
INSERT INTO `django_migrations` VALUES (33, 'honor', '0011_add_demo_model_table', '2019-07-11 13:45:49.855390');
INSERT INTO `django_migrations` VALUES (34, 'honor', '0012_rename_honor_tables', '2019-07-11 14:11:38.721854');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('cjca3ldbsaabc5oqc1wkdbnwux0xneac', 'Yjg2YzlmMjc5YjcyMWYxZjY5NThlNjZlYjM4MDdhZGRhMGZiZDA5Nzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YTdkMjNjOTMzYTFhMTM3MGFkMjAyYzI1Y2JmMmU0ZDc2NDAzM2E1In0=', '2019-07-17 13:43:00.605517');
INSERT INTO `django_session` VALUES ('d7x8xedtrgj61vor19uhbbyeowpujpdt', 'NjA0NWRjMzdiZTQwYjBiNGE0MDZjYzYyYzY4OWQ2ZmU3MTdjNzlhYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwOTE4MThjMDliODhmMWYxZWFiZDY2N2U2NjVkMmY5YTE5YzA0ZDFlIn0=', '2019-03-21 12:56:30.640833');
INSERT INTO `django_session` VALUES ('k6n9qbjzn3rpyhqdea3q0z26r53858y5', 'Yjg2YzlmMjc5YjcyMWYxZjY5NThlNjZlYjM4MDdhZGRhMGZiZDA5Nzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YTdkMjNjOTMzYTFhMTM3MGFkMjAyYzI1Y2JmMmU0ZDc2NDAzM2E1In0=', '2019-09-01 12:44:50.934336');

-- ----------------------------
-- Table structure for goods_factory
-- ----------------------------
DROP TABLE IF EXISTS `goods_factory`;
CREATE TABLE `goods_factory`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_joined` date NOT NULL,
  `factory_id_id` int(11) NOT NULL,
  `goods_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `honor_goodsfactory_factory_id_id_3898c214_fk_honor_factory_id`(`factory_id_id`) USING BTREE,
  INDEX `honor_goodsfactory_goods_id_id_b4f74835_fk_honor_goods_id`(`goods_id_id`) USING BTREE,
  CONSTRAINT `honor_goodsfactory_factory_id_id_3898c214_fk_honor_factory_id` FOREIGN KEY (`factory_id_id`) REFERENCES `honor_factory` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `honor_goodsfactory_goods_id_id_b4f74835_fk_honor_goods_id` FOREIGN KEY (`goods_id_id`) REFERENCES `honor_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_factory
-- ----------------------------
INSERT INTO `goods_factory` VALUES (1, '2019-07-09', 1, 1);
INSERT INTO `goods_factory` VALUES (2, '2019-07-08', 4, 1);
INSERT INTO `goods_factory` VALUES (3, '2019-07-08', 4, 2);

-- ----------------------------
-- Table structure for honor_factory
-- ----------------------------
DROP TABLE IF EXISTS `honor_factory`;
CREATE TABLE `honor_factory`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of honor_factory
-- ----------------------------
INSERT INTO `honor_factory` VALUES (1, '华为');
INSERT INTO `honor_factory` VALUES (4, '苹果');

-- ----------------------------
-- Table structure for honor_goods
-- ----------------------------
DROP TABLE IF EXISTS `honor_goods`;
CREATE TABLE `honor_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `head_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `goodclass_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `honor_goods_goodclass_id_adc190e0_fk_honor_goodsclass_id`(`goodclass_id`) USING BTREE,
  CONSTRAINT `honor_goods_goodclass_id_adc190e0_fk_honor_goodsclass_id` FOREIGN KEY (`goodclass_id`) REFERENCES `honor_goods_class` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of honor_goods
-- ----------------------------
INSERT INTO `honor_goods` VALUES (1, 'iphone 8', 4999, 100, 'iphone 8 有着强大得功能', '', 3);
INSERT INTO `honor_goods` VALUES (2, 'iphone x', 7999, 1000, 'iphone x 有着非常牛x的功能', '', 1);
INSERT INTO `honor_goods` VALUES (3, '华为 P30', 8999, 1000, '华为 P30 有着非常牛x的功能', '', 1);

-- ----------------------------
-- Table structure for honor_goods_class
-- ----------------------------
DROP TABLE IF EXISTS `honor_goods_class`;
CREATE TABLE `honor_goods_class`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `is_show` int(11) NOT NULL,
  `sort` smallint(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of honor_goods_class
-- ----------------------------
INSERT INTO `honor_goods_class` VALUES (1, '手机', 1, 0, '2019-07-07 02:49:45.199046', '2019-07-07 02:49:45.199046', 0);
INSERT INTO `honor_goods_class` VALUES (2, '平板', 1, 1, '2019-07-07 02:49:52.067635', '2019-07-07 02:49:52.067635', 0);
INSERT INTO `honor_goods_class` VALUES (3, 'iphone', 1, 3, '2019-07-07 02:54:42.000000', '2019-07-07 02:54:48.000000', 0);

-- ----------------------------
-- Table structure for polls_choice
-- ----------------------------
DROP TABLE IF EXISTS `polls_choice`;
CREATE TABLE `polls_choice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `choice_text` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `votes` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `polls_choice_question_id_c5b4b260_fk_polls_question_id`(`question_id`) USING BTREE,
  CONSTRAINT `polls_choice_question_id_c5b4b260_fk_polls_question_id` FOREIGN KEY (`question_id`) REFERENCES `polls_question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of polls_choice
-- ----------------------------
INSERT INTO `polls_choice` VALUES (1, '12124341', 16, 1);

-- ----------------------------
-- Table structure for polls_question
-- ----------------------------
DROP TABLE IF EXISTS `polls_question`;
CREATE TABLE `polls_question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of polls_question
-- ----------------------------
INSERT INTO `polls_question` VALUES (1, 'this is content', '2019-02-25 14:00:05.521808');
INSERT INTO `polls_question` VALUES (2, 'this is content', '2019-02-25 14:00:08.719016');
INSERT INTO `polls_question` VALUES (3, 'this is content', '2019-02-25 14:00:08.917490');
INSERT INTO `polls_question` VALUES (4, 'this is content', '2019-02-25 14:00:09.048138');

SET FOREIGN_KEY_CHECKS = 1;
