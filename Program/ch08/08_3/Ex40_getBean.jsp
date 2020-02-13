<%@ page contentType="text/html;charset=big5" %>
<html>
<head><title>Ex40_getBean</title></head><body>
<p align="left">
<font size="5"><b>Page of Ex40_getBean</b></font>
</p>
<jsp:useBean id= "BookJSP" scope= "session" class= "beanLib.valueBean" />
BookJSP單價為：
<jsp:getProperty name= "BookJSP" property= "price" /><br>
BookJSP數量為：
<jsp:getProperty name= "BookJSP" property= "number" /><br>
BookJSP總價為：
<jsp:getProperty name= "BookJSP" property= "totalValue" /><br>
</body>
</html>