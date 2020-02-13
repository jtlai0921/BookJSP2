package DatabaseLib;
import java.sql.*;

public class TRwork98Bean {
   private String SQLcmd;

   public void setSQLcmd(String SQLcmd) {
      this.SQLcmd= SQLcmd;
   }

   public String getResult() {
      String JDriver = "sun.jdbc.odbc.JdbcOdbcDriver";
      String connectDB="jdbc:odbc:Bank19";
      StringBuffer sb = new StringBuffer();

      try{
         Class.forName(JDriver);
         Connection con = DriverManager.getConnection(connectDB);
         Statement stmt = con.createStatement();

         con.setAutoCommit(false);
         stmt.execute(SQLcmd);
         con.rollback();
         sb.append("rollback works before commit!!");
         con.commit();
         con.setAutoCommit(true);
        
         sb.append("<B>Transaction not works successfully in Database!!</B> " );
           
         stmt.close();
         con.close();
      }
      catch (Exception e){sb.append(e.getMessage());}
      return sb.toString();     
   }
}