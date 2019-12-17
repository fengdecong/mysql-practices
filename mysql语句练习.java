//    mysql 通过管理员身份打开
//    mysql -u root -p
//    密码:root
create table student
(
name varchar(20),
sn int,
mysql int,
english double(5,2),
java smallint
);

查询:
1.全列查询
2.指定列查询
3.去重 distinct
4.排序,order by ,默认 asc,desc.
5.条件查询
a.表达式,between and
b. in
c.and,or,not,&&,||,!
d.like &,_
e.limit s,n 

select distinct english+1 from student;
 
select distinct java, mysql from student;

select * from student order by englist desc;
 
insert into student(name) values('Tom');

select name,sn,mysql+english+java as total_score from student order by total_score desc;

select name,sn,mysql+english+java from student;

insert into student(mysql,english,java) values(30,54,75)   //创建信息

update student set name='fdc',sn=1001    //修改信息
where english>95;

update student set name='James' where english=72;

mysql> select * from student order by name;
+-------+------+-------+---------+------+
| name  | sn   | mysql | english | java |
+-------+------+-------+---------+------+
| 1005  | 1005 |  NULL |    NULL | NULL |
| 1005  | 1005 |  NULL |    NULL | NULL |
| 1005  | 1005 |  NULL |    NULL | NULL |
| 1005  | 1005 |  NULL |    NULL | NULL |
| 1005  | 1005 |  NULL |    NULL | NULL |
| Ben   | 1005 |    72 |   12.00 |   45 |
| Bob   | 1005 |    88 |   65.00 |   72 |
| fdc   | 1001 |    95 |   98.00 |   85 |
| James | 1005 |    55 |   72.00 |   23 |
| ljx   | 1002 |    78 |   95.00 |   66 |
| Timo  | 1005 |    22 |   42.00 |   95 |
| Tom   | 1005 |   698 |   90.00 |   89 |
+-------+------+-------+---------+------+
12 rows in set (0.00 sec)
select * from student ;

mysql> delete from student where mysql <=>null;   //删除信息
+-------+------+-------+---------+------+
| name  | sn   | mysql | english | java |
+-------+------+-------+---------+------+
| fdc   | 1001 |    95 |   98.00 |   85 |
| Tom   | 1005 |   698 |   90.00 |   89 |
| Bob   | 1005 |    88 |   65.00 |   72 |
| ljx   | 1002 |    78 |   95.00 |   66 |
| James | 1005 |    55 |   72.00 |   23 |
| Timo  | 1005 |    22 |   42.00 |   95 |
| Ben   | 1005 |    72 |   12.00 |   45 |
+-------+------+-------+---------+------+
