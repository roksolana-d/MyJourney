<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"/>  	
  	<jsp:include page="_menu.jsp" />

  	<h4>Select countries you have visited</h4>
 	<form name="countries" method='POST'>=
				  <c:forEach items="${allCountries}" var="item">
					<input type=checkbox name="country" value="${item}" checked=<%=("${countriesList}".contains("${item}") ? "checked" : "")%> />${item}<br>
				  </c:forEach><br>
		<input type="submit" value="Submit"/>
    </form>
    
    <h4>Select cities you have visited</h4>
 	<form name="cities" method='POST'>
				  <c:forEach items="${allCities}" var="item">
					<input type=checkbox name='city' value="${item}" checked=<%=("${citiesList}".contains("${item}") ? "checked" : "")%> />${item}<br>
				  </c:forEach><br>
		<input type="submit" value="Submit"/>
    </form>
  	<jsp:include page="footer.jsp"/> 
</body>
</html>