<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
 
<html>
<head>
<title>${title}</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
    <jsp:include page="_menu.jsp" /> 
    <h2>Admin Page</h2>  

	<c:forEach items="${unames}" var="uitem" varStatus="status">
	  <tr>
	      <td>${uitem}  </td>
	      <td>${fnames[status.index]}  </td>
	      <td>${lnames[status.index]}  </td>
	      <td>${res[status.index]}  </td>
	      <td>${date[status.index]}  </td><br>
	  </tr>
	</c:forEach>

    
    <jsp:include page="footer.jsp"/>
</body>
</html>