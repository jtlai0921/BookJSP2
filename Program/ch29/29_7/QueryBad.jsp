<%@ page contentType="text/html;charset=big5" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "java.io.*" %>
<html>
<head><title>QueryBad</title></head><body>
<p align="left">
<font size="5"><b>操行不良名單查詢</b></font>
</p>
<%
  boolean flag = false;
  String JDriver = "sun.jdbc.odbc.JdbcOdbcDriver";
  String connectDB="jdbc:odbc:School";
  StringBuffer sb = new StringBuffer();

  Class.forName(JDriver);
  Connection con = DriverManager.getConnection(connectDB);
  Statement stmt = con.createStatement();

  String sql= "select * from 查詢3_不良名單" ;

  session = request.getSession();
  if(session.getAttribute("School") == "true") {
       flag = true;
       out.print("本頁為經過認證之合法資料庫查詢網頁!!" + "<br>");
  }
   else{
      out.print("<p><A HREF=");
      out.print("'SchoolPage.jsp'");
      out.print(" TARGET=");
      out.print("'_top'");
      out.print(">因本頁為非合法網頁!!請按此回首頁</A></p>");
   }
  if ((flag) && (stmt.execute(sql)))
      {
        ResultSet rs = stmt.getResultSet();
        ResultSetMetaData md = rs.getMetaData();
        int colCount = md.getColumnCount();
        sb.append("<TABLE CELLSPACING=10><TR>");
        for (int i = 1; i <= colCount; i++)
           sb.append("<TH>" + md.getColumnLabel(i));
        while (rs.next())
            {
              sb.append("<TR>");
              for (int i = 1; i <= colCount; i++)
                   {
                     sb.append("<TD>");
                     Object obj = rs.getObject(i);
                     if (obj != null)
                          sb.append(obj.toString());
                      else
                          sb.append("&nbsp;");
                    }
              }
              sb.append("</TABLE>\n");
      }
     else
       sb.append("<B>未能完成讀取</B> ");

  String result= sb.toString();
  out.print(result);

  stmt.close();
  con.close();
%>
</body>
</html>