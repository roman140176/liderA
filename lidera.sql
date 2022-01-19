-- MySQL dump 10.13  Distrib 5.7.32, for Linux (x86_64)
--
-- Host: localhost    Database: lidera
-- ------------------------------------------------------
-- Server version	5.7.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `yupe_blog_blog`
--

DROP TABLE IF EXISTS `yupe_blog_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_blog_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `description` text,
  `icon` varchar(250) NOT NULL DEFAULT '',
  `slug` varchar(150) NOT NULL,
  `lang` char(2) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1',
  `create_user_id` int(11) NOT NULL,
  `update_user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `member_status` int(11) NOT NULL DEFAULT '1',
  `post_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_blog_blog_slug_lang` (`slug`,`lang`),
  KEY `ix_yupe_blog_blog_create_user` (`create_user_id`),
  KEY `ix_yupe_blog_blog_update_user` (`update_user_id`),
  KEY `ix_yupe_blog_blog_status` (`status`),
  KEY `ix_yupe_blog_blog_type` (`type`),
  KEY `ix_yupe_blog_blog_create_date` (`create_time`),
  KEY `ix_yupe_blog_blog_update_date` (`update_time`),
  KEY `ix_yupe_blog_blog_lang` (`lang`),
  KEY `ix_yupe_blog_blog_slug` (`slug`),
  KEY `ix_yupe_blog_blog_category_id` (`category_id`),
  CONSTRAINT `fk_yupe_blog_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `yupe_category_category` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yupe_blog_blog_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `yupe_user_user` (`id`),
  CONSTRAINT `fk_yupe_blog_blog_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `yupe_user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_blog_blog`
--

LOCK TABLES `yupe_blog_blog` WRITE;
/*!40000 ALTER TABLE `yupe_blog_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_blog_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_blog_post`
--

DROP TABLE IF EXISTS `yupe_blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_blog_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL,
  `create_user_id` int(11) NOT NULL,
  `update_user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `publish_time` int(11) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `lang` char(2) DEFAULT NULL,
  `title` varchar(250) NOT NULL,
  `quote` text,
  `content` text NOT NULL,
  `link` varchar(250) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `comment_status` int(11) NOT NULL DEFAULT '1',
  `create_user_ip` varchar(20) NOT NULL,
  `access_type` int(11) NOT NULL DEFAULT '1',
  `meta_keywords` varchar(250) NOT NULL DEFAULT '',
  `meta_description` varchar(250) NOT NULL DEFAULT '',
  `image` varchar(300) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `meta_title` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_blog_post_lang_slug` (`slug`,`lang`),
  KEY `ix_yupe_blog_post_blog_id` (`blog_id`),
  KEY `ix_yupe_blog_post_create_user_id` (`create_user_id`),
  KEY `ix_yupe_blog_post_update_user_id` (`update_user_id`),
  KEY `ix_yupe_blog_post_status` (`status`),
  KEY `ix_yupe_blog_post_access_type` (`access_type`),
  KEY `ix_yupe_blog_post_comment_status` (`comment_status`),
  KEY `ix_yupe_blog_post_lang` (`lang`),
  KEY `ix_yupe_blog_post_slug` (`slug`),
  KEY `ix_yupe_blog_post_publish_date` (`publish_time`),
  KEY `ix_yupe_blog_post_category_id` (`category_id`),
  CONSTRAINT `fk_yupe_blog_post_blog` FOREIGN KEY (`blog_id`) REFERENCES `yupe_blog_blog` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yupe_blog_post_category_id` FOREIGN KEY (`category_id`) REFERENCES `yupe_category_category` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yupe_blog_post_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yupe_blog_post_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `yupe_user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_blog_post`
--

LOCK TABLES `yupe_blog_post` WRITE;
/*!40000 ALTER TABLE `yupe_blog_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_blog_post_to_tag`
--

DROP TABLE IF EXISTS `yupe_blog_post_to_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_blog_post_to_tag` (
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `ix_yupe_blog_post_to_tag_post_id` (`post_id`),
  KEY `ix_yupe_blog_post_to_tag_tag_id` (`tag_id`),
  CONSTRAINT `fk_yupe_blog_post_to_tag_post_id` FOREIGN KEY (`post_id`) REFERENCES `yupe_blog_post` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yupe_blog_post_to_tag_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `yupe_blog_tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_blog_post_to_tag`
--

LOCK TABLES `yupe_blog_post_to_tag` WRITE;
/*!40000 ALTER TABLE `yupe_blog_post_to_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_blog_post_to_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_blog_tag`
--

DROP TABLE IF EXISTS `yupe_blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_blog_tag_tag_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_blog_tag`
--

LOCK TABLES `yupe_blog_tag` WRITE;
/*!40000 ALTER TABLE `yupe_blog_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_blog_user_to_blog`
--

DROP TABLE IF EXISTS `yupe_blog_user_to_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_blog_user_to_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `role` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1',
  `note` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_blog_user_to_blog_blog_user_to_blog_u_b` (`user_id`,`blog_id`),
  KEY `ix_yupe_blog_user_to_blog_blog_user_to_blog_user_id` (`user_id`),
  KEY `ix_yupe_blog_user_to_blog_blog_user_to_blog_id` (`blog_id`),
  KEY `ix_yupe_blog_user_to_blog_blog_user_to_blog_status` (`status`),
  KEY `ix_yupe_blog_user_to_blog_blog_user_to_blog_role` (`role`),
  CONSTRAINT `fk_yupe_blog_user_to_blog_blog_user_to_blog_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `yupe_blog_blog` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yupe_blog_user_to_blog_blog_user_to_blog_user_id` FOREIGN KEY (`user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_blog_user_to_blog`
--

LOCK TABLES `yupe_blog_user_to_blog` WRITE;
/*!40000 ALTER TABLE `yupe_blog_user_to_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_blog_user_to_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_category_category`
--

DROP TABLE IF EXISTS `yupe_category_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_category_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(150) NOT NULL,
  `lang` char(2) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `short_description` text,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_category_category_alias_lang` (`slug`,`lang`),
  KEY `ix_yupe_category_category_parent_id` (`parent_id`),
  KEY `ix_yupe_category_category_status` (`status`),
  CONSTRAINT `fk_yupe_category_category_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `yupe_category_category` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_category_category`
--

LOCK TABLES `yupe_category_category` WRITE;
/*!40000 ALTER TABLE `yupe_category_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_category_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_comment_comment`
--

DROP TABLE IF EXISTS `yupe_comment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_comment_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `model` varchar(100) NOT NULL,
  `model_id` int(11) NOT NULL,
  `url` varchar(150) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `text` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(20) DEFAULT NULL,
  `level` int(11) DEFAULT '0',
  `root` int(11) DEFAULT '0',
  `lft` int(11) DEFAULT '0',
  `rgt` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ix_yupe_comment_comment_status` (`status`),
  KEY `ix_yupe_comment_comment_model_model_id` (`model`,`model_id`),
  KEY `ix_yupe_comment_comment_model` (`model`),
  KEY `ix_yupe_comment_comment_model_id` (`model_id`),
  KEY `ix_yupe_comment_comment_user_id` (`user_id`),
  KEY `ix_yupe_comment_comment_parent_id` (`parent_id`),
  KEY `ix_yupe_comment_comment_level` (`level`),
  KEY `ix_yupe_comment_comment_root` (`root`),
  KEY `ix_yupe_comment_comment_lft` (`lft`),
  KEY `ix_yupe_comment_comment_rgt` (`rgt`),
  CONSTRAINT `fk_yupe_comment_comment_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `yupe_comment_comment` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yupe_comment_comment_user_id` FOREIGN KEY (`user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_comment_comment`
--

LOCK TABLES `yupe_comment_comment` WRITE;
/*!40000 ALTER TABLE `yupe_comment_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_comment_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_contentblock_content_block`
--

DROP TABLE IF EXISTS `yupe_contentblock_content_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_contentblock_content_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `code` varchar(100) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `content` text NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `title_short` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_contentblock_content_block_code` (`code`),
  KEY `ix_yupe_contentblock_content_block_type` (`type`),
  KEY `ix_yupe_contentblock_content_block_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_contentblock_content_block`
--

LOCK TABLES `yupe_contentblock_content_block` WRITE;
/*!40000 ALTER TABLE `yupe_contentblock_content_block` DISABLE KEYS */;
INSERT INTO `yupe_contentblock_content_block` VALUES (1,'Каталог продукции','katalog-produkcii',4,'','<p>Компания &laquo;ЛидерА&raquo; является не только поставщиком<br />медицинских расходных материалов в государственные <br />и частные медицинские учреждения, но и надежным<br />партнером, который индивидуально подходит<br />к потребностям заказчика/фирм',NULL,1,'','d980ff2a65bccdc6f8697b6cc4e2952b.pdf');
/*!40000 ALTER TABLE `yupe_contentblock_content_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_customfield_group`
--

DROP TABLE IF EXISTS `yupe_customfield_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_customfield_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `module_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_customfield_group`
--

LOCK TABLES `yupe_customfield_group` WRITE;
/*!40000 ALTER TABLE `yupe_customfield_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_customfield_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_dictionary_dictionary_data`
--

DROP TABLE IF EXISTS `yupe_dictionary_dictionary_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_dictionary_dictionary_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `name` varchar(250) NOT NULL,
  `value` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_dictionary_dictionary_data_code_unique` (`code`),
  KEY `ix_yupe_dictionary_dictionary_data_group_id` (`group_id`),
  KEY `ix_yupe_dictionary_dictionary_data_create_user_id` (`create_user_id`),
  KEY `ix_yupe_dictionary_dictionary_data_update_user_id` (`update_user_id`),
  KEY `ix_yupe_dictionary_dictionary_data_status` (`status`),
  CONSTRAINT `fk_yupe_dictionary_dictionary_data_create_user_id` FOREIGN KEY (`create_user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yupe_dictionary_dictionary_data_data_group_id` FOREIGN KEY (`group_id`) REFERENCES `yupe_dictionary_dictionary_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yupe_dictionary_dictionary_data_update_user_id` FOREIGN KEY (`update_user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_dictionary_dictionary_data`
--

LOCK TABLES `yupe_dictionary_dictionary_data` WRITE;
/*!40000 ALTER TABLE `yupe_dictionary_dictionary_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_dictionary_dictionary_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_dictionary_dictionary_group`
--

DROP TABLE IF EXISTS `yupe_dictionary_dictionary_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_dictionary_dictionary_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_dictionary_dictionary_group_code` (`code`),
  KEY `ix_yupe_dictionary_dictionary_group_create_user_id` (`create_user_id`),
  KEY `ix_yupe_dictionary_dictionary_group_update_user_id` (`update_user_id`),
  CONSTRAINT `fk_yupe_dictionary_dictionary_group_create_user_id` FOREIGN KEY (`create_user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yupe_dictionary_dictionary_group_update_user_id` FOREIGN KEY (`update_user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_dictionary_dictionary_group`
--

LOCK TABLES `yupe_dictionary_dictionary_group` WRITE;
/*!40000 ALTER TABLE `yupe_dictionary_dictionary_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_dictionary_dictionary_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_feedback_feedback`
--

DROP TABLE IF EXISTS `yupe_feedback_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_feedback_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `answer_user` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(150) DEFAULT NULL,
  `theme` varchar(250) NOT NULL,
  `text` text NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `answer` text NOT NULL,
  `answer_time` datetime DEFAULT NULL,
  `is_faq` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_yupe_feedback_feedback_category` (`category_id`),
  KEY `ix_yupe_feedback_feedback_type` (`type`),
  KEY `ix_yupe_feedback_feedback_status` (`status`),
  KEY `ix_yupe_feedback_feedback_isfaq` (`is_faq`),
  KEY `ix_yupe_feedback_feedback_answer_user` (`answer_user`),
  CONSTRAINT `fk_yupe_feedback_feedback_answer_user` FOREIGN KEY (`answer_user`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yupe_feedback_feedback_category` FOREIGN KEY (`category_id`) REFERENCES `yupe_category_category` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_feedback_feedback`
--

LOCK TABLES `yupe_feedback_feedback` WRITE;
/*!40000 ALTER TABLE `yupe_feedback_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_feedback_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_gallery_gallery`
--

DROP TABLE IF EXISTS `yupe_gallery_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_gallery_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `description` text,
  `status` int(11) NOT NULL DEFAULT '1',
  `owner` int(11) DEFAULT NULL,
  `preview_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '1',
  `image` varchar(255) DEFAULT NULL,
  `names` tinyint(1) NOT NULL DEFAULT '0',
  `pic_name` tinyint(1) NOT NULL DEFAULT '0',
  `self_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_yupe_gallery_gallery_status` (`status`),
  KEY `ix_yupe_gallery_gallery_owner` (`owner`),
  KEY `fk_yupe_gallery_gallery_gallery_preview_to_image` (`preview_id`),
  KEY `fk_yupe_gallery_gallery_gallery_to_category` (`category_id`),
  KEY `ix_yupe_gallery_gallery_sort` (`sort`),
  CONSTRAINT `fk_yupe_gallery_gallery_gallery_preview_to_image` FOREIGN KEY (`preview_id`) REFERENCES `yupe_image_image` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yupe_gallery_gallery_gallery_to_category` FOREIGN KEY (`category_id`) REFERENCES `yupe_category_category` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yupe_gallery_gallery_owner` FOREIGN KEY (`owner`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_gallery_gallery`
--

LOCK TABLES `yupe_gallery_gallery` WRITE;
/*!40000 ALTER TABLE `yupe_gallery_gallery` DISABLE KEYS */;
INSERT INTO `yupe_gallery_gallery` VALUES (1,'Верхний слайдер на главной','<p>Верхний слайдер на главной</p>',1,1,NULL,NULL,1,NULL,0,0,NULL);
/*!40000 ALTER TABLE `yupe_gallery_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_gallery_image_to_gallery`
--

DROP TABLE IF EXISTS `yupe_gallery_image_to_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_gallery_image_to_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) NOT NULL,
  `gallery_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_gallery_image_to_gallery_gallery_to_image` (`image_id`,`gallery_id`),
  KEY `ix_yupe_gallery_image_to_gallery_gallery_to_image_image` (`image_id`),
  KEY `ix_yupe_gallery_image_to_gallery_gallery_to_image_gallery` (`gallery_id`),
  CONSTRAINT `fk_yupe_gallery_image_to_gallery_gallery_to_image_gallery` FOREIGN KEY (`gallery_id`) REFERENCES `yupe_gallery_gallery` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yupe_gallery_image_to_gallery_gallery_to_image_image` FOREIGN KEY (`image_id`) REFERENCES `yupe_image_image` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_gallery_image_to_gallery`
--

LOCK TABLES `yupe_gallery_image_to_gallery` WRITE;
/*!40000 ALTER TABLE `yupe_gallery_image_to_gallery` DISABLE KEYS */;
INSERT INTO `yupe_gallery_image_to_gallery` VALUES (6,6,1,'2021-06-03 11:17:55',1),(7,7,1,'2021-06-03 11:17:58',2),(8,8,1,'2021-06-03 11:18:02',3);
/*!40000 ALTER TABLE `yupe_gallery_image_to_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_image_image`
--

DROP TABLE IF EXISTS `yupe_image_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_image_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `description` text,
  `file` varchar(250) NOT NULL,
  `create_time` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `alt` varchar(250) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `sort` int(11) NOT NULL DEFAULT '1',
  `data` longtext,
  PRIMARY KEY (`id`),
  KEY `ix_yupe_image_image_status` (`status`),
  KEY `ix_yupe_image_image_user` (`user_id`),
  KEY `ix_yupe_image_image_type` (`type`),
  KEY `ix_yupe_image_image_category_id` (`category_id`),
  KEY `fk_yupe_image_image_parent_id` (`parent_id`),
  CONSTRAINT `fk_yupe_image_image_category_id` FOREIGN KEY (`category_id`) REFERENCES `yupe_category_category` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yupe_image_image_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `yupe_image_image` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yupe_image_image_user_id` FOREIGN KEY (`user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_image_image`
--

LOCK TABLES `yupe_image_image` WRITE;
/*!40000 ALTER TABLE `yupe_image_image` DISABLE KEYS */;
INSERT INTO `yupe_image_image` VALUES (6,NULL,NULL,'i.jpg','','51a97a8d7efc4ded17fcc6d5bdc7fd50.jpg','2021-06-03 11:17:55',1,'i.jpg',0,1,1,NULL),(7,NULL,NULL,'i.jpg','','9b7a0c5d9437cdad3f48004ad925d35a.jpg','2021-06-03 11:17:58',1,'i.jpg',0,1,2,NULL),(8,NULL,NULL,'i.jpg','','0c67c5623c6b31660771b536f0dea3ce.jpg','2021-06-03 11:18:02',1,'i.jpg',0,1,3,NULL);
/*!40000 ALTER TABLE `yupe_image_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_mail_mail_event`
--

DROP TABLE IF EXISTS `yupe_mail_mail_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_mail_mail_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_mail_mail_event_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_mail_mail_event`
--

LOCK TABLES `yupe_mail_mail_event` WRITE;
/*!40000 ALTER TABLE `yupe_mail_mail_event` DISABLE KEYS */;
INSERT INTO `yupe_mail_mail_event` VALUES (1,'napisat-nam','Написать нам','');
/*!40000 ALTER TABLE `yupe_mail_mail_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_mail_mail_template`
--

DROP TABLE IF EXISTS `yupe_mail_mail_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_mail_mail_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(150) NOT NULL,
  `event_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text,
  `from` varchar(150) NOT NULL,
  `to` varchar(150) NOT NULL,
  `theme` text NOT NULL,
  `body` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_mail_mail_template_code` (`code`),
  KEY `ix_yupe_mail_mail_template_status` (`status`),
  KEY `ix_yupe_mail_mail_template_event_id` (`event_id`),
  CONSTRAINT `fk_yupe_mail_mail_template_event_id` FOREIGN KEY (`event_id`) REFERENCES `yupe_mail_mail_event` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_mail_mail_template`
--

LOCK TABLES `yupe_mail_mail_template` WRITE;
/*!40000 ALTER TABLE `yupe_mail_mail_template` DISABLE KEYS */;
INSERT INTO `yupe_mail_mail_template` VALUES (1,'napisat-nam',1,'Написать нам','','www-data@localhost.localdomain','gordeew.r2015@yandex.ru','Сообщение с сайта','<table style=\"border-collapse: collapse; width: 100%; height: 63px;\" border=\"1\">\r\n<tbody>\r\n<tr style=\"height: 21px;\">\r\n<td style=\"width: 49.004%; height: 21px;\">Имя</td>\r\n<td style=\"width: 49.0714%; height: 21px;\">name</td>\r\n</tr>\r\n<tr style=\"height: 21px;\">\r\n<td style=\"width: 49.004%; height: 21px;\">Телефон</td>\r\n<td style=\"width: 49.0714%; height: 21px;\">phone</td>\r\n</tr>\r\n<tr style=\"height: 21px;\">\r\n<td style=\"width: 49.004%; height: 21px;\">Текст сообщения</td>\r\n<td style=\"width: 49.0714%; height: 21px;\">body</td>\r\n</tr>\r\n</tbody>\r\n</table>',1);
/*!40000 ALTER TABLE `yupe_mail_mail_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_menu_menu`
--

DROP TABLE IF EXISTS `yupe_menu_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_menu_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_menu_menu_code` (`code`),
  KEY `ix_yupe_menu_menu_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_menu_menu`
--

LOCK TABLES `yupe_menu_menu` WRITE;
/*!40000 ALTER TABLE `yupe_menu_menu` DISABLE KEYS */;
INSERT INTO `yupe_menu_menu` VALUES (1,'Верхнее меню','top-menu','Основное меню сайта, расположенное сверху в блоке mainmenu.',1);
/*!40000 ALTER TABLE `yupe_menu_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_menu_menu_item`
--

DROP TABLE IF EXISTS `yupe_menu_menu_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_menu_menu_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `regular_link` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL,
  `href` varchar(150) NOT NULL,
  `class` varchar(150) DEFAULT NULL,
  `title_attr` varchar(150) DEFAULT NULL,
  `before_link` varchar(150) DEFAULT NULL,
  `after_link` varchar(150) DEFAULT NULL,
  `target` varchar(150) DEFAULT NULL,
  `rel` varchar(150) DEFAULT NULL,
  `condition_name` varchar(150) DEFAULT '0',
  `condition_denial` int(11) DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1',
  `entity_module_name` varchar(40) DEFAULT NULL,
  `entity_name` varchar(40) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_yupe_menu_menu_item_menu_id` (`menu_id`),
  KEY `ix_yupe_menu_menu_item_sort` (`sort`),
  KEY `ix_yupe_menu_menu_item_status` (`status`),
  CONSTRAINT `fk_yupe_menu_menu_item_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `yupe_menu_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_menu_menu_item`
--

LOCK TABLES `yupe_menu_menu_item` WRITE;
/*!40000 ALTER TABLE `yupe_menu_menu_item` DISABLE KEYS */;
INSERT INTO `yupe_menu_menu_item` VALUES (13,0,1,1,'О компании','/o-kompanii',NULL,NULL,NULL,NULL,NULL,NULL,'0',0,15,1,NULL,NULL,NULL),(14,0,1,1,'Акции','/akcii',NULL,NULL,NULL,NULL,NULL,NULL,'0',0,16,1,NULL,NULL,NULL),(15,0,1,1,'Покупателям','/pokupatelyam',NULL,NULL,NULL,NULL,NULL,NULL,'0',0,17,1,NULL,NULL,NULL),(16,0,1,1,'Партнерам','/partneram',NULL,NULL,NULL,NULL,NULL,NULL,'0',0,18,1,NULL,NULL,NULL),(17,0,1,1,'Контакты','/kontakty',NULL,NULL,NULL,NULL,NULL,NULL,'0',0,19,1,NULL,NULL,NULL),(18,13,1,1,'Информация к раскрытию','/informaciya-k-raskrytiyu',NULL,NULL,NULL,NULL,NULL,NULL,'0',0,20,1,NULL,NULL,NULL),(19,13,1,1,'Сертификаты','/sertifikaty',NULL,NULL,NULL,NULL,NULL,NULL,'0',0,21,1,NULL,NULL,NULL),(20,13,1,1,'Руководство','/rukovodstvo',NULL,NULL,NULL,NULL,NULL,NULL,'0',0,22,1,NULL,NULL,NULL),(21,15,1,1,'Как заказать товар','/kak-zakazat-tovar',NULL,NULL,NULL,NULL,NULL,NULL,'0',0,23,1,NULL,NULL,NULL),(22,15,1,1,'Доставка','/dostavka',NULL,NULL,NULL,NULL,NULL,NULL,'0',0,24,1,NULL,NULL,NULL),(23,15,1,1,'Оплата и гарантии','/oplata-i-garantii',NULL,NULL,NULL,NULL,NULL,NULL,'0',0,25,1,NULL,NULL,NULL),(24,15,1,1,'FAQ','/faq',NULL,NULL,NULL,NULL,NULL,NULL,'0',0,26,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `yupe_menu_menu_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_migrations`
--

DROP TABLE IF EXISTS `yupe_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_migrations_module` (`module`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_migrations`
--

LOCK TABLES `yupe_migrations` WRITE;
/*!40000 ALTER TABLE `yupe_migrations` DISABLE KEYS */;
INSERT INTO `yupe_migrations` VALUES (1,'user','m000000_000000_user_base',1610043137),(2,'user','m131019_212911_user_tokens',1610043137),(3,'user','m131025_152911_clean_user_table',1610043138),(4,'user','m131026_002234_prepare_hash_user_password',1610043138),(5,'user','m131106_111552_user_restore_fields',1610043138),(6,'user','m131121_190850_modify_tokes_table',1610043138),(7,'user','m140812_100348_add_expire_to_token_table',1610043138),(8,'user','m150416_113652_rename_fields',1610043138),(9,'user','m151006_000000_user_add_phone',1610043139),(10,'yupe','m000000_000000_yupe_base',1610043139),(11,'yupe','m130527_154455_yupe_change_unique_index',1610043139),(12,'yupe','m150416_125517_rename_fields',1610043139),(13,'yupe','m160204_195213_change_settings_type',1610043139),(14,'category','m000000_000000_category_base',1610043139),(15,'category','m150415_150436_rename_fields',1610043139),(16,'image','m000000_000000_image_base',1610043140),(17,'image','m150226_121100_image_order',1610043140),(18,'image','m150416_080008_rename_fields',1610043140),(19,'mail','m000000_000000_mail_base',1610043141),(20,'comment','m000000_000000_comment_base',1610043141),(21,'comment','m130704_095200_comment_nestedsets',1610043142),(22,'comment','m150415_151804_rename_fields',1610043142),(23,'notify','m141031_091039_add_notify_table',1610043142),(24,'blog','m000000_000000_blog_base',1610043145),(25,'blog','m130503_091124_BlogPostImage',1610043145),(26,'blog','m130529_151602_add_post_category',1610043146),(27,'blog','m140226_052326_add_community_fields',1610043146),(28,'blog','m140714_110238_blog_post_quote_type',1610043146),(29,'blog','m150406_094809_blog_post_quote_type',1610043146),(30,'blog','m150414_180119_rename_date_fields',1610043146),(31,'blog','m160518_175903_alter_blog_foreign_keys',1610043147),(32,'blog','m180421_143937_update_blog_meta_column',1610043147),(33,'blog','m180421_143938_add_post_meta_title_column',1610043147),(34,'page','m000000_000000_page_base',1610043148),(35,'page','m130115_155600_columns_rename',1610043148),(36,'page','m140115_083618_add_layout',1610043148),(37,'page','m140620_072543_add_view',1610043148),(38,'page','m150312_151049_change_body_type',1610043148),(39,'page','m150416_101038_rename_fields',1610043148),(40,'page','m180224_105407_meta_title_column',1610043148),(41,'page','m180421_143324_update_page_meta_column',1610043148),(42,'contentblock','m000000_000000_contentblock_base',1610043149),(43,'contentblock','m140715_130737_add_category_id',1610043149),(44,'contentblock','m150127_130425_add_status_column',1610043149),(45,'gallery','m000000_000000_gallery_base',1610043150),(46,'gallery','m130427_120500_gallery_creation_user',1610043150),(47,'gallery','m150416_074146_rename_fields',1610043150),(48,'gallery','m160514_131314_add_preview_to_gallery',1610043150),(49,'gallery','m160515_123559_add_category_to_gallery',1610043150),(50,'gallery','m160515_151348_add_position_to_gallery_image',1610043150),(51,'gallery','m181224_072816_add_sort_to_gallery',1610043150),(52,'feedback','m000000_000000_feedback_base',1610043151),(53,'feedback','m150415_184108_rename_fields',1610043151),(54,'news','m000000_000000_news_base',1610043152),(55,'news','m150416_081251_rename_fields',1610043152),(56,'news','m180224_105353_meta_title_column',1610043152),(57,'news','m180421_142416_update_news_meta_column',1610043152),(58,'rbac','m140115_131455_auth_item',1610043153),(59,'rbac','m140115_132045_auth_item_child',1610043153),(60,'rbac','m140115_132319_auth_item_assign',1610043153),(61,'rbac','m140702_230000_initial_role_data',1610043153),(62,'menu','m000000_000000_menu_base',1610043154),(63,'menu','m121220_001126_menu_test_data',1610043154),(64,'menu','m160914_134555_fix_menu_item_default_values',1610043155),(65,'menu','m181214_110527_menu_item_add_entity_fields',1610043155),(66,'dictionary','m000000_000000_dictionary_base',1610043600),(67,'dictionary','m150415_183050_rename_fields',1610043600),(68,'slider','m000000_000000_slider_base',1610043603),(69,'slider','m000001_000001_slider_add_column',1610043603),(70,'slider','m000001_000002_slider_add_column_category',1610043603),(71,'services','m000000_000000_services_base',1610043606),(72,'services','m000000_000001_services_add_column_data',1610043606),(73,'services','m000000_000002_services_add_column_is_home',1610043606),(74,'review','m000000_000000_review_base',1610043610),(75,'review','m000000_000001_review_add_column',1610043610),(76,'review','m000000_000002_review_add_column_pos',1610043610),(77,'review','m000000_000003_review_add_column_name_service',1610043610),(78,'review','m000000_000004_review_add_column_rating',1610043610),(79,'review','m000000_000005_review_rename_column',1610043610),(80,'review','m000000_000006_add_table_images',1610043610),(81,'review','m000000_000007_rename_table_images_name',1610043610),(82,'review','m000000_000008_add_column_count',1610043610),(83,'review','m000000_000009_add_column_name_desc',1610043611),(84,'page','m180421_143325_add_column_image',1610043614),(85,'page','m180421_143326_add_column_body_Short',1610043614),(86,'page','m180421_143328_add_page_image_tbl',1610043614),(87,'page','m180421_143329_add_page_title_page_h1',1610043614),(88,'page','m180421_143330_directions_add_column_data',1610043614),(89,'page','m180421_143331_add_page_column_svg_icon',1610043614),(90,'coupon','m140816_200000_store_coupon_base',1622553574),(91,'coupon','m150414_124659_add_order_coupon_table',1622971567),(92,'coupon','m150414_124659_add_order_coupon_table',1622971567),(93,'yupe','m180421_143332_add_column_customfield_group',1622553606),(94,'gallery','m191224_082816_add_image_to_gallery',1622553635),(95,'gallery','m191225_082817_add_checkboxes_to_gallery',1622553635),(96,'gallery','m201225_082817_add_ids_to_gallery',1622553635),(97,'image','m000000_000001_curses_add_column_data',1622553637),(98,'page','m180421_143332_add_column_page_image_desc',1622553639),(99,'news','m180324_105354_add_count_view_column',1622553642),(100,'store','m140812_160000_store_attribute_group_base',1622553940),(101,'store','m140812_170000_store_attribute_base',1622553940),(102,'store','m140812_180000_store_attribute_option_base',1622553941),(103,'store','m140813_200000_store_category_base',1622553941),(104,'store','m140813_210000_store_type_base',1622553941),(105,'store','m140813_220000_store_type_attribute_base',1622553942),(106,'store','m140813_230000_store_producer_base',1622553942),(107,'store','m140814_000000_store_product_base',1622553943),(108,'store','m140814_000010_store_product_category_base',1622553943),(109,'store','m140814_000013_store_product_attribute_eav_base',1622553944),(110,'store','m140814_000018_store_product_image_base',1622553944),(111,'store','m140814_000020_store_product_variant_base',1622553945),(112,'store','m141014_210000_store_product_category_column',1622553945),(113,'store','m141015_170000_store_product_image_column',1622553946),(114,'store','m141218_091834_default_null',1622553946),(115,'store','m150210_063409_add_store_menu_item',1622553946),(116,'store','m150210_105811_add_price_column',1622553946),(117,'store','m150210_131238_order_category',1622553946),(118,'store','m150211_105453_add_position_for_product_variant',1622553946),(119,'store','m150226_065935_add_product_position',1622553946),(120,'store','m150416_112008_rename_fields',1622553946),(121,'store','m150417_180000_store_product_link_base',1622553946),(122,'store','m150825_184407_change_store_url',1622553946),(123,'store','m150907_084604_new_attributes',1622553947),(124,'store','m151218_081635_add_external_id_fields',1622553947),(125,'store','m151218_082939_add_external_id_ix',1622553947),(126,'store','m151218_142113_add_product_index',1622553947),(127,'store','m151223_140722_drop_product_type_categories',1622553947),(128,'store','m160210_084850_add_h1_and_canonical',1622553948),(129,'store','m160210_131541_add_main_image_alt_title',1622553948),(130,'store','m160211_180200_add_additional_images_alt_title',1622553948),(131,'store','m160215_110749_add_image_groups_table',1622553948),(132,'store','m160227_114934_rename_producer_order_column',1622553948),(133,'store','m160309_091039_add_attributes_sort_and_search_fields',1622553948),(134,'store','m160413_184551_add_type_attr_fk',1622553948),(135,'store','m160602_091243_add_position_product_index',1622553948),(136,'store','m160602_091909_add_producer_sort_index',1622553948),(137,'store','m160713_105449_remove_irrelevant_product_status',1622553948),(138,'store','m160805_070905_add_attribute_description',1622553948),(139,'store','m161015_121915_change_product_external_id_type',1622553949),(140,'store','m161122_090922_add_sort_product_position',1622553949),(141,'store','m161122_093736_add_store_layouts',1622553949),(142,'store','m181218_121815_store_product_variant_quantity_column',1622553949),(143,'payment','m140815_170000_store_payment_base',1622553975),(144,'delivery','m140815_190000_store_delivery_base',1622553981),(145,'delivery','m140815_200000_store_delivery_payment_base',1622553982),(146,'order','m140814_200000_store_order_base',1622553983),(147,'order','m150324_105949_order_status_table',1622553983),(148,'order','m150416_100212_rename_fields',1622553983),(149,'order','m150514_065554_change_order_price',1622553983),(150,'order','m151209_185124_split_address',1622553983),(151,'order','m151211_115447_add_appartment_field',1622553983),(152,'order','m160415_055344_add_manager_to_order',1622553983),(153,'order','m160618_145025_add_status_color',1622553983),(154,'stocks','m000000_000000_stocks_base',1622712756),(155,'stocks','m000001_000000_rename_fields',1622712756),(156,'stocks','m000003_000000_add_badge_and_badge_color_column',1622712756),(157,'stocks','m000004_000000_add_bg_stock_column',1622712756),(158,'stocks','m010004_010000_add_marks_stock_column',1622712756),(159,'stocks','m010005_010001_add_sort_stock_column',1622712756),(160,'store','m181218_121816_store_product_add_column_new_hit',1622714514),(161,'coupon','m150414_124659_add_order_coupon_table',1622971567),(162,'coupon','m150414_124659_add_order_coupon_table',1622971567),(163,'coupon','m150414_124659_add_order_coupon_table',1622971567),(164,'coupon','m150414_124659_add_order_coupon_table',1622971567),(165,'coupon','m150415_153218_rename_fields',1622971567),(166,'contentblock','m160715_160737_add_title_short',1622988824),(167,'contentblock','m170715_170737_add_image',1622988824),(168,'page','m190421_153332_add_column_is_main',1626866737),(169,'store','m271205_150639_add_field_cat_attribute_option',1627640820),(170,'store','m281218_131817_add_field_img_attribute_option',1627640820),(171,'store','m181218_121819_store_product_add_column_is_visible',1627641241),(172,'order','m160618_145026_add_column_time_delivery',1628405674),(173,'store','m191319_131919_store_product_add_column_populate',1630846855);
/*!40000 ALTER TABLE `yupe_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_news_news`
--

DROP TABLE IF EXISTS `yupe_news_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_news_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `lang` char(2) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `date` date NOT NULL,
  `title` varchar(250) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `short_text` text,
  `full_text` text NOT NULL,
  `image` varchar(300) DEFAULT NULL,
  `link` varchar(300) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `is_protected` tinyint(1) NOT NULL DEFAULT '0',
  `meta_keywords` varchar(250) NOT NULL,
  `meta_description` varchar(250) NOT NULL,
  `meta_title` varchar(250) NOT NULL,
  `count_view` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_news_news_alias_lang` (`slug`,`lang`),
  KEY `ix_yupe_news_news_status` (`status`),
  KEY `ix_yupe_news_news_user_id` (`user_id`),
  KEY `ix_yupe_news_news_category_id` (`category_id`),
  KEY `ix_yupe_news_news_date` (`date`),
  CONSTRAINT `fk_yupe_news_news_category_id` FOREIGN KEY (`category_id`) REFERENCES `yupe_category_category` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yupe_news_news_user_id` FOREIGN KEY (`user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_news_news`
--

LOCK TABLES `yupe_news_news` WRITE;
/*!40000 ALTER TABLE `yupe_news_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_news_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_notify_settings`
--

DROP TABLE IF EXISTS `yupe_notify_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_notify_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `my_post` tinyint(1) NOT NULL DEFAULT '1',
  `my_comment` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `ix_yupe_notify_settings_user_id` (`user_id`),
  CONSTRAINT `fk_yupe_notify_settings_user_id` FOREIGN KEY (`user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_notify_settings`
--

LOCK TABLES `yupe_notify_settings` WRITE;
/*!40000 ALTER TABLE `yupe_notify_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_notify_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_page_page`
--

DROP TABLE IF EXISTS `yupe_page_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_page_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `lang` char(2) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `change_user_id` int(11) DEFAULT NULL,
  `title_short` varchar(150) NOT NULL,
  `title` varchar(250) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `body` mediumtext NOT NULL,
  `meta_keywords` varchar(250) NOT NULL,
  `meta_description` varchar(250) NOT NULL,
  `status` int(11) NOT NULL,
  `is_protected` tinyint(1) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `layout` varchar(250) DEFAULT NULL,
  `view` varchar(250) DEFAULT NULL,
  `meta_title` varchar(250) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `icon` varchar(250) DEFAULT NULL,
  `body_short` text,
  `name_h1` varchar(255) DEFAULT NULL,
  `data` longtext,
  `svg_icon` text,
  `is_special` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_page_page_slug_lang` (`slug`,`lang`),
  KEY `ix_yupe_page_page_status` (`status`),
  KEY `ix_yupe_page_page_is_protected` (`is_protected`),
  KEY `ix_yupe_page_page_user_id` (`user_id`),
  KEY `ix_yupe_page_page_change_user_id` (`change_user_id`),
  KEY `ix_yupe_page_page_menu_order` (`order`),
  KEY `ix_yupe_page_page_category_id` (`category_id`),
  CONSTRAINT `fk_yupe_page_page_category_id` FOREIGN KEY (`category_id`) REFERENCES `yupe_category_category` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yupe_page_page_change_user_id` FOREIGN KEY (`change_user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yupe_page_page_user_id` FOREIGN KEY (`user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_page_page`
--

LOCK TABLES `yupe_page_page` WRITE;
/*!40000 ALTER TABLE `yupe_page_page` DISABLE KEYS */;
INSERT INTO `yupe_page_page` VALUES (1,NULL,'ru',NULL,'2021-06-01 18:21:05','2021-06-01 18:21:05',1,1,'ЛидерА','ЛидерА','lidera','<p>ЛидерА</p>','','',1,0,1,'','','',NULL,NULL,'','',NULL,NULL,0),(2,NULL,'ru',NULL,'2021-06-02 10:17:11','2021-07-21 16:29:43',1,1,'О компании','О компании','o-kompanii','<p>О компании</p>','','',1,0,2,'','','',NULL,NULL,'','',NULL,NULL,1),(3,NULL,'ru',NULL,'2021-06-02 10:18:17','2021-07-21 16:29:57',1,1,'Акции','Акции','akcii','<p>Акции</p>','','',1,0,3,'','','',NULL,NULL,'','',NULL,NULL,1),(4,NULL,'ru',NULL,'2021-06-02 10:18:47','2021-07-21 16:30:06',1,1,'Покупателям','Покупателям','pokupatelyam','<p>Покупателям</p>','','',1,0,4,'','','',NULL,NULL,'','',NULL,NULL,1),(5,NULL,'ru',NULL,'2021-06-02 10:19:52','2021-07-21 16:30:14',1,1,'Партнерам','Партнерам','partneram','<p>Партнерам</p>','','',1,0,5,'','','',NULL,NULL,'','',NULL,NULL,1),(6,NULL,'ru',NULL,'2021-06-02 10:20:10','2021-07-21 16:30:23',1,1,'','Контакты','kontakty','<p>Контакты</p>','','',1,0,6,'','','',NULL,NULL,'','',NULL,NULL,1),(7,NULL,'ru',2,'2021-07-21 16:30:50','2021-07-21 16:31:10',1,1,'Информация к раскрытию','Информация к раскрытию','informaciya-k-raskrytiyu','<div>\r\n<div>Информация к раскрытию</div>\r\n</div>','','',1,0,7,'','','',NULL,NULL,'','',NULL,NULL,1),(8,NULL,'ru',2,'2021-07-21 16:34:28','2021-07-21 16:35:36',1,1,'Сертификаты','Сертификаты','sertifikaty','<div>\r\n<div>Сертификаты</div>\r\n</div>','','',1,0,8,'','','',NULL,NULL,'','',NULL,NULL,1),(9,NULL,'ru',2,'2021-07-21 16:34:56','2021-07-21 16:35:43',1,1,'Руководство','Руководство','rukovodstvo','<div>\r\n<div>Руководство</div>\r\n</div>','','',1,0,9,'','','',NULL,NULL,'','',NULL,NULL,1),(10,NULL,'ru',4,'2021-07-21 16:36:05','2021-07-21 16:37:14',1,1,'Как заказать товар','Как заказать товар','kak-zakazat-tovar','<div>\r\n<div>Как заказать товар</div>\r\n</div>','','',1,0,10,'','','',NULL,NULL,'','',NULL,NULL,1),(11,NULL,'ru',4,'2021-07-21 16:36:57','2021-07-21 16:37:21',1,1,'Доставка','Доставка','dostavka','<div>\r\n<div>Доставка</div>\r\n</div>','','',1,0,11,'','','',NULL,NULL,'','',NULL,NULL,1),(12,NULL,'ru',4,'2021-07-21 16:37:44','2021-07-21 16:37:44',1,1,'Оплата и гарантии','Оплата и гарантии','oplata-i-garantii','<div>\r\n<div>Оплата и гарантии</div>\r\n</div>','','',1,0,12,'','','',NULL,NULL,'','',NULL,NULL,1),(13,NULL,'ru',4,'2021-07-21 16:38:15','2021-07-21 16:38:15',1,1,'FAQ','FAQ','faq','<div>\r\n<div>FAQ</div>\r\n</div>','','',1,0,13,'','','',NULL,NULL,'','',NULL,NULL,0);
/*!40000 ALTER TABLE `yupe_page_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_page_page_image`
--

DROP TABLE IF EXISTS `yupe_page_page_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_page_page_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `image` varchar(255) NOT NULL COMMENT 'Изображение',
  `title` varchar(255) NOT NULL COMMENT 'Название изображения',
  `alt` varchar(255) NOT NULL COMMENT 'Alt изображения',
  `position` int(11) DEFAULT NULL COMMENT 'Сортировка',
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_page_page_image`
--

LOCK TABLES `yupe_page_page_image` WRITE;
/*!40000 ALTER TABLE `yupe_page_page_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_page_page_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_review`
--

DROP TABLE IF EXISTS `yupe_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `text` text NOT NULL,
  `moderation` int(11) DEFAULT NULL,
  `username` varchar(256) DEFAULT NULL,
  `image` varchar(256) DEFAULT NULL,
  `useremail` varchar(256) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT 'Категория',
  `position` int(11) DEFAULT NULL COMMENT 'Сортировка',
  `product_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `countImage` int(11) DEFAULT NULL,
  `name_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_review`
--

LOCK TABLES `yupe_review` WRITE;
/*!40000 ALTER TABLE `yupe_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_review_image`
--

DROP TABLE IF EXISTS `yupe_review_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_review_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `review_id` int(11) DEFAULT NULL COMMENT 'Id отзыва',
  `image` varchar(255) DEFAULT NULL COMMENT 'Изображение',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `alt` varchar(255) DEFAULT NULL COMMENT 'Alt',
  `position` int(11) DEFAULT NULL COMMENT 'Сортировка',
  PRIMARY KEY (`id`),
  KEY `fk_yupe_review_image_review_id` (`review_id`),
  CONSTRAINT `fk_yupe_review_image_review_id` FOREIGN KEY (`review_id`) REFERENCES `yupe_review` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_review_image`
--

LOCK TABLES `yupe_review_image` WRITE;
/*!40000 ALTER TABLE `yupe_review_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_review_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_services`
--

DROP TABLE IF EXISTS `yupe_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_user_id` int(11) NOT NULL,
  `update_user_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `parent_id` int(11) DEFAULT NULL COMMENT 'Родитель',
  `name_short` varchar(255) DEFAULT NULL COMMENT 'Короткое название',
  `name` varchar(255) DEFAULT NULL COMMENT 'Название',
  `slug` varchar(255) DEFAULT NULL COMMENT 'Alias',
  `name_h1` varchar(255) DEFAULT NULL COMMENT 'Заголовок на странице',
  `image` varchar(255) DEFAULT NULL COMMENT 'Изображение',
  `description_short` text COMMENT 'Короткое описание',
  `description` text COMMENT 'Описание',
  `meta_title` varchar(255) DEFAULT NULL COMMENT 'Title (SEO)',
  `meta_keywords` text COMMENT 'Ключевые слова SEO',
  `meta_description` text COMMENT 'Описание SEO',
  `status` int(11) DEFAULT NULL COMMENT 'Статус',
  `position` int(11) DEFAULT NULL COMMENT 'Сортировка',
  `svg_icon` text,
  `data` longtext,
  `is_home` tinyint(1) NOT NULL DEFAULT '0',
  `is_menu` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_services`
--

LOCK TABLES `yupe_services` WRITE;
/*!40000 ALTER TABLE `yupe_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_slider`
--

DROP TABLE IF EXISTS `yupe_slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'Название',
  `name_short` varchar(255) DEFAULT NULL COMMENT 'Короткое Название',
  `image` varchar(255) DEFAULT NULL COMMENT 'Изображение',
  `description` text COMMENT 'Описание',
  `description_short` text COMMENT 'Краткое описание',
  `button_name` varchar(255) DEFAULT NULL COMMENT 'Название кнопки',
  `button_link` varchar(255) DEFAULT NULL COMMENT 'url для кнопки',
  `status` int(11) DEFAULT NULL COMMENT 'Статус',
  `position` int(11) DEFAULT NULL COMMENT 'Сортировка',
  `image_xs` varchar(250) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_slider`
--

LOCK TABLES `yupe_slider` WRITE;
/*!40000 ALTER TABLE `yupe_slider` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_slider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_stocks`
--

DROP TABLE IF EXISTS `yupe_stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_stocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` char(2) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `date` date NOT NULL,
  `title` varchar(250) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `short_text` text,
  `full_text` text NOT NULL,
  `image` varchar(300) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `description` varchar(250) NOT NULL,
  `badge` varchar(255) DEFAULT NULL,
  `badge_color` varchar(255) DEFAULT NULL,
  `bg_stock` varchar(255) DEFAULT NULL,
  `marks` int(11) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_stocks_slug_lang` (`slug`,`lang`),
  KEY `ix_yupe_stocks_status` (`status`),
  KEY `ix_yupe_stocks_date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_stocks`
--

LOCK TABLES `yupe_stocks` WRITE;
/*!40000 ALTER TABLE `yupe_stocks` DISABLE KEYS */;
INSERT INTO `yupe_stocks` VALUES (1,'ru','2021-06-03 14:34:08','2021-06-10 11:06:24','2021-06-03','Покупай больше - плати меньше','pokupay-bolshe-plati-menshe','','','67fef59d6ff5d40af877f42f077cf21b.jpg',1,'','При покупке от 10 000 руб. <br>получайте скидку до 15%','#000000',NULL,0,1),(2,'ru','2021-06-03 14:35:03','2021-08-13 10:57:02','2021-06-03','Бесплатная доставка в регионы, при заказе от 3000 ₽','besplatnaya-dostavka-v-regiony-pri-zakaze-ot-3000','','','c06a89d9b10de6929562625ac19f1772.jpg',1,'','Купите на сумму от 1 000 рублей <br>и мы доставим товар до дверей','#000000',NULL,0,2),(3,'ru','2021-06-03 14:35:35','2021-09-23 12:10:14','2021-06-03','Санитарные<br> требования и нормы','sanitarnyebr-trebovaniya-i-normy','','','5173fd16c4e4c14c4cb6e06fe51e538b.jpg',1,'','Соблюдение санитарных правил для нас является важным условием','#000000',NULL,0,3);
/*!40000 ALTER TABLE `yupe_stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_store_attribute`
--

DROP TABLE IF EXISTS `yupe_store_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_store_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `unit` varchar(30) DEFAULT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `is_filter` smallint(6) NOT NULL DEFAULT '1',
  `description` text,
  `is_visible` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_store_attribute_name_group` (`name`,`group_id`),
  KEY `ix_yupe_store_attribute_title` (`title`),
  KEY `fk_yupe_store_attribute_group` (`group_id`),
  CONSTRAINT `fk_yupe_store_attribute_group` FOREIGN KEY (`group_id`) REFERENCES `yupe_store_attribute_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_store_attribute`
--

LOCK TABLES `yupe_store_attribute` WRITE;
/*!40000 ALTER TABLE `yupe_store_attribute` DISABLE KEYS */;
INSERT INTO `yupe_store_attribute` VALUES (2,NULL,'cvet','Цвет',2,'',0,1,0,'',0),(3,NULL,'obem','Объем',2,'',0,2,1,'Объем',1),(4,NULL,'material','Материал',2,'',0,3,1,'Материал',0);
/*!40000 ALTER TABLE `yupe_store_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_store_attribute_group`
--

DROP TABLE IF EXISTS `yupe_store_attribute_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_store_attribute_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_store_attribute_group`
--

LOCK TABLES `yupe_store_attribute_group` WRITE;
/*!40000 ALTER TABLE `yupe_store_attribute_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_store_attribute_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_store_attribute_option`
--

DROP TABLE IF EXISTS `yupe_store_attribute_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_store_attribute_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) DEFAULT NULL,
  `position` tinyint(4) DEFAULT NULL,
  `value` varchar(255) DEFAULT '',
  `cat` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_yupe_store_attribute_option_attribute_id` (`attribute_id`),
  KEY `ix_yupe_store_attribute_option_position` (`position`),
  CONSTRAINT `fk_yupe_store_attribute_option_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `yupe_store_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_store_attribute_option`
--

LOCK TABLES `yupe_store_attribute_option` WRITE;
/*!40000 ALTER TABLE `yupe_store_attribute_option` DISABLE KEYS */;
INSERT INTO `yupe_store_attribute_option` VALUES (2,2,1,'Желтый/#FFD400','#FFD400',NULL),(3,2,2,'Белый/#FFFFFF','#FF0000',NULL),(4,2,3,'Красный/#FF0000','#000000',NULL),(5,3,4,'0.25л','',NULL),(6,3,5,'0.3л','',NULL),(7,3,6,'0.5л','',NULL),(8,3,7,'0.9л','',NULL),(9,3,8,'1л','',NULL),(10,3,9,'1.1л','',NULL),(11,3,10,'1.5л','',NULL),(12,3,11,'2л','',NULL),(13,3,12,'2.5л','',NULL),(14,3,13,'3л','',NULL),(15,3,14,'6л','',NULL),(16,3,15,'3.6л','',NULL),(17,3,16,'5л','',NULL),(18,3,17,'6л','',NULL),(19,3,18,'7.5л','',NULL),(20,2,19,'Черный/#000000','#FFFFFF',NULL),(21,3,20,'0.6л','',NULL),(22,3,21,'10л','',NULL),(23,3,22,'12л','',NULL),(24,4,23,'Пластик','',NULL),(25,4,24,'Картон','',NULL),(26,3,25,'0.8л','',NULL);
/*!40000 ALTER TABLE `yupe_store_attribute_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_store_category`
--

DROP TABLE IF EXISTS `yupe_store_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_store_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(150) NOT NULL,
  `name` varchar(250) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `short_description` text,
  `description` text,
  `meta_title` varchar(250) DEFAULT NULL,
  `meta_description` varchar(250) DEFAULT NULL,
  `meta_keywords` varchar(250) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort` int(11) NOT NULL DEFAULT '1',
  `external_id` varchar(100) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `meta_canonical` varchar(255) DEFAULT NULL,
  `image_alt` varchar(255) DEFAULT NULL,
  `image_title` varchar(255) DEFAULT NULL,
  `view` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_store_category_alias` (`slug`),
  KEY `ix_yupe_store_category_parent_id` (`parent_id`),
  KEY `ix_yupe_store_category_status` (`status`),
  KEY `yupe_store_category_external_id_ix` (`external_id`),
  CONSTRAINT `fk_yupe_store_category_parent` FOREIGN KEY (`parent_id`) REFERENCES `yupe_store_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_store_category`
--

LOCK TABLES `yupe_store_category` WRITE;
/*!40000 ALTER TABLE `yupe_store_category` DISABLE KEYS */;
INSERT INTO `yupe_store_category` VALUES (1,NULL,'konteynery-dlya-sbora-medicinskih-othodov','Контейнеры для сбора медицинских отходов','dabbd6496a57949bfd81be8e5e2b034b.png','','','','','',1,1,NULL,'Контейнеры для сбора<br> медицинских отходов','','','',''),(2,NULL,'konteynery-dlya-sterilizacii-i-obezzarazhivaniya-transportirovki','Контейнеры для стерилизации и обеззараживания, транспортировки','4c0ddfba6a0214f033cda8046b366f65.png','','','','','',1,2,NULL,'Для обеззараживания <br> и транспортировки','','','',''),(3,NULL,'baki-urny-konteynery-dlya-hraneniya','Баки, урны, контейнеры для хранения','9fdf4fe5d89b29006d0827d6d1471e02.png','','','','','',1,4,NULL,'Баки, урны, контейнеры <br>для хранения','','','',''),(4,NULL,'telezhki','Тележки','51e9020addfe7970c36e45fb632af01e.png','','','','','',1,5,NULL,'Тележки','','','',''),(5,NULL,'pakety-meshki','Пакеты, мешки','0ba5d57394bf6dbfa0c150780aaa09bc.png','','','','','',1,6,NULL,'Пакеты, мешки','','','',''),(6,5,'patologoanatomicheskie-meshki','Патологоанатомические мешки','0b1647d9840c86ca162ecaf73e67c225.png','','','','','',1,21,NULL,'Патологоанатомические <br>мешки','','','',''),(7,11,'kovrik-antibakterialnyy','Коврик антибактериальный','c32772a14ad6a604c6d2975c8a665109.png','','','','','',0,24,NULL,'Коврик антибактериальный','','','',''),(8,NULL,'perenoska-dlya-analizov','Переноска для анализов','859e545c12fa003cf8e22ce0b5c4c3ab.png','','','','','',0,9,NULL,'Переноска <br>для анализов','','','',''),(9,NULL,'laboratornyy-plastik','Лабораторный пластик','d59868edd3c18b53ea36244b84e91962.png','','','','','',1,3,NULL,'Лабораторный пластик','','','',''),(10,NULL,'sredstva-individualnoy-zashchity','Средства индивидуальной защиты','38c0745c1c5357ee5969f4b6dce1e7af.png','','','','','',1,8,NULL,'Средства индивидуальной <br>защиты','','','',''),(11,NULL,'dezinficiruyushchie-sredstva','Дезинфицирующие средства','5320cf38307b81452fc27426509bf02c.png','','','','','',1,7,NULL,'Дезинфицирующие средства','','','',''),(12,1,'konteynery-dlya-sbora-ostrogo-instumentariya','Контейнеры для сбора острого инстументария','5e15a7176746bd89bb855c3d33504c4f.png','','','','','',1,10,NULL,'Для сбора острого инстументария','','','',''),(13,1,'dlya-organicheskih-othodov','Для органических отходов','46d34d31b40995f94ae5389333dda4f9.png','','','','','',1,11,NULL,'Для органических отходов','','','',''),(14,2,'konteynery-dlya-sterilizacii-i-obezzarazhivaniya','Контейнеры для стерилизации и обеззараживания','e3d93a97aba69c7b4d1538ee9ecb3d8f.png','','','','','',1,12,NULL,'','','','',''),(15,2,'konteynery-dlya-transportirovki','Контейнеры для транспортировки','890f7393d11ae61ae6eeadb8dfd34ee7.png','','','','','',1,13,NULL,'','','','',''),(16,3,'konteynery-mnogorazovye-dlya-sbora-medicinskih-othodov','Контейнеры многоразовые для сбора медицинских отходов','5630682f616350d7ce7172b73cd14223.png','','','','','',1,14,NULL,'Для сбора медицинских отходов','','','',''),(17,3,'urny-pedalnye','Урны педальные','0b882345ff0724c5bf096e8798f25da0.png','','','','','',1,15,NULL,'Урны педальные','','','',''),(18,3,'baki-mezhkorpusnye-i-vnutrikorpusnye','Баки межкорпусные и внутрикорпусные','64d120f8861218b192770c0c9d4ee528.png','','','','','',1,16,NULL,'Баки межкорпусные и внутрикорпусные','','','',''),(19,5,'pakety-dlya-sbora-medicinskih-othodov','Пакеты для сбора медицинских отходов','c21bf912a1bb37ec5bfec60284cda208.png','','','','','',1,17,NULL,'Для сбора медицинских отходов','','','',''),(20,5,'pakety-dlya-termicheskoy-obrabotki-medicinskih-othodov','Пакеты для термической обработки медицинских отходов','8c829b6650400a4314dbfba202f40bd4.png','','','','','',1,18,NULL,'Для термической обработки медицинских отходов','','','',''),(21,5,'pakety-dlya-utiliziruyushchih-ustanovok','Пакеты для утилизирующих установок','541cb83d26ada1e5ba705b61e88401df.png','','','','','',1,19,NULL,'Для утилизирующих установок','','','',''),(22,5,'pakety-dlya-press-destruktorov','Пакеты для пресс-деструкторов','af3d75fd82ae1276ba15fb43f87c3d15.png','','','','','',1,20,NULL,'Пакеты для пресс-деструкторов','','','',''),(24,11,'antiseptiki-i-dezinficiruyushchie-sredstva','Антисептики и дезинфицирующие средства','1d080d01628779f47badcb74d4de7828.png','','','','','',1,22,NULL,'Антисептики и дезинфицирующие средства','','','',''),(25,11,'stiralnyy-poroshok','Стиральный порошок','25db02613e6999df92856aa6de0f44ca.png','','','','','',1,23,NULL,'Стиральный порошок','','','','');
/*!40000 ALTER TABLE `yupe_store_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_store_coupon`
--

DROP TABLE IF EXISTS `yupe_store_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_store_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `code` varchar(255) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `min_order_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `registered_user` tinyint(4) NOT NULL DEFAULT '0',
  `free_shipping` tinyint(4) NOT NULL DEFAULT '0',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `quantity_per_user` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_store_coupon`
--

LOCK TABLES `yupe_store_coupon` WRITE;
/*!40000 ALTER TABLE `yupe_store_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_store_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_store_delivery`
--

DROP TABLE IF EXISTS `yupe_store_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_store_delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` float(10,2) NOT NULL DEFAULT '0.00',
  `free_from` float(10,2) DEFAULT NULL,
  `available_from` float(10,2) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `separate_payment` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yupe_store_delivery_position` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_store_delivery`
--

LOCK TABLES `yupe_store_delivery` WRITE;
/*!40000 ALTER TABLE `yupe_store_delivery` DISABLE KEYS */;
INSERT INTO `yupe_store_delivery` VALUES (1,'Самовывоз','<p>Самовывоз</p>',0.00,NULL,NULL,1,1,0),(2,'Доставка до пункта назначения','',0.00,NULL,NULL,2,1,0),(3,'Доставка до тк','',0.00,NULL,NULL,3,1,0);
/*!40000 ALTER TABLE `yupe_store_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_store_delivery_payment`
--

DROP TABLE IF EXISTS `yupe_store_delivery_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_store_delivery_payment` (
  `delivery_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  PRIMARY KEY (`delivery_id`,`payment_id`),
  KEY `fk_yupe_store_delivery_payment_payment` (`payment_id`),
  CONSTRAINT `fk_yupe_store_delivery_payment_delivery` FOREIGN KEY (`delivery_id`) REFERENCES `yupe_store_delivery` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yupe_store_delivery_payment_payment` FOREIGN KEY (`payment_id`) REFERENCES `yupe_store_payment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_store_delivery_payment`
--

LOCK TABLES `yupe_store_delivery_payment` WRITE;
/*!40000 ALTER TABLE `yupe_store_delivery_payment` DISABLE KEYS */;
INSERT INTO `yupe_store_delivery_payment` VALUES (1,1),(2,1),(3,1),(1,2),(2,2),(3,2);
/*!40000 ALTER TABLE `yupe_store_delivery_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_store_order`
--

DROP TABLE IF EXISTS `yupe_store_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_store_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_id` int(11) DEFAULT NULL,
  `delivery_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_method_id` int(11) DEFAULT NULL,
  `paid` tinyint(4) DEFAULT '0',
  `payment_time` datetime DEFAULT NULL,
  `payment_details` text,
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `coupon_discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `separate_delivery` tinyint(4) DEFAULT '0',
  `status_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `comment` varchar(1024) NOT NULL DEFAULT '',
  `ip` varchar(15) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `note` varchar(1024) NOT NULL DEFAULT '',
  `modified` datetime DEFAULT NULL,
  `zipcode` varchar(30) DEFAULT NULL,
  `country` varchar(150) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `house` varchar(50) DEFAULT NULL,
  `apartment` varchar(10) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `delivery_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `udx_yupe_store_order_url` (`url`),
  KEY `idx_yupe_store_order_user_id` (`user_id`),
  KEY `idx_yupe_store_order_date` (`date`),
  KEY `idx_yupe_store_order_status` (`status_id`),
  KEY `idx_yupe_store_order_paid` (`paid`),
  KEY `fk_yupe_store_order_delivery` (`delivery_id`),
  KEY `fk_yupe_store_order_payment` (`payment_method_id`),
  KEY `fk_yupe_store_order_manager` (`manager_id`),
  CONSTRAINT `fk_yupe_store_order_delivery` FOREIGN KEY (`delivery_id`) REFERENCES `yupe_store_delivery` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_yupe_store_order_manager` FOREIGN KEY (`manager_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_yupe_store_order_payment` FOREIGN KEY (`payment_method_id`) REFERENCES `yupe_store_payment` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_yupe_store_order_status` FOREIGN KEY (`status_id`) REFERENCES `yupe_store_order_status` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_yupe_store_order_user` FOREIGN KEY (`user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_store_order`
--

LOCK TABLES `yupe_store_order` WRITE;
/*!40000 ALTER TABLE `yupe_store_order` DISABLE KEYS */;
INSERT INTO `yupe_store_order` VALUES (82,2,0.00,1,0,NULL,NULL,0.00,0.00,0.00,0,1,'2021-09-06 15:57:07',1,'ZXzX','ул Тупиковая','+7 (912) 340 6469','rouming76@gmail.com','','94.41.183.11','07ed68bff6742e7c2b5d10421b9a4be2','','2021-09-06 15:57:07','','','','','',NULL,NULL),(83,1,0.00,1,0,NULL,NULL,0.00,0.00,0.00,0,1,'2021-09-06 15:59:25',1,'xzx','','+7 (912) 340 6469','rouming76@gmail.com','','94.41.183.11','ac3acc894146fa1cfd604f600cb4ad02','','2021-09-06 15:59:25','','','','','',NULL,NULL),(84,1,0.00,1,0,NULL,NULL,0.00,0.00,0.00,0,1,'2021-09-06 16:00:46',1,'vzxvxzv','','+7 (912) 340 6469','rouming76@gmail.com','','94.41.183.11','5424f1284db1c218b1058d1631d1f467','','2021-09-06 16:00:46','','','','','',NULL,NULL),(85,1,0.00,1,0,NULL,NULL,0.00,0.00,0.00,0,1,'2021-09-06 16:01:20',1,'xZX','','+7 (912) 340 6469','gordeew.r2015@yandex.ru','','94.41.183.11','3c84449f2dd2cbdd4c1d1ba27babd370','','2021-09-06 16:01:20','','','','','',NULL,NULL),(86,1,0.00,1,0,NULL,NULL,0.00,0.00,0.00,0,1,'2021-09-09 14:08:27',NULL,'апролдж','','+7 (689) 645 0798','ipnikolaevaon@yandex.ru','','46.242.9.57','81982ec12bdda17d3fb57ccf4eef4789','','2021-09-09 14:08:27','','','','','',NULL,NULL),(87,1,0.00,1,0,NULL,NULL,0.00,0.00,0.00,0,1,'2021-09-20 17:02:46',NULL,'fdgsdf','','+7 (912) 340 6469','rouming76@gmail.com','','94.41.183.11','6def51e6d84eb287ed31f28c3f55a6cb','','2021-09-20 17:02:46','','','','','',NULL,NULL),(88,1,0.00,1,0,NULL,NULL,0.00,0.00,0.00,0,1,'2021-09-20 17:03:07',NULL,'sdgds','','+7 (912) 340 6469','rouming76@gmail.com','','94.41.183.11','d6df81d6e7bb6bdff7db2f0a865e99a3','','2021-09-20 17:03:07','','','','','',NULL,NULL),(89,1,0.00,1,0,NULL,NULL,0.00,0.00,0.00,0,1,'2021-10-02 00:00:03',NULL,'ыпфтро','','+7 (546) 787 89','ipnikolaevaon@yandex.ru','','46.242.9.57','0f763d56462d8fa7565def5a63457ed6','','2021-10-02 00:00:03','','','','','',NULL,NULL),(90,3,0.00,1,0,NULL,NULL,0.00,0.00,0.00,0,1,'2021-10-20 17:49:38',1,'ыфафы','','+7 (912) 340 6469','rouming76@gmail.com','','94.41.135.35','dce6cd3e8296fc797d1fdaaf20d31df9','','2021-10-20 17:49:38','','','','','',NULL,NULL),(91,1,0.00,3,0,NULL,NULL,0.00,0.00,0.00,0,1,'2021-10-20 18:00:44',1,'asd','','+7 (912) 340 6469','rouming76@gmail.com','','94.41.135.35','07852325f6a6421b55dcafaa312321d8','','2021-10-20 18:00:44','','','','','',NULL,NULL),(92,1,0.00,1,0,NULL,NULL,0.00,0.00,0.00,0,1,'2021-10-22 12:54:29',NULL,'апролд','','+7 (567) 898 9009','ipnikolaevaon@yandex.ru','','46.242.9.57','2f9bf003d1203a6f3d69b80b59399b5e','','2021-10-22 12:54:29','','','','','',NULL,NULL);
/*!40000 ALTER TABLE `yupe_store_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_store_order_coupon`
--

DROP TABLE IF EXISTS `yupe_store_order_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_store_order_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_yupe_store_order_coupon_order` (`order_id`),
  KEY `fk_yupe_store_order_coupon_coupon` (`coupon_id`),
  CONSTRAINT `fk_yupe_store_order_coupon_coupon` FOREIGN KEY (`coupon_id`) REFERENCES `yupe_store_coupon` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yupe_store_order_coupon_order` FOREIGN KEY (`order_id`) REFERENCES `yupe_store_order` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_store_order_coupon`
--

LOCK TABLES `yupe_store_order_coupon` WRITE;
/*!40000 ALTER TABLE `yupe_store_order_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_store_order_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_store_order_product`
--

DROP TABLE IF EXISTS `yupe_store_order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_store_order_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `variants` text,
  `variants_text` varchar(1024) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `sku` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_yupe_store_order_product_order_id` (`order_id`),
  KEY `idx_yupe_store_order_product_product_id` (`product_id`),
  CONSTRAINT `fk_yupe_store_order_product_order` FOREIGN KEY (`order_id`) REFERENCES `yupe_store_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yupe_store_order_product_product` FOREIGN KEY (`product_id`) REFERENCES `yupe_store_product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_store_order_product`
--

LOCK TABLES `yupe_store_order_product` WRITE;
/*!40000 ALTER TABLE `yupe_store_order_product` DISABLE KEYS */;
INSERT INTO `yupe_store_order_product` VALUES (105,82,52,'Ёмкость-контейнер одноразовый 1,5 Л','a:1:{i:0;a:12:{s:2:\"id\";s:3:\"207\";s:10:\"product_id\";s:2:\"52\";s:12:\"attribute_id\";s:1:\"2\";s:15:\"attribute_value\";s:22:\"Красный/#FF0000\";s:4:\"type\";s:1:\"0\";s:3:\"sku\";s:0:\"\";s:8:\"position\";s:3:\"203\";s:8:\"quantity\";N;s:6:\"amount\";s:1:\"0\";s:14:\"attribute_name\";s:4:\"cvet\";s:15:\"attribute_title\";s:8:\"Цвет\";s:11:\"optionValue\";s:22:\"Красный/#FF0000\";}}',NULL,0.00,5,'1.5 нИ'),(106,83,8,'Ёмкость-контейнер одноразовый 0,25 Л','a:1:{i:0;a:12:{s:2:\"id\";s:1:\"7\";s:10:\"product_id\";s:1:\"8\";s:12:\"attribute_id\";s:1:\"2\";s:15:\"attribute_value\";s:22:\"Красный/#FF0000\";s:4:\"type\";s:1:\"0\";s:3:\"sku\";s:0:\"\";s:8:\"position\";s:1:\"7\";s:8:\"quantity\";N;s:6:\"amount\";s:1:\"0\";s:14:\"attribute_name\";s:4:\"cvet\";s:15:\"attribute_title\";s:8:\"Цвет\";s:11:\"optionValue\";s:22:\"Красный/#FF0000\";}}',NULL,0.00,10,'025 МК'),(107,84,1,'Ёмкость-контейнер одноразовый 0,25 Л','a:1:{i:0;a:12:{s:2:\"id\";s:1:\"3\";s:10:\"product_id\";s:1:\"1\";s:12:\"attribute_id\";s:1:\"2\";s:15:\"attribute_value\";s:22:\"Красный/#FF0000\";s:4:\"type\";s:1:\"0\";s:3:\"sku\";s:0:\"\";s:8:\"position\";s:1:\"3\";s:8:\"quantity\";N;s:6:\"amount\";s:1:\"0\";s:14:\"attribute_name\";s:4:\"cvet\";s:15:\"attribute_title\";s:8:\"Цвет\";s:11:\"optionValue\";s:22:\"Красный/#FF0000\";}}',NULL,0.00,10,'025 И'),(108,85,1,'Ёмкость-контейнер одноразовый 0,25 Л','a:1:{i:0;a:12:{s:2:\"id\";s:1:\"3\";s:10:\"product_id\";s:1:\"1\";s:12:\"attribute_id\";s:1:\"2\";s:15:\"attribute_value\";s:22:\"Красный/#FF0000\";s:4:\"type\";s:1:\"0\";s:3:\"sku\";s:0:\"\";s:8:\"position\";s:1:\"3\";s:8:\"quantity\";N;s:6:\"amount\";s:1:\"0\";s:14:\"attribute_name\";s:4:\"cvet\";s:15:\"attribute_title\";s:8:\"Цвет\";s:11:\"optionValue\";s:22:\"Красный/#FF0000\";}}',NULL,0.00,1,'025 И'),(109,86,1,'Ёмкость-контейнер одноразовый 0,25 Л','a:0:{}',NULL,0.00,1,'025 И'),(110,86,8,'Ёмкость-контейнер одноразовый 0,25 Л','a:0:{}',NULL,0.00,1,'025 МК'),(111,86,2,'Ёмкость-контейнер одноразовый 0,25 Л','a:0:{}',NULL,0.00,1,'025 О'),(112,87,8,'Ёмкость-контейнер одноразовый 0,25 Л','a:0:{}',NULL,0.00,1,'025 МК'),(113,87,2,'Ёмкость-контейнер одноразовый 0,25 Л','a:0:{}',NULL,0.00,1,'025 О'),(114,88,1,'Ёмкость-контейнер одноразовый 0,25 Л','a:1:{i:0;a:12:{s:2:\"id\";s:1:\"3\";s:10:\"product_id\";s:1:\"1\";s:12:\"attribute_id\";s:1:\"2\";s:15:\"attribute_value\";s:22:\"Красный/#FF0000\";s:4:\"type\";s:1:\"0\";s:3:\"sku\";s:0:\"\";s:8:\"position\";s:1:\"3\";s:8:\"quantity\";N;s:6:\"amount\";s:1:\"0\";s:14:\"attribute_name\";s:4:\"cvet\";s:15:\"attribute_title\";s:8:\"Цвет\";s:11:\"optionValue\";s:22:\"Красный/#FF0000\";}}',NULL,0.00,2,'025 И'),(115,89,5,'Ёмкость-контейнер одноразовый 0,5 Л','a:1:{i:0;a:12:{s:2:\"id\";s:2:\"27\";s:10:\"product_id\";s:1:\"5\";s:12:\"attribute_id\";s:1:\"2\";s:15:\"attribute_value\";s:22:\"Красный/#FF0000\";s:4:\"type\";s:1:\"0\";s:3:\"sku\";s:0:\"\";s:8:\"position\";s:2:\"23\";s:8:\"quantity\";N;s:6:\"amount\";s:1:\"0\";s:14:\"attribute_name\";s:4:\"cvet\";s:15:\"attribute_title\";s:8:\"Цвет\";s:11:\"optionValue\";s:22:\"Красный/#FF0000\";}}',NULL,0.00,2,'05 МФ'),(116,89,4,'Емкость-контейнер одноразовый 0,5л.','a:0:{}',NULL,0.00,1,'05 И'),(117,90,1,'Ёмкость-контейнер одноразовый 0,25 Л','a:0:{}',NULL,0.00,1,'025 И'),(118,91,1,'Ёмкость-контейнер одноразовый 0,25 Л','a:0:{}',NULL,0.00,1,'025 И'),(119,92,1,'Ёмкость-контейнер одноразовый 0,25 Л','a:0:{}',NULL,0.00,1,'025 И'),(120,92,8,'Ёмкость-контейнер одноразовый 0,25 Л','a:0:{}',NULL,0.00,1,'025 МК'),(121,92,2,'Ёмкость-контейнер одноразовый 0,25 Л','a:0:{}',NULL,0.00,1,'025 О'),(122,92,6,'Ёмкость-контейнер одноразовый 0,5 Л','a:0:{}',NULL,0.00,1,'05 Э'),(123,92,5,'Ёмкость-контейнер одноразовый 0,5 Л','a:0:{}',NULL,0.00,1,'05 МФ'),(124,92,4,'Емкость-контейнер одноразовый 0,5л.','a:1:{i:0;a:12:{s:2:\"id\";s:2:\"23\";s:10:\"product_id\";s:1:\"4\";s:12:\"attribute_id\";s:1:\"2\";s:15:\"attribute_value\";s:22:\"Красный/#FF0000\";s:4:\"type\";s:1:\"0\";s:3:\"sku\";s:0:\"\";s:8:\"position\";s:2:\"19\";s:8:\"quantity\";N;s:6:\"amount\";s:1:\"0\";s:14:\"attribute_name\";s:4:\"cvet\";s:15:\"attribute_title\";s:8:\"Цвет\";s:11:\"optionValue\";s:22:\"Красный/#FF0000\";}}',NULL,0.00,1,'05 И');
/*!40000 ALTER TABLE `yupe_store_order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_store_order_status`
--

DROP TABLE IF EXISTS `yupe_store_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_store_order_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_store_order_status`
--

LOCK TABLES `yupe_store_order_status` WRITE;
/*!40000 ALTER TABLE `yupe_store_order_status` DISABLE KEYS */;
INSERT INTO `yupe_store_order_status` VALUES (1,'Новый',1,'default'),(2,'Принят',1,'info'),(3,'Выполнен',1,'success'),(4,'Удален',1,'danger');
/*!40000 ALTER TABLE `yupe_store_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_store_payment`
--

DROP TABLE IF EXISTS `yupe_store_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_store_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `settings` text,
  `currency_id` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_yupe_store_payment_position` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_store_payment`
--

LOCK TABLES `yupe_store_payment` WRITE;
/*!40000 ALTER TABLE `yupe_store_payment` DISABLE KEYS */;
INSERT INTO `yupe_store_payment` VALUES (1,'manual','Наличными','<p>Наличными</p>','a:0:{}',NULL,1,1),(2,'manual','Картой','<p>Картой</p>','a:0:{}',NULL,2,1),(3,'manual','Безналичный расчёт','','a:0:{}',NULL,3,1);
/*!40000 ALTER TABLE `yupe_store_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_store_producer`
--

DROP TABLE IF EXISTS `yupe_store_producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_store_producer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_short` varchar(150) NOT NULL,
  `name` varchar(250) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `short_description` text,
  `description` text,
  `meta_title` varchar(250) DEFAULT NULL,
  `meta_keywords` varchar(250) DEFAULT NULL,
  `meta_description` varchar(250) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `sort` int(11) NOT NULL DEFAULT '0',
  `view` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_yupe_store_producer_slug` (`slug`),
  KEY `ix_yupe_store_producer_sort` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_store_producer`
--

LOCK TABLES `yupe_store_producer` WRITE;
/*!40000 ALTER TABLE `yupe_store_producer` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_store_producer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_store_product`
--

DROP TABLE IF EXISTS `yupe_store_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_store_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `producer_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sku` varchar(100) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `price` decimal(19,3) NOT NULL DEFAULT '0.000',
  `discount_price` decimal(19,3) DEFAULT NULL,
  `discount` decimal(19,3) DEFAULT NULL,
  `description` text,
  `short_description` text,
  `data` text,
  `is_special` tinyint(1) NOT NULL DEFAULT '0',
  `length` decimal(19,3) DEFAULT NULL,
  `width` decimal(19,3) DEFAULT NULL,
  `height` decimal(19,3) DEFAULT NULL,
  `weight` decimal(19,3) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `in_stock` tinyint(4) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `meta_title` varchar(250) DEFAULT NULL,
  `meta_keywords` varchar(250) DEFAULT NULL,
  `meta_description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `average_price` decimal(19,3) DEFAULT NULL,
  `purchase_price` decimal(19,3) DEFAULT NULL,
  `recommended_price` decimal(19,3) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  `external_id` varchar(100) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `meta_canonical` varchar(255) DEFAULT NULL,
  `image_alt` varchar(255) DEFAULT NULL,
  `image_title` varchar(255) DEFAULT NULL,
  `view` varchar(100) DEFAULT NULL,
  `is_home` tinyint(1) NOT NULL DEFAULT '0',
  `is_new` tinyint(1) NOT NULL DEFAULT '0',
  `populate` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_store_product_alias` (`slug`),
  KEY `ix_yupe_store_product_status` (`status`),
  KEY `ix_yupe_store_product_type_id` (`type_id`),
  KEY `ix_yupe_store_product_producer_id` (`producer_id`),
  KEY `ix_yupe_store_product_price` (`price`),
  KEY `ix_yupe_store_product_discount_price` (`discount_price`),
  KEY `ix_yupe_store_product_create_time` (`create_time`),
  KEY `ix_yupe_store_product_update_time` (`update_time`),
  KEY `fk_yupe_store_product_category` (`category_id`),
  KEY `yupe_store_product_external_id_ix` (`external_id`),
  KEY `ix_yupe_store_product_sku` (`sku`),
  KEY `ix_yupe_store_product_name` (`name`),
  KEY `ix_yupe_store_product_position` (`position`),
  CONSTRAINT `fk_yupe_store_product_category` FOREIGN KEY (`category_id`) REFERENCES `yupe_store_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_yupe_store_product_producer` FOREIGN KEY (`producer_id`) REFERENCES `yupe_store_producer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_yupe_store_product_type` FOREIGN KEY (`type_id`) REFERENCES `yupe_store_type` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_store_product`
--

LOCK TABLES `yupe_store_product` WRITE;
/*!40000 ALTER TABLE `yupe_store_product` DISABLE KEYS */;
INSERT INTO `yupe_store_product` VALUES (1,1,NULL,12,'025 И','Ёмкость-контейнер одноразовый 0,25 Л','yomkost-konteyner-odnorazovyy-025-l',0.000,NULL,NULL,'<p>Сбор и хранение использованного острого инструментария, игл со всех типов шприцов, а также браунюль, фистульных игл, инфузионных канюль для внутривенного доступа, ланцетов, наконечников скальпелей, в том числе в условиях оказания ургентной помощи.</p>\n<hr /><ul><li>безопасный контейнер для утилизации игл в дорожных условиях.</li>\n<li>подходит для амбулаторного применения в хирургических отделениях, псих- и наркодиспансерах,а также работникам скорой помощи и спасательных служб</li>\n<li>с лёгкостью помещается как в стандартную сумку скорой помощи, так и в самую маленькую сумку участкового врача или патронажной медсестры.</li>\n</ul>','','',0,NULL,NULL,120.000,NULL,NULL,1,1,'2021-06-03 15:25:08','2021-10-22 16:16:53','','','','0708584284912688fdd8b5624b76ee06.jpg',NULL,NULL,NULL,1,NULL,'','','','','',0,1,'13'),(2,1,NULL,12,'025 О','Ёмкость-контейнер одноразовый 0,25 Л','yomkost-konteyner-odnorazovyy-03-lmf',0.000,NULL,NULL,'<p>Сбор и хранение использованного острого инструментария, игл со всех типов шприцов, а также браунюль, фистульных игл, инфузионных канюль для внутривенного доступа, ланцетов, наконечников скальпелей, в том числе в условиях оказания ургентной помощи.</p>\n<hr />\n<ul>\n<li>безопасный контейнер для утилизации игл в дорожных условиях.</li>\n<li>подходит для амбулаторного применения в хирургических отделениях, псих- и наркодиспансерах,а также работникам скорой помощи и спасательных служб</li>\n<li>с лёгкостью помещается как в стандартную сумку скорой помощи, так и в самую маленькую сумку участкового врача или патронажной медсестры.</li>\n</ul>','','',0,NULL,NULL,145.000,NULL,0,0,1,'2021-06-03 15:26:17','2021-10-22 12:35:33','','','','daaadaa717ddea10b0ad842f255c0dd5.jpg',NULL,NULL,NULL,3,NULL,'','','','','',0,1,'4'),(3,1,NULL,12,'03 МФ','Ёмкость-контейнер одноразовый 0,3 Л','yomkost-konteyner-odnorazovyy-03-l',0.000,NULL,NULL,'<p>Сбор и хранение использованного острого инструментария, игл со всех типов шприцов, а также браунюль, фистульных игл, инфузионных канюль для внутривенного доступа, ланцетов, наконечников скальпелей, в том числе в условиях оказания ургентной помощи.</p>\n<hr />\n<ul>\n<li>безопасный контейнер для утилизации игл в дорожных условиях.</li>\n<li>подходит для амбулаторного применения в хирургических отделениях, псих- и наркодиспансерах,а также работникам скорой помощи и спасательных служб</li>\n<li>с лёгкостью помещается как в стандартную сумку скорой помощи, так и в самую маленькую сумку участкового врача или патронажной медсестры.</li>\n</ul>','','',0,NULL,NULL,80.000,NULL,NULL,1,1,'2021-06-03 15:33:08','2021-10-01 21:41:50','','','','67e609cf476fdeee3389c946c73aa735.jpg',NULL,NULL,NULL,4,NULL,'','','','','',0,1,'1'),(4,1,NULL,12,'05 И','Емкость-контейнер одноразовый 0,5л.','emkost-konteyner-odnorazovyy-05li',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медментария в местах первичного образования.</p>\n<ul>\n<li>различные формы отверстий для съема/откручивания</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов.</li>\n</ul>','','',0,NULL,NULL,125.000,NULL,NULL,1,1,'2021-06-03 15:33:52','2021-10-22 12:53:35','','','','0ec7809afbe55eba27a9faad06a7484f.jpg',NULL,NULL,NULL,5,NULL,'','','','','',0,1,'4'),(5,1,NULL,12,'05 МФ','Ёмкость-контейнер одноразовый 0,5 Л','yomkost-konteyner-odnorazovyy-05-lmf',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медментария в местах первичного образования.</p>\n<ul><li>различные формы отверстий для съема/откручивания</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов.</li>\n</ul>','','',0,NULL,NULL,85.000,NULL,0,0,1,'2021-06-03 15:35:54','2021-10-22 12:50:03','','','','63f360bee68ea66b4a8de5217f81b095.jpg',NULL,NULL,NULL,6,NULL,'','','','','',0,1,'3'),(6,1,NULL,12,'05 Э','Ёмкость-контейнер одноразовый 0,5 Л','yomkost-konteyner-odnorazovyy-05-le',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медментария в местах первичного образования.</p>\n<ul>\n<li>различные формы отверстий для съема/откручивания</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов.</li>\n</ul>','','',0,NULL,NULL,65.000,NULL,NULL,1,1,'2021-06-04 16:48:23','2021-10-22 12:49:57','','','','5ff5a8fb6912e569571b18c68f67b1a6.jpg',NULL,NULL,NULL,7,NULL,'','','','','',0,1,'3'),(7,1,NULL,12,'05 МК','Ёмкость-контейнер одноразовый 0,5 Л','yomkost-konteyner-odnorazovyy-05-lmk',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медментария в местах первичного образования.</p>\n<ul><li>различные формы отверстий для съема/откручивания</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов.</li>\n</ul>','','',0,NULL,NULL,105.000,NULL,NULL,1,1,'2021-07-21 09:49:37','2021-09-05 18:34:03','','','','89be46ef9501f9910befa53a5a5b66f4.jpg',NULL,NULL,NULL,8,NULL,'','','','','',0,1,'0'),(8,1,NULL,12,'025 МК','Ёмкость-контейнер одноразовый 0,25 Л','yomkost-konteyner-odnorazovyy-025-mk',0.000,NULL,NULL,'<p>Сбор и хранение использованного острого инструментария, игл со всех типов шприцов, а также браунюль, фистульных игл, инфузионных канюль для внутривенного доступа, ланцетов, наконечников скальпелей, в том числе в условиях оказания ургентной помощи.</p>\n<hr />\n<ul>\n<li>безопасный контейнер для утилизации игл в дорожных условиях.</li>\n<li>подходит для амбулаторного применения в хирургических отделениях, псих- и наркодиспансерах,а также работникам скорой помощи и спасательных служб</li>\n<li>с лёгкостью помещается как в стандартную сумку скорой помощи, так и в самую маленькую сумку участкового врача или патронажной медсестры.</li>\n</ul>','','',0,NULL,NULL,130.000,NULL,NULL,1,1,'2021-08-04 14:53:15','2021-10-22 12:35:31','','','','4f485e2a97905e153afa8af7febb98d4.jpg',NULL,NULL,NULL,2,NULL,'','','','','',0,1,'9'),(10,1,NULL,12,'05 О','Ёмкость-контейнер одноразовый 0,5 Л','yomkost-konteyner-odnorazovyy-05-lo',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медментария в местах первичного образования.</p>\n<ul><li>различные формы отверстий для съема/откручивания</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов.</li>\n</ul>','','',0,NULL,NULL,85.000,NULL,NULL,1,1,'2021-08-05 15:11:20','2021-10-22 12:55:15','','','','b6fd437045f92915997193edc70afa58.jpg',NULL,NULL,NULL,9,NULL,'','','','','',0,0,'3'),(11,1,NULL,12,'06 МА','Ёмкость-контейнер одноразовый 0,6 Л','yomkost-konteyner-odnorazovyy-06-lma',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медментария в местах первичного образования.</p>\n<ul>\n<li>различные формы отверстий для съема/откручивания</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов.</li>\n</ul>','','',1,NULL,NULL,150.000,NULL,NULL,1,1,'2021-08-05 15:18:21','2021-10-22 12:57:41','','','','75f839da4d6a7439482f16a9e04a0117.jpg',NULL,NULL,NULL,10,NULL,'','','','','',0,0,'1'),(12,1,NULL,12,'09 МК','Ёмкость-контейнер одноразовый 0,9 Л','yomkost-konteyner-odnorazovyy-09-lmk',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медментария в местах первичного образования.</p>\n<ul>\n<li>различные формы отверстий для съема/откручивания</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов.</li>\n</ul>','','',0,NULL,NULL,140.000,NULL,NULL,1,1,'2021-08-05 15:24:30','2021-09-10 14:15:25','','','','166d77a882c1d2664730d3ee465d6b30.jpg',NULL,NULL,NULL,11,NULL,'','','','','',0,0,'3'),(13,1,NULL,12,'1И','Ёмкость-контейнер одноразовый 1 Л','yomkost-konteyner-odnorazovyy-1-li',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медментария в местах первичного образования.</p>\n<ul>\n<li>различные формы отверстий для съема/откручивания</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов.</li>\n</ul>','','',0,NULL,NULL,210.000,NULL,NULL,1,1,'2021-08-05 15:41:35','2021-10-22 12:58:14','','','','2213436e86775e2d56082db7a16975d2.jpg',NULL,NULL,NULL,12,NULL,'','','','','',0,0,'1'),(14,1,NULL,12,'1 МФ','Ёмкость-контейнер одноразовый 1Л','yomkost-konteyner-odnorazovyy-1lmf',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медментария в местах первичного образования.</p>\n<ul><li>различные формы отверстий для съема/откручивания</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов.</li>\n</ul>','','',0,NULL,NULL,135.000,NULL,NULL,1,1,'2021-08-05 15:48:10','2021-09-05 18:07:20','','','','47d5b076bc7b07d1e48b0a154e05c8fc.jpg',NULL,NULL,NULL,13,NULL,'','','','','',0,0,'0'),(15,1,NULL,12,'1 МК','Ёмкость-контейнер одноразовый 1 Л','yomkost-konteyner-odnorazovyy-1-lmk',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медментария в местах первичного образования.</p>\n<ul>\n<li>различные формы отверстий для съема/откручивания</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов.</li>\n</ul>','','',0,NULL,NULL,128.000,NULL,NULL,1,1,'2021-08-05 15:56:21','2021-09-05 18:03:53','','','','d5a7a850e663fc33084ca213996ebe2f.jpg',NULL,NULL,NULL,14,NULL,'','','','','',0,0,'1'),(16,1,NULL,12,'1 О','Ёмкость-контейнер одноразовый 1 Л','yomkost-konteyner-odnorazovyy-1-0',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медментария в местах первичного образования.</p>\n<ul>\n<li>различные формы отверстий для съема/откручивания</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов.</li>\n</ul>','','',1,NULL,NULL,145.000,NULL,NULL,1,1,'2021-08-05 16:13:05','2021-08-11 16:55:37','','','','bbd9d69b44b91c005af82ab7a92d764f.jpg',NULL,NULL,NULL,15,NULL,'','','','','',0,0,'0'),(17,1,NULL,12,'11 МА','Ёмкость-контейнер одноразовый 1.1 Л','yomkost-konteyner-odnorazovyy-11-lma',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медментария в местах первичного образования.</p>\n<ul><li>различные формы отверстий для съема/откручивания</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов.</li>\n</ul>','','',0,NULL,NULL,270.000,NULL,NULL,1,1,'2021-08-05 16:18:33','2021-09-05 18:11:11','','','','1e136b11817f498d4feb4dd0259b2ef8.jpg',NULL,NULL,NULL,16,NULL,'','','','','',0,0,'0'),(18,1,NULL,12,'1.5 И','Ёмкость-контейнер одноразовый 1,5 Л','yomkost-konteyner-odnorazovyy-15-li',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медиментария в местах первичного образования.</p>\n<ul><li>различные формы отверстий для съема/откручивания</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов.</li>\n</ul>','','',0,NULL,NULL,150.000,NULL,NULL,1,1,'2021-08-10 14:19:01','2021-09-05 18:14:34','','','','948d16e8a64bfed1d4e142862098920f.jpg',NULL,NULL,NULL,17,NULL,'','','','','',0,0,'0'),(19,1,NULL,12,'1.5 МФ','Ёмкость-контейнер одноразовый 1.5 Л','yomkost-konteyner-odnorazovyy-15-lmf',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медментария в местах первичного образования.</p>\n<ul>\n<li>различные формы отверстий для съема/откручивания</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов.</li>\n</ul>','','',0,NULL,NULL,120.000,NULL,NULL,1,1,'2021-08-10 14:35:22','2021-08-11 16:56:02','','','','73d45245e45f7ba02b895963d4beea53.jpg',NULL,NULL,NULL,18,NULL,'','','','','',0,0,'0'),(20,1,NULL,12,'1.5 МК','Ёмкость-контейнер одноразовый 1,5 Л','yomkost-konteyner-odnorazovyy-15-lmk',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медментария в местах первичного образования.</p>\n<ul>\n<li>различные формы отверстий для съема/откручивания</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов.</li>\n</ul>','','',0,NULL,NULL,150.000,NULL,NULL,1,1,'2021-08-10 14:41:36','2021-09-14 11:27:33','','','','c981b6cea873137f15299a419a52cc1d.jpg',NULL,NULL,NULL,19,NULL,'','','','','',0,0,'1'),(21,1,NULL,12,'1.5 О','Ёмкость-контейнер одноразовый 1.5 Л','yomkost-konteyner-odnorazovyy-15-lo',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медментария в местах первичного образования.</p>\n<ul><li>различные формы отверстий для съема/откручивания</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов.</li>\n</ul>','','',0,NULL,NULL,200.000,NULL,NULL,1,1,'2021-08-11 14:09:24','2021-09-09 16:50:40','','','','9790dded5a698fa14113ec0540e6040b.jpg',NULL,NULL,NULL,20,NULL,'','','','','',0,0,'0'),(22,1,NULL,12,'1.5 Э','Ёмкость-контейнер одноразовый 1.5Л','yomkost-konteyner-odnorazovyy-15le',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медментария в местах первичного образования.</p>\n<ul>\n<li>различные формы отверстий для съема/откручивания</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов.</li>\n</ul>','','',0,NULL,NULL,190.000,NULL,NULL,1,1,'2021-08-11 14:25:49','2021-08-11 16:56:31','','','','419f2fbb2b5dd4714bf05fedfe07dafa.jpg',NULL,NULL,NULL,21,NULL,'','','','','',0,0,'0'),(23,1,NULL,12,'2 И','Ёмкость-контейнер одноразовый 2 Л','yomkost-konteyner-odnorazovyy-2-l',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медицинских отходов. Бесконтактный сбор острого инстру- ментария в местах первичного образования.</p>\n<hr />\n<ul>\n<li>различные формы отверстий для съема/откручивания</li>\n<li>различные размеры отверстий в разных видах контейнеров</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов</li>\n</ul>','','',0,NULL,NULL,130.000,NULL,NULL,1,1,'2021-08-11 14:35:18','2021-08-11 16:56:40','','','','4e021650188f4de17ea7f3619137c5b9.jpg',NULL,NULL,NULL,22,NULL,'','','','','',0,0,'0'),(24,1,NULL,12,'2 МК','Ёмкость-контейнер одноразовый 2 Л','yomkost-konteyner-odnorazovyy-2-lmk',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медицинских отходов. Бесконтактный сбор острого инстру- ментария в местах первичного образования.</p>\n<hr />\n<ul>\n<li>различные формы отверстий для съема/откручивания</li>\n<li>различные размеры отверстий в разных видах контейнеров</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов</li>\n</ul>','','',0,NULL,NULL,140.000,NULL,NULL,1,1,'2021-08-11 14:43:24','2021-08-11 16:56:50','','','','e011062552243e72a9dd1ba038aa6dbd.jpg',NULL,NULL,NULL,23,NULL,'','','','','',0,0,'0'),(25,1,NULL,12,'2 О','Ёмкость-контейнер одноразовый 2 Л','yomkost-konteyner-odnorazovyy-2-loldans',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медицинских отходов. Бесконтактный сбор острого инстру- ментария в местах первичного образования.</p>\n<hr />\n<ul>\n<li>различные формы отверстий для съема/откручивания</li>\n<li>различные размеры отверстий в разных видах контейнеров</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов</li>\n</ul>','','',0,NULL,NULL,265.000,NULL,NULL,1,1,'2021-08-11 14:47:52','2021-09-05 18:03:59','','','','44a917daf6361fd11fc80590a1a6ea09.jpg',NULL,NULL,NULL,24,NULL,'','','','','',0,0,'1'),(26,1,NULL,12,'2.5 МФ','Ёмкость-контейнер одноразовый 2.5 Л','yomkost-konteyner-odnorazovyy-25-lmf',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медицинских отходов. Бесконтактный сбор острого инстру- ментария в местах первичного образования.</p>\n<hr /><ul><li>различные формы отверстий для съема/откручивания</li>\n<li>различные размеры отверстий в разных видах контейнеров</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов</li>\n</ul>','','',0,NULL,NULL,220.000,NULL,NULL,1,1,'2021-08-11 14:53:34','2021-09-09 16:51:35','','','','e9732ddc7fd49486749c6142b03b892a.jpg',NULL,NULL,NULL,25,NULL,'','','','','',0,0,'1'),(27,1,NULL,12,'2.5 МК','Ёмкость-контейнер одноразовый 2.5 Л','yomkost-konteyner-odnorazovyy-25-lmk',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медицинских отходов. Бесконтактный сбор острого инстру- ментария в местах первичного образования.</p>\n<hr />\n<ul>\n<li>различные формы отверстий для съема/откручивания</li>\n<li>различные размеры отверстий в разных видах контейнеров</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов</li>\n</ul>','','',0,NULL,NULL,135.000,NULL,NULL,1,1,'2021-08-11 14:57:39','2021-08-11 16:57:27','','','','4def143bb16db6fab8a23488e4eed32e.jpg',NULL,NULL,NULL,26,NULL,'','','','','',0,0,'0'),(28,1,NULL,12,'2.5 О','Ёмкость-контейнер одноразовый 2.5 Л','yomkost-konteyner-odnorazovyy-25-loldans',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медицинских отходов. Бесконтактный сбор острого инстру- ментария в местах первичного образования.</p>\n<hr />\n<ul>\n<li>различные формы отверстий для съема/откручивания</li>\n<li>различные размеры отверстий в разных видах контейнеров</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов</li>\n</ul>','','',0,NULL,NULL,265.000,NULL,NULL,1,1,'2021-08-11 15:05:47','2021-08-11 16:57:37','','','','d640bc6229ea30e7b227d9f1f03ab416.jpg',NULL,NULL,NULL,27,NULL,'','','','','',0,0,'0'),(29,1,NULL,12,'3 МФ','Ёмкость-контейнер одноразовый 3 Л','yomkost-konteyner-odnorazovyy-3-lmf',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медицинских отходов. Бесконтактный сбор острого инстру- ментария в местах первичного образования.</p>\n<hr />\n<ul>\n<li>различные формы отверстий для съема/откручивания</li>\n<li>различные размеры отверстий в разных видах контейнеров</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов</li>\n</ul>','','',0,NULL,NULL,160.000,NULL,NULL,1,1,'2021-08-11 15:12:04','2021-08-11 16:57:46','','','','ba2ecb4339c6a4a4ab781ae8488c58cd.jpg',NULL,NULL,NULL,28,NULL,'','','','','',0,0,'0'),(30,1,NULL,12,'3 МК','Ёмкость-контейнер одноразовый 3 Л','yomkost-konteyner-odnorazovyy-3-lmk',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медицинских отходов. Бесконтактный сбор острого инстру- ментария в местах первичного образования.</p>\n<hr />\n<ul>\n<li>различные формы отверстий для съема/откручивания</li>\n<li>различные размеры отверстий в разных видах контейнеров</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов</li>\n</ul>','','',0,NULL,NULL,210.000,NULL,NULL,1,1,'2021-08-11 15:18:49','2021-08-11 16:57:55','','','','6bd45e0cc2e7b86286bafc5bc088a7b2.jpg',NULL,NULL,NULL,29,NULL,'','','','','',0,0,'0'),(31,1,NULL,12,'3 О','Ёмкость-контейнер одноразовый 3 Л','yomkost-konteyner-odnorazovyy-3-loldans',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медицинских отходов. Бесконтактный сбор острого инстру- ментария в местах первичного образования.</p>\n<hr />\n<ul>\n<li>различные формы отверстий для съема/откручивания</li>\n<li>различные размеры отверстий в разных видах контейнеров</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов</li>\n</ul>','','',0,NULL,NULL,180.000,NULL,NULL,1,1,'2021-08-11 15:21:46','2021-09-10 16:12:47','','','','711a85d60784c42261e8386f5a288ad5.jpg',NULL,NULL,NULL,30,NULL,'','','','','',0,0,'1'),(32,1,NULL,12,'36 МФ','Ёмкость-контейнер одноразовый 3.6 Л','yomkost-konteyner-odnorazovyy-36-l',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медицинских отходов. Бесконтактный сбор острого инстру- ментария в местах первичного образования.</p>\n<hr /><ul><li>различные формы отверстий для съема/откручивания</li>\n<li>различные размеры отверстий в разных видах контейнеров</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов</li>\n</ul>','','',0,NULL,NULL,175.000,NULL,NULL,1,1,'2021-08-11 15:26:09','2021-09-10 16:12:45','','','','ba4bc44665297405defcbe63d9612060.jpg',NULL,NULL,NULL,31,NULL,'','','','','',0,0,'1'),(33,1,NULL,12,'6 МФ','Ёмкость-контейнер одноразовый 6 Л','yomkost-konteyner-odnorazovyy-6-l',0.000,NULL,NULL,'','','',0,NULL,NULL,160.000,NULL,NULL,1,1,'2021-08-11 15:28:23','2021-09-10 16:12:40','','','','f51311026f462d81cacb7d337015c8d4.jpg',NULL,NULL,NULL,32,NULL,'','','','','',0,0,'1'),(34,1,NULL,12,'5 О','Ёмкость-контейнер одноразовый 6Л','yomkost-konteyner-odnorazovyy-6loldans',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медицинских отходов. Бесконтактный сбор острого инстру- ментария в местах первичного образования.</p>\n<hr />\n<ul>\n<li>различные формы отверстий для съема/откручивания</li>\n<li>различные размеры отверстий в разных видах контейнеров</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов</li>\n</ul>','','',0,NULL,NULL,235.000,NULL,NULL,1,1,'2021-08-11 15:33:31','2021-09-10 16:12:41','','','','6bd7e20102a66bb0a94eec9689ccf77c.jpg',NULL,NULL,NULL,33,NULL,'','','','','',0,0,'1'),(35,1,NULL,12,'6 МФ','Ёмкость-контейнер одноразовый 6 Л','yomkost-konteyner-odnorazovyy-6-lmf',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медицинских отходов. Бесконтактный сбор острого инстру- ментария в местах первичного образования.</p>\n<hr /><ul><li>различные формы отверстий для съема/откручивания</li>\n<li>различные размеры отверстий в разных видах контейнеров</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов</li>\n</ul>','','',0,NULL,NULL,240.000,NULL,NULL,1,1,'2021-08-11 15:37:52','2021-09-10 16:12:43','','','','0272b3690fc6110a8a78caa852d64120.jpg',NULL,NULL,NULL,34,NULL,'','','','','',0,0,'1'),(36,1,NULL,12,'6 МК','Ёмкость-контейнер одноразовый 6 Л','yomkost-konteyner-odnorazovyy-6-lmk',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медицинских отходов. Бесконтактный сбор острого инстру- ментария в местах первичного образования.</p>\n<hr />\n<ul>\n<li>различные формы отверстий для съема/откручивания</li>\n<li>различные размеры отверстий в разных видах контейнеров</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов</li>\n</ul>','','',0,NULL,NULL,205.000,NULL,NULL,1,1,'2021-08-11 15:39:58','2021-09-10 16:12:37','','','','fe4b71e4ccb7dab34081fccbac40a7f4.jpg',NULL,NULL,NULL,35,NULL,'','','','','',0,0,'1'),(37,1,NULL,12,'7.5 МК','Ёмкость-контейнер одноразовый 7.5 Л','yomkost-konteyner-odnorazovyy-75-lmk',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медицинских отходов. Бесконтактный сбор острого инстру- ментария в местах первичного образования.</p>\n<hr />\n<ul>\n<li>различные формы отверстий для съема/откручивания</li>\n<li>различные размеры отверстий в разных видах контейнеров</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов</li>\n</ul>','','',0,NULL,NULL,275.000,NULL,NULL,1,1,'2021-08-11 15:45:09','2021-09-10 16:12:35','','','','1de8da6e86555e7a1b2cab7e24df5dc5.jpg',NULL,NULL,NULL,36,NULL,'','','','','',0,0,'1'),(38,1,NULL,12,'10 МФ','Ёмкость-контейнер одноразовый 10 Л','yomkost-konteyner-odnorazovyy-10-lmf',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медицинских отходов. Бесконтактный сбор острого инстру- ментария в местах первичного образования.</p>\n<hr /><ul><li>различные формы отверстий для съема/откручивания</li>\n<li>различные размеры отверстий в разных видах контейнеров</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов</li>\n</ul>','','',0,NULL,NULL,250.000,NULL,NULL,1,1,'2021-08-11 16:12:58','2021-09-09 17:04:10','','','','fec645a7b2aa324e3198a72a9e875da8.jpg',NULL,NULL,NULL,37,NULL,'','','','','',0,0,'0'),(39,1,NULL,12,'10 МК','Ёмкость-контейнер одноразовый 10 Л','yomkost-konteyner-odnorazovyy-10-lmk',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медицинских отходов. Бесконтактный сбор острого инстру- ментария в местах первичного образования.</p>\n<hr />\n<ul>\n<li>различные формы отверстий для съема/откручивания</li>\n<li>различные размеры отверстий в разных видах контейнеров</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов</li>\n</ul>','','',0,NULL,NULL,220.000,NULL,NULL,1,1,'2021-08-11 16:15:03','2021-09-05 22:37:45','','','','0d4729dc3dd70a6d8ffbb2c4736d9d73.jpg',NULL,NULL,NULL,38,NULL,'','','','','',0,0,'2'),(40,1,NULL,12,'10 О','Ёмкость-контейнер одноразовый 10 Л','yomkost-konteyner-odnorazovyy-10-lo',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медицинских отходов. Бесконтактный сбор острого инстру- ментария в местах первичного образования.</p>\n<hr />\n<ul>\n<li>различные формы отверстий для съема/откручивания</li>\n<li>различные размеры отверстий в разных видах контейнеров</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов</li>\n</ul>','','',0,NULL,NULL,340.000,NULL,NULL,1,1,'2021-08-11 16:22:52','2021-08-11 16:59:38','','','','4e479363ab8cd9a6026227f845688b55.jpg',NULL,NULL,NULL,39,NULL,'','','','','',0,0,'0'),(41,1,NULL,12,'12 МК','Ёмкость-контейнер одноразовый 12 Л','yomkost-konteyner-odnorazovyy-12-lmk',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медицинских отходов. Бесконтактный сбор острого инстру- ментария в местах первичного образования.</p>\n<hr />\n<ul>\n<li>различные формы отверстий для съема/откручивания</li>\n<li>различные размеры отверстий в разных видах контейнеров</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов</li>\n</ul>','','',0,NULL,NULL,260.000,NULL,NULL,1,1,'2021-08-11 16:24:24','2021-09-05 18:04:07','','','','4b0ad05b0c5f4b15f2032bdf67225dfa.jpg',NULL,NULL,NULL,40,NULL,'','','','','',0,0,'1'),(42,1,NULL,12,'05 К','Ёмкость-контейнер одноразовый 0,5 Л','yomkost-konteyner-odnorazovyy-05-lk',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медицинских отходов. Бесконтактный сбор острого инструментария в местах первичного образования.</p>\n<hr />\n<ul>\n<li>подходит для использования в амбулатории и стационаре</li>\n<li>сбор жидких отходов в картонные контейнеры не производится</li>\n</ul>','','',0,NULL,NULL,170.000,NULL,NULL,1,1,'2021-08-11 16:51:09','2021-08-11 22:04:26','','','','242a7064936d4772db7d66d182501b3b.jpg',NULL,NULL,NULL,41,NULL,'','','','','',0,0,'0'),(43,1,NULL,12,'1 К','Ёмкость-контейнер одноразовый 1 Л','yomkost-konteyner-odnorazovyy-1-lk',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медицинских отходов. Бесконтактный сбор острого инструментария в местах первичного образования.</p>\n<hr />\n<ul>\n<li>подходит для использования в амбулатории и стационаре</li>\n<li>сбор жидких отходов в картонные контейнеры не производится</li>\n</ul>','','',0,NULL,NULL,140.000,NULL,NULL,1,1,'2021-08-11 22:06:53','2021-08-11 22:06:53','','','','7d8e2507123b0a1ab2bb0bb89e154b3d.jpg',NULL,NULL,NULL,42,NULL,'','','','','',0,0,'0'),(44,1,NULL,12,'1.5 К','Ёмкость-контейнер одноразовый 1,5 Л','yomkost-konteyner-odnorazovyy-15-lK',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медицинских отходов. Бесконтактный сбор острого инструментария в местах первичного образования.</p>\n<hr />\n<ul>\n<li>подходит для использования в амбулатории и стационаре</li>\n<li>сбор жидких отходов в картонные контейнеры не производится</li>\n</ul>','','',0,NULL,NULL,105.000,NULL,NULL,1,1,'2021-08-11 22:08:41','2021-08-11 22:08:41','','','','947df3be5dab3b3b8d1637f9b4f9f596.jpg',NULL,NULL,NULL,43,NULL,'','','','','',0,0,'0'),(45,1,NULL,12,'2.5 К','Ёмкость-контейнер одноразовый 2,5 Л','yomkost-konteyner-odnorazovyy-25-lK',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медицинских отходов. Бесконтактный сбор острого инструментария в местах первичного образования.</p>\n<hr />\n<ul>\n<li>подходит для использования в амбулатории и стационаре</li>\n<li>сбор жидких отходов в картонные контейнеры не производится</li>\n</ul>','','',0,NULL,NULL,210.000,NULL,NULL,1,1,'2021-08-11 22:10:24','2021-08-11 22:10:24','','','','5301eebb4f0035fa0db4c69f3a0a2691.jpg',NULL,NULL,NULL,44,NULL,'','','','','',0,0,'0'),(46,1,NULL,12,'5 К','Ёмкость-контейнер одноразовый 5Л','yomkost-konteyner-odnorazovyy-5lkomn',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медицинских отходов. Бесконтактный сбор острого инструментария в местах первичного образования.</p>\n<hr />\n<ul>\n<li>подходит для использования в амбулатории и стационаре</li>\n<li>сбор жидких отходов в картонные контейнеры не производится</li>\n</ul>','','',0,NULL,NULL,400.000,NULL,NULL,1,1,'2021-08-11 22:12:41','2021-08-11 22:12:41','','','','d9d1386f8f9fd91f66080a7cd9a5ceb1.jpg',NULL,NULL,NULL,45,NULL,'','','','','',0,0,'0'),(47,1,NULL,13,'05О О','Ёмкость-контейнер одноразовый 0,5 Л','yomkost-konteyner-odnorazovyy-05-l05o',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных органических и микробиологических медицинских отходов.</p>\n<hr /><ul><li>подходит для использования в амбулатории и стационаре</li>\n<li>подходит для использования ветеринарной службой</li>\n<li>ёмкости 0,75 л и 1 л имеют удобную и гибкую ручку</li>\n</ul>','','',0,NULL,NULL,84.000,NULL,NULL,1,1,'2021-08-12 00:22:42','2021-09-09 17:05:16','','','','cf0e4e7d362e7347c9d8aeeaacc95ebe.jpg',NULL,NULL,NULL,46,NULL,'','','','','',0,0,'0'),(48,1,NULL,13,'05О МФ','Ёмкость-контейнер одноразовый 0,5 Л','yomkost-konteyner-odnorazovyy-05-lomf',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных органических и микробиологических медицинских отходов.</p>\n<hr />\n<ul>\n<li>подходит для использования в амбулатории и стационаре</li>\n<li>подходит для использования ветеринарной службой</li>\n<li>ёмкости 0,75 л и 1 л имеют удобную и гибкую ручку</li>\n</ul>','','',0,NULL,NULL,85.000,NULL,NULL,1,1,'2021-08-12 00:25:28','2021-10-01 21:42:32','','','','11b06e95dc4e233dcb3f3632b5367f74.jpg',NULL,NULL,NULL,47,NULL,'','','','','',0,0,'2'),(49,1,NULL,13,' 08О О','Ёмкость-контейнер одноразовый 0,5 Л','yomkost-konteyner-odnorazovyy-05-l08o',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных органических и микробиологических медицинских отходов.</p>\n<hr /><ul><li>подходит для использования в амбулатории и стационаре</li>\n<li>подходит для использования ветеринарной службой</li>\n<li>ёмкости 0,75 л и 1 л имеют удобную и гибкую ручку</li>\n</ul>','','',0,NULL,NULL,118.000,NULL,NULL,1,1,'2021-08-12 00:28:32','2021-10-01 21:42:30','','','','c1899096e4ebc5ba7128fa1a567076bf.jpg',NULL,NULL,NULL,48,NULL,'','','','','',0,0,'3'),(50,1,NULL,13,'1 О МК','Ёмкость-контейнер одноразовый 1 Л','yomkost-konteyner-odnorazovyy-1-omk',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных органических и микробиологических медицинских отходов.</p>\n<hr />\n<ul>\n<li>подходит для использования в амбулатории и стационаре</li>\n<li>подходит для использования ветеринарной службой</li>\n<li>ёмкости 0,75 л и 1 л имеют удобную и гибкую ручку</li>\n</ul>','','',0,NULL,NULL,120.000,NULL,NULL,1,1,'2021-08-12 00:33:39','2021-10-01 21:42:28','','','','6b214afe9e55b837eb0accae21d390ef.jpg',NULL,NULL,NULL,49,NULL,'','','','','',0,0,'2'),(51,1,NULL,13,'5 О МК','Ёмкость-контейнер одноразовый 5 Л','yomkost-konteyner-odnorazovyy-5-lomk',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных органических и микробиологических медицинских отходов.</p>\n<hr />\n<ul>\n<li>подходит для использования в амбулатории и стационаре</li>\n<li>подходит для использования ветеринарной службой</li>\n<li>ёмкости 0,75 л и 1 л имеют удобную и гибкую ручку</li>\n</ul>','','',0,NULL,NULL,243.000,NULL,NULL,1,1,'2021-08-12 00:36:32','2021-08-12 00:37:24','','','','1d1fceb78c2e02967f12b72945f6c279.jpg',NULL,NULL,NULL,50,NULL,'','','','','',0,0,'0'),(52,1,NULL,12,'1.5 нИ','Ёмкость-контейнер одноразовый 1,5 Л','yomkost-konteyner-odnorazovyy-15-lni',0.000,NULL,NULL,'<p>Безопасный сбор эпидемиологически опасных медиментария в местах первичного образования.</p>\n<ul><li>различные формы отверстий для съема/откручивания</li>\n<li>подходит для использования в амбулатории и стационаре при образовании минимального количества медицинских отходов.</li>\n</ul>','','',0,NULL,NULL,210.000,NULL,NULL,1,1,'2021-09-05 18:26:18','2021-10-01 21:39:52','','','','f2570cb642d6efee1493e6da43014357.jpg',NULL,NULL,NULL,51,NULL,'','','','','',0,0,'2');
/*!40000 ALTER TABLE `yupe_store_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_store_product_attribute_value`
--

DROP TABLE IF EXISTS `yupe_store_product_attribute_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_store_product_attribute_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `number_value` double DEFAULT NULL,
  `string_value` varchar(250) DEFAULT NULL,
  `text_value` text,
  `option_value` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yupe_fk_product_attribute_product` (`product_id`),
  KEY `yupe_fk_product_attribute_attribute` (`attribute_id`),
  KEY `yupe_fk_product_attribute_option` (`option_value`),
  KEY `yupe_ix_product_attribute_number_value` (`number_value`),
  KEY `yupe_ix_product_attribute_string_value` (`string_value`),
  CONSTRAINT `yupe_fk_product_attribute_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `yupe_store_attribute` (`id`) ON DELETE CASCADE,
  CONSTRAINT `yupe_fk_product_attribute_option` FOREIGN KEY (`option_value`) REFERENCES `yupe_store_attribute_option` (`id`) ON DELETE CASCADE,
  CONSTRAINT `yupe_fk_product_attribute_product` FOREIGN KEY (`product_id`) REFERENCES `yupe_store_product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_store_product_attribute_value`
--

LOCK TABLES `yupe_store_product_attribute_value` WRITE;
/*!40000 ALTER TABLE `yupe_store_product_attribute_value` DISABLE KEYS */;
INSERT INTO `yupe_store_product_attribute_value` VALUES (1,1,2,NULL,NULL,NULL,2,NULL),(2,1,3,NULL,NULL,NULL,5,NULL),(3,8,2,NULL,NULL,NULL,2,NULL),(4,8,3,NULL,NULL,NULL,5,NULL),(5,2,2,NULL,NULL,NULL,2,NULL),(6,2,3,NULL,NULL,NULL,5,NULL),(9,3,2,NULL,NULL,NULL,2,NULL),(10,3,3,NULL,NULL,NULL,6,NULL),(11,4,2,NULL,NULL,NULL,2,NULL),(12,4,3,NULL,NULL,NULL,7,NULL),(13,5,2,NULL,NULL,NULL,2,NULL),(14,5,3,NULL,NULL,NULL,7,NULL),(15,6,2,NULL,NULL,NULL,2,NULL),(16,6,3,NULL,NULL,NULL,7,NULL),(17,7,2,NULL,NULL,NULL,2,NULL),(18,7,3,NULL,NULL,NULL,7,NULL),(19,10,2,NULL,NULL,NULL,2,NULL),(20,10,3,NULL,NULL,NULL,7,NULL),(21,11,2,NULL,NULL,NULL,2,NULL),(22,11,3,NULL,NULL,NULL,21,NULL),(23,12,2,NULL,NULL,NULL,2,NULL),(24,12,3,NULL,NULL,NULL,8,NULL),(25,13,2,NULL,NULL,NULL,2,NULL),(26,13,3,NULL,NULL,NULL,9,NULL),(27,14,2,NULL,NULL,NULL,2,NULL),(28,14,3,NULL,NULL,NULL,9,NULL),(29,15,2,NULL,NULL,NULL,2,NULL),(30,15,3,NULL,NULL,NULL,9,NULL),(31,16,2,NULL,NULL,NULL,2,NULL),(32,16,3,NULL,NULL,NULL,9,NULL),(33,17,2,NULL,NULL,NULL,2,NULL),(34,17,3,NULL,NULL,NULL,10,NULL),(35,18,2,NULL,NULL,NULL,2,NULL),(36,18,3,NULL,NULL,NULL,11,NULL),(37,19,2,NULL,NULL,NULL,2,NULL),(38,19,3,NULL,NULL,NULL,11,NULL),(39,20,2,NULL,NULL,NULL,2,NULL),(40,20,3,NULL,NULL,NULL,11,NULL),(41,21,2,NULL,NULL,NULL,2,NULL),(42,21,3,NULL,NULL,NULL,11,NULL),(43,22,2,NULL,NULL,NULL,2,NULL),(44,22,3,NULL,NULL,NULL,11,NULL),(45,23,2,NULL,NULL,NULL,2,NULL),(46,23,3,NULL,NULL,NULL,12,NULL),(47,24,2,NULL,NULL,NULL,2,NULL),(48,24,3,NULL,NULL,NULL,12,NULL),(49,25,2,NULL,NULL,NULL,2,NULL),(50,25,3,NULL,NULL,NULL,12,NULL),(51,26,2,NULL,NULL,NULL,2,NULL),(52,26,3,NULL,NULL,NULL,13,NULL),(53,27,2,NULL,NULL,NULL,2,NULL),(54,27,3,NULL,NULL,NULL,13,NULL),(55,28,2,NULL,NULL,NULL,2,NULL),(56,28,3,NULL,NULL,NULL,13,NULL),(57,29,2,NULL,NULL,NULL,2,NULL),(58,29,3,NULL,NULL,NULL,14,NULL),(59,30,2,NULL,NULL,NULL,2,NULL),(60,30,3,NULL,NULL,NULL,14,NULL),(61,31,2,NULL,NULL,NULL,2,NULL),(62,31,3,NULL,NULL,NULL,14,NULL),(63,32,2,NULL,NULL,NULL,2,NULL),(64,32,3,NULL,NULL,NULL,16,NULL),(65,33,2,NULL,NULL,NULL,2,NULL),(66,33,3,NULL,NULL,NULL,15,NULL),(67,34,2,NULL,NULL,NULL,2,NULL),(68,34,3,NULL,NULL,NULL,17,NULL),(69,35,2,NULL,NULL,NULL,2,NULL),(70,35,3,NULL,NULL,NULL,15,NULL),(71,36,2,NULL,NULL,NULL,2,NULL),(72,36,3,NULL,NULL,NULL,15,NULL),(73,37,2,NULL,NULL,NULL,2,NULL),(74,37,3,NULL,NULL,NULL,19,NULL),(75,38,2,NULL,NULL,NULL,2,NULL),(76,38,3,NULL,NULL,NULL,22,NULL),(77,39,2,NULL,NULL,NULL,2,NULL),(78,39,3,NULL,NULL,NULL,22,NULL),(79,40,2,NULL,NULL,NULL,2,NULL),(80,40,3,NULL,NULL,NULL,22,NULL),(81,41,2,NULL,NULL,NULL,2,NULL),(82,41,3,NULL,NULL,NULL,23,NULL),(83,42,2,NULL,NULL,NULL,2,NULL),(84,42,3,NULL,NULL,NULL,7,NULL),(85,1,4,NULL,NULL,NULL,24,NULL),(86,8,4,NULL,NULL,NULL,24,NULL),(87,2,4,NULL,NULL,NULL,24,NULL),(88,3,4,NULL,NULL,NULL,24,NULL),(89,4,4,NULL,NULL,NULL,24,NULL),(90,5,4,NULL,NULL,NULL,24,NULL),(91,6,4,NULL,NULL,NULL,24,NULL),(92,7,4,NULL,NULL,NULL,24,NULL),(93,10,4,NULL,NULL,NULL,24,NULL),(94,11,4,NULL,NULL,NULL,24,NULL),(95,12,4,NULL,NULL,NULL,24,NULL),(96,13,4,NULL,NULL,NULL,24,NULL),(97,14,4,NULL,NULL,NULL,24,NULL),(98,15,4,NULL,NULL,NULL,24,NULL),(99,16,4,NULL,NULL,NULL,24,NULL),(100,17,4,NULL,NULL,NULL,24,NULL),(101,18,4,NULL,NULL,NULL,24,NULL),(102,19,4,NULL,NULL,NULL,24,NULL),(103,20,4,NULL,NULL,NULL,24,NULL),(104,21,4,NULL,NULL,NULL,24,NULL),(105,22,4,NULL,NULL,NULL,24,NULL),(106,23,4,NULL,NULL,NULL,24,NULL),(107,24,4,NULL,NULL,NULL,24,NULL),(108,25,4,NULL,NULL,NULL,24,NULL),(109,26,4,NULL,NULL,NULL,24,NULL),(110,27,4,NULL,NULL,NULL,24,NULL),(111,28,4,NULL,NULL,NULL,24,NULL),(112,29,4,NULL,NULL,NULL,24,NULL),(113,30,4,NULL,NULL,NULL,24,NULL),(114,31,4,NULL,NULL,NULL,24,NULL),(115,32,4,NULL,NULL,NULL,24,NULL),(116,33,4,NULL,NULL,NULL,24,NULL),(117,34,4,NULL,NULL,NULL,24,NULL),(118,35,4,NULL,NULL,NULL,24,NULL),(119,36,4,NULL,NULL,NULL,24,NULL),(120,37,4,NULL,NULL,NULL,24,NULL),(121,38,4,NULL,NULL,NULL,24,NULL),(122,39,4,NULL,NULL,NULL,24,NULL),(123,40,4,NULL,NULL,NULL,24,NULL),(124,41,4,NULL,NULL,NULL,24,NULL),(125,42,4,NULL,NULL,NULL,25,NULL),(126,43,2,NULL,NULL,NULL,2,NULL),(127,43,3,NULL,NULL,NULL,9,NULL),(128,43,4,NULL,NULL,NULL,25,NULL),(129,44,2,NULL,NULL,NULL,2,NULL),(130,44,3,NULL,NULL,NULL,11,NULL),(131,44,4,NULL,NULL,NULL,25,NULL),(132,45,2,NULL,NULL,NULL,2,NULL),(133,45,3,NULL,NULL,NULL,13,NULL),(134,45,4,NULL,NULL,NULL,25,NULL),(135,46,2,NULL,NULL,NULL,2,NULL),(136,46,3,NULL,NULL,NULL,17,NULL),(137,46,4,NULL,NULL,NULL,25,NULL),(138,47,2,NULL,NULL,NULL,2,NULL),(139,47,3,NULL,NULL,NULL,7,NULL),(140,47,4,NULL,NULL,NULL,24,NULL),(141,48,2,NULL,NULL,NULL,2,NULL),(142,48,3,NULL,NULL,NULL,7,NULL),(143,48,4,NULL,NULL,NULL,24,NULL),(144,49,2,NULL,NULL,NULL,2,NULL),(145,49,3,NULL,NULL,NULL,26,NULL),(146,49,4,NULL,NULL,NULL,24,NULL),(147,50,2,NULL,NULL,NULL,2,NULL),(148,50,3,NULL,NULL,NULL,9,NULL),(149,50,4,NULL,NULL,NULL,24,NULL),(150,51,2,NULL,NULL,NULL,2,NULL),(151,51,3,NULL,NULL,NULL,17,NULL),(152,51,4,NULL,NULL,NULL,24,NULL),(153,52,2,NULL,NULL,NULL,2,NULL),(154,52,3,NULL,NULL,NULL,11,NULL),(155,52,4,NULL,NULL,NULL,24,NULL);
/*!40000 ALTER TABLE `yupe_store_product_attribute_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_store_product_category`
--

DROP TABLE IF EXISTS `yupe_store_product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_store_product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_yupe_store_product_category_product_id` (`product_id`),
  KEY `ix_yupe_store_product_category_category_id` (`category_id`),
  CONSTRAINT `fk_yupe_store_product_category_category` FOREIGN KEY (`category_id`) REFERENCES `yupe_store_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yupe_store_product_category_product` FOREIGN KEY (`product_id`) REFERENCES `yupe_store_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_store_product_category`
--

LOCK TABLES `yupe_store_product_category` WRITE;
/*!40000 ALTER TABLE `yupe_store_product_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_store_product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_store_product_image`
--

DROP TABLE IF EXISTS `yupe_store_product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_store_product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_yupe_store_product_image_product` (`product_id`),
  KEY `fk_yupe_store_product_image_group` (`group_id`),
  CONSTRAINT `fk_yupe_store_product_image_group` FOREIGN KEY (`group_id`) REFERENCES `yupe_store_product_image_group` (`id`) ON UPDATE SET NULL,
  CONSTRAINT `fk_yupe_store_product_image_product` FOREIGN KEY (`product_id`) REFERENCES `yupe_store_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_store_product_image`
--

LOCK TABLES `yupe_store_product_image` WRITE;
/*!40000 ALTER TABLE `yupe_store_product_image` DISABLE KEYS */;
INSERT INTO `yupe_store_product_image` VALUES (19,2,'fabc2e4d8936732e5cb7c42746f24e9d.jpg','','',NULL),(20,8,'2555c0925e3fcbb9761d0fd4bcf2dd72.jpg','','',NULL),(21,8,'a749fe8f66a6429310b7e97c509fdcf9.jpg','','',NULL),(22,3,'331389ff6d9f37d60db3fb6e33095d98.jpg','','',NULL),(23,1,'e342a2968c6f785d6f36eef7a03a91df.jpg','','',NULL),(24,4,'672baa6f8ca4469ab4a0c0fe46bc1401.jpg','','',NULL),(25,4,'bfc18627d59e96e81835d71c01c67e6a.jpg','','',NULL),(27,6,'bb20336971e40c9f3deb2da1e5e8a594.jpg','','',NULL),(29,10,'a4761367a135015122a005e262dd357f.jpg','','',NULL),(30,10,'d719f07307fe2644ce8126d3ae82c850.jpg','','',NULL),(31,11,'44a7770e4ec05f4303908460e063bb35.jpg','','',NULL),(32,11,'a00b2d51ffbd4cdf6a45abca617981bb.jpg','','',NULL),(33,12,'a8550d1bf247704f12671bffbea16db7.jpg','','',NULL),(34,13,'369cbe29a8de0f05a635d8c44c250f3b.jpg','','',NULL),(35,13,'e75b30d0f6e1bfb62da8c8477a9f3758.jpg','','',NULL),(36,14,'792ca34f3ecbc98e43ca223c237ba666.jpg','','',NULL),(37,15,'c2097c0b26b8a05590a8c75c53de3af3.jpg','','',NULL),(38,16,'7bfeda1f51242a70dca61af4d60fb34c.jpg','','',NULL),(39,17,'002465ec04e0b8c183f5a31f333e2b2b.jpg','','',NULL),(40,18,'e674954e80d67b61225a740f78a80b31.jpg','','',NULL),(41,19,'cec6ad7548904a94f9920004ba7834a9.jpg','','',NULL),(42,20,'922bf6686593b8589e60fa77a489d4a5.jpg','','',NULL),(43,22,'e2f90fae533b3b37b68b3856406194f4.jpg','','',NULL),(44,23,'a3bc06e36b62e5fccca07364c02392f9.jpg','','',NULL),(45,24,'3ccc8dd1e600018b9c8d3b9f11798483.jpg','','',NULL),(46,25,'4dbc60d467712f17b8a0b646f01a2623.jpg','','',NULL),(47,27,'9a6a78647504fd45ea508b22cfed7ab8.jpg','','',NULL),(48,28,'d58402062669f6017368fb96d83f57ec.jpg','','',NULL),(49,29,'b0aee676712f621e411e1fd0b2643fad.jpg','','',NULL),(50,30,'38f6547e41cecee47fe27b816bc97364.jpg','','',NULL),(51,31,'0e451f8a00b0bd6f34d248be64f8d43e.jpg','','',NULL),(52,33,'bec6dc0bebe848ea15642523ea5e2b82.jpg','','',NULL),(53,34,'fc8963aeaddfa7b4e3a441d8ce70ecc1.jpg','','',NULL),(54,36,'59d79d689f89f061a00976fa58de36b0.jpg','','',NULL),(55,37,'9ab469b9e31489f262aa4f1622a3f86c.jpg','','',NULL),(56,39,'ee3947201a7bf1ed8950f9966d4182e7.jpg','','',NULL),(57,40,'b752e3cae50e5418ba77843fd6882ebd.jpg','','',NULL),(58,41,'2d1c8e4e0e45ee147ca154fb643a25f0.jpg','','',NULL),(59,42,'86831cc8f33b262310e9f93fcbcf5969.jpg','','',NULL),(60,43,'f03a34fc7bbb6d2ec3db6d96096f53e3.jpg','','',NULL),(61,44,'cb79e8af731ad62994c4638440da92e9.jpg','','',NULL),(62,45,'79c415b04c8fc234f05af72fc8b46426.jpg','','',NULL),(63,46,'f18ea8b47b260f04dfc22261fb94f5d8.jpg','','',NULL),(65,48,'525db0b5919c4a13664b162a358e8d49.jpg','','',NULL),(67,17,'b7afede3cec5c14050b4908c6bb649cf.jpg','','',NULL),(68,18,'e417749fb79f2389b2190dcd2c418193.jpg','','',NULL),(69,52,'eb61a5c0e45ed3cc300cf627da51542e.jpg','','',NULL),(70,52,'2d07c3e102cc7ae2b5aa4fa6a2270bc8.jpg','','',NULL),(71,5,'2bad5db628746251c744226536d70949.jpg','','',NULL),(72,7,'45ec22482e1e20edf05e73f3f360aefd.jpg','','',NULL),(73,10,'03bee58ec87ea296d41df1004d46fd51.jpg','','',NULL),(74,21,'96a6dd183a0206441c8b82d687dd7db4.jpg','','',NULL),(75,26,'d4c61c458480ce17434fe8b54cdaf5fb.jpg','','',NULL),(76,32,'2413e5cc67bc7f69bf35f9a146e64820.jpg','','',NULL),(77,35,'1d39b3d54ad4cfc6795e3e1cb32a92af.jpg','','',NULL),(78,38,'79ffa0be78c51d1f89d7114d9d869433.jpg','','',NULL);
/*!40000 ALTER TABLE `yupe_store_product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_store_product_image_group`
--

DROP TABLE IF EXISTS `yupe_store_product_image_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_store_product_image_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_store_product_image_group`
--

LOCK TABLES `yupe_store_product_image_group` WRITE;
/*!40000 ALTER TABLE `yupe_store_product_image_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_store_product_image_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_store_product_link`
--

DROP TABLE IF EXISTS `yupe_store_product_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_store_product_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `linked_product_id` int(11) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_store_product_link_product` (`product_id`,`linked_product_id`),
  KEY `fk_yupe_store_product_link_linked_product` (`linked_product_id`),
  KEY `fk_yupe_store_product_link_type` (`type_id`),
  CONSTRAINT `fk_yupe_store_product_link_linked_product` FOREIGN KEY (`linked_product_id`) REFERENCES `yupe_store_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yupe_store_product_link_product` FOREIGN KEY (`product_id`) REFERENCES `yupe_store_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yupe_store_product_link_type` FOREIGN KEY (`type_id`) REFERENCES `yupe_store_product_link_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_store_product_link`
--

LOCK TABLES `yupe_store_product_link` WRITE;
/*!40000 ALTER TABLE `yupe_store_product_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_store_product_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_store_product_link_type`
--

DROP TABLE IF EXISTS `yupe_store_product_link_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_store_product_link_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_store_product_link_type_code` (`code`),
  UNIQUE KEY `ux_yupe_store_product_link_type_title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_store_product_link_type`
--

LOCK TABLES `yupe_store_product_link_type` WRITE;
/*!40000 ALTER TABLE `yupe_store_product_link_type` DISABLE KEYS */;
INSERT INTO `yupe_store_product_link_type` VALUES (1,'similar','Похожие'),(2,'related','Сопутствующие');
/*!40000 ALTER TABLE `yupe_store_product_link_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_store_product_variant`
--

DROP TABLE IF EXISTS `yupe_store_product_variant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_store_product_variant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `attribute_value` varchar(255) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `type` tinyint(4) NOT NULL,
  `sku` varchar(50) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_yupe_store_product_variant_product` (`product_id`),
  KEY `idx_yupe_store_product_variant_attribute` (`attribute_id`),
  KEY `idx_yupe_store_product_variant_value` (`attribute_value`),
  CONSTRAINT `fk_yupe_store_product_variant_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `yupe_store_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yupe_store_product_variant_product` FOREIGN KEY (`product_id`) REFERENCES `yupe_store_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_store_product_variant`
--

LOCK TABLES `yupe_store_product_variant` WRITE;
/*!40000 ALTER TABLE `yupe_store_product_variant` DISABLE KEYS */;
INSERT INTO `yupe_store_product_variant` VALUES (1,1,2,'Желтый/#FFD400',0,0,'',1,NULL),(2,1,2,'Белый/#FFFFFF',0,0,'',2,NULL),(3,1,2,'Красный/#FF0000',0,0,'',3,NULL),(4,1,2,'Черный/#000000',0,0,'',4,NULL),(5,8,2,'Желтый/#FFD400',0,0,'',5,NULL),(6,8,2,'Белый/#FFFFFF',0,0,'',6,NULL),(7,8,2,'Красный/#FF0000',0,0,'',7,NULL),(8,8,2,'Черный/#000000',0,0,'',8,NULL),(9,2,2,'Желтый/#FFD400',0,0,'',9,NULL),(10,2,2,'Белый/#FFFFFF',0,0,'',10,NULL),(11,2,2,'Красный/#FF0000',0,0,'',11,NULL),(12,2,2,'Черный/#000000',0,0,'',12,NULL),(17,3,2,'Желтый/#FFD400',0,0,'',13,NULL),(18,3,2,'Белый/#FFFFFF',0,0,'',14,NULL),(19,3,2,'Красный/#FF0000',0,0,'',15,NULL),(20,3,2,'Черный/#000000',0,0,'',16,NULL),(21,4,2,'Желтый/#FFD400',0,0,'',17,NULL),(22,4,2,'Белый/#FFFFFF',0,0,'',18,NULL),(23,4,2,'Красный/#FF0000',0,0,'',19,NULL),(24,4,2,'Черный/#000000',0,0,'',20,NULL),(25,5,2,'Желтый/#FFD400',0,0,'',21,NULL),(26,5,2,'Белый/#FFFFFF',0,0,'',22,NULL),(27,5,2,'Красный/#FF0000',0,0,'',23,NULL),(28,5,2,'Черный/#000000',0,0,'',24,NULL),(29,6,2,'Желтый/#FFD400',0,0,'',25,NULL),(30,6,2,'Белый/#FFFFFF',0,0,'',26,NULL),(31,6,2,'Красный/#FF0000',0,0,'',27,NULL),(32,6,2,'Черный/#000000',0,0,'',28,NULL),(33,7,2,'Желтый/#FFD400',0,0,'',29,NULL),(34,7,2,'Белый/#FFFFFF',0,0,'',30,NULL),(35,7,2,'Красный/#FF0000',0,0,'',31,NULL),(36,7,2,'Черный/#000000',0,0,'',32,NULL),(37,10,2,'Желтый/#FFD400',0,0,'',33,NULL),(38,10,2,'Белый/#FFFFFF',0,0,'',34,NULL),(39,10,2,'Красный/#FF0000',0,0,'',35,NULL),(40,10,2,'Черный/#000000',0,0,'',36,NULL),(41,11,2,'Желтый/#FFD400',0,0,'',37,NULL),(42,11,2,'Белый/#FFFFFF',0,0,'',38,NULL),(43,11,2,'Красный/#FF0000',0,0,'',39,NULL),(44,11,2,'Черный/#000000',0,0,'',40,NULL),(45,12,2,'Желтый/#FFD400',0,0,'',41,NULL),(46,12,2,'Белый/#FFFFFF',0,0,'',42,NULL),(47,12,2,'Красный/#FF0000',0,0,'',43,NULL),(48,12,2,'Черный/#000000',0,0,'',44,NULL),(49,13,2,'Желтый/#FFD400',0,0,'',45,NULL),(50,13,2,'Белый/#FFFFFF',0,0,'',46,NULL),(51,13,2,'Красный/#FF0000',0,0,'',47,NULL),(52,13,2,'Черный/#000000',0,0,'',48,NULL),(53,14,2,'Желтый/#FFD400',0,0,'',49,NULL),(54,14,2,'Белый/#FFFFFF',0,0,'',50,NULL),(55,14,2,'Красный/#FF0000',0,0,'',51,NULL),(56,14,2,'Черный/#000000',0,0,'',52,NULL),(57,15,2,'Желтый/#FFD400',0,0,'',53,NULL),(58,15,2,'Белый/#FFFFFF',0,0,'',54,NULL),(59,15,2,'Красный/#FF0000',0,0,'',55,NULL),(60,15,2,'Черный/#000000',0,0,'',56,NULL),(61,16,2,'Желтый/#FFD400',0,0,'',57,NULL),(62,16,2,'Белый/#FFFFFF',0,0,'',58,NULL),(63,16,2,'Красный/#FF0000',0,0,'',59,NULL),(64,16,2,'Черный/#000000',0,0,'',60,NULL),(65,17,2,'Желтый/#FFD400',0,0,'',61,NULL),(66,17,2,'Белый/#FFFFFF',0,0,'',62,NULL),(67,17,2,'Красный/#FF0000',0,0,'',63,NULL),(68,17,2,'Черный/#000000',0,0,'',64,NULL),(69,18,2,'Желтый/#FFD400',0,0,'',65,NULL),(70,18,2,'Белый/#FFFFFF',0,0,'',66,NULL),(71,18,2,'Красный/#FF0000',0,0,'',67,NULL),(72,18,2,'Черный/#000000',0,0,'',68,NULL),(73,19,2,'Желтый/#FFD400',0,0,'',69,NULL),(74,19,2,'Белый/#FFFFFF',0,0,'',70,NULL),(75,19,2,'Красный/#FF0000',0,0,'',71,NULL),(76,19,2,'Черный/#000000',0,0,'',72,NULL),(77,20,2,'Желтый/#FFD400',0,0,'',73,NULL),(78,20,2,'Белый/#FFFFFF',0,0,'',74,NULL),(79,20,2,'Красный/#FF0000',0,0,'',75,NULL),(80,20,2,'Черный/#000000',0,0,'',76,NULL),(81,21,2,'Желтый/#FFD400',0,0,'',77,NULL),(82,21,2,'Белый/#FFFFFF',0,0,'',78,NULL),(83,21,2,'Красный/#FF0000',0,0,'',79,NULL),(84,21,2,'Черный/#000000',0,0,'',80,NULL),(85,22,2,'Желтый/#FFD400',0,0,'',81,NULL),(86,22,2,'Белый/#FFFFFF',0,0,'',82,NULL),(87,22,2,'Красный/#FF0000',0,0,'',83,NULL),(88,22,2,'Черный/#000000',0,0,'',84,NULL),(89,23,2,'Желтый/#FFD400',0,0,'',85,NULL),(90,23,2,'Белый/#FFFFFF',0,0,'',86,NULL),(91,23,2,'Красный/#FF0000',0,0,'',87,NULL),(92,23,2,'Черный/#000000',0,0,'',88,NULL),(93,24,2,'Желтый/#FFD400',0,0,'',89,NULL),(94,24,2,'Белый/#FFFFFF',0,0,'',90,NULL),(95,24,2,'Красный/#FF0000',0,0,'',91,NULL),(96,24,2,'Черный/#000000',0,0,'',92,NULL),(97,25,2,'Желтый/#FFD400',0,0,'',93,NULL),(98,25,2,'Белый/#FFFFFF',0,0,'',94,NULL),(99,25,2,'Красный/#FF0000',0,0,'',95,NULL),(100,25,2,'Черный/#000000',0,0,'',96,NULL),(101,26,2,'Желтый/#FFD400',0,0,'',97,NULL),(102,26,2,'Белый/#FFFFFF',0,0,'',98,NULL),(103,26,2,'Красный/#FF0000',0,0,'',99,NULL),(104,26,2,'Черный/#000000',0,0,'',100,NULL),(105,27,2,'Желтый/#FFD400',0,0,'',101,NULL),(106,27,2,'Белый/#FFFFFF',0,0,'',102,NULL),(107,27,2,'Красный/#FF0000',0,0,'',103,NULL),(108,27,2,'Черный/#000000',0,0,'',104,NULL),(109,28,2,'Желтый/#FFD400',0,0,'',105,NULL),(110,28,2,'Белый/#FFFFFF',0,0,'',106,NULL),(111,28,2,'Красный/#FF0000',0,0,'',107,NULL),(112,28,2,'Черный/#000000',0,0,'',108,NULL),(113,29,2,'Желтый/#FFD400',0,0,'',109,NULL),(114,29,2,'Белый/#FFFFFF',0,0,'',110,NULL),(115,29,2,'Красный/#FF0000',0,0,'',111,NULL),(116,29,2,'Черный/#000000',0,0,'',112,NULL),(117,30,2,'Желтый/#FFD400',0,0,'',113,NULL),(118,30,2,'Белый/#FFFFFF',0,0,'',114,NULL),(119,30,2,'Красный/#FF0000',0,0,'',115,NULL),(120,30,2,'Черный/#000000',0,0,'',116,NULL),(121,31,2,'Желтый/#FFD400',0,0,'',117,NULL),(122,31,2,'Белый/#FFFFFF',0,0,'',118,NULL),(123,31,2,'Красный/#FF0000',0,0,'',119,NULL),(124,31,2,'Черный/#000000',0,0,'',120,NULL),(125,32,2,'Желтый/#FFD400',0,0,'',121,NULL),(126,32,2,'Белый/#FFFFFF',0,0,'',122,NULL),(127,32,2,'Красный/#FF0000',0,0,'',123,NULL),(128,32,2,'Черный/#000000',0,0,'',124,NULL),(129,33,2,'Желтый/#FFD400',0,0,'',125,NULL),(130,33,2,'Белый/#FFFFFF',0,0,'',126,NULL),(131,33,2,'Красный/#FF0000',0,0,'',127,NULL),(132,33,2,'Черный/#000000',0,0,'',128,NULL),(133,34,2,'Желтый/#FFD400',0,0,'',129,NULL),(134,34,2,'Белый/#FFFFFF',0,0,'',130,NULL),(135,34,2,'Красный/#FF0000',0,0,'',131,NULL),(136,34,2,'Черный/#000000',0,0,'',132,NULL),(137,35,2,'Желтый/#FFD400',0,0,'',133,NULL),(138,35,2,'Белый/#FFFFFF',0,0,'',134,NULL),(139,35,2,'Красный/#FF0000',0,0,'',135,NULL),(140,35,2,'Черный/#000000',0,0,'',136,NULL),(141,36,2,'Желтый/#FFD400',0,0,'',137,NULL),(142,36,2,'Белый/#FFFFFF',0,0,'',138,NULL),(143,36,2,'Красный/#FF0000',0,0,'',139,NULL),(144,36,2,'Черный/#000000',0,0,'',140,NULL),(145,37,2,'Желтый/#FFD400',0,0,'',141,NULL),(146,37,2,'Белый/#FFFFFF',0,0,'',142,NULL),(147,37,2,'Красный/#FF0000',0,0,'',143,NULL),(148,37,2,'Черный/#000000',0,0,'',144,NULL),(149,38,2,'Желтый/#FFD400',0,0,'',145,NULL),(150,38,2,'Белый/#FFFFFF',0,0,'',146,NULL),(151,38,2,'Красный/#FF0000',0,0,'',147,NULL),(152,38,2,'Черный/#000000',0,0,'',148,NULL),(153,39,2,'Желтый/#FFD400',0,0,'',149,NULL),(154,39,2,'Белый/#FFFFFF',0,0,'',150,NULL),(155,39,2,'Красный/#FF0000',0,0,'',151,NULL),(156,39,2,'Черный/#000000',0,0,'',152,NULL),(157,40,2,'Желтый/#FFD400',0,0,'',153,NULL),(158,40,2,'Белый/#FFFFFF',0,0,'',154,NULL),(159,40,2,'Красный/#FF0000',0,0,'',155,NULL),(160,40,2,'Черный/#000000',0,0,'',156,NULL),(161,41,2,'Желтый/#FFD400',0,0,'',157,NULL),(162,41,2,'Белый/#FFFFFF',0,0,'',158,NULL),(163,41,2,'Красный/#FF0000',0,0,'',159,NULL),(164,41,2,'Черный/#000000',0,0,'',160,NULL),(165,42,2,'Желтый/#FFD400',0,0,'',161,NULL),(166,42,2,'Белый/#FFFFFF',0,0,'',162,NULL),(167,42,2,'Красный/#FF0000',0,0,'',163,NULL),(168,42,2,'Черный/#000000',0,0,'',164,NULL),(169,43,2,'Желтый/#FFD400',0,0,'',165,NULL),(170,43,2,'Белый/#FFFFFF',0,0,'',166,NULL),(171,43,2,'Красный/#FF0000',0,0,'',167,NULL),(172,43,2,'Черный/#000000',0,0,'',168,NULL),(173,44,2,'Желтый/#FFD400',0,0,'',169,NULL),(174,44,2,'Белый/#FFFFFF',0,0,'',170,NULL),(175,44,2,'Красный/#FF0000',0,0,'',171,NULL),(176,44,2,'Черный/#000000',0,0,'',172,NULL),(177,45,2,'Желтый/#FFD400',0,0,'',173,NULL),(178,45,2,'Белый/#FFFFFF',0,0,'',174,NULL),(179,45,2,'Красный/#FF0000',0,0,'',175,NULL),(180,45,2,'Черный/#000000',0,0,'',176,NULL),(181,46,2,'Желтый/#FFD400',0,0,'',177,NULL),(182,46,2,'Белый/#FFFFFF',0,0,'',178,NULL),(183,46,2,'Красный/#FF0000',0,0,'',179,NULL),(184,46,2,'Черный/#000000',0,0,'',180,NULL),(185,47,2,'Желтый/#FFD400',0,0,'',181,NULL),(186,47,2,'Белый/#FFFFFF',0,0,'',182,NULL),(187,47,2,'Красный/#FF0000',0,0,'',183,NULL),(188,47,2,'Черный/#000000',0,0,'',184,NULL),(189,48,2,'Желтый/#FFD400',0,0,'',185,NULL),(190,48,2,'Белый/#FFFFFF',0,0,'',186,NULL),(191,48,2,'Красный/#FF0000',0,0,'',187,NULL),(192,48,2,'Черный/#000000',0,0,'',188,NULL),(193,49,2,'Желтый/#FFD400',0,0,'',189,NULL),(194,49,2,'Белый/#FFFFFF',0,0,'',190,NULL),(195,49,2,'Красный/#FF0000',0,0,'',191,NULL),(196,49,2,'Черный/#000000',0,0,'',192,NULL),(197,50,2,'Желтый/#FFD400',0,0,'',193,NULL),(198,50,2,'Белый/#FFFFFF',0,0,'',194,NULL),(199,50,2,'Красный/#FF0000',0,0,'',195,NULL),(200,50,2,'Черный/#000000',0,0,'',196,NULL),(201,51,2,'Желтый/#FFD400',0,0,'',197,NULL),(202,51,2,'Белый/#FFFFFF',0,0,'',198,NULL),(203,51,2,'Красный/#FF0000',0,0,'',199,NULL),(204,51,2,'Черный/#000000',0,0,'',200,NULL),(205,52,2,'Желтый/#FFD400',0,0,'',201,NULL),(206,52,2,'Белый/#FFFFFF',0,0,'',202,NULL),(207,52,2,'Красный/#FF0000',0,0,'',203,NULL),(208,52,2,'Черный/#000000',0,0,'',204,NULL);
/*!40000 ALTER TABLE `yupe_store_product_variant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_store_type`
--

DROP TABLE IF EXISTS `yupe_store_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_store_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_store_type_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_store_type`
--

LOCK TABLES `yupe_store_type` WRITE;
/*!40000 ALTER TABLE `yupe_store_type` DISABLE KEYS */;
INSERT INTO `yupe_store_type` VALUES (1,'контейнеры');
/*!40000 ALTER TABLE `yupe_store_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_store_type_attribute`
--

DROP TABLE IF EXISTS `yupe_store_type_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_store_type_attribute` (
  `type_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  PRIMARY KEY (`type_id`,`attribute_id`),
  KEY `fk_yupe_store_type_attribute_attribute` (`attribute_id`),
  CONSTRAINT `fk_yupe_store_type_attribute_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `yupe_store_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yupe_store_type_attribute_type` FOREIGN KEY (`type_id`) REFERENCES `yupe_store_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_store_type_attribute`
--

LOCK TABLES `yupe_store_type_attribute` WRITE;
/*!40000 ALTER TABLE `yupe_store_type_attribute` DISABLE KEYS */;
INSERT INTO `yupe_store_type_attribute` VALUES (1,2),(1,3),(1,4);
/*!40000 ALTER TABLE `yupe_store_type_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_user_tokens`
--

DROP TABLE IF EXISTS `yupe_user_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_user_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `expire_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_yupe_user_tokens_user_id` (`user_id`),
  CONSTRAINT `fk_yupe_user_tokens_user_id` FOREIGN KEY (`user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_user_tokens`
--

LOCK TABLES `yupe_user_tokens` WRITE;
/*!40000 ALTER TABLE `yupe_user_tokens` DISABLE KEYS */;
INSERT INTO `yupe_user_tokens` VALUES (156,1,'C16SeuLEW11DDnmJO9Tunoxcd9dHdk2F',2,0,'2021-08-10 11:47:38','2021-08-10 11:47:38','127.0.0.1','2021-08-11 11:47:38'),(195,1,'IE0oOyXmEAnNbsmYBnrk70nMu17nCK86',4,0,'2021-10-24 13:23:48','2021-10-24 13:23:48','94.41.135.35','2021-10-31 13:23:48');
/*!40000 ALTER TABLE `yupe_user_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_user_user`
--

DROP TABLE IF EXISTS `yupe_user_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_user_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` datetime NOT NULL,
  `first_name` varchar(250) DEFAULT NULL,
  `middle_name` varchar(250) DEFAULT NULL,
  `last_name` varchar(250) DEFAULT NULL,
  `nick_name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `birth_date` date DEFAULT NULL,
  `site` varchar(250) NOT NULL DEFAULT '',
  `about` varchar(250) NOT NULL DEFAULT '',
  `location` varchar(250) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '2',
  `access_level` int(11) NOT NULL DEFAULT '0',
  `visit_time` datetime DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `avatar` varchar(150) DEFAULT NULL,
  `hash` varchar(255) NOT NULL DEFAULT '2eae861550c07eb0356b477a223c4a140.09819700 1610043138',
  `email_confirm` tinyint(1) NOT NULL DEFAULT '0',
  `phone` char(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_user_user_nick_name` (`nick_name`),
  UNIQUE KEY `ux_yupe_user_user_email` (`email`),
  KEY `ix_yupe_user_user_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_user_user`
--

LOCK TABLES `yupe_user_user` WRITE;
/*!40000 ALTER TABLE `yupe_user_user` DISABLE KEYS */;
INSERT INTO `yupe_user_user` VALUES (1,'2021-08-11 22:14:44','Roman','Alexandrovich','Gordeew','admin','gordeew.r2015@yandex.ru',1,NULL,'','frontend-developer','DCMedia',1,1,'2021-10-24 13:23:48','2021-01-07 23:12:59','1_1628516133.jpg','$2y$13$SBkPDOVZT.dWQRcCxp7bsu1txDcBEfy5Aloa.Uz6Mtu.K0HrLeMHa',1,'+7 (912) 340 6469');
/*!40000 ALTER TABLE `yupe_user_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_user_user_auth_assignment`
--

DROP TABLE IF EXISTS `yupe_user_user_auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_user_user_auth_assignment` (
  `itemname` char(64) NOT NULL,
  `userid` int(11) NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`),
  KEY `fk_yupe_user_user_auth_assignment_user` (`userid`),
  CONSTRAINT `fk_yupe_user_user_auth_assignment_item` FOREIGN KEY (`itemname`) REFERENCES `yupe_user_user_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yupe_user_user_auth_assignment_user` FOREIGN KEY (`userid`) REFERENCES `yupe_user_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_user_user_auth_assignment`
--

LOCK TABLES `yupe_user_user_auth_assignment` WRITE;
/*!40000 ALTER TABLE `yupe_user_user_auth_assignment` DISABLE KEYS */;
INSERT INTO `yupe_user_user_auth_assignment` VALUES ('admin',1,NULL,NULL);
/*!40000 ALTER TABLE `yupe_user_user_auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_user_user_auth_item`
--

DROP TABLE IF EXISTS `yupe_user_user_auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_user_user_auth_item` (
  `name` char(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`),
  KEY `ix_yupe_user_user_auth_item_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_user_user_auth_item`
--

LOCK TABLES `yupe_user_user_auth_item` WRITE;
/*!40000 ALTER TABLE `yupe_user_user_auth_item` DISABLE KEYS */;
INSERT INTO `yupe_user_user_auth_item` VALUES ('admin',2,'Администратор',NULL,NULL);
/*!40000 ALTER TABLE `yupe_user_user_auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_user_user_auth_item_child`
--

DROP TABLE IF EXISTS `yupe_user_user_auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_user_user_auth_item_child` (
  `parent` char(64) NOT NULL,
  `child` char(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `fk_yupe_user_user_auth_item_child_child` (`child`),
  CONSTRAINT `fk_yupe_user_user_auth_item_child_child` FOREIGN KEY (`child`) REFERENCES `yupe_user_user_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yupe_user_user_auth_itemchild_parent` FOREIGN KEY (`parent`) REFERENCES `yupe_user_user_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_user_user_auth_item_child`
--

LOCK TABLES `yupe_user_user_auth_item_child` WRITE;
/*!40000 ALTER TABLE `yupe_user_user_auth_item_child` DISABLE KEYS */;
/*!40000 ALTER TABLE `yupe_user_user_auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yupe_yupe_settings`
--

DROP TABLE IF EXISTS `yupe_yupe_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yupe_yupe_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` varchar(100) NOT NULL,
  `param_name` varchar(100) NOT NULL,
  `param_value` varchar(500) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_yupe_yupe_settings_module_id_param_name_user_id` (`module_id`,`param_name`,`user_id`),
  KEY `ix_yupe_yupe_settings_module_id` (`module_id`),
  KEY `ix_yupe_yupe_settings_param_name` (`param_name`),
  KEY `fk_yupe_yupe_settings_user_id` (`user_id`),
  CONSTRAINT `fk_yupe_yupe_settings_user_id` FOREIGN KEY (`user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yupe_yupe_settings`
--

LOCK TABLES `yupe_yupe_settings` WRITE;
/*!40000 ALTER TABLE `yupe_yupe_settings` DISABLE KEYS */;
INSERT INTO `yupe_yupe_settings` VALUES (1,'yupe','siteDescription','ЛидерА','2021-01-07 23:13:02','2021-06-02 10:32:05',1,1),(2,'yupe','siteName','ЛидерА','2021-01-07 23:13:02','2021-06-02 10:32:05',1,1),(3,'yupe','siteKeyWords','ЛидерА','2021-01-07 23:13:02','2021-06-02 10:32:05',1,1),(4,'yupe','email','info@lidera.su','2021-01-07 23:13:02','2021-06-02 10:32:05',1,1),(5,'yupe','theme','default','2021-01-07 23:13:02','2021-01-07 23:13:02',1,1),(6,'yupe','backendTheme','','2021-01-07 23:13:02','2021-01-07 23:13:02',1,1),(7,'yupe','defaultLanguage','ru','2021-01-07 23:13:02','2021-01-07 23:13:02',1,1),(8,'yupe','defaultBackendLanguage','ru','2021-01-07 23:13:02','2021-01-07 23:13:02',1,1),(9,'yupe','coreCacheTime','3600','2021-01-07 23:20:58','2021-01-07 23:20:58',1,1),(10,'yupe','uploadPath','uploads','2021-01-07 23:20:58','2021-01-07 23:20:58',1,1),(11,'yupe','editor','tinymce5','2021-01-07 23:20:58','2021-01-07 23:20:58',1,1),(12,'yupe','availableLanguages','ru,uk,en,zh','2021-01-07 23:20:58','2021-01-07 23:20:58',1,1),(13,'yupe','allowedIp','','2021-01-07 23:20:58','2021-01-07 23:20:58',1,1),(14,'yupe','hidePanelUrls','0','2021-01-07 23:20:58','2021-01-07 23:20:58',1,1),(15,'yupe','logo','images/logo.png','2021-01-07 23:20:58','2021-01-07 23:20:58',1,1),(16,'yupe','allowedExtensions','gif, jpeg, png, jpg, zip, rar, doc, docx, xls, xlsx, pdf','2021-01-07 23:20:58','2021-01-07 23:20:58',1,1),(17,'yupe','mimeTypes','image/gif,image/jpeg,image/png,application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/zip,application/x-rar,application/x-rar-compressed, application/vnd.ms-excel, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','2021-01-07 23:20:58','2021-01-07 23:20:58',1,1),(18,'yupe','maxSize','68108864','2021-01-07 23:20:58','2021-08-01 21:12:03',1,1),(19,'yupe','defaultImage','/images/nophoto.jpg','2021-01-07 23:20:58','2021-01-07 23:20:58',1,1),(20,'homepage','mode','2','2021-06-01 18:21:18','2021-06-01 18:21:18',1,1),(21,'homepage','target','1','2021-06-01 18:21:18','2021-06-01 18:21:21',1,1),(22,'homepage','limit','','2021-06-01 18:21:18','2021-06-01 18:21:18',1,1),(23,'yupe','copy','© 2021 “Лидер-А”. Копирование и использование любой информации размещенной на сайте допускается только с указанием источника или по договоренности с администрацией сайта','2021-06-02 10:32:05','2021-07-22 10:07:09',1,1),(24,'yupe','main_phone','8 (495) 777-88-99','2021-06-02 10:32:05','2021-06-02 10:32:05',1,1),(25,'yupe','wmode','Пн-Пт с 9:00 до 20:00','2021-06-02 10:32:05','2021-06-02 10:32:05',1,1),(26,'yupe','second_phone','8 (495) 146-88-99','2021-06-02 10:32:05','2021-06-02 10:33:37',1,1),(27,'yupe','reception_phone','','2021-06-02 10:32:05','2021-06-02 10:32:05',1,1),(28,'yupe','thrid_phone','8 (495) 146-88-99','2021-06-02 10:32:05','2021-06-02 10:33:37',1,1),(29,'yupe','address','123456, Московская область, <br>г. Москва, ул. Наименование улицы, <br>строение 48, офис 14','2021-06-02 10:32:05','2021-06-06 17:38:19',1,1),(30,'yupe','instagram','#','2021-06-02 10:32:05','2021-06-02 10:32:05',1,1),(31,'yupe','telegram','#','2021-06-02 10:32:05','2021-06-02 10:32:05',1,1),(32,'yupe','whatsapp','#','2021-06-02 10:32:05','2021-06-02 10:32:05',1,1),(33,'yupe','viber','#','2021-06-02 10:32:05','2021-06-02 10:32:05',1,1),(34,'yupe','vk','#','2021-06-02 10:32:05','2021-06-02 10:32:05',1,1),(35,'yupe','siteKey','6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI','2021-06-02 10:32:05','2021-06-02 10:32:05',1,1),(36,'yupe','secretKey','6LeIxAcTAAAAAGG-vFI1TnRWxMZNFuojJ4WifJWe','2021-06-02 10:32:05','2021-06-02 10:32:05',1,1),(37,'image','uploadPath','image','2021-06-02 10:32:13','2021-06-02 10:32:13',1,1),(38,'image','allowedExtensions','jpg,jpeg,png,gif','2021-06-02 10:32:13','2021-06-02 10:32:13',1,1),(39,'image','minSize','0','2021-06-02 10:32:13','2021-06-02 10:32:13',1,1),(40,'image','maxSize','5242880','2021-06-02 10:32:13','2021-06-02 10:32:13',1,1),(41,'image','mainCategory','','2021-06-02 10:32:13','2021-06-02 10:32:13',1,1),(42,'image','mimeTypes','image/gif, image/jpeg, image/png','2021-06-02 10:32:13','2021-06-02 10:32:13',1,1),(43,'image','width','1950','2021-06-02 10:32:13','2021-06-02 10:32:13',1,1),(44,'image','height','1950','2021-06-02 10:32:13','2021-06-02 10:32:13',1,1),(45,'store','uploadPath','store','2021-06-09 10:06:42','2021-06-09 10:06:42',1,1),(46,'store','defaultImage','/images/nophoto.jpg','2021-06-09 10:06:42','2021-06-09 10:06:42',1,1),(47,'store','editor','','2021-06-09 10:06:42','2021-06-09 10:06:42',1,1),(48,'store','itemsPerPage','20','2021-06-09 10:06:42','2021-08-16 09:01:16',1,1),(49,'store','phone','','2021-06-09 10:06:42','2021-06-09 10:06:42',1,1),(50,'store','email','','2021-06-09 10:06:42','2021-06-09 10:06:42',1,1),(51,'store','currency','RUB','2021-06-09 10:06:42','2021-06-09 10:06:42',1,1),(52,'store','title','','2021-06-09 10:06:42','2021-06-09 10:06:42',1,1),(53,'store','address','','2021-06-09 10:06:42','2021-06-09 10:06:42',1,1),(54,'store','city','','2021-06-09 10:06:42','2021-06-09 10:06:42',1,1),(55,'store','zipcode','','2021-06-09 10:06:42','2021-06-09 10:06:42',1,1),(56,'store','defaultSort','position','2021-06-09 10:06:42','2021-06-09 10:06:42',1,1),(57,'store','defaultSortDirection','ASC','2021-06-09 10:06:42','2021-06-09 10:06:42',1,1),(58,'store','metaTitle','','2021-06-09 10:06:42','2021-06-09 10:06:42',1,1),(59,'store','metaDescription','','2021-06-09 10:06:42','2021-06-09 10:06:42',1,1),(60,'store','metaKeyWords','','2021-06-09 10:06:42','2021-06-09 10:06:42',1,1),(61,'store','controlStockBalances','','2021-06-09 10:06:42','2021-06-09 10:06:42',1,1),(62,'order','notifyEmailFrom','www-data@localhost.localdomain','2021-08-08 11:59:29','2021-09-06 15:59:02',1,1),(63,'order','notifyEmailsTo','rouming76@gmail.com','2021-08-08 11:59:29','2021-09-06 15:56:22',1,1),(64,'order','showOrder','1','2021-08-08 11:59:29','2021-08-08 11:59:29',1,1),(65,'order','enableCheck','1','2021-08-08 11:59:29','2021-08-08 20:49:33',1,1),(66,'order','defaultStatus','1','2021-08-08 11:59:29','2021-08-08 11:59:29',1,1),(67,'order','enableComments','1','2021-08-08 11:59:29','2021-08-08 20:49:33',1,1),(68,'user','avatarMaxSize','5242880','2021-08-09 21:27:54','2021-08-09 21:27:54',1,1),(69,'user','avatarExtensions','jpg,png,gif,jpeg','2021-08-09 21:27:54','2021-08-09 21:27:54',1,1),(70,'user','defaultAvatarPath','images/avatar.png','2021-08-09 21:27:54','2021-08-09 21:27:54',1,1),(71,'user','avatarsDir','avatars','2021-08-09 21:27:54','2021-08-09 21:27:54',1,1),(72,'user','showCaptcha','0','2021-08-09 21:27:54','2021-08-09 21:27:54',1,1),(73,'user','minCaptchaLength','3','2021-08-09 21:27:54','2021-08-09 21:27:54',1,1),(74,'user','maxCaptchaLength','6','2021-08-09 21:27:54','2021-08-09 21:27:54',1,1),(75,'user','minPasswordLength','8','2021-08-09 21:27:54','2021-08-09 21:27:54',1,1),(76,'user','autoRecoveryPassword','0','2021-08-09 21:27:54','2021-08-10 10:41:46',1,1),(77,'user','recoveryDisabled','0','2021-08-09 21:27:54','2021-08-09 21:27:54',1,1),(78,'user','registrationDisabled','0','2021-08-09 21:27:54','2021-08-09 21:27:54',1,1),(79,'user','notifyEmailFrom','www-data@localhost.localdomain','2021-08-09 21:27:54','2021-08-10 10:44:24',1,1),(80,'user','logoutSuccess','/','2021-08-09 21:27:54','2021-08-09 21:27:54',1,1),(81,'user','loginSuccess','/user/profile/profile','2021-08-09 21:27:54','2021-08-10 11:51:17',1,1),(82,'user','accountActivationSuccess','/user/account/login','2021-08-09 21:27:54','2021-08-09 21:27:54',1,1),(83,'user','accountActivationFailure','/user/account/registration','2021-08-09 21:27:54','2021-08-09 21:27:54',1,1),(84,'user','loginAdminSuccess','/yupe/backend/index','2021-08-09 21:27:54','2021-08-09 21:27:54',1,1),(85,'user','registrationSuccess','/user/account/login','2021-08-09 21:27:54','2021-08-09 21:27:54',1,1),(86,'user','sessionLifeTime','7','2021-08-09 21:27:54','2021-08-09 21:27:54',1,1),(87,'user','usersPerPage','20','2021-08-09 21:27:54','2021-08-09 21:27:54',1,1),(88,'user','emailAccountVerification','0','2021-08-09 21:27:54','2021-08-10 10:48:23',1,1),(89,'user','badLoginCount','5','2021-08-09 21:27:54','2021-08-09 21:27:54',1,1),(90,'user','phoneMask','+7 (999) 999 9999','2021-08-09 21:27:54','2021-08-09 21:27:54',1,1),(91,'user','phonePattern','/^((\\+?7)(-?\\d{3})-?)?(\\d{3})(-?\\d{4})$/','2021-08-09 21:27:54','2021-08-09 21:27:54',1,1),(92,'user','generateNickName','1','2021-08-09 21:27:54','2021-08-09 21:27:54',1,1);
/*!40000 ALTER TABLE `yupe_yupe_settings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-24 13:50:08
