<%@ page contentType="text/html;charset=big5" %>
<html>
<head><title>Withdraw Work</title></head><body>
<p align="left">
<font size="5"><b>Sub Page of Withdraw Work</b></font>
</p>
<jsp:useBean id= "Withdraw" scope= "session" class= "DatabaseLib.WithdrawBean" />
<%
  request.setCharacterEncoding("big5");
  String outnumberStr=request.getParameter("Outnumber");
  String amountStr=request.getParameter("Amount");

  String sql1 = "UPDATE Deposit " +
                        " SET �l�B = �l�B - " + amountStr  +
                        " WHERE �s���b�� = " + outnumberStr + ";";

   String sql2 = "SELECT  �l�B " +
                         "FROM Deposit " +
                         "WHERE �s���b�� = " + outnumberStr + ";";

  HttpSession sessionC = request.getSession();
  if(sessionC.getAttribute(outnumberStr) == "true") {
     out.print("�������g�L�{�Ҥ��X�k����!!" + "<br>");
     Withdraw.setSQLcmd(sql1, sql2);
     out.print(Withdraw.getResult());
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