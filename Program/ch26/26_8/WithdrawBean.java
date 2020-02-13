package DatabaseLib;
import java.sql.*;

public class WithdrawBean {
   private String sql1, sql2;

   public void setSQLcmd(String sql1, String sql2) {
      this.sql1= sql1;
      this.sql2= sql2;
   }

   public String getResult() {
      int val, flag= 0;
      String JDriver = "sun.jdbc.odbc.JdbcOdbcDriver";
      String connectDB="jdbc:odbc:Bank";
      StringBuffer sb = new StringBuffer();

      try{
         Class.forName(JDriver);
         Connection con = DriverManager.getConnection(connectDB);
         Statement stmt = con.createStatement();

         con.setAutoCommit(false);

         stmt.execute(sql1);
         ResultSet rs = stmt.executeQuery(sql2);
         while(rs.next()) {
             val = rs.getInt("æl√B");
             if(val < 0) flag =1;
          }
          if(flag == 1) {
             sb.append("Balance is not enough and Rollbak!! ");
             con.rollback();
          }
          else
              sb.append("Transaction works successfully!!");

         con.commit();
         con.setAutoCommit(true);

         stmt.close();
         con.close();
      }
      catch (Exception e){sb.append(e.getMessage());}
      return sb.toString();     
   }
}