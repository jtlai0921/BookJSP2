<%@ page contentType= "text/html;charset=big5" %>
<html>
<head><title>Ex49_2</title></head><body>
<%
  request.setCharacterEncoding("big5");
  out.print("This is the Sub Page of Ex49_2" + "<br>");
  out.print("" + "<br>");

  session = request.getSession();

  if(session.getAttribute("ex49") == "true")
       out.print("認證成功網頁" + "<br>");
   else
       out.print("非認證成功網頁" + "<br>");
%>
</body>
</html>