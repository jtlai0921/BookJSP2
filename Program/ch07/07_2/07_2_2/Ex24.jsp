<%@ page contentType="text/html; charset=big5" %>
<html>
<head><title>Ex24</title></head>
<body> 
<% 
 int sizeValue;

 sizeValue= out.getBufferSize();
 out.print("���ҹw�]BufferSize��: " + sizeValue + "bytes<br>");

 sizeValue= out.getRemaining();
 out.print("�ثeBufferSize�|�l: " + sizeValue + "bytes<p>");

 out.clear();
 sizeValue= out.getRemaining();
 out.print("�g�Lclear�ثeBufferSize�|�l: " + sizeValue + "bytes<p>");
%>
</body>
</html>