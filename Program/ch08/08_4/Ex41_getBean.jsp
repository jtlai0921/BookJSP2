<%@ page contentType="text/html;charset=big5" %>
<html>
<head><title>Ex41_getBean</title></head><body>
<p align="left">
<font size="5"><b>Page of Ex41_getBean</b></font>
</p>
<jsp:useBean id= "BookJSP" scope= "session" class= "beanLib.valueBean" />
BookJSP������G
<%= BookJSP.getPrice() %><br>
BookJSP�ƶq���G
<%= BookJSP.getNumber() %><br>
BookJSP�`�����G
<%= BookJSP.gettotalValue() %><br>
</body>
</html>