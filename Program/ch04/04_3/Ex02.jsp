<%@ page contentType="text/html;charset=big5" %>
<%@ page import= "java.sql.*" %>
<html>
<head><title>Ex02</title></head><body>
<p align="center">
<font size="5"><b>Front Page of Ex02</b></font>
</p>
<center>
�}�ҥ������A�ߧY�۰ʱN��ƿ�J��ƪ� "Books"
<%
  String JDriver = "sun.jdbc.odbc.JdbcOdbcDriver";
  String connectDB="jdbc:odbc:BookStore";

  Class.forName(JDriver);
  Connection con = DriverManager.getConnection(connectDB);
  Statement stmt = con.createStatement();
      String query1 = "insert into Books values (" 
                      + "'001','Java��¦�J��','��T��', 520)";
      String query2 = "insert into Books values (" 
                      + "'002','�@�~�t��2/e','��T��', 590)";
      String query3 = "insert into Books values (" 
                      + "'003','�����ƾ�2/e','��T��', 450)";
      String query4 = "insert into Books values (" 
                      + "'004','Servlet������Ʈw','��T��', 620)";
                      
      stmt.executeUpdate(query1);
      stmt.executeUpdate(query2);
      stmt.executeUpdate(query3);
      stmt.executeUpdate(query4);

   stmt.close();
   con.close();
%>
</body>
</html>