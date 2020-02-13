<%@ page contentType="text/html;charset=big5" %>
<%@ page import= "java.sql.*" %>
<html>
<head><title>InputRecord</title></head><body>
<%
  String JDriver = "sun.jdbc.odbc.JdbcOdbcDriver";
  String connectDB="jdbc:odbc:School";

  Class.forName(JDriver);
  Connection con = DriverManager.getConnection(connectDB);
  Statement stmt = con.createStatement();

  request.setCharacterEncoding("big5");
  String s0Str = request.getParameter("s0");
  String s1Str = request.getParameter("s1");
  String s2Str = request.getParameter("s2");
  String s3Str = request.getParameter("s3");
  String s4Str = request.getParameter("s4");
  String s5Str = request.getParameter("s5");

  String sql="INSERT INTO RECORDS(班級座號, 年月日, 公假, 事假, 病假, 曠課)" +
             " VALUES('" + s0Str + "'," + s1Str + "," + s2Str +
             "," + s3Str + "," + s4Str + "," + s5Str + ")" ;

  session = request.getSession();
  if(session.getAttribute("School") == "true") {
       out.print("本頁為經過認證之合法資料庫輸入網頁!!" + "<br>");
       stmt.executeUpdate(sql);
       stmt.close();
       con.close();
       out.print("<left><p>  </p><p>");
       out.print("成功完成曠缺課資料輸入</P>");
   }
   else{
      out.print("<p><A HREF=");
      out.print("'SchoolPage.jsp'");
      out.print(" TARGET=");
      out.print("'_top'");
      out.print(">因本頁為非合法網頁!!請按此回首頁</A></p>");
   }
%>
</body>
</html>