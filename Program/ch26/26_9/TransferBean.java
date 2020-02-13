package DatabaseLib;
import java.sql.*;

public class TransferBean {
   private String sql1, sql2, sql3, sql4, sql5, sql6;

   public void setSQLcmd(String sql1, String sql2, String sql3, 
                                          String sql4, String sql5, String sql6) {
      this.sql1= sql1;   this.sql2= sql2;
      this.sql3= sql3;   this.sql4= sql4;
      this.sql5= sql5;   this.sql6= sql6;
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

         stmt.execute(sql1);      stmt.execute(sql2);
         stmt.execute(sql3);      stmt.execute(sql4);
         stmt.execute(sql5);

         ResultSet rs = stmt.executeQuery(sql6);
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