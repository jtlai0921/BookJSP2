<%@ page contentType="text/html; charset=big5" %>
<html>
<head><title>Ex32</title></head>
<body> 
<%
 String encod, type;

 response.setCharacterEncoding("big5");

 encod= response.getCharacterEncoding();
 out.print("本例回應訊息編碼為: " + encod + "<br>");

 type= response.getContentType();
 out.print("本例回應文件格式為: " + type + "<br>");
%>
</body>
</html>