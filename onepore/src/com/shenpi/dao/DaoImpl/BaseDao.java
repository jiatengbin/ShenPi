package com.shenpi.dao.DaoImpl;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class BaseDao {

    static ComboPooledDataSource dataSource = new ComboPooledDataSource("c3p0-config.xml");
    static Connection conn = null;
    static {
        try {

            conn = dataSource.getConnection();
            if (conn != null){
                System.out.println("数据库连接成功");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 查询数据库
     * @param sql 传入要执行的sql语句
     * @param params 传入执行SQL语句的参数列表
     * @return返回一个Result结果集
     */
    public ResultSet query(String  sql,Object...params){
        ResultSet rs = null;
        try {
            PreparedStatement prst = conn.prepareStatement(sql);
            for (int i = 0;i<params.length;i++){
                prst.setObject(i+1,params[i]);

            }

            rs=prst.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    /**
     * 更新数据库
     * @param sql 传入要执行的sql语句
     * @param params 传入执行SQL语句的参数列表
     * @return返回一个Result结果集
     */
    public int upda(String sql , Object... params){
        int rs = 0;
        try {
            PreparedStatement prst = conn.prepareStatement(sql);
            for (int i = 0; i <params.length ; i++) {
                prst.setObject(i+1,params[i]);
            }
            rs = prst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }


/**
 * 测试数据库连接成功没
 */
public static void main(String[] args) {

}


}
