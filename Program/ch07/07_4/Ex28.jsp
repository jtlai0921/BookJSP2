<%@ page contentType="text/html;charset=big5" %>
<html>
<head><title>Ex28</title></head><body>
<%
  String ClientOpt = request.getHeader("user-agent");
  out.print("ClientOpt¡G " + ClientOpt);
%>
</body>
</html>