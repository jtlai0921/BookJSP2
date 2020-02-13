<%@ page contentType="text/html;charset=big5" %>
<%@ page import= "java.sql.*" %>
<html>
<head><title>Ex02</title></head><body>
<p align="center">
<font size="5"><b>Front Page of Ex02</b></font>
</p>
<center>
開啟本網頁，立即自動將資料輸入資料表 "Books"
<%
  String JDriver = "sun.jdbc.odbc.JdbcOdbcDriver";
  String connectDB="jdbc:odbc:BookStore";

  Class.forName(JDriver);
  Connection con = DriverManager.getConnection(connectDB);
  Statement stmt = con.createStatement();
      String query1 = "insert into Books values (" 
                      + "'001','Java基礎入門','賈蓉生', 520)";
      String query2 = "insert into Books values (" 
                      + "'002','作業系統2/e','賈蓉生', 590)";
      String query3 = "insert into Books values (" 
                      + "'003','離散數學2/e','賈蓉生', 450)";
      String query4 = "insert into Books values (" 
                      + "'004','Servlet網站資料庫','賈蓉生', 620)";
                      
      stmt.executeUpdate(query1);
      stmt.executeUpdate(query2);
      stmt.executeUpdate(query3);
      stmt.executeUpdate(query4);

   stmt.close();
   con.close();
%>
</body>
</html>