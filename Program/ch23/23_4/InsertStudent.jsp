<%@ page contentType="text/html;charset=big5" %>
<%@ page import= "java.sql.*" %>
<html>
<head><title>InsertStudent</title></head><body>
<%
  String JDriver = "sun.jdbc.odbc.JdbcOdbcDriver";
  String connectDB="jdbc:odbc:Exam";

  Class.forName(JDriver);
  Connection con = DriverManager.getConnection(connectDB);
  Statement stmt = con.createStatement();

  request.setCharacterEncoding("big5");
  String numberStr = request.getParameter("num");
  String nameStr = request.getParameter("name");
  String addressStr = request.getParameter("address");

  String sql="INSERT INTO Students(准考證號碼, 姓名, 地址)" +
           " VALUES (" + numberStr + ",'" + nameStr + "','" + addressStr +"')" ;

  session = request.getSession();
  if(session.getAttribute("Exam") == "true") {
       out.print("本頁為經過認證之合法資料庫輸入網頁!!" + "<br>");
       stmt.executeUpdate(sql);
       stmt.close();
       con.close();
       out.print("<left><p>  </p><p>");
       out.print("成功完成考生資料輸入</P>");
   }
   else{
      out.print("<p><A HREF=");
      out.print("'ExPage.jsp'");
      out.print(" TARGET=");
      out.print("'_top'");
      out.print(">因本頁為非合法網頁!!請按此回首頁</A></p>");
   }
%>
</body>
</html>