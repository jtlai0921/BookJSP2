<%@ page contentType="text/html;charset=big5" %>
<%@ page import= "java.sql.*" %>
<html>
<head><title>InputConduct</title></head><body>
<%
  String JDriver = "sun.jdbc.odbc.JdbcOdbcDriver";
  String connectDB="jdbc:odbc:School";

  Class.forName(JDriver);
  Connection con = DriverManager.getConnection(connectDB);
  Statement stmt = con.createStatement();

  request.setCharacterEncoding("big5");
  String s0Str = request.getParameter("s0");
  String s1Str = request.getParameter("s1");

  String sql="INSERT INTO CONDUCT(�Z�Ůy��, �ɮv����)" +
             " VALUES('" + s0Str + "'," + s1Str + ")" ;

  session = request.getSession();
  if(session.getAttribute("School") == "true") {
       out.print("�������g�L�{�Ҥ��X�k��Ʈw��J����!!" + "<br>");
       stmt.executeUpdate(sql);
       stmt.close();
       con.close();
       out.print("<left><p>  </p><p>");
       out.print("���\�����ɮv������ƿ�J</P>");
   }
   else{
      out.print("<p><A HREF=");
      out.print("'SchoolPage.jsp'");
      out.print(" TARGET=");
      out.print("'_top'");
      out.print(">�]�������D�X�k����!!�Ы����^����</A></p>");
   }
%>
</body>
</html>