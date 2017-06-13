<%@page session="false"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>${title}</title>

	<script
	    src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&key=AIzaSyDxS8WSvbLkzJPrH2TVqfVspGs4QgSLWy8">
	</script>
	<script>
	var map;
	function initialize() {
	  var mapOptions = {
	    zoom: 1,
	    center: new google.maps.LatLng(48.295637, 26.6949621)
	  };
	  
	  // Display a map on the page
	  map = new google.maps.Map(document.getElementById('map-canvas'),mapOptions);
	  
	  // Multiple Markers
	  var markers = [
	        ['Kyiv, Ukraine', 50.401699,30.252508],
	        ['Lviv, Ukraine', 49.8326679,23.9421957]
	  ];
	  
	  // Info Window Content
	    var infoWindowContent = [
	        ['<div class="info_content">' +
	        '<h3>Kyiv</h3>' +
	        '<p>The London Eye is a giant Ferris wheel situated on the banks of the River Thames. The entire structure is 135 metres (443 ft) tall and the wheel has a diameter of 120 metres (394 ft).</p>' +        '</div>'],
	        ['<div class="info_content">' +
	        '<h3>Lviv</h3>' +
	        '<p>The Palace of Westminster is the meeting place of the House of Commons and the House of Lords, the two houses of the Parliament of the United Kingdom. Commonly known as the Houses of Parliament after its tenants.</p>' +
	        '</div>']
	    ];
	  
	  // Display multiple markers on a map
	  var infoWindow = new google.maps.InfoWindow(), marker, i;
	  
	  // Loop through our array of markers & place each one on the map  
	    for( i = 0; i < markers.length; i++ ) {
	        var position = new google.maps.LatLng(markers[i][1], markers[i][2]);
	        bounds.extend(position);
	        marker = new google.maps.Marker({
	            position: position,
	            map: map,
	            title: markers[i][0]
	        });

	     // Allow each marker to have an info window    
	        google.maps.event.addListener(marker, 'click', (function(marker, i) {
	            return function() {
	                infoWindow.setContent(infoWindowContent[i][0]);
	                infoWindow.open(map, marker);
	            }
	        })(marker, i));
	        
	        // Automatically center the map fitting all markers on the screen
	        map.fitBounds(bounds);
	    }
	  
	 // Override our map zoom level once our fitBounds function runs (Make sure it only runs once)
	    var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
	        this.setZoom(14);
	        google.maps.event.removeListener(boundsListener);
	    });
	}
	
	google.maps.event.addDomListener(window, 'load', initialize);
	</script>
</head>
<body>
    <jsp:include page="_menu.jsp" />
 
 
    <h1>${username}</h1>
    
    <h2>
	    <c:forEach items="${countriesCount}" var="item">
	    	${item}
	    </c:forEach> visited countries: 
    </h2>
    
	<c:forEach items="${countries}" var="item" varStatus="loop">
    	${item}
    	${loop.last ? '' : ', '}
	</c:forEach>

	<h2>
		<c:forEach items="${citiesCount}" var="item">
	    	${item}
	    </c:forEach> visited cities: 
	    </h2>
	    
	<c:forEach items="${cities}" var="item" varStatus="loop">
    	${item}
    	${loop.last ? '' : ', '}
	</c:forEach>
	
	<br/><br/><br/>
	<div id="map-canvas" style="height:300px; width:500px"></div>
</body>
</html>