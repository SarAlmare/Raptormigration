<%-- 
    Document   : ControlloDati
    Created on : 30-nov-2013, 14.36.51
    Author     : Sara
--%>





<%@page import="Utilities.DataCorrente"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Connection"%>
<%@page import="sun.rmi.transport.Transport"%>
<%@page import="com.sun.corba.se.impl.protocol.giopmsgheaders.Message"%>

<%@page import="java.util.Properties"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.*,java.util.*,javax.mail.*"%>
<%@page import="javax.mail.internet.*,javax.activation.*"%>
<%@page import="javax.servlet.http.*,javax.servlet.*" %>
<%@page import="javax.mail.Session" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
    </head>
    <body>
          <div style="margin-top: 16px;">
       <hr width="1007" align="left">
        </div>
      <div style="margin-left: 70%;">
     <h1><font  size ='4'>RAPTORMIGRATION</h1>
      
      </div>
      <div style="border: 0px solid;margin-left: 0px;margin-right: 0px;margin-top: -80px;height: 15px; width:1008px;color: rgb(0, 0, 0); background-color: #D8E1E7; background: -moz-linear-gradient(left, #c8d7dc 0%, #e3eaed 53%,#f2f5f6 100% );"></div>
     
       <font  size ='4'>
        
      
        <div style="margin-left: 60%;margin-top: -15px;">
        <i> Mediterranean Raptor Migration Network </i>
        </div>
       
       <%
            Connection conn=null;
            Statement stm=null;
            ResultSet rs=null;
            //String Username="";
            String Password="";
            String Mail="";
            String Cognome="";
            String Nome="";
            String annoNascita="";
            String Nazionalita="";
            String Indirizzo="";
            String NumCivico="";
            String Cap="";
            String Provincia="";
            String Comune="";
            String Telefono="";
            String Commento="";
            //ArrayList<Utente> listUtenti=new ArrayList<Utente>();
            
 
            try
            {
                //Username=new String(request.getParameter("Username")); 
                Password=new String(request.getParameter("Password"));
                Mail=new String(request.getParameter("Indirizzo_mail"));
            }
            catch(Exception e)
            {
                System.out.println(e.getMessage());
            }
            String ConnectionUrl="jdbc:mysql://localhost:3306/raptor"; 
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn=DriverManager.getConnection(ConnectionUrl);
            stm=conn.createStatement();
            String query="select * from Utenti where Mail="+"'"+Mail +"';";
            System.out.println("query "+ query);
           
            rs=stm.executeQuery(query);
      
            boolean flag= rs.next();
            //System.out.println("ggg "+flag);

    
            if(flag==true)
            {
           
   
        %>
   <!--<div style="margin-top: 16px;">
       <hr width="1007" align="left">
        </div>
      <div style="margin-left: 800px;">
      <h1>MEDRAPTOR</h1>
      
      </div>
      <div style="border: 0px solid;margin-left: 0px;margin-right: 0px;margin-top: -80px;height: 15px; width:1008px;color: rgb(0, 0, 0); background-color: #D8E1E7; background: -moz-linear-gradient(left, #c8d7dc 0%, #e3eaed 53%,#f2f5f6 100% );"></div>
     
      <font  size ='4'>
        
      
        <div style="margin-left: 770px;margin-top: -15px;">
        <i> Mediterranean Raptor Migration Network </i>
        </div>-->
       <br><br>
       Indirizzo e-mail già presente!
       <br><br>
       
        <a class="mylink" href="login.jsp" style="text-decoration:none;margin-left: 0px;">Login</a>
        <a class="mylink" href="index.jsp" style="text-decoration:none;margin-left: 10px;">Home</a>
       
        <%
            }
           if(flag==false)
           {
           %>    
      
 <!--       <div style="margin-top: 16px;">
       <hr width="1007" align="left">
        </div>
      <div style="margin-left: 800px;">
      <h1>MEDRAPTOR</h1>-->
      
      </div>
      <div style="border: 0px solid;margin-left: 0px;margin-right: 0px;margin-top: -80px;height: 15px; width:1008px;color: rgb(0, 0, 0); background-color: #D8E1E7; background: -moz-linear-gradient(left, #c8d7dc 0%, #e3eaed 53%,#f2f5f6 100% );"></div>
     
      <font  size ='4'>
        
      
        <div style="margin-left: 770px;margin-top: -15px;">
        <i> Mediterranean Raptor Migration Network </i>
        </div>
       <br><br><br><br>
       
       Ti è stata inviata una mail per confermare la registrazione.
       
        <a class="mylink" href="login.jsp" style="text-decoration:none;margin-left: 30px;">Login</a>
        <a class="mylink" href="index.jsp" style="text-decoration:none;margin-left: 30px;">Home</a>
      
      <%
             
             try
             {
                Cognome=new String(request.getParameter("Cognome")); 
             }
             catch(Exception e)
             {
                Cognome=""; 
             }
               try
             {
                Nome=new String(request.getParameter("Nome")); 
             }
             catch(Exception e)
             {
                Nome=""; 
             }
             
                  try
             {
                annoNascita=new String(request.getParameter("BIRTH_YEAR")); 
             }
             catch(Exception e)
             {
                annoNascita=""; 
             }
                  try
             {
                Nazionalita=new String(request.getParameter("Nazionalita")); 
             }
             catch(Exception e)
             {
                Nazionalita=""; 
             }
             
               try
             {
                Indirizzo=new String(request.getParameter("Indirizzo")); 
             }
             catch(Exception e)
             {
                Indirizzo=""; 
             }
                try
             {
                NumCivico=new String(request.getParameter("Numero_civico")); 
             }
             catch(Exception e)
             {
                NumCivico=""; 
             }
               try
             {
                Cap=new String(request.getParameter("Cap")); 
             }
             catch(Exception e)
             {
                Cap=""; 
             }
                try
             {
                Provincia=new String(request.getParameter("Provincia")); 
             }
             catch(Exception e)
             {
                Provincia=""; 
             }
                 try
             {
                Comune=new String(request.getParameter("Comune")); 
             }
             catch(Exception e)
             {
                Comune=""; 
             }
               try
             {
                Telefono=new String(request.getParameter("Telefono")); 
             }
             catch(Exception e)
             {
                Telefono=""; 
             }
               try
             {
                Commento=new String(request.getParameter("Commento")); 
             }
             catch(Exception e)
             {
                Commento=""; 
             }
            
              if(Mail==null || Mail.equals(""))
             {
                Mail="null";
             } 
               
             if(Cognome==null || Cognome.equals(""))
             {
                Cognome="null";
             }
               if(Nome==null || Nome.equals(""))
             {
                Nome="null";
             }
               if(annoNascita==null || annoNascita.equals(""))
             {
                annoNascita="null";
             }
               if(Nazionalita==null || Nazionalita.equals(""))
             {
                Nazionalita="null";
             }
               if(Indirizzo==null || Indirizzo.equals(""))
             {
                Indirizzo="null";
             }
               if(NumCivico==null || NumCivico.equals(""))
             {
                NumCivico="null";
             }
               if(Cap==null || Cap.equals(""))
             {
                Cap="null";
             }
              if(Provincia==null || Provincia.equals(""))
             {
                Provincia="null";
             }
               if(Comune==null || Comune.equals(""))
             {
                Comune="null";
             }
                if(Telefono==null || Telefono.equals(""))
             {
                Telefono="null";
             }
              if(Commento==null || Commento.equals(""))
             {
                Commento="null";
             }
           if(NumCivico!="null")
                    {
                        Indirizzo=Indirizzo+","+NumCivico;
                    }
                    if(Cap!="null")
                    {
                        Indirizzo=Indirizzo+","+Cap;
                    }
                    if(Provincia!="null")
                    {
                        Indirizzo=Indirizzo+","+Provincia;
                    }
                    if(Comune!="null")
                    {
                        Indirizzo=Indirizzo+","+Comune;
                    }       
        //Mettere hash  la parola benvenuto   
                    
      
        int hash=Password.hashCode();
        String link="Benvenuto_"+hash;
        File myFile=new File("C:/Users/Sara/Documents/NetBeansProjects/RaptorMigration/web/"+link+".jsp");
        myFile.createNewFile();
        String Mylink="http://localhost:8076/RaptorMigration/"+link+".jsp";
        
            //Scrive la pagina-link utente
        FileOutputStream Miofile = new FileOutputStream(myFile.getPath());
        PrintStream Output = new PrintStream(Miofile);
        
        Output.print("<!DOCTYPE html PUBLIC \"-//W3C//DTD"
         + " XHTML 1.0 Strict//EN\" \"http://www.w3.org"
         + "/TR/xhtml1/DTD/xhtml1-strict.dtd\">");
        Output.print("<head>");
    
        Output.println("<script type='text/javascript' src='cookies.js'></script>");
        Output.println("<title>Hello page</title>");
    
        
   
   
        Output.println("</head>");
        Output.println("<body>");
    
        Output.println("<script type='text/javascript'>"); 
        Output.println("window.location.href = 'http://localhost:8076/RaptorMigration/InsertUtenteDb.jsp?Mail="+Mail+"&password="+Password+"';");
        
        Output.println("</script>");

        Output.println("<h4>Registrazione avvenuta con successo! </h4><br>"); 
    
        Output.println("</body>");
        Output.close();
        Miofile.close();
        //salva su file i dati utenti su tabella temporanea.
    
    	        
        String hour=(new SimpleDateFormat("HH:mm").format(Calendar.getInstance().getTime()));
        DataCorrente data=new DataCorrente();
        hour=hour+":00";
        data.mese=data.mese+1;
        String mese="";
        if(data.mese<=9)
        {
          mese=String.valueOf(data.mese);
          mese="0"+mese;
        }
        else
        {
            mese=String.valueOf(data.mese);
        }
        String giorno="";
        if(data.giorno<=9)
        {
           giorno=String.valueOf(data.giorno);
           giorno="0"+giorno;
        }
        else
        {
            giorno=String.valueOf(data.giorno);
        }
        
        String mydada=data.anno+"-"+mese+ "-"+giorno;
        
      
     
        try
        {
        String MyQuery="INSERT INTO utenti_temp(Mail,Cognome,Nome,AnnoDiNascita,Indirizzo,Telefono,Commento,Password,Nazionalita,Data,Hour,hash) "
                        + "VALUES('"+Mail+"',"+"'"+Cognome+"',"+"'"+Nome+"',"+"'"+annoNascita+"',"+"'"+Indirizzo+"',"+"'"+Telefono+"',"+"'"+Commento+"',"+"'"+Password+"',"+"'"+Nazionalita+"',"+"'"+mydada+"',"+"'"+hour+"',"+"'"+hash+"');";
         
        System.out.println("query temp "+MyQuery);
        int n=stm.executeUpdate(MyQuery);
        stm.close();
        }
        catch(Exception ex)
        {
            System.out.println("Eccezione db "+ ex.getMessage());
        }
         // Creazione di una mail session
        
        String from = "msara402@gmail.com";
        String to = Mail; 
        String host = "smtp.gmail.com";
       
        
        Properties propsSSL = new Properties();

       
        propsSSL.put("mail.transport.protocol", "smtps");
        propsSSL.put("mail.smtps.host", "smtp.gmail.com");

       // "mail.smtps.auth"
        propsSSL.put("mail.smtps.auth", "true");

        Session sessionSSL = Session.getInstance(propsSSL);
        sessionSSL.setDebug(true);

        javax.mail.Message messageSSL = new MimeMessage(sessionSSL);
        messageSSL.setFrom(new InternetAddress(from, "Raptor Migration"));
        messageSSL.setRecipients(javax.mail.Message.RecipientType.TO, InternetAddress.parse(to)); // real recipient
        messageSSL.setSubject("Registrazione Raptor Migration ");
        messageSSL.setText("Benvenuto/a su Raptor Migration! Clicca sul seguente link per confermare la registrazione \n"+Mylink);

        javax.mail.Transport transportSSL = sessionSSL.getTransport();
        
        transportSSL.connect("smtp.gmail.com", 465, from, "msara402H"); // account used
        transportSSL.sendMessage(messageSSL, messageSSL.getAllRecipients());
        transportSSL.close();
        
    
  }
    
 




 
         %>
  
  
  



  
       
    </body>
</html>
