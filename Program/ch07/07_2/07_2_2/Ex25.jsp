<%@ page contentType="text/html; charset=big5" %>
<html>
<head><title>Ex25</title></head>
<body> 
<% 
 int sizeValue;

 sizeValue= out.getBufferSize();
 out.print("���ҹw�]BufferSize��: " + sizeValue + "bytes<br>");

 sizeValue= out.getRemaining();
 out.print("�ثeBufferSize�|�l: " + sizeValue + "bytes<p>");

 out.flush();
 sizeValue= out.getRemaining();
 out.print("�g�Lflush�ثeBufferSize�|�l: " + sizeValue + "bytes<p>");

 boolean b= out.isAutoFlush();
 out.print("����Buffer�O�_�i����flush: " + b);
%>
</body>
</html>