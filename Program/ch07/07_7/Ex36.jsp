<%@ page contentType="text/html;charset=big5" %>
<html>
<head><title>Ex36</title></head><body>
<p align="left">
<font size="5"><b>Sub Page of Ex36</b></font>
</p>
<%
  request.setCharacterEncoding("big5");
  String val = request.getParameter("data");
  application.setAttribute("application_ex36", val);

  Object info= application.getAttribute("application_ex36");
  String infoStr= (String)info;
%>

  application_ex36資訊內容為： <%= infoStr %>
</body>
</html>