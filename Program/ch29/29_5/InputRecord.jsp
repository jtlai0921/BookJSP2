<%@ page contentType="text/html;charset=big5" %>
<%@ page import= "java.sql.*" %>
<html>
<head><title>InputRecord</title></head><body>
<%
  String JDriver = "sun.jdbc.odbc.JdbcOdbcDriver";
  String connectDB="jdbc:odbc:School";

  Class.forName(JDriver);
  Connection con = DriverManager.getConnection(connectDB);
  Statement stmt = con.createStatement();

  request.setCharacterEncoding("big5");
  String s0Str = request.getParameter("s0");
  String s1Str = request.getParameter("s1");
  String s2Str = request.getParameter("s2");
  String s3Str = request.getParameter("s3");
  String s4Str = request.getParameter("s4");
  String s5Str = request.getParameter("s5");

  String sql="INSERT INTO RECORDS(�Z�Ůy��, �~���, ����, �ư�, �f��, �m��)" +
             " VALUES('" + s0Str + "'," + s1Str + "," + s2Str +
             "," + s3Str + "," + s4Str + "," + s5Str + ")" ;

  session = request.getSession();
  if(session.getAttribute("School") == "true") {
       out.print("�������g�L�{�Ҥ��X�k��Ʈw��J����!!" + "<br>");
       stmt.executeUpdate(sql);
       stmt.close();
       con.close();
       out.print("<left><p>  </p><p>");
       out.print("���\�����m�ʽҸ�ƿ�J</P>");
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