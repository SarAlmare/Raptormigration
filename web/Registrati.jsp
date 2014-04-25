<%-- 
    Document   : Registrati.jsp
    Created on : 27-nov-2013, 9.13.41
    Author     : Sara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <!-- Stoppa la possibilità di andare alla pagina di risposta appena premo tasto invio -->
        <script type="text/javascript">  

function stopRKey(evt) {
  var evt = (evt) ? evt : ((event) ? event : null);
  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;}
}

document.onkeypress = stopRKey;

</script> 
        <title>JSP Page</title>
    </head>
    <body background="" style="margin-top: -80px;">
        <!--img/sfondoRegistrazione.gif-->
     <div style="margin-top: 100px;">
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
       
     <div style="margin-left: 100px;margin-top: 60px;">
   <font size="3"> Compilare il seguente form, i campi segnati con asterisco sono obbligatori</font>
    </div>
       <img src="img/corniceLogin.gif"style="margin-left:0px;margin-top: -100px;" />
      
      <form onsubmit="return controllaDati(this);" name="myForm" method="post"   action="ControlloDatiUtente.jsp">
    <br>
    <div style="border: 0px solid #D8E1E7;margin-left: 180px;margin-top: -1200px;"><font size="3">* Cognome </font></div> 
    <div style="margin-top: -23px;">
     <input type="text" size="39" name="Cognome" style="margin-left:280px;"/>
    </div>
    <br> 
     
      <div style="border: 0px solid #D8E1E7;margin-left: 180px;"><font size="3">* Nome  </font></div>
      <div style="margin-top: -22px;">
     <input type="text" size="39" id="Nome" name="Nome" style="margin-left:280px;" />
    </div>
     <br>
     
     <div style="border: 0px solid #D8E1E7;margin-left: 150px;"><font size="3">* Anno di nascita</font></div>
     
     
   <div style="margin-top:-20px;">
       <div style="width:220px;height:20px; margin-left: 280px;">
           <select name="BIRTH_YEAR" id="BIRTH_YEAR" >
               <font size="3">
       <option value="0">-</option>
       <option value="2006">2006</option><option value="2005">2005</option><option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option><option value="2001">2001</option><option value="2000">2000</option><option value="1999">1999</option><option value="1998">1998</option><option value="1997">1997</option><option value="1996">1996</option><option value="1995">1995</option><option value="1994">1994</option><option value="1993">1993</option><option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option><option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option><option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option><option value="1983">1983</option><option value="1982">1982</option><option value="1981">1981</option><option value="1980">1980</option><option value="1979">1979</option><option value="1978">1978</option><option value="1977">1977</option><option value="1976">1976</option><option value="1975">1975</option><option value="1974">1974</option><option value="1973">1973</option><option value="1972">1972</option><option value="1971">1971</option><option value="1970">1970</option><option value="1969">1969</option><option value="1968">1968</option><option value="1967">1967</option><option value="1966">1966</option><option value="1965">1965</option><option value="1964">1964</option><option value="1963">1963</option><option value="1962">1962</option><option value="1961">1961</option><option value="1960">1960</option><option value="1959">1959</option><option value="1958">1958</option><option value="1957">1957</option><option value="1956">1956</option><option value="1955">1955</option><option value="1954">1954</option><option value="1953">1953</option><option value="1952">1952</option><option value="1951">1951</option><option value="1950">1950</option><option value="1949">1949</option><option value="1948">1948</option><option value="1947">1947</option><option value="1946">1946</option><option value="1945">1945</option><option value="1944">1944</option><option value="1943">1943</option><option value="1942">1942</option><option value="1941">1941</option><option value="1940">1940</option><option value="1939">1939</option><option value="1938">1938</option><option value="1937">1937</option><option value="1936">1936</option><option value="1935">1935</option><option value="1934">1934</option><option value="1933">1933</option><option value="1932">1932</option><option value="1931">1931</option><option value="1930">1930</option><option value="1929">1929</option><option value="1928">1928</option><option value="1927">1927</option><option value="1926">1926</option><option value="1925">1925</option><option value="1924">1924</option><option value="1923">1923</option><option value="1922">1922</option><option value="1921">1921</option><option value="1920">1920</option><option value="1919">1919</option><option value="1918">1918</option><option value="1917">1917</option><option value="1916">1916</option><option value="1915">1915</option><option value="1914">1914</option><option value="1913">1913</option>                </select>
           </font>
       </div></div>
   <br>
   
   <div style="border: 0px solid #D8E1E7;margin-left: 170px;"><font size="3">* Nazionalità</font></div>
     <div style="margin-top:-20px;">
       <div style="width:150px;height:20px; margin-left: 280px;">
           <select name="Nazionalita" id="Nazionalita" >
       <option value="0">-</option>
       <option value="Afghanistan">Afghanistan</option>
<option value="Albania">Albania</option>
<option value="Algeria">Algeria</option>
<option value="Algeria">Andorra</option>
<option value="Angola">Angola</option>
<option value="Anguilla">Anguilla</option>
<option value="Antartide">Antartide</option>
<option value="Antigua e Barbuda">Antigua e Barbuda</option>
<option value="Arabia Saudita">Arabia Saudita</option>
<option value="Argentina">Argentina</option>
<option value="Armenia">Armenia</option>
<option value="Aruba">Aruba</option>
<option value="Australia">Australia</option>
<option value="Austria">Austria</option>
<option value="Azerbaigian">Azerbaigian</option>
<option value="Azerbaigian">Bahamas</option>
<option value="Bahrein">Bahrein</option>
<option value="Bangladesh">Bangladesh</option>
<option value="Belgio">Belgio</option>
<option value="Benin">Benin</option>
<option value="Bermuda">Bermuda</option>
<option value="Bhutan">Bhutan</option>
<option value="Bielorussia">Bielorussia</option>
<option value="Bolivia">Bolivia</option>
<option value="Bosnia-Erzegovina">Bosnia-Erzegovina</option>
<option value="Botswana">Botswana</option>
<option value="Brasile">Brasile</option>
<option value="Brunei">Brunei</option>
<option value="Bulgaria">Bulgaria</option>
<option value="Burkina Faso">Burkina Faso</option>
<option value="Burundi">Burundi</option>
<option value="Cambogia">Cambogia</option>
<option value="Camerun">Camerun</option>
<option value="Canada">Canada</option>
<option value="Capo Verde">Capo Verde</option>
<option value="Ciad">Ciad</option>
<option value="Cile">Cile</option>
<option value="Cina">Cina</option>
<option value="Cipro">Cipro</option>
<option value="Città del Vaticano">Città del Vaticano</option>
<option value="Colombia">Colombia</option>
<option value="Comore">Comore</option>
<option value="Congo">Congo</option>
<option value="Corea del Nord">Corea del Nord</option>
<option value="Corea del Sud">Corea del Sud</option>
<option value="Costa Rica">Costa Rica</option>
<option value="Costa d'Avorio">Costa d'Avorio</option>
<option value="Cuba">Cuba</option>
<option value="Danimarca">Danimarca</option>
<option value="Ecuador">Ecuador</option>
<option value="Egitto">Egitto</option>
<option value="El Salvador">El Salvador</option>
<option value="Emirati arabi uniti">Emirati arabi uniti</option>
<option value="Estonia">Estonia</option>
<option value="Etiopia">Etiopia</option>
<option value="Faerøerne">Faerøerne</option>
<option value="Filippine">Filippine</option>
<option value="Finlandia">Finlandia</option>
<option value="Francia">Francia</option>
<option value="Gabon">Gabon</option>
<option value="Gambia">Gambia</option>
<option value="Georgia">Georgia</option>
<option value="Germania">Germania</option>
<option value="Ghana">Ghana</option>
<option value="Giamaica">Giamaica</option>
<option value="Giappone">Giappone</option>
<option value="Gibilterra">Gibilterra</option>
<option value="Gibuti">Gibuti</option>
<option value="Giordania">Giordania</option>
<option value="Grecia">Grecia</option>
<option value="Groenlandia">Groenlandia</option>
<option value="Guadalupa">Guadalupa</option>
<option value="Guam">Guam</option>
<option value="Guatemala">Guatemala</option>
<option value="Guiana francese">Guiana francese</option>
<option value="Guinea">Guinea</option>
<option value="Guinea Bissau">Guinea Bissau</option>
<option value="Guinea Equatoriale">Guinea Equatoriale</option>
<option value="Guyana">Guyana</option>
<option value="Haiti">Haiti</option>
<option value="Honduras">Honduras</option>
<option value="Hong Kong">Hong Kong</option>
<option value="India">India</option>
<option value="Indonesia">Indonesia</option>
<option value="Iran">Iran</option>
<option value="Iraq">Iraq</option>
<option value="Irlanda">Irlanda</option>
<option value="Islanda">Islanda</option>
<option value="Isole Marshall">Isole Marshall</option>
<option value="Isole Pitcairn">Isole Pitcairn</option>
<option value="Isole Salomone">Isole Salomone</option>
<option value="Israele">Israele</option>
<option value="Italia">Italia</option>
<option value="Kazakstan">Kazakstan</option>
<option value="Kenya">Kenya</option>
<option value="Kuwait">Kuwait</option>
<option value="Laos">Laos</option>
<option value="Lesotho">Lesotho</option>
<option value="Lettonia">Lettonia</option>
<option value="Libano">Libano</option>
<option value="Liberia">Liberia</option>
<option value="Libia">Libia</option>
<option value="Liechtenstein">Liechtenstein</option>
<option value="Lituania">Lituania</option>
<option value="Lussemburgo">Lussemburgo</option>
<option value="Macao">Macao</option>
<option value="Madagascar">Madagascar</option>
<option value="Malawi">Malawi</option>
<option value="Malesia">Malesia</option>
<option value="Mali">Mali</option>
<option value="Malta">Malta</option>
<option value="Marocco">Marocco</option>
<option value="Martinica">Martinica</option>
<option value="Mauritania">Mauritania</option>
<option value="Mauritius">Mauritius</option>
<option value="Messico">Messico</option>
<option value="Micronesia">Micronesia</option>
<option value="Moldavia">Moldavia</option>
<option value="Monaco">Monaco</option>
<option value="Mongolia">Mongolia</option>
<option value="Monserrat">Monserrat</option>
<option value="Mozambico">Mozambico</option>
<option value="Namibia">Namibia</option>
<option value="Nauru">Nauru</option>
<option value="Nepal">Nepal</option>
<option value="Nicaragua">Nicaragua</option>
<option value="Niger">Niger</option>
<option value="Nigeria">Nigeria</option>
<option value="Niue">Niue</option>
<option value="Norvegia">Norvegia</option>
<option value="Nuova Caledonia">Nuova Caledonia</option>
<option value="Nuova Zelanda">Nuova Zelanda</option>
<option value="Oman">Oman</option>
<option value="Palestina">Palestina</option>
<option value="Paesi Bassi">Paesi Bassi</option>
<option value="Pakistan">Pakistan</option>
<option value="Panama">Panama</option>
<option value="Papua Nuova Guinea">Papua Nuova Guinea</option>
<option value="Paraguay">Paraguay</option>
<option value="Perù">Perù</option>
<option value="57">Polinesia francese</option>
<option value="136">Polonia</option>
<option value="137">Portogallo</option>
<option value="138">Portorico</option>
<option value="139">Qatar</option>
<option value="177">Regno Unito; Gran Bretagna</option>
<option value="34">Repubblica Centrafricana</option>
<option value="44">Repubblica ceca</option>
<option value="9">Repubblica di San Marino</option>
<option value="47">Repubblica dominicana</option>
<option value="140">Riunione</option>
<option value="142">Ruanda</option>
<option value="141">Russia</option>
<option value="185">Sahara occidentale</option>
<option value="193">Samoa americane</option>
<option value="156">Sant'Elena</option>
<option value="146">Seicelle</option>
<option value="145">Senegal</option>
<option value="147">Sierra Leone</option>
<option value="148">Singapore</option>
<option value="162">Siria</option>
<option value="149">Slovacchia</option>
<option value="150">Slovenia</option>
<option value="152">Somalia</option>
<option value="154">Spagna</option>
<option value="155">Sri Lanka</option>
<option value="178">Stati Uniti</option>
<option value="153">Sudafrica</option>
<option value="157">Sudan</option>
<option value="158">Suriname</option>
<option value="159">Svalbard e Jan Mayen</option>
<option value="161">Svezia</option>
<option value="2">Svizzera</option>
<option value="160">Swaziland</option>
<option value="164">Tagikistan</option>
<option value="163">Taiwan</option>
<option value="165">Tanzania</option>
<option value="166">Thailandia</option>
<option value="167">Togo</option>
<option value="168">Tokelau</option>
<option value="169">Trinidad e Tobago</option>
<option value="170">Tunisia</option>
<option value="171">Turchia</option>
<option value="172">Turkmenistan</option>
<option value="173">Tuvalu</option>
<option value="175">Ucraina</option>
<option value="174">Uganda</option>
<option value="74">Ungheria</option>
<option value="179">Uruguay</option>
<option value="180">Uzbekistan</option>
<option value="181">Vanuatu</option>
<option value="183">Venezuela</option>
<option value="184">Vietnam</option>
<option value="186">Yemen</option>
<option value="187">Zambia</option>
<option value="188">Zimbabwe </option>
</select>
    </div></div>
   <br>
   
   <div style="border: 0px solid #D8E1E7;margin-left: 180px;"><font size="3">Indirizzo</font></div>
     <div style="margin-top: -22px;">
     <input type="text" size="39" id="Indirizzo" name="Indirizzo" style="margin-left:280px;" />
    </div>
   <br>
   
   <div style="border: 0px solid #D8E1E7;margin-left: 170px;"><font size="3">Numero civico</font></div>
    <div style="margin-top: -22px;">
     <input type="text" size="5" id="Numero_civico" name="Numero_civico" style="margin-left:280px;" />
    </div>
   <br>
   <div style="border: 0px solid #D8E1E7;margin-left: 180px;"><font size="3">Cap</font></div>
    <div style="margin-top: -22px;">
     <input type="text" size="5" id="Cap" name="Cap" style="margin-left:280px;" />
    </div>
   <br>
   <div style="border: 0px solid #D8E1E7;margin-left: 180px;"><font size="3">Provincia</font></div>
    <div style="margin-top: -22px;">
     <input type="text" size="39" id="Provincia" name="Provincia" style="margin-left:280px;" />
    </div>
   <br>
   <div style="border: 0px solid #D8E1E7;margin-left: 180px;"><font size="3">Comune</font></div>
    <div style="margin-top: -22px;">
     <input type="text" size="39" id="Comune" name="Comune" style="margin-left:280px;" />
    </div>
   <br>
  
   
     
      <div style="border: 0px solid #D8E1E7;margin-left: 160px;"><font size="3">* Indirizzo mail </font> </div>
      <div style="margin-top: -22px;">
     <input type="text" size="39" onchange="return ControllMail()" id="Indirizzo_mail" name="Indirizzo_mail" style="margin-left:280px;" />
    </div>
     <br>
     
      <div style="border: 0px solid #D8E1E7;margin-left: 160px;"><font size="3">* Conferma mail </font> </div>
      <div style="margin-top: -22px;">
     <input type="text" size="39" id="Conferma_mail" name="Conferma_mail" style="margin-left:280px;" />
    </div>
     <br>
     
     
    <!--  <div style="border: 0px solid #D8E1E7;margin-left: 180px;"><font size="3">* Username </font> </div>
      <div style="margin-top: -22px;">
     <input type="text" size="39" id="Username" name="Username" style="margin-left:280px;" />
    </div>
     <br>-->
     
      <div style="border: 0px solid #D8E1E7;margin-left: 180px;"><font size="3">* Password </font> </div>
      <div style="margin-top: -22px;">
     <input type="password" size="39" id="Password" name="Password" style="margin-left:280px;" />
    </div>
     <br>
     
      <div style="border: 0px solid #D8E1E7;margin-left: 130px;"><font size="3">* Conferma Password </font> </div>
      <div style="margin-top: -22px;">
     <input type="password" size="39"onChange="controlla()"id="Conferma_Password" name="Conferma_Password" style="margin-left:280px;" />
    </div>
     <br>
     
     <div style="border: 0px solid #D8E1E7;margin-left: 180px;"><font size="3">Telefono </font> </div>
      <div style="margin-top: -22px;">
     <input type="text" size="39" id="Telefono" name="Telefono" style="margin-left:280px;" />
    </div>
     <br>
     
       <div style="border: 0px solid #D8E1E7;margin-left: 96px;"><font size="3">Commento di presentazione  </font></div>
      <div style="margin-top: -22px;">
          <textarea name="testo" rows="5" cols="40" style="margin-left:280px; height:120px; width: 255px;">
 
</textarea>
    <!-- <input size="50" id="Commento" name="Commento" style="margin-left:280px; height:120px;" />-->
    </div>
     <br><br>
<br>     
      <div style="margin-left: 110px;">
   <font size="3"> L’iscrizione ad RaptorMigration.it è libera e gratuita.  I dati possono essere </font>
    </div>
         <div style="margin-left: 110px;">
   <font size="3"> caricati solo a seguito dell’iscrizione. Non c’è limite alla quantità di dati che</font>
    </div>
          <div style="margin-left: 110px;">
   <font size="3"> potranno essere trasmessi dai singoli iscritti. La responsabilità circa</font>
    </div>
             <div style="margin-left: 110px;">
   <font size="3"> l'attendibilità dei dati caricati è esclusivamente a carico dei singoli iscritti.</font>
    </div>
     
    
 <br>
          <div style="border: 0px solid #D8E1E7;margin-left: 220px;margin-top: 0px;">
<input type="submit" value ="invia" style="background-color: #D8E1E7; margin-left: 20px;width:50px">
</div>
     
              <!-- <div style="border: 0px solid #D8E1E7;margin-left: 280px;margin-top: -22px;">
<input type="submit" onclick="href=index.jsp" value ="annulla" style="background-color: #D8E1E7; margin-left: 20px;width:60px">
</div>-->

       </form> 

       
       <script type="text/javascript">
           function controlla()
           {
           var password=myForm.Password.value;
           var password2=myForm.Conferma_Password.value;
           if(password!=password2)
           {
               alert("Il valore della password non coincide");   //fare popup carina con jquery
           }
            }
       </script>
       
           </form> 

       <script type="text/javascript">
           function ControllMail()
           {
               EmailAddr = document.myForm.Indirizzo_mail.value;
               Filtro = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-]{2,})+\.)+([a-zA-Z0-9]{2,})+$/;
               if (Filtro.test(EmailAddr))
               return true;
               else
                {
                    alert("Indirizzo Email non valido. Controllalo, per favore.");
                    document.myForm.Indirizzo_mail.focus();
                    return false;
            }
           }
           
       </script>
       <script type="text/javascript">
           function controllaDati(myForm)
           {
          var Cognome=document.myForm.Cognome.value;
          var Nome=document.myForm.Nome.value;
          

          var AnnoDiNascita=document.myForm.BIRTH_YEAR.options[document.myForm.BIRTH_YEAR.selectedIndex].value;
         
          var Nazionalita=document.myForm.Nazionalita.options[document.myForm.Nazionalita.selectedIndex].value;
          var Indirizzo_mail=document.myForm.Indirizzo_mail.value;
          var Conferma_mail=myForm.Conferma_mail.value;
          //var Username=myForm.Username.value;
          var Password=myForm.Password.value;
          var Conferma_Password=myForm.Conferma_Password.value;
          var flag=false;
          var stringa="";
          if(Cognome==""||Cognome==null)
          {
                Cognome='Cognome';
                flag=true;
                stringa=Cognome+"\n";
                
          }
          else
          {
             Cognome="";
          }
           if(Nome==""||Nome==null)
               {
                  Nome='Nome';
                  flag=true;
                  stringa+=Nome+"\n";
                  
               }
                else
               {
                    Nome="";
               }
               
             if(AnnoDiNascita==0)
               {
                  AnnoDiNascita='AnnoDiNascita';
                   flag=true;
                   stringa+=AnnoDiNascita+"\n";
               }
                 else
               {
                    AnnoDiNascita="";
               }   
               
            if(Nazionalita==0)
               {
                  Nazionalita='Nazionalita';
                   flag=true;
                   stringa+=Nazionalita+"\n";
               }
                 else
               {
                    Nazionalita="";
               }     
         if(Indirizzo_mail=="")
               {
                  Indirizzo_mail='Indirizzo_mail';
                  flag=true;
                  stringa+=Indirizzo_mail+"\n";
               }
                 else
               {
                    Indirizzo_mail="";
               }
           if(Conferma_mail=="")
               {
                  Conferma_mail='Conferma_mail';
                   flag=true;
                   stringa+=Conferma_mail+"\n";
               }
                 else
               {
                    Conferma_mail="";
               }
              /*  if(Username=="")
               {
                  Username='Username';
                   flag=true;
                   stringa+=Username+"\n";
               }
                 else
               {
                    Username="";
               }*/
                if(Password=="")
               {
                  Password='Password';
                   flag=true;
                  stringa+=Password+"\n";
               }
                 else
               {
                    Password="";
               }
                if(Conferma_Password=="")
               {
                  Conferma_Password='Conferma_Password' ;
                   flag=true;
                   stringa+=Conferma_Password+"\n";
               }
                 else
               {
                    Conferma_Password="";
               }
          if(flag==true)
          {
             
             alert("settare i seguenti campi: "+"\n"+ stringa); 
             return false;
          }
          else
          {
              return true;
          }
        
          
            }
       </script>
       
  
        <div style="margin-top: -100px;">
      <a class="mylink" href="index.jsp" style="text-decoration:none;margin-left: 50px;">Home</a> 
      </div>

    </body>
</html>
