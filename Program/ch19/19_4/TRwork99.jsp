<%@ page contentType="text/html;charset=big5" %>
<html>
<head><title>EX99 Transaction Work</title></head><body>
<p align="left">
<font size="5"><b>Sub Page of EX99 Transaction Work</b></font>
</p>
<jsp:useBean id= "TRwork99" scope= "session"
                       class= "DatabaseLib.TRwork99Bean" />
<%
  request.setCharacterEncoding("big5");
  String numberStr= request.getParameter("number");
  String amountStr= request.getParameter("amount");

  String sql1 = "UPDATE Deposit " +
                       " SET balance=balance - " + amountStr  +
                       " WHERE account_number= " + numberStr + ";";

  String sql2 = "SELECT balance " +
                         "FROM Deposit " +
                         "WHERE account_number = " + numberStr + ";";

  TRwork99.setSQLcmd(sql1, sql2);
  out.print(TRwork99.getResult());
%>
</body>
</html>