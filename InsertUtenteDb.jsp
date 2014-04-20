<%-- 
    Document   : qui.jsp
    Created on : 27-dic-2013, 16.59.55
    Author     : Sara
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="cookies.js"></script>
    </head>
    <body>
        <form name="aux">
        <input type="hidden" id="Myaux" name="myaux" value="">
        </form>
        <h4>Registrazione avvenuta con successo!  </h4>

         
         <%
      
             String Mail=request.getParameter("Mail");
             String password=request.getParameter("password");
             String mystring="Benvenuto su RaptorMigration";
             out.println(mystring);
             System.out.println("Mail "+Mail);
             System.out.println("password "+password);
            
             
             //String MyUsername="";
             String MyPassword="";
             String MyMail="";
             String MyCognome="";
             String MyNome="";
             String MyannoNascita="";
             String MyNazionalita="";
             String MyIndirizzo="";
             String MyNumCivico="";
             String MyCap="";
             String MyProvincia="";
             String MyComune="";
             String MyTelefono="";
             String MyCommento="";
             int MyHash=0;
             
             Connection conn=null;
             Statement stm=null;
             ResultSet rs=null;
             
             ArrayList<String> list=new ArrayList<String>();
             boolean flag=false;
             System.out.println("qui1");
             String query="select * from Utenti_Temp where Mail="+"'"+Mail+"'"+"and Password="+"'"+password+"';";
             System.out.println("qeeee "+query);
             String ConnectionUrl="jdbc:mysql://localhost:3306/raptor"; 
             Class.forName("com.mysql.jdbc.Driver").newInstance();
             conn=DriverManager.getConnection(ConnectionUrl);
             stm=conn.createStatement();
             rs=stm.executeQuery(query);
             boolean flagRs= rs.next();
            
             if(flagRs==true)
             {
             
             //MyUsername=rs.getString("Username");
             MyPassword=rs.getString("Password");
             MyMail=rs.getString("Mail");
             MyCognome=rs.getString("Cognome");
             MyNome=rs.getString("Nome");
             MyannoNascita=rs.getString("AnnoDiNascita");
             MyNazionalita=rs.getString("Nazionalita");
             MyIndirizzo=rs.getString("Indirizzo");
             MyTelefono=rs.getString("Telefono");
             MyCommento=rs.getString("Commento");
             MyHash=rs.getInt("hash");
            
             String MyQuery="INSERT INTO Utenti(Mail,Cognome,Nome,AnnoDiNascita,Indirizzo,Telefono,Commento,Password,Nazionalita) "
                        + "VALUES('"+MyMail+"',"+"'"+MyCognome+"',"+"'"+MyNome+"',"+"'"+MyannoNascita+"',"+"'"+MyIndirizzo+"',"+"'"+MyTelefono+"',"+"'"+MyCommento+"',"+"'"+MyPassword+"',"+"'"+MyNazionalita+"');";
                    System.out.println("MyQuery "+MyQuery);
                    try
                    {
                    int n=stm.executeUpdate(MyQuery);
                    
                    }
                    catch(Exception e)
                    {
                       System.out.println("eccezione "+e.getMessage());
                    }
                    //rs.close();
                    try
                    {
                    //cancella il link creato per l'utente
                    String link="Benvenuto_"+MyHash;
                    File myFile=new File("C:/Users/Sara/Documents/NetBeansProjects/RaptorMigration/web/"+link+".jsp");
                    //myFile.createNewFile();
                  
                    System.out.println("myFile "+myFile.getPath());
                    boolean n=true;
                  
                    n=myFile.delete();
                    }
                    catch(Exception e)
                    {
                       System.out.println("eccezFile "+e.getMessage()); 
                    }
                    
                    String QueryDelete="Delete from Utenti_Temp where Mail="+"'"+Mail+"'"+"and Password="+"'"+password+"';";
                    stm.executeUpdate(QueryDelete);
                    conn.close();
                    
         
             }
             
             
          %>
          

    </body>
</html>
