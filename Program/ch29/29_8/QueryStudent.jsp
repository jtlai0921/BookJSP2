<%@ page contentType="text/html;charset=big5" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "java.io.*" %>
<html>
<head><title>QueryStudent</title></head><body>
<p align="left">
<font size="5"><b>學生操行成績單查詢</b></font>
</p>
<%
  String JDriver = "sun.jdbc.odbc.JdbcOdbcDriver";
  String connectDB="jdbc:odbc:School";
  StringBuffer sb = new StringBuffer();

  Class.forName(JDriver);
  Connection con = DriverManager.getConnection(connectDB);
  Statement stmt = con.createStatement();

  request.setCharacterEncoding("big5");
  String numberStr=request.getParameter("num");

  String sql="SELECT * FROM 查詢2_成績 WHERE 學號= " +
                    numberStr +";" ;

  if (stmt.execute(sql))
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
             sb.append("<B>未能完成讀取:</B> " );

  String result= sb.toString();
  out.print(result);

  stmt.close();
  con.close();
%>
</body>
</html>