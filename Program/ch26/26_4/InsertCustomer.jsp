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

  String sql="INSERT INTO Customers(�s���b��, �m�W, �K�X, �a�})" +
                   " VALUES (" + numberStr + ",'" + nameStr + "','" + 
                                        pwdStr + "','" + addressStr +"')" ;

  session = request.getSession();
  if(session.getAttribute("Bank") == "true") {
       out.print("�������g�L�{�Ҥ��X�k��Ʈw��J����!!" + "<br>");
       stmt.executeUpdate(sql);
       stmt.close();
       con.close();
       out.print("<left><p>  </p><p>");
       out.print("���\�����Ȥ��ƿ�J</P>");
  }
   else{
      out.print("<p><A HREF=");
      out.print("'BankPage.jsp'");
      out.print(" TARGET=");
      out.print("'_top'");
      out.print(">�]�������D�X�k����!!�Ы����^����</A></p>");
   }
%>
</body>
</html>