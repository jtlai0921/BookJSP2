<%@ page contentType="text/html;charset=big5" %>
<html>
<head><title>Deposit Work</title></head><body>
<p align="left">
<font size="5"><b>Sub Page of Deposit Work</b></font>
</p>
<jsp:useBean id= "Deposit" scope= "session" class= "DatabaseLib.DepositBean" />
<%
  request.setCharacterEncoding("big5");
  String innumberStr=request.getParameter("Innumber");
  String amountStr=request.getParameter("Amount");

   String sql = "UPDATE Deposit " +
                      " SET �l�B = �l�B + " + amountStr  +
                      " WHERE �s���b�� = " + innumberStr + ";";

  HttpSession sessionC = request.getSession();
  if(sessionC.getAttribute(innumberStr) == "true") {
     out.print("�������g�L�{�Ҥ��X�k����!!" + "<br>");
     Deposit.setSQLcmd(sql);
     out.print(Deposit.getResult());
  }
  else{
     out.print("<p><A HREF=");
     out.print("'BankPage.jsp'");
     out.print(" TARGET=");
     out.print("'_top'");
     out.print(">�]�������D�X�k����!!�Ы����^����</A></p>");
   }
%>
</body>
</html>