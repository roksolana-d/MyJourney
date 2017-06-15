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
	  var markers;
	  // Multiple Markers
	  if("${username}" == 'dbuser1'){
		  markers = [
		        ['Kyiv, Ukraine', 50.401699,30.252508],
		        ['Lviv, Ukraine', 49.8326679,23.9421957],
		        ['Netherlands, Amsterdam', 52.3746961, 4.8285745],
		        ['France, Paris', 48.8589507, 2.2775171],
		        ['Ukraine, Odessa', 46.4601261, 30.5717035],
		        ['Ukraine, Chernivtsi', 48.228952, 26.0904992],
		        ['Hungary, Budapest', 47.4042071, 18.9570666],
		        ['Czech Republic, Prague', 49.8008803, 14.309061],
		        ['Czech Republic, Karlovy Vary', 49.9311685, 11.9986745],
		        ['Belarus, Minsk', 53.6867179, 27.01594],
		        ['Poland, Krakow', 49.7707466, 19.4974343],
		        ['Poland, Warsaw', 51.8251441, 20.8084955],
		        ['Poland, Wroclaw', 50.7810493, 16.9524741],
		        ['Poland, Gdansk', 54.0141813, 18.6630094]
		  ];
	  }else if("${username}" == 'johnW'){
		  markers = [
			  ['Netherlands, Amsterdam', 52.3746961, 4.8285745],
			  ['France, Paris', 48.8589507, 2.2775171],
			  ['US, Miami', 25.7902689, -80.3025756],
			  ['US, New York', 40.7058316, -74.2581909],
			  ['US, Los Angeles', 34.0207504, -118.6919231],
			  ['US, San Francisco', 37.757815, -122.5076402],
			  ['US, Boston', 43.272556, -76.1226202],
			  ['Germany, Berlin', 52.2574157, 12.9894098],
			  ['Italy, Rome', 41.8518616, 11.9545369],
			  ['Sweden, Stockholm', 59.326242, 17.8474634],
			  ['Ireland, Dublin', 53.3244431, -6.3857871],
			  ['Poland, Warsaw', 51.8251441, 20.8084955],
		      ['Belgium, Brussels', 50.4003828, 4.2516901]
		  ];
	  }else if("${username}" == 'Cassie13'){
		  markers = [
			  ['UK, London', 51.5287718, -0.2417014],
		      ['UK, Bristol', 51.3570991, -3.6231525],
		      ['US, New York', 40.7058316, -74.2581909],
		      ['Ireland, Dublin', 53.3244431, -6.3857871]
		  ];
	  }else if("${username}" == 'mashaS'){
		  markers = [
			  ['Netherlands, Amsterdam', 52.3746961, 4.8285745],
		      ['France, Paris', 48.8589507, 2.2775171],
			  ['UK, London', 51.5287718, -0.2417014],
		      ['US, New York', 40.7058316, -74.2581909],
		      ['US, San Francisco', 37.757815, -122.5076402],
		      ['Germany, Berlin', 52.2574157, 12.9894098],
		      ['Germany, Munich', 48.9352345, 8.965889],
		      ['Austria, Vienna', 48.1370518, 15.8950305],
		      ['Austria, Hallstatt', 47.5601464, 13.5631719],
		      ['Italy, Rome', 41.8518616, 11.9545369],
		      ['Italy, Venice', 43.8591351, 12.3658014],
		      ['Italy, Florence', 43.7727656, 10.4833404],
		      ['Italy, Burano', 45.4905016, 12.428467],
		      ['Sweden, Stockholm', 59.326242, 17.8474634],
		      ['France, Nice', 43.6822122, 6.8504077],
		      ['Poland, Warsaw', 51.8251441, 20.8084955],
		      ['Belgium, Brussels', 50.4003828, 4.2516901],
		      ['Belgium, Antwerpen', 50.953239, 4.0566884],
		      ['Belgium, Brugge', 50.9649133, 3.0368275]
		  ];
	  }else if("${username}" == 'kumar'){
		  markers = [
			  ['US, Miami', 25.7902689, -80.3025756],
			  ['US, New York', 40.7058316, -74.2581909],
			  ['US, San Francisco', 37.757815, -122.5076402],
			  ['India, New Delhi', 28.6350432,77.1451167],
		      ['India, Mumbai', 18.5955829, 72.5858389],
		      ['India, Calcutta', 22.8097772, 88.1292971]
		  ];
	  }
	  
	 
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