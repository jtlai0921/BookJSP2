<%@ page contentType= "text/html;charset=big5" %>
<%@ page import= "java.sql.*" %>
<html>
<head><title>ManagerSchl</title></head><body>
<p align="left">
<font size="5"><b>�޲z���ﶵ�ާ@</b></font></p><p>
<%
  session = request.getSession();
  session.setAttribute("School", "true");

  String JDriver = "sun.jdbc.odbc.JdbcOdbcDriver";
  String connectDB="jdbc:odbc:School";

  Class.forName(JDriver);
  Connection con = DriverManager.getConnection(connectDB);
  Statement stmt = con.createStatement();

  request.setCharacterEncoding("big5");
  String user = request.getParameter("user");
  String pwd = request.getParameter("pwd");

  String sql="SELECT *  FROM MANAGER WHERE �m�W='" +
                    user + "'AND �K�X='" + pwd + "';";

  ResultSet rs= stmt.executeQuery(sql);
  boolean flag= false;

  while(rs.next()) flag= true;
  if(flag) {
      out.print("�������g�L�{�Ҥ��X�k����!!");
      out.print("</p><p>   </p><p>");
      out.print("<A HREF=");
      out.print("'InputStudent.html'");
      out.print(" TARGET=");
      out.print("'MidSchool_2'");
      out.print(">�ǥͰ򥻸�ƿ�J</A></p><p>");

      out.print("<A HREF=");
      out.print("'InputRecord.html'");
      out.print(" TARGET=");
      out.print("'MidSchool_2'");
      out.print(">�m�ʽҸ�ƿ�J</A></p>");

      out.print("<A HREF=");
      out.print("'InputConduct.html'");
      out.print(" TARGET=");
      out.print("'MidSchool_2'");
      out.print(">�ɮv������J</A></p>");

      out.print("<A HREF=");
      out.print("'QueryBad.jsp'");
      out.print(" TARGET=");
      out.print("'MidSchool_2'");
      out.print(">���}�W��d��</A></p>");
  }
  else {
      out.print("<p><A HREF=");
      out.print("'SchoolPage.jsp'");
      out.print(" TARGET=");
      out.print("'_top'");
      out.print(">�]�b���K�X���~!!�Ы����^����</A></p>");
   }
  stmt.close();
  con.close();
%>
</body>
</html>