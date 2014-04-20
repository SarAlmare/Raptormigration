/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var latlng = new google.maps.LatLng(37.439974,25.883789); // centro la mappa su Trapani
      var options = {   // opzioni per la mappa da visualizzare
          zoom: 4,  	 // zoom a livello 13
          center: latlng, // centro la mappa sulle coordinate specificate
          mapTypeId: google.maps.MapTypeId.ROADMAP, // tipo di mappa: strada
          draggableCursor: "crosshair", // uso la croce come puntatore
          streetViewControl: false // disabilito la street view
        };
      var map = new google.maps.Map(document.getElementById("map"), options); // visualizzo la mappa nel div con ID map
		  google.maps.event.addListener(map,"click", function(location) // funzione che rimane in ascolto di eventuali click sulla mappa
      {
        GetLocationInfo(location.latLng); // al click sulla mappa richiamo GetLocationInfo (vedi più in basso)
      });
      var marker;

			function Geocode()  // funzione geocode trova gli indirizzi quando si effettua una ricerca
			{
				$("#error").html(""); // cancello il contenuto del div #error
				var localSearch = new google.maps.Geocoder();  // inizializzo la variabile del geocoder
				var postcode = $("#postcode").val(); // inizializzo la variabile del campo indirizzo
				localSearch.geocode({ 'address': postcode }, // avvio la funzione geocode che restituisce un array di risultati

					function(results, status) {	// analizzo il risultato
						if (results.length == 1) { //  se ho un solo risultato lo mostro direttamente a video, non ho bisogno di elencare tutti gli indirizzi
							var result = results[0]; // valorizzo result con l'unico risultato trovato
							var location = result.geometry.location; // valorizzo location con le coordinate del risultato trovato
							GotoLocation(location); // passo il valore location alla funzione GotoLocation che si occuperà di fare il resto (vedi più in basso)
						}
						else if (results.length > 1) { // se ho più di un risultato...
							$("#error").html("<strong>Multipli risultati trovati</strong>"); //  mostro questo testo
							var html = ""; // valorizzo la variabile html che riempiro con i vari indirizzi
							for (var i=0; i<results.length; i++) { // ciclo i risultati
								html += '<br/><a href="javascript:GotoLocation(new google.maps.LatLng(' + 
									results[i].geometry.location.lat() + ', ' + results[i].geometry.location.lng() + '))">' + 
									results[i].formatted_address + "</a>";
							} // per ogni indirizzo trovato creo un link che viene aggiunto alla variabile html
							$("#error").append(html); // mostro nel dom la variabile html nel div #error
                                                        
						}
						else {
							$("#error").html("Indirizzo non trovato"); // se non trovo nulla non è stato trovato l'indirizzo
						}
					});
			}

			function GotoLocation(location) { // è la funzione che viene richiamata dopo la ricerca di un indirizzo
				GetLocationInfo(location); // richiamo GetLocationInfo (vedi più sotto)
				map.setCenter(location); // centro la mappa sulle coordinate passate
			}

      function GetLocationInfo(latlng) // conttrolla che le coordinate non siano nulle e passa tutto alla funzione ShowLatLong
      {
        if (latlng != null)
        {
          ShowLatLong(latlng);
        }
      }

      function ShowLatLong(latLong) // la funzione principale che mostra il marker e riempi i campi con i valori
      {
        if (marker != null) { // se c'è già un marker
          marker.setMap(null); // lo cancello dalla mappa
        }

        marker = new google.maps.Marker({ // aggingo un marker
          position: latLong, // nella posizione indicata da latLong
          map: map}); // sulla mappa
        $("#lat").val(latLong.lat()); // valorizzo il campo di testo con id #lat (viene mostrato all'utente)
        $("#long").val(latLong.lng()); // valorizzo il campo di testo con id #long  (viene mostrato all'utente)
		
		/*var geocoder = new google.maps.Geocoder(); // bisgona adesso trovare l'indirizzo corrispondente alle coordinate specificate
		geocoder.geocode({'latLng': latLong}, function (results, status) { // richiamo la funzione geocode (come fatto precedentemente con la ricerca)
		if (status == google.maps.GeocoderStatus.OK) { // controllo che la richiesta sia OK
			if (results[1]) { // se trovo risultati...
				var localita = ''; // inizializzo la varibaile città
				var route = ''; // inizializzo la varibaile strada
				var number = ''; // inizializzo la varibaile numero
				for (i = 0; i < results[0].address_components.length; i++) { // ciclo dell'array dei risultati
				for (j = 0; j < results[0].address_components[i].types.length; j++) {
				if (results[0].address_components[i].types[j] == "locality")  
				localita = results[0].address_components[i].long_name; // valorizzo località con il valore trovato
				if (results[0].address_components[i].types[j] == "route")
				route = results[0].address_components[i].long_name; // valorizzo strada con il valore trovato
				if (results[0].address_components[i].types[j] == "street_number") 
				number = results[0].address_components[i].long_name; } // valorizzo numero con il valore trovato
				if (number != '') 
					$("#postcode").val(route + ', ' + number + ' - ' + localita); // valorizzo il campo di testo con id #postcode (viene mostrato all'utente) CASO A, con numero civico
				else
					$("#postcode").val(route) + ' - '+localita; // valorizzo il campo di testo con id #postcode (viene mostrato all'utente) CASO B, senza numero civico
				}
			}
			else {
				alert("Nessun risultato"); } // gestione errori
		} else {
			alert("Geocoder fallito"); } // gestione errori
		 });	*/	
      }