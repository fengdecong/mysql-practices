//创建学生表
create table stu_with_comstraint
(
id int ,
sn int unique,
name varchar(10) not null
);

insert into stu_with_comstraint values(01,20191224,'101');
//学号 唯一约束(唯一,不重复)
insert into stu_with_comstraint values(01,20191224,'102');
ERROR 1062 (23000): Duplicate entry '20191224' for key 'sn'   

//查看表的内容
select * from stu_with_comstraint;

//删除表  stu_with_comstraint
drop table stu_with_comstraint;

create table 

//nuique  和  primary key  的区别 
//
//主键不能为NULL
mysql> insert into stu_with_comstraint values(3,20191226,null);
ERROR 1048 (23000): Column 'name' cannot be null


###数据库设计

实现一个学生选课系统,学生学期开始选择自己的课程,期末考试老师要录入成绩

1. 分析(需求分析)
模型概念(schema) => 关系模型

1.1识别实体(entity)
	学生(student),课程(course),老师(teacher),班级(class)
	
1.2识别关系(relational)
	成绩(score)
	a) 	1 : 1
	b) 	1 : M
	c)	M : N
1.3 ER图(Entity-Relation)
	entiy 用**矩形**表示
	relational用**菱形**表示
	
	//创建老师表
	create table teacher(
	tid int ,
	name varchar(20)
	primary key(tid) //有错误
	);
	
	//创建学生表
	create table student(
	sid int ,
	name varchar(20)
	);
	





















