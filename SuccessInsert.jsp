<%-- 
    Document   : SuccessInsert
    Created on : 2-feb-2014, 23.16.13
    Author     : Sara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div style="margin-top: 10px;">
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
            String Mail=request.getParameter("Mail");
            String Password=request.getParameter("Password");
       %>
       <div style="margin-top: 50px;">
           Registrazione dati avvenuta con successo!
           </div>
       <div style="margin-top: 70px;">
           
        <a class="mylink" href="index.jsp" style="text-decoration:none;margin-left: 10px;">Home</a> 
        <a class="mylink" href="ControlloLogin.jsp?Mail=<%=Mail%>&Password=<%=Password %>"  style="text-decoration:none;margin-left: 20px;">Back</a>
    </div>
       </body>
</html>
