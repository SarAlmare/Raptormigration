<%-- 
    Document   : RecuperoPassword
    Created on : 9-feb-2014, 13.20.03
    Author     : Sara
--%>


<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
         <body>   
   <div style="margin-top: 20px;">
       <hr width="1007" align="left">
        </div>
      <div style="margin-left: 60%;">
      <h1>RAPTORMIGRATION</h1>
      
      </div>
      <div style="border: 0px solid;margin-left: 0px;margin-right: 0px;margin-top: -80px;height: 15px; width:1008px;color: rgb(0, 0, 0); background-color: #D8E1E7; background: -moz-linear-gradient(left, #c8d7dc 0%, #e3eaed 53%,#f2f5f6 100% );"></div>
     
       <font  size ='4'>
        
      
        <div style="margin-left: 70%;margin-top: -15px;">
        <i> Mediterranean Raptor Migration Network </i>
        </div>
        <%
           
            String mail=request.getParameter("Mail");
            Connection Conn=null;
            Statement  Stm=null;
            ResultSet rs=null; 
            String ConnectionUrl="jdbc:mysql://localhost:3306/raptor"; 
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Conn=DriverManager.getConnection(ConnectionUrl);
            Stm=Conn.createStatement();
            String query="select Password  from utenti where Mail= "+"'"+mail+"'";
            rs=Stm.executeQuery(query);
            boolean flag= rs.next();
            if(flag==true)
            {
                try
                {
                
                String Password=rs.getString("Password");
                
                // Creazione di una mail session
        
        String from = "msara402@gmail.com";
        String to = mail; //cambiare con mail VERAAA
        String host = "smtp.gmail.com";
       
        
        Properties propsSSL = new Properties();

        // EVEN IF YOU SKIP THESE TWO PROP IT WOULD WORK
        propsSSL.put("mail.transport.protocol", "smtps");
        propsSSL.put("mail.smtps.host", "smtp.gmail.com");

        // THIS IS THE MOST IMPORTANT PROP --> "mail.smtps.auth"
        propsSSL.put("mail.smtps.auth", "true");

        Session sessionSSL = Session.getInstance(propsSSL);
        sessionSSL.setDebug(true);

        javax.mail.Message messageSSL = new MimeMessage(sessionSSL);
        messageSSL.setFrom(new InternetAddress(from, "Raptor Migration"));
        messageSSL.setRecipients(javax.mail.Message.RecipientType.TO, InternetAddress.parse(to)); // real recipient
        messageSSL.setSubject("Raptor Migration-recupero dati ");
        messageSSL.setText("Benvenuto/a su Raptor Migration! Le sue credenziali per accedere sono: Password: "+Password);

        javax.mail.Transport transportSSL = sessionSSL.getTransport();
        // EVEN IF YOU SKIP PORT NUMBER , IT WOULD WORK
        transportSSL.connect("smtp.gmail.com", 465, from, "msara402H"); // account used
        transportSSL.sendMessage(messageSSL, messageSSL.getAllRecipients());
        transportSSL.close();
        Conn.close();
            }
            catch(Exception e)
            {
                System.out.println("Exception "+e.getMessage());
            }
         %>
      
    
       <div style="margin-top: 50px;">
       Ti è stata inviata una mail con le tue credenziali
       
        <a class="mylink" href="index.jsp" style="text-decoration:none;margin-left: 50px;">Home</a> 
       </div>
         
         
         <%
            }
            else
            {
        %>
      
        <div style="margin-top: 50px;">
       La mail inserita non risulta registrata. Devi effettuare la procedura di registrazione.
       <div style="margin-top: 70px;">
        <a class="mylink" href="index.jsp" style="text-decoration:none;margin-left: 0px;">Home</a> 
        <a class="mylink" href="Registrati.jsp" style="text-decoration:none;margin-left: 40px;">Registrati</a> 
        </div>
        </div>
        <%
            }
         %>
    </body>
</html>
