<%@ page contentType="text/html; charset=big5" %>
<html>
<head><title>Ex25</title></head>
<body> 
<% 
 int sizeValue;

 sizeValue= out.getBufferSize();
 out.print("本例預設BufferSize為: " + sizeValue + "bytes<br>");

 sizeValue= out.getRemaining();
 out.print("目前BufferSize尚餘: " + sizeValue + "bytes<p>");

 out.flush();
 sizeValue= out.getRemaining();
 out.print("經過flush目前BufferSize尚餘: " + sizeValue + "bytes<p>");

 boolean b= out.isAutoFlush();
 out.print("本例Buffer是否可執行flush: " + b);
%>
</body>
</html>