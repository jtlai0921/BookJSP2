<%@ page contentType="text/html;charset=big5" %>
<html>
<head><title>EX98 Transaction Work</title></head><body>
<p align="left">
<font size="5"><b>Sub Page of EX98 Transaction Work</b></font>
</p>
<jsp:useBean id= "TRwork98" scope= "session" class= "DatabaseLib.TRwork98Bean" />
<%
  request.setCharacterEncoding("big5");
  String numberStr= request.getParameter("number");
  String amountStr= request.getParameter("amount");

  String sql = "UPDATE Deposit " +
                         " SET balance=balance+ " + amountStr  +
                          " WHERE account_number= " + numberStr + ";";

  TRwork98.setSQLcmd(sql);
  out.print(TRwork98.getResult());
%>
</body>
</html>