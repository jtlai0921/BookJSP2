<%@ page contentType= "text/html;charset=big5" %>
<html>
<head><title>Ex49_2</title></head><body>
<%
  request.setCharacterEncoding("big5");
  out.print("This is the Sub Page of Ex49_2" + "<br>");
  out.print("" + "<br>");

  session = request.getSession();

  if(session.getAttribute("ex49") == "true")
       out.print("�{�Ҧ��\����" + "<br>");
   else
       out.print("�D�{�Ҧ��\����" + "<br>");
%>
</body>
</html>