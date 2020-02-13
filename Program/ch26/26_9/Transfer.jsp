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
                             " SET 轉出帳號= " + outnumberStr + "," +
                                      " 轉入帳號= " + innumberStr + "," +
                                      " 轉帳金額= " + amountStr +
                             " WHERE 存褶帳號=000 " + ";";

       String sql2 = "UPDATE Deposit " +
                             "SET 轉帳金額 = DLookup('轉帳金額', 'Deposit', " +
                                                                          " '存褶帳號 = 000') " +
                             "WHERE 存褶帳號 = (SELECT  轉出帳號 " +
                                                                  "FROM Deposit " +
                                                                  "WHERE 存褶帳號 = 000) ";

       String  sql3 = "UPDATE Deposit " +
                             "SET 轉帳金額 = DLookup('轉帳金額', 'Deposit', " +
                                                                          " '存褶帳號 = 000') " +
                             "WHERE 存褶帳號 = (SELECT 轉入帳號 " +
                                                                  "FROM Deposit " +
                                                                  "WHERE 存褶帳號 = 000) ";

       String  sql4 = "UPDATE Deposit " +
                                 "SET 餘額 = 餘額 - 轉帳金額 " +
                                 "WHERE 存褶帳號 = (SELECT 轉出帳號 " +
                                                                      "FROM Deposit " +
                                                                      "WHERE 存褶帳號 = 000)";

       String  sql5 = "UPDATE Deposit " +
                                 "SET 餘額 = 餘額 + 轉帳金額 " +
                                 "WHERE 存褶帳號 = (SELECT 轉入帳號 " +
                                                                      "FROM Deposit " +
                                                                      "WHERE 存褶帳號 = 000)";

       String  sql6 = "SELECT 餘額 " +
                               "FROM Deposit " +
                               "WHERE 存褶帳號 = " + outnumberStr + ";";

  HttpSession sessionC = request.getSession();
  if(sessionC.getAttribute(outnumberStr) == "true") {
     out.print("本頁為經過認證之合法網頁!!" + "<br>");
     Transfer.setSQLcmd(sql1, sql2, sql3, sql4, sql5, sql6);
     out.print(Transfer.getResult());
  }
  else{
     out.print("<p><A HREF=");
     out.print("'BankPage.jsp'");
     out.print(" TARGET=");
     out.print("'_top'");
     out.print(">因本頁為非合法網頁!!請按此回首頁</A></p>");
   }
%>
</body>
</html>