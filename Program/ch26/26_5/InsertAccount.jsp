<%@ page contentType="text/html;charset=big5" %>
<%@ page import= "java.sql.*" %>
<html>
<head><title>InsertAccount</title></head><body>
<%
  String JDriver = "sun.jdbc.odbc.JdbcOdbcDriver";
  String connectDB="jdbc:odbc:Bank";

  Class.forName(JDriver);
  Connection con = DriverManager.getConnection(connectDB);
  Statement stmt = con.createStatement();

  request.setCharacterEncoding("big5");
  String numberStr = request.getParameter("Number");
  String balanceStr = request.getParameter("Balance");

  String sql="INSERT INTO Deposit(存褶帳號, 餘額)" +
                    " VALUES (" + numberStr + "," + balanceStr + ")" ;

  session = request.getSession();
  if(session.getAttribute("Bank") == "true") {
       out.print("本頁為經過認證之合法資料庫輸入網頁!!" + "<br>");
       stmt.executeUpdate(sql);
       stmt.close();
       con.close();
       out.print("<left><p>  </p><p>");
       out.print("成功完成開戶存褶資料輸入</P>");
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