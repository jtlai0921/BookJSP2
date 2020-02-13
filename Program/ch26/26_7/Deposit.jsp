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
                      " SET 餘額 = 餘額 + " + amountStr  +
                      " WHERE 存褶帳號 = " + innumberStr + ";";

  HttpSession sessionC = request.getSession();
  if(sessionC.getAttribute(innumberStr) == "true") {
     out.print("本頁為經過認證之合法網頁!!" + "<br>");
     Deposit.setSQLcmd(sql);
     out.print(Deposit.getResult());
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