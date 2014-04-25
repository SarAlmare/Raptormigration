<%-- 
    Document   : DeleteData
    Created on : 18-gen-2014, 21.21.24
    Author     : Sara
--%>


<%@page import="java.io.File"%>
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
        <%
            String myData="";
            String cod_ut="";
            String Mail="";
            String password="";
            try
            {
             myData=request.getParameter("Mydata");
             cod_ut=request.getParameter("cod_ut");
            }
            catch(Exception e)
            {
                
            }
           
            String MyData=myData.trim();
            System.out.println("MyData "+MyData);
            Connection Conn=null;
            Statement  Stm=null;
            Statement  Stm2=null;
            Statement  Stm3=null;
            ResultSet  Rs=null;
            String connectionUrl="jdbc:mysql://localhost:3306/raptor"; 
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Conn=DriverManager.getConnection(connectionUrl);
            Stm=Conn.createStatement();
            Stm2=Conn.createStatement();
            
            String[] data=MyData.split(";");
            String[] record={};
            String Mylatitudine="";
            String Mylongitudine="";
            String cod_immg="";
            String cod_link="";
                
            for(int i=0;i<data.length;i++)
            {
               
                record=data[i].split("\\|");
                Mylatitudine=record[0];
                Mylongitudine=record[1];
                String QUery="Select cod_immg,cod_link from raptorMigration where latitudine="+Mylatitudine+" and longitudine="+Mylongitudine+" and cod_ut="+cod_ut+";";
                System.out.println("QUery "+QUery);
                try
                {
                    Rs=Stm.executeQuery(QUery);
                    Rs.next();
                    cod_immg=Rs.getString("cod_immg");
                    cod_link=Rs.getString("cod_link");
                }
                catch(Exception e)
                {
                    System.out.println("eeee "+e.getMessage());
                }
             
               
                File myFileImmg=new File("C:/Users/Sara/Documents/NetBeansProjects/RaptorMigration/web/Img_db/"+cod_immg);
                boolean n=true;
                    try
                    {
                    n=myFileImmg.delete();
                    }
                    catch(Exception e)
                    {
                       System.out.println("eccezFile "+e.getMessage()); 
                    }
                 File myFileCont=new File("C:/Users/Sara/Documents/NetBeansProjects/RaptorMigration/web/contenuti/"+cod_link);
                 boolean nC=true;
                    try
                    {
                    nC=myFileCont.delete();
                    }
                    catch(Exception e)
                    {
                       System.out.println("eccezFile "+e.getMessage()); 
                    }   
                
                String qUery="delete from raptorMigration where latitudine="+Mylatitudine+" and longitudine="+Mylongitudine+" and cod_ut="+cod_ut+";";
                System.out.println("qUery "+qUery);
            try
            {
             int m=Stm2.executeUpdate(qUery);
             System.out.println("m "+m);
            }
            catch(Exception e)
            {
             System.out.print("EZZ "+e.getMessage());
            }
            }
           String QueryUser="select Mail,Password from utenti where cod_ut="+cod_ut;
           Rs=Stm2.executeQuery(QueryUser);
           Rs.next();
           Mail=Rs.getString("Mail");
           password=Rs.getString("Password");
           Stm.close();
           Stm2.close();
           Conn.close();
           Rs.close();
            
         %>
     
       <a class="mylink" href="index.jsp" style="text-decoration:none;margin-left: 380px;">Home</a> 
       <a class="mylink" href="ControlloLogin.jsp?Mail=<%=Mail%>&Password=<%=password%>" style="text-decoration:none;margin-left: 180px;">Back</a>
       
    <div style="margin-top: 30px">
        I tuoi dati sono stati cancellati con successo!
    </div>
    
    </body>
</html>
