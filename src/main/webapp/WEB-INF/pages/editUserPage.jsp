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
	
	<jsp:include page="_menu.jsp" />
 
    <h1><c:forEach items="${nsur}" var="item" varStatus="loop">
    	${item}
    	${loop.last ? '' : ''}
	</c:forEach></h1>
    <p>${summary} <br> from ${residence}</p>
<form:form method="post" action = "edit" commandName="user">
<c:forEach items="${cities}" var="item" varStatus="loop">
    	${item}
    	${loop.last ? '' : ', '}
	</c:forEach>
	<input type="submit" value = "edit"> 
 </form:form>

	<br/><br/><br/>
	<div id="map-canvas" style="height:300px; width:500px"></div>
	<jsp:include page="footer.jsp"/> 
</body>
</html>