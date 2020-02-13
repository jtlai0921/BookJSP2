package DatabaseLib;
import java.sql.*;

public class ConnBean {
   private String DBname;

   public void setDBname(String DBname) {
      this.DBname= DBname;
   }

   public String getResult() {
      String JDriver = "sun.jdbc.odbc.JdbcOdbcDriver";
      String connectDB="jdbc:odbc:" + DBname;
      StringBuffer sb = new StringBuffer();

      try{
         Class.forName(JDriver);
         Connection con = DriverManager.getConnection(connectDB);
         Statement stmt = con.createStatement();
         String sqlCmd= "SELECT * FROM Books";

        if (stmt.execute(sqlCmd))
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
                 sb.append("<B>Modifying works successfully</B> ");

            stmt.close();
            con.close();
      }
      catch (Exception e){sb.append(e.getMessage());}
      return sb.toString();     
   }
}