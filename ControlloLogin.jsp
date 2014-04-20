<%-- 
    Document   : ControlloLogin
    Created on : 6-gen-2014, 15.16.20
    Author     : Sara
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Disattiva la possibilità di andare alla pagina di risposta appena premo tasto invio -->
                <script type="text/javascript">  

 function stopRKey(evt) {
  var evt = (evt) ? evt : ((event) ? event : null);
  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;}
}

document.onkeypress = stopRKey;

</script>
        <script type="text/javascript" src="cookies.js"></script>
        <title>JSP Page</title>
    </head>
    <body> 
        <%
            String Mail="";
            String Password="";
             
            String mylatitudine="";
            String mylongitudine="";
            String mylocalita="";
            Connection conn=null;
            Statement stm=null;
            ResultSet rs=null;
            String ConnectionUrl="jdbc:mysql://localhost:3306/raptor"; 
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn=DriverManager.getConnection(ConnectionUrl);
            stm=conn.createStatement();
            String Logout="Si";
            
            
            try
            {
            HttpSession sessioneUtente = request.getSession();
            boolean flagSession=sessioneUtente.isNew();
            
            if(!sessioneUtente.isNew())
            {
                Mail =(String)sessioneUtente.getAttribute("Mail");
                Password=(String)sessioneUtente.getAttribute("Password");
            }
            if((Mail==null || Mail.equals(""))&&(Password==null || Password.equals("")))
            {
            Mail=request.getParameter("Mail");
            Password=request.getParameter("Password");
            }
            System.out.println("flagSession "+flagSession);
            //se l'utente ha cliccato su un determinato segnaposto, per inserire le sue osservazioni li
            //mylatitudine=request.getParameter("latitudine");
            //mylongitudine=request.getParameter("longitudine");
            
          /*  if((mylatitudine!=null && (!mylatitudine.equals("")) ) && (mylongitudine!=null && (!mylongitudine.equals(""))))
            {
               String query="select localita from raptorMigration where latitudine="+"'"+mylatitudine +"'"+"and longitudine="+"'"+mylongitudine+"';"; 
               rs=stm.executeQuery(query);
               boolean flag= rs.next();
               if(flag==true)
               {
                 mylocalita=rs.getString("localita");
                 
               }
            }*/
            
            }
            catch(Exception e)
            {
            //Mail=request.getParameter("Mail");
            //Password=request.getParameter("Password");
            }
            
            String query="select * from Utenti where Mail="+"'"+Mail +"'"+"and Password="+"'"+Password+"';";
            rs=stm.executeQuery(query);
            String Nome="";
            String id_ut="";
            
            boolean flag= rs.next();
             if(flag==true)
            {
                Nome=rs.getString("Nome");
                id_ut=rs.getString("cod_ut");
                HttpSession sessioneUtente = request.getSession();
                
                sessioneUtente.setAttribute("Mail", Mail);
                sessioneUtente.setAttribute("Password", Password);
                
                
               
                
            
         %>
        
         
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
       
        <h3>
            Benvenuto/a  <%=Nome%> 
         </h3> 
         <script type="text/javascript">
          var  nome=<%=Nome%>;
         </script>
         
          <div style="margin-top: -30px;">
        <a class="mylink" href="index.jsp" style="text-decoration:none;margin-left: 350px;">Home</a> 
        <a class="mylink" href="#" onclick='javascript:try{showDati()}catch(e){alert("non hai inserito alcun dato")}' style="text-decoration:none;margin-left: 12px;">Verifica i tuoi dati</a> 
        <a class="mylink" href="#" onclick='javascript:try{DeleteDati()}catch(e){alert("non hai inserito alcun dato")}' style="text-decoration:none;margin-left: 18px;">Delete</a> 
        <a class="mylink" href="#" onclick='javascript:try{InserisceDati()}catch(e){alert(e)}' style="text-decoration:none;margin-left: 18px;">Inserisci dati</a> 
        <a class="mylink" href="#" onclick='javascript:try{ModificaDati()}catch(e){alert(e)}' style="text-decoration:none;margin-left: 18px;">Modifica dati</a> 
         <a class="mylink" href="index.jsp?Logout=<%=Logout%>" style="text-decoration:none;margin-left: 18px;">Logout</a> 
          </div>
         
       
        
         
     <script type="text/javascript">
     function InserisceDati()
    {
    
 
        //resetto il from
        
        if( document.getElementById("Localita").value != "")
        {
            document.getElementById("Localita").value = "";
        }
        if(document.getElementById("Nazione").value != "")
        {
        document.getElementById("Nazione").value = "";
        }
        if(document.getElementById("Latitudine").value != "")
        {
            document.getElementById("Latitudine").value = "";    
        }
        if(document.getElementById("Longitudine").value != "")
        {
         document.getElementById("Longitudine").value = "";   
        }
        if(document.getElementById("Data_osservazione").value != "")
        {
          document.getElementById("Data_osservazione").value = "";  
        }
        if(document.getElementById("Inizio_ora_osservazione").value != "")
        {
         document.getElementById("Inizio_ora_osservazione").value = "";   
        }
        if(document.getElementById("Fine_ora_osservazione").value != "")
        {
         document.getElementById("Fine_ora_osservazione").value = "";   
        }
        if(document.getElementById("Specie").value != "")
        {
          document.getElementById("Specie").value = "";  
        }
        if(document.getElementById("Numero_individui_osservati").value != "")
        {
          document.getElementById("Numero_individui_osservati").value = "";  
        }
        if(document.getElementById("M").value != "")
        {
         document.getElementById("M").value = "";   
        }
        if(document.getElementById("F").value != "")
        {
          document.getElementById("F").value = "";  
        }
        if(document.getElementById("giovani").value != "")
        {
          document.getElementById("giovani").value = "";  
        }
        if(document.getElementById("Adulti").value != "")
        {
         document.getElementById("Adulti").value = "";   
        }
        if(document.getElementById("Immaturi").value != "")
        {
         document.getElementById("Immaturi").value = "";   
        }
        if(document.getElementById("immagine").value != "")
        {
         document.getElementById("immagine").value = "";   
        }
        if(document.getElementById("testo").value != "")
        {
           document.getElementById("testo").value = ""; 
        }
        try
        {
        if(document.getElementById("mydiv").style.display == "block")
        {
           document.getElementById("mydiv").style.display = "none";
        }
    }
    catch(e)
    {
        
    }
   //setto questi valori se il login proviene da un segnaposto della mappa
  /* try
   {
       
       /*if(mylocalita!=="" && mylocalita!=null)
         {
             document.getElementById("Localita").value = mylocalita;
         }*/
      /*if(mylatitudine!=="" && mylatitudine!=null)
         {
             document.getElementById("Latitudine").value = mylatitudine;
         }
     if(mylongitudine!=="" && mylongitudine!=null)
         {
             document.getElementById("Longitudine").value = mylongitudine;
         }
     }
     catch(e)
     {
     }*/
      document.getElementById("divinsert").style.display = "block";
     
    
    }   
     </script>
         <%
                     
                    Connection myconn=null;
                    Statement mystm=null;
                    ResultSet myrs=null;
                    String Myquery="";
                    boolean myflag=true;
                    int n=0;
                    String record="";
                    String myConnectionUrl="jdbc:mysql://localhost:3306/raptor"; 
                       try
                    {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    myconn=DriverManager.getConnection(myConnectionUrl);
                    mystm=myconn.createStatement();
                    Myquery="select * from raptorMigration where cod_ut="+id_ut;
                    
                    myrs=mystm.executeQuery(Myquery);
                    myflag= myrs.next();
                    //fino a qui
                    System.out.println(myflag+"  "+Myquery);
                   
                    
                   
                    }
                    catch(Exception e)
                    {
                       System.out.println(e.getMessage());
                    }
                    ArrayList<String> RecordUtenti=new ArrayList<String>();
                    String latitudine="";
                    String longitudine="";
                    String località="";
                    String img="";
                    String link="";
                    String value="";
                    String nazione="";
                    String Data_osservazione=""; 
                    String inizio_ora_osservazione="";
                    String fine_ora_osservazione="";
                    String specie="";
                    String numero_individui_osservati="";
                    String numero_maschi=""; 
                    String numero_femmine=""; 
                    String numero_giovani="";
                    String numero_adulti="";
                    String numero_immaturi="";
                    String note_aggiuntive="";
                    String cod_immg="";
                    String cod_link="";
                    String pubblica="";
                    
                            
                    if(myflag==true)
                    {
                         //serve per prendere il primo record, che altrimenti salta
                            latitudine=myrs.getString("latitudine");
                            longitudine=myrs.getString("longitudine");
                            località=myrs.getString("localita");
                            nazione=myrs.getString("nazione");
                            Data_osservazione=myrs.getString("Data_osservazione");
                            inizio_ora_osservazione=myrs.getString("inizio_ora_osservazione");
                            fine_ora_osservazione=myrs.getString("fine_ora_osservazione");
                            specie=myrs.getString("specie");
                            numero_individui_osservati=myrs.getString("numero_individui_osservati");
                            
                            numero_maschi=myrs.getString("numero_maschi");
                            numero_femmine=myrs.getString("numero_femmine");
                            numero_giovani=myrs.getString("numero_giovani");
                            
                            numero_adulti=myrs.getString("numero_adulti");
                            
                            numero_immaturi=myrs.getString("numero_immaturi");
                            note_aggiuntive=myrs.getString("note_aggiuntive");
                            pubblica=myrs.getString("Pubblica");
                           
                            
                            
                            img=myrs.getString("cod_immg");
                            link=myrs.getString("cod_link");
                            value=località+"|"+latitudine+"|"+longitudine+"|"+nazione+"|"+Data_osservazione+"|"+inizio_ora_osservazione+"|"+fine_ora_osservazione+"|"+specie+"|"+numero_individui_osservati+"|"+numero_maschi+"|"+numero_femmine+"|"+numero_giovani+"|"+numero_adulti+"|"+numero_immaturi+"|"+img+"|"+link+"|"+note_aggiuntive+"|"+pubblica+"|"+"flag";
                            RecordUtenti.add(value);
                            value="";
                       while(myrs.next())
                       {
                            latitudine=myrs.getString("latitudine");
                            longitudine=myrs.getString("longitudine");
                            località=myrs.getString("localita");
                            img=myrs.getString("cod_immg");
                            link=myrs.getString("cod_link");
                            nazione=myrs.getString("nazione");
                            Data_osservazione=myrs.getString("Data_osservazione");
                            inizio_ora_osservazione=myrs.getString("inizio_ora_osservazione");
                            fine_ora_osservazione=myrs.getString("fine_ora_osservazione");
                            specie=myrs.getString("specie");
                            numero_individui_osservati=myrs.getString("numero_individui_osservati");
                            
                            numero_maschi=myrs.getString("numero_maschi");
                            numero_femmine=myrs.getString("numero_femmine");
                            numero_giovani=myrs.getString("numero_giovani");
                            
                            numero_adulti=myrs.getString("numero_adulti");
                            
                            numero_immaturi=myrs.getString("numero_immaturi");
                            note_aggiuntive=myrs.getString("note_aggiuntive");
                            pubblica=myrs.getString("Pubblica");
                            
                            
                            
                            value=località+"|"+latitudine+"|"+longitudine+"|"+nazione+"|"+Data_osservazione+"|"+inizio_ora_osservazione+"|"+fine_ora_osservazione+"|"+specie+"|"+numero_individui_osservati+"|"+numero_maschi+"|"+numero_femmine+"|"+numero_giovani+"|"+numero_adulti+"|"+numero_immaturi+"|"+img+"|"+link+"|"+note_aggiuntive+"|"+pubblica+"|"+"flag";
                            RecordUtenti.add(value);
                            value="";
                            
                   }
                  String intestazione="Località|Latitudine|Longitudine|Nazione|Data_osserz.|Inizio_osservz.|Fine_osservaz.|Specie|n_individui|n_maschi|n_femmine|n_giovani|n_adulti|n_immaturi|Immagine|Link|Note|Publica|Flag";
                  String[] MyIntestazione=intestazione.split("\\|");
                  String[] Myrecord={};
                  %>
                  

            
   
                
                  
                  <div id="mydiv"style="display:none;margin-top: 150px;">
                      <table class="imagetable" id="Mytable">
                  <%
                 for (int i=0;i<MyIntestazione.length;i++)
                    {
                      %>
                      
                          
                           <th>
                            <%=MyIntestazione[i] %> 

                           </th>
                           
                      <%
                     
                    }
                 for(String stringa:RecordUtenti)
                 {
                     %>
                     <tr align="center" id="my" style="height:8px;"> 
                     <%
                      for(int h=0;h<MyIntestazione.length;h++)
                      {
                          Myrecord=stringa.split("\\|");
                          String Record="";
                          
                          try
                          {
                              Record=Myrecord[h];
                          }
                          catch(Exception e)
                          {
                              
                          }
                        
                      
                       if(Record.equals("flag"))
                       {
                           %>
                           <td class="myTable2">
                               <input type="checkbox" id="Mychek" /> 
                           </td>
                           <%
                       }
                       else
                       {
                           if(Record.equals("null"))
                           {
                               Record="";
                           }
                         %>
                       
                            <td class="myTable">
                            <%=Record%>  
                            </td>  
                       
                       <% 
                           
                           
                       }
                      }
                      %>
                      </tr>
                      <%
                 }
                 conn.close();
                 myconn.close();
                    } //chiude if myflag       
             
         %>
         </table>
         </div>
         
         <script type="text/javascript">
    
    function showDati()
          {
           var table=document.getElementById('Mytable');
           var checkboxes= new Array();
           checkboxes = document.getElementsByTagName('input');
                     for (var i = 0; i < checkboxes.length; i++)
     {
       
         if (checkboxes[i].type === 'checkbox')
         {
              if ( checkboxes[i].checked)
             {
                checkboxes[i].checked=false; 
             }
            
         }
        }
      
            document.getElementById("divinsert").style.display = "none";
            document.getElementById("divModifica").style.display = "none";
            document.getElementById("mydiv").style.display = "block";
          }
               
     </script>
     
             <script type="text/javascript">
 
  
    var  myData="";
    var cod_ut=<%=id_ut%>
      function DeleteDati()
    {
      var table=document.getElementById('Mytable');
      var checkboxes= new Array();
      checkboxes = document.getElementsByTagName('input');
       
   
        var latitudine="";
        var longitudine="";
        
       
       for (var i = 0; i < checkboxes.length; i++)
     {
       
         if (checkboxes[i].type === 'checkbox')
         {
             if ( checkboxes[i].checked)
             {
               for (var r = 0, n = table.rows.length; r < n; r++) {
               for (var c = 0, m = table.rows[r].cells.length; c < m; c++) {
                   if(r===i)
                   {
                       latitudine=table.rows[r+1].cells[1].innerHTML;
                       longitudine=table.rows[r+1].cells[2].innerHTML;
                       myData+=latitudine.trim()+"|"+longitudine.trim()+";";
                       latitudine="";
                       longitudine="";
                        
                       break;
                   }
                    
            }
        }
                   // indice.push(i);
              }
           
       }
     }
    if(myData==null || myData=="")
    {
        alert("nessun dato selezionato");
    }
    else
    {
    if (confirm('I dati selezionati verranno rimossi dal database')) 
        {
           try
           {
               
          window.location.href = "http://localhost:8076/RaptorMigration/DeleteData.jsp?Mydata="+myData+"&cod_ut="+cod_ut;
          myData="";
           }
           catch(e)
           {
               alert(e);
           }
            
        } 
      else 
        {
        myData="";
           for (var i = 0; i < checkboxes.length; i++)
     {
       
         if (checkboxes[i].type === 'checkbox')
         {
              if ( checkboxes[i].checked)
             {
                checkboxes[i].checked=false; 
             }
            
         }
        }
        } 
    }
    }  
             
     </script>
     
     <script type="text/javascript">
    var  myData="";
    var count=0;
    function ModificaDati()
    {
       
      
        var table=document.getElementById('Mytable');
        var checkboxes= new Array();
        checkboxes = document.getElementsByTagName('input');
       
   
        var latitudine="";
        var longitudine="";
        var località="";
        var img="";
        var link="";
        var nazione="";
        var Data_osservazione="";
        var inizio_ora_osservazione="";
        var fine_ora_osservazione="";
        var specie="";
        var numero_individui_osservati="";
        var numero_maschi="";
        var numero_femmine="";
        var numero_giovani="";
        var numero_adulti="";
        var numero_immaturi="";
        var note_aggiuntive="";
        var cod_immg="";
        var cod_link="";
        var pubblica="";
        
 
 
       for (var i = 0; i < checkboxes.length; i++)
     {
       
         if (checkboxes[i].type === 'checkbox')
         {
             if ( checkboxes[i].checked)
             {
               for (var r = 0, n = table.rows.length; r < n; r++) {
               for (var c = 0, m = table.rows[r].cells.length; c < m; c++) {
                   if(r===i)
                   {
                       località=table.rows[r+1].cells[0].innerHTML;
                       latitudine=table.rows[r+1].cells[1].innerHTML;
                       longitudine=table.rows[r+1].cells[2].innerHTML;
                       nazione=table.rows[r+1].cells[3].innerHTML;
                       Data_osservazione=table.rows[r+1].cells[4].innerHTML;
                       inizio_ora_osservazione=table.rows[r+1].cells[5].innerHTML;
                       fine_ora_osservazione=table.rows[r+1].cells[6].innerHTML;
                       specie=table.rows[r+1].cells[7].innerHTML;
                       numero_individui_osservati=table.rows[r+1].cells[8].innerHTML;
                       numero_maschi=table.rows[r+1].cells[9].innerHTML;
                       numero_femmine=table.rows[r+1].cells[10].innerHTML;
                       numero_giovani=table.rows[r+1].cells[11].innerHTML;
                       numero_adulti=table.rows[r+1].cells[12].innerHTML;
                       numero_immaturi=table.rows[r+1].cells[13].innerHTML;
                       cod_immg=table.rows[r+1].cells[14].innerHTML;
                       cod_link="";
                       
                       note_aggiuntive=table.rows[r+1].cells[16].innerHTML; 
                       pubblica=table.rows[r+1].cells[17].innerHTML;
                       //3                      4                        5                                 6                   7                                         8                        9                      10                         11                      12                         13          14
                       myData+=località.trim()+"|"+latitudine.trim()+"|"+longitudine.trim()+"|"+nazione.trim()+"|"+Data_osservazione.trim()+"|"+inizio_ora_osservazione.trim()+"|"+fine_ora_osservazione.trim()+"|"+specie.trim()+"|"+numero_individui_osservati.trim()+"|"+numero_maschi.trim()+"|"+numero_femmine.trim()+"|"+numero_giovani.trim()+"|"+numero_adulti.trim()+"|"+numero_immaturi.trim()+"|"+cod_immg.trim()+"|"+cod_link+"|"+note_aggiuntive.trim()+"|"+pubblica.trim();
                       latitudine="";
                       longitudine="";
                        
                       break;
                   }
                    
            }
        }
                    count++;
              
              }
           
       }
   }
         for (var i = 0; i < checkboxes.length; i++)
     {
       
         if (checkboxes[i].type === 'checkbox')
         {
              if ( checkboxes[i].checked)
             {
                checkboxes[i].checked=false; 
             }
            
         }
        }
   
    //if(myData==null || myData=="")
    if(count===0)
    {
        alert("nessun dato selezionato");
    }
    //if(myData.length>12)
    if(count>1)
    {
       alert("selezionare un record alla volta"); 
       //alert(myData.length);
    }
    if(count===1)
    {
      
      var record=myData.split("|");
     // alert(record);
      document.getElementById("MyLocalita").value = record[0];
      document.getElementById("MyNazione").value = record[3]; 
      document.getElementById("MyLatitudine").value = record[1];
      document.getElementById("MyLongitudine").value = record[2];   
      document.getElementById("MyData_osservazione").value = record[4];   
      document.getElementById("MyInizio_ora_osservazione").value = record[5];   
      document.getElementById("MyFine_ora_osservazione").value =record[6];
      document.getElementById("MySpecie").value = record[7];  
      document.getElementById("MyNumero_individui_osservati").value = record[8];    
      document.getElementById("MyM").value = record[9];       
      document.getElementById("MyF").value = record[10];       
      document.getElementById("Mygiovani").value = record[11]; 
      document.getElementById("MyAdulti").value = record[12];   
      document.getElementById("MyImmaturi").value = record[13];
      
      document.getElementById("MyImmagine").value = record[14];
     
  
      document.getElementById("Mytesto").value = record[15];
      
      if(record[17]==="Si")
      {
        document.myFormModifica.Mypubblica[0].checked=true;
      }
      else
      {
        document.myFormModifica.Mypubblica[1].checked=true;
      }
      //gli passo la latitudine e longitudine vecchi per cancellare il record dal db
      document.getElementById("Myold_lat").value = record[1];
      document.getElementById("Myold_long").value = record[2];
      document.getElementById("mydiv").style.display = "none";
      
      document.getElementById("divModifica").style.display = "block"; 
  }
      
    
  
    
    myData="";
    count=0;
}
        
   
 
    
         
     </script>
     <%
         }
         else
             {
    %>  
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
       
       Utente non registrato!
    <!--fare link hai dimenticato la password?-->
    
    
    
    <%
             }
    %>
    <div id="divinsert"style="display:none">
        <div style="margin-left: 100px;margin-top: 150px;">
   <font size="3"> Compilare il seguente form, i campi segnati con asterisco sono obbligatori</font>
    </div>
       <img src="img/corniceRegistrazione.gif"style="margin-left:0px;margin-top: -170px;" />
      
      <form onsubmit="return controllaDati(this);"  name="myForm" method="post" enctype="multipart/form-data"   action="Upload">
    <br>
    <div style="border: 0px solid #D8E1E7;margin-left: 198px;margin-top: -1200px;"><font size="3">* Località </font></div> 
    <div style="margin-top: -23px;">
     <input type="text" size="36" id="Localita" name="Localita" style="margin-left:280px;"/>
    </div>
    <br> 
     <div style="border: 0px solid #D8E1E7;margin-left: 210px;margin-top: 0px;"><font size="3">Nazione</font></div> 
    <div style="margin-top: -23px;">
     <input type="text" size="36" id="Nazione" name="Nazione" style="margin-left:280px;"/>
    </div>
    <br> 
      <div style="border: 0px solid #D8E1E7;margin-left: 180px;"><font size="3">* Latitudine </font></div>
      <div style="margin-top: -22px;">
     <input type="text" size="36" id="Latitudine" name="Latitudine" style="margin-left:280px;" />
    </div>
     <br>
      <div style="margin-top: -43px;">
  <a style="border: 0px solid #D8E1E7;margin-left: 258px;" class="button" href="javascript:coordinate();">?</a>
  </div>
    <br>
      <div style="border: 0px solid #D8E1E7;margin-left: 180px;"><font size="3">* Longitudine</font></div>
     <div style="margin-top: -22px;">
     <input type="text" size="36" id="Longitudine" name="Longitudine" style="margin-left:280px;" />
    </div>
   <br>
    <div style="margin-top: -43px;">
  <a style="border: 0px solid #D8E1E7;margin-left: 265px;" class="button" href="javascript:coordinate();">?</a>
  </div>
   <br>
   <div style="border: 0px solid #D8E1E7;margin-left: 98px;"><font size="3">Non conosco le coordinate</font></div>
   
                <div style="border: 0px solid #D8E1E7;margin-left: 40px;margin-top: -22px;">
<a style="border: 0px solid #D8E1E7;margin-left: 250px;" class="button" href="javascript:apriGeocoder();">coordinate</a>
</div>
   <br><br>
   
   
      <div style="border: 0px solid #D8E1E7;margin-left: 150px;margin-top: -20px;"><font size="3">Data osservazione</font></div>
     <div style="margin-top: -22px;">
     <input type="text" size="13" id="Data_osservazione" name="Data_osservazione" onchange="return ControlloData(this);" style="margin-left:280px;" />
    </div>
   <br>
   
    <div style="border: 0px solid #D8E1E7;margin-left: 130px;margin-top: 0px;"><font size="3">Inizio ora osservazione</font></div>
     <div style="margin-top: -22px;">
     <input type="text" size="5" id="Inizio_ora_osservazione" name="Inizio_ora_osservazione" style="margin-left:280px;" />
    </div>
   <br>
   
    <div style="border: 0px solid #D8E1E7;margin-left: 130px;margin-top: 0px;"><font size="3">Fine ora osservazione</font></div>
     <div style="margin-top: -22px;">
     <input type="text" size="5" id="Fine_ora_osservazione" name="Fine_ora_osservazione" style="margin-left:280px;" />
    </div>
   <br>
   
    <div style="border: 0px solid #D8E1E7;margin-left: 220px;margin-top: 0px;"><font size="3">Specie</font></div>
     <div style="margin-top: -22px;">
     <input type="text" size="36" id="Specie" name="Specie" style="margin-left:280px;" />
    </div>
   <br>
   
     <div style="border: 0px solid #D8E1E7;margin-left: 100px;margin-top: 0px;"><font size="3">Numero individui osservati</font></div>
     <div style="margin-top: -22px;">
     <input type="text" size="5" id="Numero_individui_osservati" name="Numero_individui_osservati" style="margin-left:280px;" />
    </div>
   <br>
   
     <div style="border: 0px solid #D8E1E7;margin-left: 220px;margin-top: 0px;"><font size="3">Sesso</font></div>
     <div style="margin-top: -22px;">
    <div style="margin-left: 280px;"><font size="3"> M: 
     <input type="text" size="3" id="M" name="M" style="margin-left:0px;" />
    
      <div style="margin-left: 0px;margin-top: 5px;"> <font size="3"> F: 
     <input type="text" size="3" id="F" name="F" style="margin-left:6px;" />
    </div></div>
   <br>
   
     <div style="border: 0px solid #D8E1E7;margin-left: 240px;margin-top: 0px;"><font size="3">Età</font></div>
     <div style="margin-top: -22px;">
    <div style="margin-left: 280px;"><font size="3"> Giovani: 
     <input type="text" size="3" id="giovani" name="Giovani" style="margin-left:6px;" />
    
      <div style="margin-left: 0px;margin-top: 5px;"><font size="3"> Adulti: 
     <input type="text" size="3" id="Adulti" name="Adulti" style="margin-left:16px;" />
    </div></div>
         
         <div style="margin-left: 280px;margin-top: 5px;"><font size="3"> Immaturi: 
     <input type="text" size="3" id="Immaturi" name="Immaturi" style="margin-left:0px;" />
    </div></div>
   <br>

  <div style="border: 0px solid #D8E1E7;margin-left: 190px;"><font size="3">Immagine</font></div> 
  <div style="margin-top: -20px;">
  <a style="border: 0px solid #D8E1E7;margin-left: 255px;" class="button" href="javascript:aprImmg();">?</a>
  </div>
  <div style="border: 0px solid #D8E1E7;margin-left: 287px;margin-top: -25px;">
      <input type="file" class="button" onchange="checkFileSize(this)" id="immagine" name="immagine"  value="Browse" size="40">
   </div>  
   <br><br>
    
    
        <label style="margin-left: 168px;margin-top: 0px;"> * Pubblica i dati</label>
        <div style="margin-left: 287px;margin-top: -25px;">
        Si <input type="radio" name="pubblica" id="pubblica" value="Si"/>
        No <input type="radio" name="pubblica" id="pubblica" value="No"/>
        </div>
   
   <br>
      <div style="border: 0px solid #D8E1E7;margin-left: 170px;"><font size="3">Note aggiuntive</font></div>
      <div style="margin-top: -22px;">
            <textarea name="testo" id="testo" rows="5" cols="40" style="margin-left:280px; height:120px; width: 255px;">
 
</textarea>

    </div>
  
   <input type="hidden" name="Mail" value="<%=Mail%>" size="40">
   <input type="hidden" name="Password" value="<%=Password%>" size="40">
   <input type="hidden" name="cod_ut" value="<%=id_ut%>" size="40">
   <input type="hidden" name="old_lat" id="old_lat" value="" size="40">
   <input type="hidden" name="old_long" id="old_long" value="" size="40">
   <br>
 
   </div>
     <div style="border: 0px solid #D8E1E7;margin-left: 300px;margin-top: 25px;">
    <input type="submit" class="button" value ="send" style="margin-left: 5px;width:60px">
</div>
   

        
    </div>
         </form>
   
  <!--form di modifica dati--> 
  
  
  
  
  
     <div id="divModifica"style="display:none">
        <div style="margin-left: 100px;margin-top: 150px;">
   <font size="3"> Compilare il seguente form, i campi segnati con asterisco sono obbligatori</font>
    </div>
       <img src="img/corniceLogin.gif"style="margin-left:0px;margin-top: -170px;" />
      
      <form onsubmit="return controllaDati(this);"  name="myFormModifica" method="post" enctype="multipart/form-data"   action="Upload">
    <br>
    <div style="border: 0px solid #D8E1E7;margin-left: 198px;margin-top: -1200px;"><font size="3">* Località </font></div> 
    <div style="margin-top: -23px;">
     <input type="text" size="36" id="MyLocalita" name="Localita" style="margin-left:280px;"/>
    </div>
    <br> 
     <div style="border: 0px solid #D8E1E7;margin-left: 210px;margin-top: 0px;"><font size="3">Nazione</font></div> 
    <div style="margin-top: -23px;">
     <input type="text" size="36" id="MyNazione" name="Nazione" style="margin-left:280px;"/>
    </div>
    <br> 
      <div style="border: 0px solid #D8E1E7;margin-left: 180px;"><font size="3">* Latitudine </font></div>
      <div style="margin-top: -22px;">
     <input type="text" size="36" id="MyLatitudine" name="Latitudine" style="margin-left:280px;" />
    </div>
     <br>
      <div style="margin-top: -37px;">
  <a style="border: 0px solid #D8E1E7;margin-left: 258px;" class="button" href="javascript:coordinate();">?</a>
  </div>
    <br>
      <div style="border: 0px solid #D8E1E7;margin-left: 180px;"><font size="3">* Longitudine</font></div>
     <div style="margin-top: -22px;">
     <input type="text" size="36" id="MyLongitudine" name="Longitudine" style="margin-left:280px;" />
    </div>
   <br>
    <div style="margin-top: -38px;">
  <a style="border: 0px solid #D8E1E7;margin-left: 265px;" class="button" href="javascript:coordinate();">?</a>
  </div>
   <br>
   <div style="border: 0px solid #D8E1E7;margin-left: 98px;"><font size="3">Non conosco le coordinate</font></div>
   
                <div style="border: 0px solid #D8E1E7;margin-left: 40px;margin-top: -22px;">
<a style="border: 0px solid #D8E1E7;margin-left: 250px;" class="button" href="javascript:apriGeocoder();">coordinate</a>
</div>
   <br><br>
   
   
      <div style="border: 0px solid #D8E1E7;margin-left: 150px;margin-top: -20px;"><font size="3">Data osservazione</font></div>
     <div style="margin-top: -22px;">
     <input type="text" size="13" id="MyData_osservazione" name="Data_osservazione" onchange="return ControlloData(this);" style="margin-left:280px;" />
    </div>
   <br>
   
    <div style="border: 0px solid #D8E1E7;margin-left: 130px;margin-top: 0px;"><font size="3">Inizio ora osservazione</font></div>
     <div style="margin-top: -22px;">
     <input type="text" size="5" id="MyInizio_ora_osservazione" name="Inizio_ora_osservazione" style="margin-left:280px;" />
    </div>
   <br>
   
    <div style="border: 0px solid #D8E1E7;margin-left: 130px;margin-top: 0px;"><font size="3">Fine ora osservazione</font></div>
     <div style="margin-top: -22px;">
     <input type="text" size="5" id="MyFine_ora_osservazione" name="Fine_ora_osservazione" style="margin-left:280px;" />
    </div>
   <br>
   
    <div style="border: 0px solid #D8E1E7;margin-left: 220px;margin-top: 0px;"><font size="3">Specie</font></div>
     <div style="margin-top: -22px;">
     <input type="text" size="36" id="MySpecie" name="Specie" style="margin-left:280px;" />
    </div>
   <br>
   
     <div style="border: 0px solid #D8E1E7;margin-left: 100px;margin-top: 0px;"><font size="3">Numero individui osservati</font></div>
     <div style="margin-top: -22px;">
     <input type="text" size="5" id="MyNumero_individui_osservati" name="Numero_individui_osservati" style="margin-left:280px;" />
    </div>
   <br>
   
     <div style="border: 0px solid #D8E1E7;margin-left: 220px;margin-top: 0px;"><font size="3">Sesso</font></div>
     <div style="margin-top: -22px;">
    <div style="margin-left: 280px;"><font size="3"> M: 
     <input type="text" size="3" id="MyM" name="M" style="margin-left:0px;" />
    
      <div style="margin-left: 0px;margin-top: 5px;"> <font size="3"> F: 
     <input type="text" size="3" id="MyF" name="F" style="margin-left:6px;" />
    </div></div>
   <br>
   
     <div style="border: 0px solid #D8E1E7;margin-left: 230px;margin-top: 0px;"><font size="3">Età</font></div>
     <div style="margin-top: -22px;">
    <div style="margin-left: 280px;"><font size="3"> Giovani: 
     <input type="text" size="3" id="Mygiovani" name="Giovani" style="margin-left:6px;" />
    
      <div style="margin-left: 0px;margin-top: 5px;"><font size="3"> Adulti: 
     <input type="text" size="3" id="MyAdulti" name="Adulti" style="margin-left:16px;" />
    </div></div>
         
         <div style="margin-left: 280px;margin-top: 5px;"><font size="3"> Immaturi: 
     <input type="text" size="3" id="MyImmaturi" name="Immaturi" style="margin-left:0px;" />
    </div></div>
   <br>
   
        <div style="border: 0px solid #D8E1E7;margin-left: 200px;margin-top: 0px;"><font size="3">Immagine</font></div>
     <div style="margin-top: -25px;"> 
     <input type="text" size="25" id="MyImmagine" name="MyImmagine" style="margin-left:286px;" />
    </div></div>
   <br>

  <div style="border: 0px solid #D8E1E7;margin-left: 130px;"><font size="3">Modifica Immagine</font></div> 
  <div style="margin-top: -20px;">
  <a style="border: 0px solid #D8E1E7;margin-left: 255px;" class="button" href="javascript:aprImmg();">?</a>
  </div>
  <div style="border: 0px solid #D8E1E7;margin-left: 287px;margin-top: -17px;">
      <input type="file" class="button" onchange="checkFileSize(this)" id="immagine" name="immagine"  value="Browse" size="40">
   </div>  
   <br>
   <br>
    
    
        <label style="margin-left: 168px;margin-top: 0px;"> * Pubblica i dati</label>
        <div style="margin-left: 287px;margin-top: -25px;">
        Si <input type="radio" name="pubblica" id="Mypubblica" value="Si"/>
        No  <input type="radio" name="pubblica" id="Mypubblica" value="No"/>
        </div>
   
   <br>
      <div style="border: 0px solid #D8E1E7;margin-left: 170px;"><font size="3">Note aggiuntive</font></div>
      <div style="margin-top: -22px;">
            <textarea name="testo" id="Mytesto" rows="5" cols="40" style="margin-left:280px; height:120px; width: 255px;">
 
</textarea>
    </div>
  
   <input type="hidden" name="Mail" value="<%=Mail%>" size="40">
   <input type="hidden" name="Password" value="<%=Password%>" size="40">
   <input type="hidden" name="cod_ut" value="<%=id_ut%>" size="40">
   <input type="hidden" name="old_lat" id="Myold_lat" value="" size="40">
   <input type="hidden" name="old_long" id="Myold_long" value="" size="40">
   <br>
 
   
     <div style="border: 0px solid #D8E1E7;margin-left: 300px;margin-top: 25px;">
    <input type="submit" class="button" value ="send" style="margin-left: 5px;width:60px">
</div>

        
    </div>
         </form>
   </div>

    
      <style type="text/css">
       .button {
font-family: Arial;
color: #000000;
font-size: 11px;
font-weight: bold;
background-color: trasparent;
button-color: #D8E1E7;

}
   </style>
   <script type="text/javascript">
       function ControlloData(stringa)
       {
           
           var espressione = /^[0-9]{2}\/[0-9]{2}\/[0-9]{4}$/;
           var patt = new RegExp(espressione);
          
	if (!patt.test(stringa.value))
	{
             alert("il formato della data deve essere:  gg/mm/aaaa"); 
	    return false;
	}else{
		anno = parseInt(stringa.substr(6),10);
		mese = parseInt(stringa.substr(3, 2),10);
		giorno = parseInt(stringa.substr(0, 2),10);
		
		var data=new Date(anno, mese-1, giorno);
		if(data.getFullYear()==anno && data.getMonth()+1==mese && data.getDate()==giorno){
			
                return true;
		}else{
                    alert("Data sbagliata");
			return false;
		}
        
        
	}
        
}
       
   </script>
   
   <script>
   function controllaDati(myForm)
   {
         var localita=myForm.Localita.value;
         var latitudine=myForm.Latitudine.value;
         var longitudine=myForm.Longitudine.value;
         var pubblicaS=myForm.pubblica[0].checked;
         var pubblicaN=myForm.pubblica[1].checked;
         
         if(pubblicaS==false && pubblicaN==false)
         {
             alert("scegliere se si desidera o meno pubblicare i dati");
             return false;
         }
         else if(localita=="" || latitudine=="" || longitudine=="")
         {
              alert("settare i campi contrassegnati con l'asterisco");
              return false;
         }
         else
         {
             return true;
         }
         
         
       
       
 
   }
   </script>
   <script  type="text/javascript">
       function aprImmg()
       {
          var stili = "top=350, left=250, width=320, height=130, status=no, menubar=no, toolbar=no scrollbars=no";
  
  var testo  = window.open("", "", stili);
  testo.document.write("<body bgcolor='#F5F5F5'>");
  
  testo.document.write("<html>");
  testo.document.write(" <head>");
  
  
  testo.document.write("  <title></title>");
  testo.document.write("  <basefont size=1>");
  testo.document.write(" </head>");
  testo.document.write("<body topmargin=20>");
  testo.document.write("<div align=center><p>Inseriere un'immagine relativa al luogo di osservazione \n \n\
o alla specie osservata.");
  testo.document.write("</body>");
  testo.document.write("</html>");
       }
       
       
   </script>
   <script>
       function coordinate()
       {
                 var stili = "top=350, left=250, width=420, height=140, status=no, menubar=no, toolbar=no scrollbars=no";
  
  var testo  = window.open("", "", stili);
  testo.document.write("<body bgcolor='#F5F5F5'>");
  
  testo.document.write("<html>");
  testo.document.write(" <head>");
  
  
  testo.document.write("  <title></title>");
  testo.document.write("  <basefont size=1>");
  testo.document.write(" </head>");
  testo.document.write("<body topmargin=20>");
  testo.document.write("<div align=left><p>Le coordinate devono avere un formato compatibile con Google maps.Esempi\n\
di formati accettabili:<br>"+
"-Gradi, minuti e secondi (DMS): 41° 24' 12.1674\", 2° 10' 26.508<br>"+
"-Gradi decimali (DDD): 41.40338, 2.17403");
  testo.document.write("</body>");
  testo.document.write("</html>");
           
       }
   </script>
 
   
     <!-- <script  type="text/javascript">
       function checkFileSize(inputFile)
       {
           var max=59800;
        if (inputFile.files && inputFile.files[0].size > max) {
        alert("Dimensione dell'immagine oltre il limite.Dimensione massima consentita: 60KB"); // Do your thing to handle the error.
        //inputFile.value = null; // Clear the field.
        return false;
    }
    else
    {
        return true;
    }
       }
       
       
   </script>-->

 

   <script type="text/javascript">
   function apriGeocoder()
   {
       
  var stili = "top=350, left=250, width=620, height=630,dependent=yes, status=0,,resizable=no, menubar=no, toolbar=no, scrollbars=yes";
  
  var testo  = window.open("", "", stili);
  testo.focus();
    
	
 
  testo.document.write("<body bgcolor='#F5F5F5'>");
 

  testo.document.write("<html>");
  testo.document.write(" <head>");
  testo.document.write(" <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>");
  testo.document.write('\x3Cscript type="text/javascript" src="stopKeyEvent.js">\x3C/script>');
  testo.document.write("  <title></title>");
  testo.document.write("  <basefont size=1>");
  testo.document.write('\x3Cscript type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js">\x3C/script>');
  testo.document.write('\x3Cscript type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBLE-jNhimwla9nxxIt00XN_bJUCYkAI4M&sensor=false">\x3C/script>');
  testo.document.write('\x3Cscript type="text/javascript" src="Myfunction.js">\x3C/script>');
  testo.document.write(" </head>");
  testo.document.write("<body topmargin=20>");
  testo.document.write("<div id='map' style='width: 100%; height: 500px'></div>");
  testo.document.write("<fieldset>");
 // testo.document.write("<label for='postcode'>Località</label><input style='margin-left: 30px; id='postcode' /><input type='submit' style='margin-left: 50px; onclick='Geocode()' value='Cerca'' /><br clear='all' />");
  testo.document.write("<br>");
  testo.document.write("<label for='lat'>Latitudine:</label><input id='lat' style='margin-left: 20px;size:30px;'/><br clear='all' />");
  testo.document.write("<br>");
  testo.document.write("<label for='long'>Longitudine:</label><input style='margin-left: 10px;size:30px;' id='long'/><br clear='all' />");
  testo.document.write("<div id='error'></div>");
  //testo.document.write("<a href='addValue' onClick='addValue();return false;'>add</a>");
  testo.document.write("</fieldset>");
  testo.document.write("\x3Cscript type='text/javascript' src='Geocoder.js'>\x3C/script>');");
  //testo.document.write("\x3Cscript type='text/javascript' function addValue(){alert('ciao'); }>\x3C/script>');");
 
  testo.document.write("</body>");
  testo.document.write("</html>");
  
  
      // window.location.href = "http://localhost:8084/RaptorMigration/Geocoder.jsp";
 
   }
   </script>
   


             
 <style type="text/css">
  table.imagetable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
}
table.imagetable th {
	background:  -moz-linear-gradient(top, #f2f5f6 0%, #e3eaed 53%, #c8d7dc 100%);
	border:1px solid;
	border-width:1px;
	padding:8px;
	border-style: solid;
	border-color: #999999;
}
table.imagetable td {
	background:-moz-linear-gradient(top, #ffffff 0%, #f3f3f3 76%, #ededed 93%, #f3f3f3 94%, #ffffff 100%);
        border:1px solid;
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #999999;
} 

</style>

          
          <style type="text/css">

<!--
a.mylink:link     { color: #000000; text-decoration: none; }
a.mylink:visited  { color: #000000; text-decoration: none; }
a.mylinl:hover    { color: #000000; text-decoration: none; }
a.mylink:active   { color: #000000; text-decoration: none; }

-->

 
</style>
          
    </body>
</html>
