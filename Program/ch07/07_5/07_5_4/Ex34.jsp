<%@ page contentType="text/html; charset=big5" %>
<html>
<head><title>Ex34</title></head>
<body> 
<% 
 int sizeValue;

 sizeValue= response.getBufferSize();
 out.print("���ҹw�]BufferSize��: " + sizeValue + "bytes<br>");

 sizeValue= 16*1024;
 response.setBufferSize(sizeValue);
 sizeValue= response.getBufferSize();
 out.print("�s�]�wBufferSize��: " + sizeValue + "bytes<p>");

 response.flushBuffer();
 boolean b= response.isCommitted();
 out.print("����Buffer�O�_�w����flush: " + b);
%>
</body>
</html>