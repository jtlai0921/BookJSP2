<%@ page contentType="text/html;charset=big5" %>
<html>
<head><title>Ex40_setBean</title></head><body>
<p align="left">
<font size="5"><b>Page of Ex40_setBean</b></font>
</p>
<jsp:useBean id= "BookJSP" scope= "session" class= "beanLib.valueBean" />
<jsp:setProperty name= "BookJSP" property= "price" value= "500" />
<jsp:setProperty name= "BookJSP" property= "number" value= "10" />

<FORM METHOD="post" ACTION="Ex40_getBean.jsp">
<INPUT TYPE="submit" VALUE="go to Sub Page">
</body>
</html>