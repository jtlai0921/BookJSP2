<%@ page contentType="text/html;charset=big5" %>
<html>
<head><title>Ex41_setBean</title></head><body>
<p align="left">
<font size="5"><b>Page of Ex41_setBean</b></font>
</p>
<jsp:useBean id= "BookJSP" scope= "session" class= "beanLib.valueBean" />
<%
  BookJSP.setPrice(500);
  BookJSP.setNumber(10);
%>
<FORM METHOD="post" ACTION="Ex41_getBean.jsp">
<INPUT TYPE="submit" VALUE="go to Sub Page">
</body>
</html>