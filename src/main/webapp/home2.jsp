<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    
<%
// So in here, we are using JSTL's SQL lib to easy the DB work
// Do this only for frequently used queries, not require any security
%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- So here, sql is the jstl's lib used for sql queries
		 sql:setDataSource is used to create a connection, con obj
		 sql:update is like PreparedStatement, pre-complied query is used to send data in DB
		 sql:param value="" is the one that attaches the data from EL's param aka request to the placeholder in query
		 Also in here we pass the con obj, and also we get a variable (here rs like resultSet) that shows the value 1 as 
		 executed, 0 as not executed
		 So, using c:if we check
	 -->
	
	<sql:setDataSource
		var="con"
		driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/JDBC01"
		user="root"
		password="Vedant 16"
	/>
	
	<sql:update dataSource="${ con }" var="rs">
		insert into employee(emp_name, password, emp_salary) values (?, ?, ?);
		
		<sql:param value="${ param.emp_name }"></sql:param>
		<sql:param value="${ param.emp_password }"></sql:param>
		<sql:param value="${ param.emp_salary }"></sql:param>
		
	</sql:update>
	
	<c:if test="${ rs == 1 }">
		<h3>Data Inserted</h3>
	</c:if>
	
</body>
</html>