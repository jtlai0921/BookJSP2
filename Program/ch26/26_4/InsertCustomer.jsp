<%@ page contentType="text/html;charset=big5" %>
<%@ page import= "java.sql.*" %>
<html>
<head><title>InsertCustomer</title></head><body>
<%
  String JDriver = "sun.jdbc.odbc.JdbcOdbcDriver";
  String connectDB="jdbc:odbc:Bank";

  Class.forName(JDriver);
  Connection con = DriverManager.getConnection(connectDB);
  Statement stmt = con.createStatement();

  request.setCharacterEncoding("big5");
  String numberStr = request.getParameter("Number");
  String nameStr = request.getParameter("Name");
  String pwdStr = request.getParameter("Pwd");
  String addressStr = request.getParameter("Address");

  String sql="INSERT INTO Customers(存褶帳號, 姓名, 密碼, 地址)" +
                   " VALUES (" + numberStr + ",'" + nameStr + "','" + 
                                        pwdStr + "','" + addressStr +"')" ;

  session = request.getSession();
  if(session.getAttribute("Bank") == "true") {
       out.print("本頁為經過認證之合法資料庫輸入網頁!!" + "<br>");
       stmt.executeUpdate(sql);
       stmt.close();
       con.close();
       out.print("<left><p>  </p><p>");
       out.print("成功完成客戶資料輸入</P>");
  }
   else{
      out.print("<p><A HREF=");
      out.print("'BankPage.jsp'");
      out.print(" TARGET=");
      out.print("'_top'");
      out.print(">因本頁為非合法網頁!!請按此回首頁</A></p>");
   }
%>
</body>
</html>