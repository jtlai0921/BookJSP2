<%@ page contentType="text/html; charset=big5" 
    import="java.util.*" %>
<html>
<head><title>Ex37</title></head><body>
<%
  String name;

  Enumeration en = config.getInitParameterNames();
  while (en.hasMoreElements()) {
    name = (String)en.nextElement();
    out.println("config初始參數 "  + name + 
	    " : " + config.getInitParameter(name) + "<br>");
  }

  name = config.getServletName();
  out.println("Servlet名稱: " + name);
%>
</body>
</html>
