<%@ page contentType="text/html;charset=big5" %>
<html>
<head><title>EX95 Transaction Work</title></head><body>
<p align="left">
<font size="5"><b>Sub Page of EX95 Transaction Work</b></font>
</p>
<jsp:useBean id= "TRwork95" scope= "session"
                               class= "DatabaseLib.TRwork95Bean" />
<%
  request.setCharacterEncoding("big5");
  String outNumberStr= request.getParameter("outNumber");
  String inNumberStr= request.getParameter("inNumber");
  String amountStr= request.getParameter("amount");

  String sql = "UPDATE Deposit " +
                           " SET tran_out= " + outNumberStr + "," +
                                  " tran_in= " + inNumberStr + "," +
                                  " tran_amount= " + amountStr +
                           " WHERE account_number=000 " + ";";

  TRwork95.setSQLcmd(sql);
  out.print(TRwork95.getResult());
%>
</body>
</html>