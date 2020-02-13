<%@ page contentType= "text/html;charset=big5" %>
<%@ page import= "java.sql.*" %>
<html>
<head><title>C_AuthorityBank</title></head><body>
<p align="left">
<font size="5"><b>管理員選項操作</b></font></p><p>
<%
  String JDriver = "sun.jdbc.odbc.JdbcOdbcDriver";
  String connectDB="jdbc:odbc:Bank";

  Class.forName(JDriver);
  Connection con = DriverManager.getConnection(connectDB);
  Statement stmt = con.createStatement();

  request.setCharacterEncoding("big5");
  String numberStr = request.getParameter("Number");
  String pwdStr = request.getParameter("Pwd");

  HttpSession sessionC = request.getSession();
  sessionC.setAttribute(numberStr, "true");

  String sql="SELECT * FROM Customers WHERE 存褶帳號=" +
                     numberStr + " AND 密碼='" + pwdStr +"';" ;

  ResultSet rs= stmt.executeQuery(sql);
  boolean flag= false;

  while(rs.next()) flag= true;
  if(flag) {
      out.print("本頁為經過認證之合法網頁!!");
      out.print("</p><p>   </p><p>");
      out.print("<A HREF=");
      out.print("'Deposit.html'");
      out.print(" TARGET=");
      out.print("'MidBank_2'");
      out.print(">存款操作</A></p><p>");

      out.print("<A HREF=");
      out.print("'Withdraw.html'");
      out.print(" TARGET=");
      out.print("'MidBank_2'");
      out.print(">提款操作</A></p>");

      out.print("<A HREF=");
      out.print("'Transfer.html'");
      out.print(" TARGET=");
      out.print("'MidBank_2'");
      out.print(">轉帳操作</A></p>");

      out.print("<A HREF=");
      out.print("'QueryBalance.html'");
      out.print(" TARGET=");
      out.print("'MidBank_2'");
      out.print(">查詢操作</A></p>");
  }
  else {
      out.print("<p><A HREF=");
      out.print("'BankPage.jsp'");
      out.print(" TARGET=");
      out.print("'_top'");
      out.print(">因帳號密碼有誤!!請按此回首頁</A></p>");
   }
  stmt.close();
  con.close();
%>
</body>
</html>