<%@ page contentType="text/html;charset=big5"  %>
<html>
<head><title>Ex38_1</title></head><body>
<p align="left">
<font size="5"><b>Front Page of Ex38</b></font>
</p>
<%
  request.setCharacterEncoding("big5");

  pageContext.setAttribute("ex38", "pageContext¤º®e", 
                                            pageContext.SESSION_SCOPE);

  pageContext.forward("Ex38_2.jsp");
%>
</body>
</html>