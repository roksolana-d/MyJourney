<%@page session="false"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>${title}</title>
	<jsp:include page="header.jsp"/>
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
	 
	  var bounds = new google.maps.LatLngBounds();
	  // Loop through our array of markers & place each one on the map  
	    for( i = 0; i < markers.length; i++ ) {
	        var position = new google.maps.LatLng(markers[i][1], markers[i][2]);
	        bounds.extend(position);
	        marker = new google.maps.Marker({
	            position: position,
	            map: map,
	            title: markers[i][0]
	        });
	        
	        // Automatically center the map fitting all markers on the screen
	        map.fitBounds(bounds);
	    }
	  
	 // Override our map zoom level once our fitBounds function runs (Make sure it only runs once)
	    var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
	        google.maps.event.removeListener(boundsListener);
	    });
	}
	
	google.maps.event.addDomListener(window, 'load', initialize);
	</script>
</head>
<body>
    <jsp:include page="_menu.jsp" />
    <a href="${pageContext.request.contextPath}/editUser">Edit Personal Info</a> 
 
    <h1><c:forEach items="${nsur}" var="item" varStatus="loop">
    	${item}
    	${loop.last ? '' : ''}
	</c:forEach></h1>
    <p>${summary} <br> from ${residence}</p>
    
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
	
	<br><br>
	<a href="${pageContext.request.contextPath}/editPlaces">Add more visited places</a> 
	
	<br/><br/><br/>
	<div id="map-canvas" style="height:300px; width:500px"></div>
	<jsp:include page="footer.jsp"/> 
</body>
</html>