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
  String cnsStr = request.getParameter("cns");
  String engStr = request.getParameter("eng");
  String mathStr =request.getParameter("math");
  String techStr =request.getParameter("tech");
  String peopStr = request.getParameter("peop");

  String sql="INSERT INTO Scores(����Ҹ��X, ���, " +
                    "�^��, �ƾ�, �۵M, ���|)" + " VALUES (" + 
                      numberStr + "," + cnsStr + "," +   engStr + "," +   
                      mathStr  + "," + techStr + "," + peopStr +")" ;

  session = request.getSession();
  if(session.getAttribute("Exam") == "true") {
       out.print("�������g�L�{�Ҥ��X�k��Ʈw��J����!!" + "<br>");
       stmt.executeUpdate(sql);
       stmt.close();
       con.close();
       out.print("<left><p>  </p><p>");
       out.print("���\�����ҥͦ��Z��J</P>");
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