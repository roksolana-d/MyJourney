<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<jsp:include page="_menu.jsp" />
	
	<form name='f' action="${pageContext.request.contextPath}/j_spring_security_check" method='POST'>
      <table>
         <tr>
            <td>Username:</td>
            <td><input type='text' name='username' value=''></td>
         </tr>
         <tr>
            <td>First Name:</td>
            <td><input type='text' name='firstname' value=''></td>
         </tr>
          <tr>
            <td>Last Name:</td>
            <td><input type='text' name='lastname' value=''></td>
         </tr>
         <tr>
            <td>Password:</td>
            <td><input type='password' name='password' /></td>
         </tr>
         <tr>
            <td>Repeat password:</td>
            <td><input type='password' name='password' /></td>
         </tr>
         <tr>
         	<td><input type='checkbox' name='checkterms' /></td>
         	<td>I agree to the Terms Of Use and Privacy Policy</td>
         </tr>
         <tr>
         	<td></td>
            <td><input name="join" type="submit" value="Register" /></td>
         </tr>      
      </table>
  </form>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>