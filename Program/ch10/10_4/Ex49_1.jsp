<%@ page contentType= "text/html;charset=big5" %>
<%@ page import= "java.sql.*" %>
<html>
<head><title>Ex49</title></head><body>
<p align="center">
<font size="5"><b>Sub Page of Ex49</b></font>
</p><p align="left">
<B>�޲z���{��</B></p>
<%
  session = request.getSession();
  session.setAttribute("ex49", "true");

  String JDriver = "sun.jdbc.odbc.JdbcOdbcDriver";
  String connectDB="jdbc:odbc:Book10";

  Class.forName(JDriver);
  Connection con = DriverManager.getConnection(connectDB);
  Statement stmt = con.createStatement();

  request.setCharacterEncoding("big5");
  String user = request.getParameter("user");
  String pwd = request.getParameter("pwd");

  String sql="SELECT *  FROM Manager WHERE �m�W='" +
                    user + "'AND �K�X='" + pwd + "';";

  ResultSet rs= stmt.executeQuery(sql);
  boolean flag= false;

  while(rs.next()) flag= true;
  if(flag)
      out.print("�W�ٱK�X�L�~");
  else
      out.print("�W�ٱK�X���~");

  stmt.close();
  con.close();
%>
<FORM METHOD="post" ACTION="Ex49_2.jsp">
<INPUT TYPE="submit" VALUE="go to Sub Page">
</body>
</html>