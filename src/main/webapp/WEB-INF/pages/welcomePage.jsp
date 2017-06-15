<%@page session="false"%>
<html>
<head>
<title>${title}</title>
</head>
<body>
  <jsp:include page="header.jsp"/>
  <jsp:include page="_menu.jsp" />
  <h1>Welcome to Tracks!</h1>
  <p>You are passionate traveler and can't count at once
	all the countries and cities where you've been? 
	You are in the right place!</p> 
  <p>To see how adventurous you are 
  <a href="${pageContext.request.contextPath}/register">Register</a> or<br>
  <a href="${pageContext.request.contextPath}/userInfo">Log In</a>
   if you already have and account</p>  
  <jsp:include page="footer.jsp"/>
</body>
</html>