<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${title}</title>
</head>
<body>
	<jsp:include page="footer.jsp"/> 	
  	<jsp:include page="_menu.jsp" />
  
    <h6>To edit your information fill the fields, please.</h6>
    <form name='f' action="${pageContext.request.contextPath}/j_spring_security_check" method='POST'>
      <table>
      	 <tr>
            <td>First Name:</td>
            <td><input type='text' name='firstname' value=''></td>
         </tr>
          <tr>
            <td>Last Name:</td>
            <td><input type='text' name='lastname' value=''></td>
         </tr>
         <tr>
            <td>Location:</td>
            <td><input type='text' name='location' /></td>
         </tr>
         <tr>
            <td>Summary</td>
            <td><input type='text' name='summary' /></td>
         </tr>
         <tr>
            <td><input name="edit" type="submit" value="Edit" /></td>
         </tr>      
      </table>
  	</form>     
 
 	<jsp:include page="footer.jsp"/> 
</body>
</html>