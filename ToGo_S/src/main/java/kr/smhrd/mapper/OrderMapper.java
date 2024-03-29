package kr.smhrd.mapper;




import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class OrderMapper {

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://project-db-campus.smhrd.com:3307/campus_23K_AI17_p2_3";
        String username = "campus_23K_AI17_p2_3";
        String password = "smhrd3";
        return DriverManager.getConnection(url, username, password);
    }

    public static ResultSet getSalesData() throws SQLException, ClassNotFoundException {
        Connection conn = getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM orders WHERE DATE(ordered_at) = CURDATE();");
        return rs;
    }
    
    public static ResultSet getYesterdaySalesData() throws SQLException, ClassNotFoundException {
        Connection conn = getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM orders WHERE DATE(ordered_at) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);");
        return rs;
    }
    public static Connection getConnection1() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://project-db-campus.smhrd.com:3307/campus_23K_AI17_p2_3";
        String username = "campus_23K_AI17_p2_3";
        String password = "smhrd3";
        return DriverManager.getConnection(url, username, password);
    }
   
}
