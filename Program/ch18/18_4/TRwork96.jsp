<%@ page contentType="text/html;charset=big5" %>
<html>
<head><title>EX96 Transaction Work</title></head><body>
<p align="left">
<font size="5"><b>Sub Page of EX96 Transaction Work</b></font>
</p>
<jsp:useBean id= "TRwork96" scope= "session"
                               class= "DatabaseLib.TRwork96Bean" />
<%
  request.setCharacterEncoding("big5");
  String outNumberStr= request.getParameter("outNumber");
  String inNumberStr= request.getParameter("inNumber");
  String amountStr= request.getParameter("amount");

  String sql1 = "UPDATE Deposit " +
                           " SET tran_out= " + outNumberStr + "," +
                                  " tran_in= " + inNumberStr + "," +
                                  " tran_amount= " + amountStr +
                           " WHERE account_number=000 " + ";";

  String sql2 = "UPDATE Deposit " +
                            "SET tran_amount = DLookup('tran_amount', 'Deposit', " +
                                                                             " 'account_number = 000') " +
                             "WHERE account_number = (SELECT tran_out " +
                                                                            "FROM Deposit " +
                                                                            "WHERE account_number = 000) ";

  String sql3 = "UPDATE Deposit " +
                             "SET tran_amount = DLookup('tran_amount', 'Deposit', " +
                                                                              " 'account_number = 000') " +
                             "WHERE account_number = (SELECT tran_in " +
                                                                            "FROM Deposit " +
                                                                            "WHERE account_number = 000) ";

  TRwork96.setSQLcmd(sql1, sql2, sql3);
  out.print(TRwork96.getResult());
%>
</body>
</html>