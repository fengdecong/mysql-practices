内连接查询
SELECT 班级名称,学生姓名 FROM 班级,学生 WHERE 班级id = 班级id;
SELECT...FROM 表1,表2 WHERE 过滤条件;

外连接查询
左外连接查询   	 SELECT...FROM 表1 LEFT JOIN 表2 ON 过滤条件;
右外连接查询	 SELECT...FROM 表1 RIGHT JOIN 表2 ON 过滤条件;

CREATE table classes(
	id int primary key auto_increment,
	name varchar(255),
	desc1 varchar(255)
);

create table student(
	id int primary key auto_increment,
	sn int,
	name varchar(255),
	qq_mail varchar(255),
	classes_id int
);

create table course(
	id int primary key auto_increment,
	name varchar(255)
);

create table score(
	student_id int,
	course_id int,
	score float
);

insert into classes(name,desc1) VALUES
	('计算机系2019级1班', '学习了计算机原理、C和Java语言、数据结构和算法'),
	('中文系2019级3班','学习了中国传统文学'),
	('自动化2019级5班','学习了机械自动化');

insert into student(sn,name,qq_mail,classes_id) values
	('1001','及时雨宋江','songjiang@qq.com',1),
	('1002','玉麒麟卢俊义',null,1),
	('1003','行者武松',null,1),
	('1004','豹子头林冲','linchong@qq.com',1),
	('1005','霹雳火秦明',null,1),
	('1006','浪子燕青','yanqing@qq.com',2),
	('1007','入云龙公孙胜',null,2),
	('1008','黑旋风李逵',null,8),
	('1009','小李广花荣','huarong@qq.con',2);
	
insert into course(name) values
	('java'),('中国传统文化'),('计算机原理'),('语文'),('高等数学'),('大学英语');
	
insert into score(score,student_id,course_id) values
-- 及时雨宋江
(70.5,1,1),(98.5,1,3),(33,1,5),(98,1,6),
-- 玉麒麟卢俊义
(60, 2, 1),(59.5, 2, 5),
-- 行者武松
(33, 3, 1),(68, 3, 3),(99, 3, 5),
-- 豹子头林冲
(67, 4, 1),(23, 4, 3),(56, 4, 5),(72, 4, 6),
-- 霹雳火秦明
(81, 5, 1),(37, 5, 5),
-- 浪子燕青
(56, 6, 2),(43, 6, 4),(79, 6, 6),
-- 入云龙公孙胜
(80, 7, 2),(92, 7, 6);

select classes.name, student.name from classes right join student on classes.id = student.classes_id;
	+-------------------------+--------------------+
	| name                    | name               |
	+-------------------------+--------------------+
	| 计算机系2019级1班       | 及时雨宋江         |
	| 计算机系2019级1班       | 玉麒麟卢俊义       |
	| 计算机系2019级1班       | 行者武松           |
	| 计算机系2019级1班       | 豹子头林冲         |
	| 计算机系2019级1班       | 霹雳火秦明         |
	| 中文系2019级3班         | 浪子燕青           |
	| 中文系2019级3班         | 入云龙公孙胜       |
	| 中文系2019级3班         | 小李广花荣         |
	| NULL                    | 黑旋风李逵         |
	+-------------------------+--------------------+
	
select c.name,s.name,co.name,sc.score 
	from classes c,student s,course co,score sc 
	where c.id = s.classes_id and s.id = sc.student_id and co.id = sc.course_id;
	+-------------------------+--------------------+--------------------+-------+
	| name                    | name               | name               | score |
	+-------------------------+--------------------+--------------------+-------+
	| 计算机系2019级1班       | 及时雨宋江         | java               |  70.5 |
	| 计算机系2019级1班       | 及时雨宋江         | 计算机原理         |  98.5 |
	| 计算机系2019级1班       | 及时雨宋江         | 高等数学           |    33 |
	| 计算机系2019级1班       | 及时雨宋江         | 大学英语           |    98 |
	| 计算机系2019级1班       | 玉麒麟卢俊义       | java               |    60 |
	| 计算机系2019级1班       | 玉麒麟卢俊义       | 高等数学           |  59.5 |
	| 计算机系2019级1班       | 行者武松           | java               |    33 |
	| 计算机系2019级1班       | 行者武松           | 计算机原理         |    68 |
	| 计算机系2019级1班       | 行者武松           | 高等数学           |    99 |
	| 计算机系2019级1班       | 豹子头林冲         | java               |    67 |
	| 计算机系2019级1班       | 豹子头林冲         | 计算机原理         |    23 |
	| 计算机系2019级1班       | 豹子头林冲         | 高等数学           |    56 |
	| 计算机系2019级1班       | 豹子头林冲         | 大学英语           |    72 |
	| 计算机系2019级1班       | 霹雳火秦明         | java               |    81 |
	| 计算机系2019级1班       | 霹雳火秦明         | 高等数学           |    37 |
	| 中文系2019级3班         | 浪子燕青           | 中国传统文化       |    56 |
	| 中文系2019级3班         | 浪子燕青           | 语文               |    43 |
	| 中文系2019级3班         | 浪子燕青           | 大学英语           |    79 |
	| 中文系2019级3班         | 入云龙公孙胜       | 中国传统文化       |    80 |
	| 中文系2019级3班         | 入云龙公孙胜       | 大学英语           |    92 |
	+-------------------------+--------------------+--------------------+-------+
	
//子查询
select * from score where course_id in(select id from course where name in('语文','大学英语'));
	+------------+-----------+-------+
	| student_id | course_id | score |
	+------------+-----------+-------+
	|          1 |         6 |    98 |
	|          4 |         6 |    72 |
	|          6 |         4 |    43 |
	|          6 |         6 |    79 |
	|          7 |         6 |    92 |
	+------------+-----------+-------+
	
测试索引
create table test_user(
	id int ,
	name varchar(255)
);

show index from test_user;


事务  begin开始  commit结束 是要没有执行commit前面执行的都不生效
begin
update accounts set balance = balance - 300 where name  = '丰德聪';
update accounts set balance = balance + 500 where name  = '丰德攀'; 
commit
	
