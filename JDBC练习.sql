4-JDBC
CREATE TABLE likes(
	user_id INT NOT NULL,
	article_id INT NOT NULL,
	PRIMARY KEY(user_id,article_id)
);


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import java.sql.*;

public class Main {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        //1.注册Driver
        Class.forName("com.mysql.jdbc.Driver");
        //2.获取连接
        String url = "jdbc:mysql://127.0.0.1:3306/java14_20200312";
        String username = "root";
        String password = "root";
        Connection connection;
        connection = DriverManager.getConnection(
                url,
                username,
                password
        );
        //3.获取语句 Statement
        Statement statement = connection.createStatement();
        //4.执行一条  SELECT  DATABASE();
        String sql = "SELECT DATABASE()";
        ResultSet resultSet = statement.executeQuery(sql);
        //5.事先知道结果只有一行+一列
        resultSet.next();  //   调一次next才到第一行
        String name = resultSet.getString(1);  //第一列是从1开始的
        System.out.println(name);

        //-3.关闭结果集(resultSet)
        resultSet.close();
        //关闭语句


        sql = "SELECT id,username FROM users ORDER BY id";
        resultSet = statement.executeQuery(sql);
        while(resultSet.next()){
            int id = resultSet.getInt(1);
            String user = resultSet.getString(2);
            System.out.println(id + ","+ user);
        }
        resultSet.close();

        //-2.关闭语句
        statement.close();
        //1-.关闭连接
        connection.close();
    }
}

INSERT INTO users(username) VALUES
	('堕天地狱兽'),('红莲骑士兽'),('战斗暴龙兽'),('帝皇龙甲兽');
	


//制作一个简单的博客注册系统
import java.sql.*;
import java.util.Scanner;

public class BlogSystem {
    private static Connection connection;
    private static User currentUser;
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(
                    "jdbc:mysql://127.0.0.1:3306/java14_20200312?useSSL=false",
                    "root",
                    "root"
            );
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws SQLException {
        Scanner scanner = new Scanner(System.in);
        boolean running = true;
        while(running){
            System.out.println("===============");
            System.out.println("1.注册用户");
            System.out.println("2.登录用户");
            System.out.println("其他.退出");
            int select = scanner.nextInt();
            switch(select){
                case 1: registerUser(); break;
                case 2: loginUser(); break;
                default: running = false;
                System.out.println("===============");
            }
        }
    }
    //用户注册
    private static void registerUser() throws SQLException {
        Scanner scanner = new Scanner(System.in);
        System.out.println("请输入用户名");
        String username = scanner.nextLine();
        Statement statement = connection.createStatement();
        String sql = String.format(
                "INSERT INTO users (username) VALUES('%s')",
                username
        );
        try {
            statement.executeUpdate(sql);
            System.out.println("用户注册成功");
        } catch (SQLException e) {
            System.out.println("用户名重复,请重试");
        }
        statement.close();
    }
	//用户登录
    private static void loginUser() throws SQLException {
        Scanner scanner = new Scanner(System.in);
        System.out.println("请输入用户名");
        String username = scanner.nextLine();
        Statement statement = connection.createStatement();
        String sql = String.format("SELECT id FROM users WHERE username = '%s'",
                username
        );
        ResultSet resultSet = statement.executeQuery(sql);
        resultSet.next();
        int id = resultSet.getInt(1);
        currentUser = new User(id, username);
        resultSet.close();
        statement.close();
        System.out.printf("欢迎回来 %s(%d)%n",username,id);
    }
}

truncate users; 用于初始化表

executeQuery    用于有结果返回   SELECT/SHOW
executeUpdate	用户更新		其他的语句

DDL:	(围绕结构)
	CREATE DATABASE 			库名 建库
	SHOW DATABASES;  			查看有哪些库
	SELECT DATABASE(); 			查看当前库
	USE 库名;					设置默认库
	SHOW CREATE DABABASE 库名;	查看建库语句
	DROP DATABASE 库名;			删库

	前提:已经选好默认库
	CREATE TABLE();				建表
	SHOW TABLES;				查看有哪些表
	SHOW CREATE TABLE 表名		查看建表语句
	DESC 表名         			查看表结构
	DROP TABLE 表名;			删表

DML:   (围绕表里的数据)
	INSERT
	SELECT
	UPDATE
	DELETE

//JDBC应用复习
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TestJDBC {

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://127.0.0.1:3306/java14_20200312?useSSL=false";
        String user = "root";
        String passward = "root";
        Connection connection = DriverManager.getConnection(
                url, user,passward
        ) ;
        {
            Statement statement = connection.createStatement();
            String sql = "INSERT INTO users (id,name) VALUES('1','丰德聪')";
            statement.executeUpdate(sql);
            statement.close();
        }
        {
            Statement statement = connection.createStatement();
            String sql = "SELECT * FROM user";
            ResultSet resultSet = statement.executeQuery(sql);

            //结果集马上要销毁 用list保存数据
            List<String> list = new ArrayList<>();
            while (resultSet.next()){
                int id  = resultSet.getInt(1);
                String name = resultSet.getString("name");
                System.out.println(id+","+name);
                list.add(name);
            }
            resultSet.close();
        }
        connection.close();
    }
}


//创建用户表
CREATE TABLE users(
	id INT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(255) UNIQUE NOT NULL,
	password VARCHAR(255) NOT NULL
);

//创建文章表
CREATE TABLE articles(
	id INT PRIMARY KEY AUTO_INCREMENT,
	author_id INT NOT NULL,
	title VARCHAR(255),
	content TEXT
);
