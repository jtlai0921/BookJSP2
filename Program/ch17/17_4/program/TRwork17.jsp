<%@ page contentType="text/html;charset=big5" %>
<html>
<head><title>Transaction Work</title></head><body>
<p align="left">
<font size="5"><b>Sub Page of Transaction Work</b></font>
</p>
<jsp:useBean id= "TRwork17" scope= "session" class= "DatabaseLib.TRworkBean17" />
<%
  request.setCharacterEncoding("big5");
  String numberStr= request.getParameter("number");
  String amountStr= request.getParameter("amount");

  String sql = "UPDATE Deposit " +
                         " SET balance=balance+ " + amountStr  +
                          " WHERE account_number= " + numberStr + ";";

  TRwork17.setSQLcmd(sql);
  out.print(TRwork17.getResult());
%>
</body>
</html>