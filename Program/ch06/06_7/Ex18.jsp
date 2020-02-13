<%@ page contentType="text/html;charset=big5" %>
<html>
<head><title>Ex18</title></head><body>
<%
  request.setCharacterEncoding("big5");
  String val = request.getParameter("course");
  out.println("最喜歡的課目： " + val );
%>
</body>
</html>