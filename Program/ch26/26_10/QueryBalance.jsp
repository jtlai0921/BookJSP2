<%@ page contentType="text/html;charset=big5" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "java.io.*" %>
<html>
<head><title>QueryBalance</title></head><body>
<p align="left">
<font size="5"><b>�Ȥ�s���l�B�d��</b></font>
</p>
<%
  boolean flag = false;
  String JDriver = "sun.jdbc.odbc.JdbcOdbcDriver";
  String connectDB="jdbc:odbc:Bank";
  StringBuffer sb = new StringBuffer();

  Class.forName(JDriver);
  Connection con = DriverManager.getConnection(connectDB);
  Statement stmt = con.createStatement();

  request.setCharacterEncoding("big5");
  String numberStr=request.getParameter("Number");

  String sql="SELECT * FROM QueryBalance WHERE �s���b��= " +
               numberStr +";" ;

  HttpSession sessionC = request.getSession();
  if(sessionC.getAttribute(numberStr) == "true") {
       flag = true;
       out.print("�������g�L�{�Ҥ��X�k��Ʈw�d�ߺ���!!" + "<br>");
  }
   else{
      out.print("<p><A HREF=");
      out.print("'BankPage.jsp'");
      out.print(" TARGET=");
      out.print("'_top'");
      out.print(">�]�������D�X�k����!!�Ы����^����</A></p>");
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
       sb.append("<B>�s���b�����~</B> ");

  String result= sb.toString();
  out.print(result);

  stmt.close();
  con.close();
%>
</body>
</html>