<%@ page contentType="text/html; charset=big5" %>
<html>
<head><title>Ex24</title></head>
<body> 
<% 
 int sizeValue;

 sizeValue= out.getBufferSize();
 out.print("本例預設BufferSize為: " + sizeValue + "bytes<br>");

 sizeValue= out.getRemaining();
 out.print("目前BufferSize尚餘: " + sizeValue + "bytes<p>");

 out.clear();
 sizeValue= out.getRemaining();
 out.print("經過clear目前BufferSize尚餘: " + sizeValue + "bytes<p>");
%>
</body>
</html>