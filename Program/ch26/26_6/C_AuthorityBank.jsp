<%@ page contentType= "text/html;charset=big5" %>
<%@ page import= "java.sql.*" %>
<html>
<head><title>C_AuthorityBank</title></head><body>
<p align="left">
<font size="5"><b>�޲z���ﶵ�ާ@</b></font></p><p>
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

  String sql="SELECT * FROM Customers WHERE �s���b��=" +
                     numberStr + " AND �K�X='" + pwdStr +"';" ;

  ResultSet rs= stmt.executeQuery(sql);
  boolean flag= false;

  while(rs.next()) flag= true;
  if(flag) {
      out.print("�������g�L�{�Ҥ��X�k����!!");
      out.print("</p><p>   </p><p>");
      out.print("<A HREF=");
      out.print("'Deposit.html'");
      out.print(" TARGET=");
      out.print("'MidBank_2'");
      out.print(">�s�ھާ@</A></p><p>");

      out.print("<A HREF=");
      out.print("'Withdraw.html'");
      out.print(" TARGET=");
      out.print("'MidBank_2'");
      out.print(">���ھާ@</A></p>");

      out.print("<A HREF=");
      out.print("'Transfer.html'");
      out.print(" TARGET=");
      out.print("'MidBank_2'");
      out.print(">��b�ާ@</A></p>");

      out.print("<A HREF=");
      out.print("'QueryBalance.html'");
      out.print(" TARGET=");
      out.print("'MidBank_2'");
      out.print(">�d�߾ާ@</A></p>");
  }
  else {
      out.print("<p><A HREF=");
      out.print("'BankPage.jsp'");
      out.print(" TARGET=");
      out.print("'_top'");
      out.print(">�]�b���K�X���~!!�Ы����^����</A></p>");
   }
  stmt.close();
  con.close();
%>
</body>
</html>