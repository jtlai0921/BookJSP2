<%@ page contentType="text/html;charset=big5" %>
<html>
<head><title>Connection</title></head><body>
<p align="left">
<font size="5"><b>Sub Page of Connection</b></font>
</p>
<jsp:useBean id= "DBwork" scope= "session" class= "DatabaseLib.ConnBean" />
<%
  request.setCharacterEncoding("big5");
  String DBname = request.getParameter("DBname");

  DBwork.setDBname(DBname);
  out.print(DBwork.getResult());
%>
</body>
</html>