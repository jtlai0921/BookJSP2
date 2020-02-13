<%@ page contentType="text/html; charset=big5" %>
<html>
<head><title>Ex34</title></head>
<body> 
<% 
 int sizeValue;

 sizeValue= response.getBufferSize();
 out.print("本例預設BufferSize為: " + sizeValue + "bytes<br>");

 sizeValue= 16*1024;
 response.setBufferSize(sizeValue);
 sizeValue= response.getBufferSize();
 out.print("新設定BufferSize為: " + sizeValue + "bytes<p>");

 response.flushBuffer();
 boolean b= response.isCommitted();
 out.print("本例Buffer是否已執行flush: " + b);
%>
</body>
</html>