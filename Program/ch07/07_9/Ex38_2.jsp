<%@ page contentType="text/html;charset=big5" %>
<html>
<head><title>Ex38_1</title></head><body>
<p align="left">
<font size="5"><b>Sub Page of Ex38</b></font>
</p>
<%
  request.setCharacterEncoding("big5");

  Object info= pageContext.getAttribute("ex38", pageContext.SESSION_SCOPE);
  String infoStr= (String)info;
%>
  pageContext_ex38資訊內容為： <%= infoStr %>
</body>
</html>