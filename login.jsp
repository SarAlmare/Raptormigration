<%-- 
    Document   : login
    Created on : 24-nov-2013, 11.18.19
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
        <div style="margin-top: 20px;">
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
       
        <h1>Login</h1>
        
       <%
            //controllo sessione
           HttpSession sessioneUtente = request.getSession();
          
           String Mail=(String)sessioneUtente.getAttribute("Mail");
           String Password=(String)sessioneUtente.getAttribute("Password");
           if((Mail!=null && !Mail.equals("")) && (Password!=null && !Password.equals("")) && !sessioneUtente.isNew())
           {
              response.sendRedirect("ControlloLogin.jsp"); 
           }
           
           else
           {
        %>
        <form name="myLogin" method="post"   action="ControlloLogin.jsp">
             <div style="border: 0px solid #D8E1E7;margin-left: 10px;"><font size="3">Indirizzo Mail  </font></div>
               <div style="margin-top: -22px;">
            <input type="text" size="50" id="Mail" name="Mail" style="margin-left:100px;" />
            </div>
             <div style="border: 0px solid #D8E1E7;margin-left: 8px;margin-top: 20px;"><font size="3">Password  </font></div>
               <div style="margin-top: -20px;">
                <input type="password" size="50" id="Password" name="Password" style="margin-left:100px;" />
               </div>
                      <div style="border: 0px solid #D8E1E7;margin-left: -10px;margin-top: 30px;">
<input type="submit" value ="invia" style="background-color: #D8E1E7; margin-left: 20px;width:50px">
</div>
        
           <!-- <input type="hidden" name="localita" value="" size="40">-->
             </form>
             <!--link-->
              <div style="margin-top: 70px;margin-left: 0px;">
        <a class="mylink" href="index.jsp" style="text-decoration:none;margin-left: 10px;">Home</a> 
         <a class="mylink" href="#" onclick="showRecuperoPsw()" style="text-decoration:none;margin-left: 50px;">Non ricordo la password</a> 
         </div>
             
             
<%
           }
%>           
             
      <div id="recuperPassword" style="display: none; margin-top:120px">
          Inserire l'indirizzo mail usato durante la procedura di registrazione:
          <br>
          <div style="margin-top: 40px">
          <form name="recuperopassw" method="post" action="RecuperoPassword.jsp">
              <div style="border: 0px solid #D8E1E7;margin-left: 10px;"><font size="3">Mail:  </font></div>
               <div style="margin-top:-22px">
            <input type="text" size="50" id="Mail" name="Mail" style="margin-left:80px;" />
            </div>
                           
                      <div style="border: 0px solid #D8E1E7;margin-left: -10px;margin-top: 30px;">
<input type="submit" value ="invia" style="background-color: #D8E1E7; margin-left: 20px;width:50px">
</div>
        
           </form>
                </div>
              </div>
      </div>
           <script type="text/javascript">
               function showRecuperoPsw()
               {
                   document.getElementById("recuperPassword").style.display = "block";
               }
           </script>
           
               

    </body>
</html>
