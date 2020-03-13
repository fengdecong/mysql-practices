CREATE TABLE students(
	name VARCHAR(20),
	age INT ,
	sn INT
);

CREATE TABLE books(
	name VARCHAR(20),
	author VARCHAR(20),
	price INT,
	category VARCHAR(20),
	is_borrowed TINYINT
);
//创建用户表
CREATE TABLE users(
	username VARCHAR(20) UNIQUE NOT NULL
);
INSERT INTO users (username) VALUE('fengdecong');

CREATE TABLE exam_result(
	id INT,
	name VARCHAR(20),
	chinese DECIMAL(3,1),
	math DECIMAL(3,1),
	english DECIMAL(3,1)
);

INSERT INTO exam_result (id,name,chinese,math,english) VALUES
	(1,'宋江',65,98,56),
	(2,'卢俊义',87.5,78,77),
	(3,'阮小七',88,98.5,90),
	(4,'鲁智深',82,84,67),
	(5,'武松',55.5,85,45),
	(6,'林冲',70,73,78.5),
	(7,'柴进',75,65,30);
	
SELECT name,math FROM exam_result ORDER BY math DESC;

CREATE TABLE masters(
	name VARCHAR(20) UNIQUE,
	denger VARCHAR(3) NOT NULL DEFAULT '保密',
	age INT NOT NULL DEFAULT 0,
	height DOUBLE NOT NULL DEFAULT 0,
	weight DOUBLE NOT NULL DEFAULT 0
);

 CREATE TABLE slavers(
     id INT PRIMARY KEY AUTO_INCREMENT, // PRIMARY KEY 表示主键
     name VARCHAR(20) UNIQUE,
     denger VARCHAR(3) NOT NULL DEFAULT '保密',
     age INT NOT NULL DEFAULT 0,
     height DOUBLE NOT NULL DEFAULT 0,
     weight DOUBLE NOT NULL DEFAULT 0
 );
 
INSERT INTO masters (name) value('李逵');
INSERT INTO masters (name) value('李逵'); //不行
 
INSERT INTO  slavers (name) value('曹焱兵');
INSERT INTO  slavers (name) value('曹玄亮');

show create table slavers;

id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `denger` varchar(3) NOT NULL DEFAULT '保密',
  `age` int(11) NOT NULL DEFAULT '0',
  `height` double NOT NULL DEFAULT '0',
  `weight` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8

//创建学生表
CREATE DATABASE java14_20200312;
USE java14_20200312;
CREATE TABLE students(
	id INT PRIMARY KEY AUTO_INCREMENT,
	class_id INT NOT NULL,
	name VARCHAR(20)
);

//创建班级表
CREATE TABLE classes(
	id INT PRIMARY KEY AUTO_INCREMENT, 
	name VARCHAR(20)
);

INSERT INTO classes (name) VALUE('java14班');
INSERT INTO students (class_id,name) VALUES
	(1,'卡卡罗特'),
	(1,'贝吉塔');
	
//小的博客系统
//用户表
CREATE TABLE users(
	 id INT PRIMARY KEY AUTO_INCREMENT,
	 username VARCHAR(100) NOT NULL UNIQUE
);
//发表表
CREATE TABLE articles(
	id INT PRIMARY KEY AUTO_INCREMENT,
	author_id INT NOT NULL,
	title VARCHAR(100) NOT NULL,
	content TEXT NOT NULL,
	published_at DATETIME NOT NULL
);
//评论表
CREATE TABLE comments(
	id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT NOT NULL,
	article_id INT NOT NULL,
	content VARCHAR(100) NOT NULL,
	published_at DATETIME NOT NULL
);

CREATE TABLE user_article_like_relation(
	user_id INT NOT NULL,
	article_id INT NOT NULL,
	PRIMARY KEY(user_id,article_id)
);

注册用户: 悟空
INSERT INTO users(username) VALUeS("比克");
INSERT INTO users(username) VALUeS("克林");
SELECT id FROM users WHERE username = "比克";
INSERT INTO articles (author_id,title,content,published_at)
	VALUES(1,"论找实习的重要性","非常重要","2019-12-11 16:44:00");
贝吉塔评论卡卡罗特的文章<论找实习的重要性>,"同意执行"
SELECT id FROM users WHERE username = "克林";
SELECT id FROM articles WHERE title = "论找实习的重要性";
INSERT INTO comments(user_id,article_id,content,published_at)
	VALUES (2,1,"同意执行","2020-3-12 17:00:00");
克林点赞该文章
SELECT id FROM users WHERE username = "克林";
SELECT id FROM articles WHERE title = "论找实习的重要性";
INSERT INTO user_article_like_relation(user_id,article_id)
	VALUE(2,1);
比克的文章主页
SELECT id FROM users where username = "比克";
SELECT id,title,published_at FROM articles WHERE author_id = 1
	ORDER BY published_at DESC LIMIT 10 OFFSET 0;

CREATE TABLE students(
	id INT,
	sn INT COMMENT '学号',
	name VARCHAR (20) COMMENT '姓名',
	qq_mail VARCHAR(20) COMMENT '邮箱'
);

INSERT INTO students VALUES(100,10000,'卡卡罗特','111');
INSERT INTO students VALUES(101,10001,'贝吉塔',NULL);

INSERT INTO students(sn,name,)
	VALUES
	(103,"悟饭"),
	(104,"悟天"),
	(105,"特兰克斯");
ORDER BY:
	1.BY 按那个字段(表达式)排序
	2.ASC 升序(默认) DESC 降序
	3.没有指定过ORDER BY,一律认为无序(最终的顺序是实现相关)
	4.ORDER BY 字段1 DESC 字段2 ASC;

DROP TABLE IF EXISTS exam_result;
CREATE TABLE exam_result (
 id INT,
 name VARCHAR(20),
 chinese DECIMAL(3,1),
 math DECIMAL(3,1),
 english DECIMAL(3,1)
);

INSERT INTO exam_result (id,name, chinese, math, english) VALUES
 (1,'唐三藏', 67, 98, 56),
 (2,'孙悟空', 88, 78, 77),
 (3,'猪悟能', 88, 98, 90),
 (4,'曹孟德', 82, 84, 67),
 (5,'刘玄德', 55, 85, 45),
 (6,'孙权', 70, 73, 78),
 (7,'宋江',75,65,30);
 
SELECT id,name,math FROM exam_result WHERE math<80;
SELECT * FROM exam_result WHERE chinese >= 50 AND chinese<= 80;
SELECT DISTINCT math FROM exam_result;

LIKE 模糊查询 
SELECT * FROM exam_result WHERE name LIKE '孙%';

NULL  表示不清楚,不知道
SELECT null = 1; 

LIMIt OFFSET 展示分页 
CREATE TABLE threads(
	creator VARCHAR(20),
	content TEXT,
	created_at DATETIME
);

INSERT INTO threads VALUES("丰德聪","好好学,找个好工作","2020-3-13 12:00:00");
INSERT INTO threads VALUES("刘佳鑫","我们一起努力","2020-3-13 13:00:00");
INSERT INTO threads VALUES("丰德攀","好好上班","2020-3-13 14:00:00");

//每页有十个帖子
//一定先用ORDER BY , LIMIT 才有意义
SELECT * FROM threads ORDER BY created_at LIMIT 1 OFFSET 0;
SELECT * FROM threads ORDER BY created_at LIMIT 1 OFFSET 1;
SELECT * FROM threads ORDER BY created_at LIMIT 1 OFFSET 2;

//UPDATE 修改那个表 SET 修改那一列
UPDATE threads SET content = "奥里给" WHERE creator = "丰德攀";

//删除
DELETE FROM threads WHERE creator = "丰德攀";
