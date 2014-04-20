<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
   
	<link href="style_mobile.css" rel="stylesheet" type="text/css" media="only screen and (min-width: 0px) and (max-width: 320px)" >
	<link href="style_tablet.css" rel="stylesheet" type="text/css" media="only screen and (min-width: 321px) and (max-width: 768px)" >
	<!--<link href="style_desktop.css" rel="stylesheet" type="text/css" media="only screen and (min-width: 769px)" >-->
    <link rel="stylesheet" type="text/css" href="stile.css"/> 
    <style type="text/css">
      html { height: 100% }
      body { height: 100%; margin: 0; padding: 0 }
      #map-canvas { with: 93%;height: 67%; margin-left: 29%; margin-top: 4%; margin-bottom: 3%;margin-right: 5%}
    
    </style>


    <script type="text/javascript"
  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCEgsar4mU5azZ0yZzqdefhDs4D0WwfJY8&sensor=false">
    </script>
    
    <script type="text/javascript">

    var posizione=new Array(); 
    
    var value=new Array();   
    var latitudine="";
    var longitudine="";
    var localita="";
    var num="";
    var img="";
    var contentString="";
    var myImg="";
    var locations="";
    var infowindow = "";
    var marker, i;
    var mapOptions ="";
    var map="";
    var j=0;
    var link="";
    var mylink="";
    var cod_ut="";
    var icon="";
    var flag="";
    
      function initialize() {
       
      <%
    Connection conn=null;
    Statement stm=null;
    ResultSet rs=null;
    ArrayList<String> myValue=new ArrayList<String>();
    

    
    try
    {
          //distrugge la sessione se l'utente ha effettuato il logout
    
     String Logout=request.getParameter("Logout");
    
   
      if(Logout!=null && Logout.equals("Si"))
      {
          
          HttpSession sessioneUtente = request.getSession();
          
         
          System.out.println("dopo request.getsession");
          try
          {
          sessioneUtente.removeAttribute("Mail");
          sessioneUtente.removeAttribute("Password");
          sessioneUtente.invalidate();
          
          }
          catch(Exception e)
          {
              System.out.println("Sessione eccez "+e.getMessage());
          }
          
      }
       String ConnectionUrl="jdbc:mysql://localhost:3306/raptor"; 
       Class.forName("com.mysql.jdbc.Driver").newInstance();
       conn=DriverManager.getConnection(ConnectionUrl);
       stm=conn.createStatement();
       String query="select * from raptorMigration where Pubblica='Si'";
       rs=stm.executeQuery(query);
       String value="";
       String latitudine="";
       String longitudine="";
       String località="";
       String img="";
       String link="";
       String id_ut="";
       String flag="";
       while(rs.next())
       {
           latitudine=rs.getString("latitudine");
           longitudine=rs.getString("longitudine");
           località=rs.getString("localita");
           img=rs.getString("cod_immg");
           link=rs.getString("cod_link");
           id_ut=rs.getString("cod_ut");
           //flag=rs.getString("Pubblica");
           value=latitudine+"|"+longitudine+"|"+località+"|"+img+"|"+link+"|"+id_ut;
           myValue.add(value);
           
       }
       
        
    }
    catch(Exception ex)
    {
        System.out.print("ECCEZIONE :"+ex.getMessage());
        ex.printStackTrace();
    }
conn.close();
int i=0;    
for(String string:myValue)
{
%>
   posizione[<%= i%>]="<%=string %>";

 <%
 i++;
}

 %>
    
mapOptions = {
        
center: new google.maps.LatLng(37.439974,25.883789),
zoom: 4,
 mapTypeId: google.maps.MapTypeId.ROADMAP
};
map = new google.maps.Map(document.getElementById("map-canvas"),
            mapOptions);
            
num=posizione.length;     
   
   
for(j=0;j<num;j++ )
{
  
    value=posizione[j].split("|");
    latitudine=value[0];
    longitudine=value[1];
    localita=value[2];
    myImg=value[3];
    mylink=value[4];
    cod_ut=value[5];
    
    //alert(flag);
   /* if(flag==='No')
    {
        icon="img/NessunUtente.gif";
       
    }*/
    if(myImg.length==4)
    {
        img='';
    }
    else
    {
        img='<img src = "Img_db/'+myImg+'" />';
     }
    if(mylink.length==4)
    {
        link=mylink;
    }
    else
    {
        link='<a href= "contenuti/'+mylink+'"> informazioni </a>';
    }

    
    if(cod_ut==12)
    {
        icon="img/utente1.gif";
    }
    else                                                            
    {
        icon="img/utenteGenerico.gif";
    }
     
marker = new google.maps.Marker({
position: new google.maps.LatLng(latitudine,longitudine),
map: map,
icon: icon
});
 
 
var infowindow = new google.maps.InfoWindow(); 
    
     
google.maps.event.addListener(marker, 'click', (function(marker, i,img,link) {
return function() {
    if(link.length==4)
          {
                infowindow.setContent(img+'<br>'+'<a href= "login.jsp"> inserisci le tue osservazioni</a>');
          }
          else
          {
                infowindow.setContent(img + '<br>' +link+'<br>'+'<a href= "login.jsp"> inserisci le tue osservazioni</a>');
          }
           infowindow.open(map, marker);
        }
      })(marker, i,img,link));
  
       
      
      
   latitudine="";
   longitudine="";
   img="";
   link="";
   cot_ut="";
   flag="";
}
            
      } //chiude function inizialize
      
   
      google.maps.event.addDomListener(window, 'load', initialize);
          
    </script>
  </head>
 
  <body id="wrap" background="img/sfondo.gif" >

   
       
         <div style="margin-top: 900px;margin-left: 150px" id="wrap2">
             <font size="4">
        <a class="mylink" href="Chisiamo.html" style="text-decoration:none;margin-left: 12px;">Chi siamo</a> 
        <a class="mylink" href="projects2007.html" style="text-decoration:none;margin-left: 12px;">Progetti</a> 
        
       <!-- <a class="mylink" href="#" onclick="ShowRotte()" style="text-decoration:none;margin-left: 20px;">Rotte</a> -->
     
        <a class="mylink" href="pubblicazioni.html" style="text-decoration:none;margin-left: 17px;">Pubblicazioni</a> 
        <a class="mylink" href="thesis.html" style="text-decoration:none;margin-left: 10px;">Tesi</a>
        <a class="mylink" href="http://fotoalbum.raptormigration.org/" style="text-decoration:none;margin-left: 10px;">Photo gallery</a>
        <a class="mylink" href="links.html" style="text-decoration:none;margin-left: 10px;">Links</a>
        <a class="mylink" href="mailto:medraptors@raptormigration.org" style="text-decoration:none;margin-left: 10px;">Contatti</a>
        <a class="mylink" href="Registrati.jsp" style="text-decoration:none;margin-left: 10px;">Registrati</a>
        <a class="mylink" href="login.jsp" style="text-decoration:none;margin-left: 10px;">Login</a>
        </font>
           </div>
<div style="margin-top: -15px;">
       <hr width="150" align="left">
        </div>
      
      <div style="margin-top: -10px;">
       <hr width="5%" align="right">
        </div>
          
          
       <div id="map-canvas" id="map" style="margin-top: -600px;margin-left:150px" />
        
  
           
       
          
          <style type="text/css">

<!--
a.mylink:link     { color: #000000; text-decoration: none; }
a.mylink:visited  { color: #000000; text-decoration: none; }
a.mylinl:hover    { color: #000000; text-decoration: none; }
a.mylink:active   { color: #000000; text-decoration: none; }



-->

 
</style>
     <script type="text/javascript">
     function ShowRotte()
    {
        document.getElementById("rotte").style.display = "block";
       
    }   
     </script>

  </body>
</html>