<%@ page contentType="text/html;charset=big5" %>
<%@ page import= "java.sql.*" %>
<html>
<head><title>InsertStudent</title></head><body>
<%
  String JDriver = "sun.jdbc.odbc.JdbcOdbcDriver";
  String connectDB="jdbc:odbc:Exam";

  Class.forName(JDriver);
  Connection con = DriverManager.getConnection(connectDB);
  Statement stmt = con.createStatement();

  request.setCharacterEncoding("big5");
  String numberStr = request.getParameter("num");
  String cnsStr = request.getParameter("cns");
  String engStr = request.getParameter("eng");
  String mathStr =request.getParameter("math");
  String techStr =request.getParameter("tech");
  String peopStr = request.getParameter("peop");

  String sql="INSERT INTO Scores(准考證號碼, 國文, " +
                    "英文, 數學, 自然, 社會)" + " VALUES (" + 
                      numberStr + "," + cnsStr + "," +   engStr + "," +   
                      mathStr  + "," + techStr + "," + peopStr +")" ;

  session = request.getSession();
  if(session.getAttribute("Exam") == "true") {
       out.print("本頁為經過認證之合法資料庫輸入網頁!!" + "<br>");
       stmt.executeUpdate(sql);
       stmt.close();
       con.close();
       out.print("<left><p>  </p><p>");
       out.print("成功完成考生成績輸入</P>");
  }
   else{
      out.print("<p><A HREF=");
      out.print("'ExPage.jsp'");
      out.print(" TARGET=");
      out.print("'_top'");
      out.print(">因本頁為非合法網頁!!請按此回首頁</A></p>");
   }
%>
</body>
</html>