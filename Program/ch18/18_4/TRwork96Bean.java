package DatabaseLib;
import java.sql.*;

public class TRwork96Bean {
   private String sql1, sql2, sql3;

   public void setSQLcmd(String sql1, String sql2, String sql3) {
      this.sql1= sql1;
      this.sql2= sql2;
      this.sql3= sql3;
   }

   public String getResult() {
      String JDriver = "sun.jdbc.odbc.JdbcOdbcDriver";
      String connectDB="jdbc:odbc:Bank18";
      StringBuffer sb = new StringBuffer();

      try{
         Class.forName(JDriver);
         Connection con = DriverManager.getConnection(connectDB);
         Statement stmt = con.createStatement();

         con.setAutoCommit(false);
         stmt.execute(sql1);
         stmt.execute(sql2);
         stmt.execute(sql3);
         con.commit();
         con.setAutoCommit(true);
        
         sb.append("<B>Transaction works successfully</B> " );
           
         stmt.close();
         con.close();
      }
      catch (Exception e){sb.append(e.getMessage());}
      return sb.toString();     
   }
}