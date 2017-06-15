<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.List, java.util.Arrays" %>
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

	<% 
	   String[] city = request.getParameterValues("city");
	   if (city != null) 
	   {
	   	  String check = "checked='checked'";
	      List list = Arrays.asList(city);
		  if(list.contains("${item}"))pageContext.setAttribute("${item}", check);	 
	   }
	%>
	
<!--  
  	<h4>Select countries you have visited</h4>
 	<form name="countries" method='POST'>=
				  <c:forEach items="${allCountries}" var="item">
					<input type=checkbox name="country" value="${item}" <%=("${notVisCo}".contains("${item}") ? "" : ("checked='checked'"))%>/>${item}<br>
				  </c:forEach><br>
		<input type="submit" value="Submit"/>
    </form>

	<script language="javascript">

    function validate() {
      if (document.getElementById('country').checked) {

      } else {

      }
    }        

	</script>
	-->

    <h4>Select cities you have visited</h4>
 	<form name="cities" method='POST'>
				  <c:forEach items="${allCities}" var="item">
					<input type=checkbox name='city' value="${item}" <%=("${citiesList}".contains("${item}") ? ("checked='checked'") : "")%> />${item}<br>
				  </c:forEach><br>
		<input type="submit" value="Submit"/>
    </form>
    
  	<jsp:include page="footer.jsp"/> 
</body>
</html>