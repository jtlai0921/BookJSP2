<%@ page contentType="text/html;charset=big5" %>
<html>
<head><title>Transaction Work</title></head><body>
<p align="left">
<font size="5"><b>Sub Page of Transaction Work</b></font>
</p>
<jsp:useBean id= "Transfer" scope= "session"
                               class= "DatabaseLib.TransferBean" />
<%
  request.setCharacterEncoding("big5");
  String outnumberStr=request.getParameter("OutNumber");
  String innumberStr=request.getParameter("InNumber");
  String amountStr=request.getParameter("Amount");

  String sql1 =  "UPDATE Deposit " +
                             " SET ��X�b��= " + outnumberStr + "," +
                                      " ��J�b��= " + innumberStr + "," +
                                      " ��b���B= " + amountStr +
                             " WHERE �s���b��=000 " + ";";

       String sql2 = "UPDATE Deposit " +
                             "SET ��b���B = DLookup('��b���B', 'Deposit', " +
                                                                          " '�s���b�� = 000') " +
                             "WHERE �s���b�� = (SELECT  ��X�b�� " +
                                                                  "FROM Deposit " +
                                                                  "WHERE �s���b�� = 000) ";

       String  sql3 = "UPDATE Deposit " +
                             "SET ��b���B = DLookup('��b���B', 'Deposit', " +
                                                                          " '�s���b�� = 000') " +
                             "WHERE �s���b�� = (SELECT ��J�b�� " +
                                                                  "FROM Deposit " +
                                                                  "WHERE �s���b�� = 000) ";

       String  sql4 = "UPDATE Deposit " +
                                 "SET �l�B = �l�B - ��b���B " +
                                 "WHERE �s���b�� = (SELECT ��X�b�� " +
                                                                      "FROM Deposit " +
                                                                      "WHERE �s���b�� = 000)";

       String  sql5 = "UPDATE Deposit " +
                                 "SET �l�B = �l�B + ��b���B " +
                                 "WHERE �s���b�� = (SELECT ��J�b�� " +
                                                                      "FROM Deposit " +
                                                                      "WHERE �s���b�� = 000)";

       String  sql6 = "SELECT �l�B " +
                               "FROM Deposit " +
                               "WHERE �s���b�� = " + outnumberStr + ";";

  HttpSession sessionC = request.getSession();
  if(sessionC.getAttribute(outnumberStr) == "true") {
     out.print("�������g�L�{�Ҥ��X�k����!!" + "<br>");
     Transfer.setSQLcmd(sql1, sql2, sql3, sql4, sql5, sql6);
     out.print(Transfer.getResult());
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