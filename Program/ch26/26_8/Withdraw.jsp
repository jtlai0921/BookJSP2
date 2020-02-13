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
                        " SET 餘額 = 餘額 - " + amountStr  +
                        " WHERE 存褶帳號 = " + outnumberStr + ";";

   String sql2 = "SELECT  餘額 " +
                         "FROM Deposit " +
                         "WHERE 存褶帳號 = " + outnumberStr + ";";

  HttpSession sessionC = request.getSession();
  if(sessionC.getAttribute(outnumberStr) == "true") {
     out.print("本頁為經過認證之合法網頁!!" + "<br>");
     Withdraw.setSQLcmd(sql1, sql2);
     out.print(Withdraw.getResult());
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