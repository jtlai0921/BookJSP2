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

  String sql="INSERT INTO Students(����Ҹ��X, �m�W, �a�})" +
           " VALUES (" + numberStr + ",'" + nameStr + "','" + addressStr +"')" ;

  session = request.getSession();
  if(session.getAttribute("Exam") == "true") {
       out.print("�������g�L�{�Ҥ��X�k��Ʈw��J����!!" + "<br>");
       stmt.executeUpdate(sql);
       stmt.close();
       con.close();
       out.print("<left><p>  </p><p>");
       out.print("���\�����ҥ͸�ƿ�J</P>");
   }
   else{
      out.print("<p><A HREF=");
      out.print("'ExPage.jsp'");
      out.print(" TARGET=");
      out.print("'_top'");
      out.print(">�]�������D�X�k����!!�Ы����^����</A></p>");
   }
%>
</body>
</html>