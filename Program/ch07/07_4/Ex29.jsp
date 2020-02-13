<%@ page contentType="text/html;charset=big5" %>
<html>
<head><title>Ex29</title></head><body>
<%
  String ClientLanguage = request.getHeader("accept-language");
  out.print("ClientLanguage¡G " + ClientLanguage);
%>
</body>
</html>