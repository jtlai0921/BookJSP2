<%@ page contentType= "text/html;charset=big5" %>
<%@ page import= "java.sql.*" %>
<html>
<head><title>M_AuthorityBank</title></head><body>
<p align="left">
<font size="5"><b>�޲z���ﶵ�ާ@</b></font></p><p>
<%
  session = request.getSession();
  session.setAttribute("Bank", "true");

  String JDriver = "sun.jdbc.odbc.JdbcOdbcDriver";
  String connectDB="jdbc:odbc:Bank";

  Class.forName(JDriver);
  Connection con = DriverManager.getConnection(connectDB);
  Statement stmt = con.createStatement();

  request.setCharacterEncoding("big5");
  String user = request.getParameter("user");
  String pwd = request.getParameter("pwd");

  String sql="SELECT *  FROM Managers WHERE �m�W='" +
                    user + "'AND �K�X='" + pwd + "';";

  ResultSet rs= stmt.executeQuery(sql);
  boolean flag= false;

  while(rs.next()) flag= true;
  if(flag) {
      out.print("�������g�L�{�Ҥ��X�k����!!");
      out.print("</p><p>   </p><p>");
      out.print("<A HREF=");
      out.print("'InsertCustomer.html'");
      out.print(" TARGET=");
      out.print("'MidBank_2'");
      out.print(">�Ȥ�򥻸�ƿ�J</A></p><p>");

      out.print("<A HREF=");
      out.print("'InsertAccount.html'");
      out.print(" TARGET=");
      out.print("'MidBank_2'");
      out.print(">�}��s����J</A></p>");
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