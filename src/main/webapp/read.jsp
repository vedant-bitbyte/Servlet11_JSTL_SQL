<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
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

	<!-- Here, we use sql:query that is like executeQuery in JDBC
		 So rs is the variable used as rowSet, from which we extract the columns, one by one
	 -->
	<sql:setDataSource
		var="con"
		driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/JDBC01"
		user="root"
		password="Vedant 16"
	/>
	
	<sql:query dataSource="${ con }" var="rs">
		select * from employee;
	</sql:query>
	
	<c:forEach var="data" items="${ rs.rows }">
		Emp ID : ${ data.emp_id } <br>
		Emp Name : ${ data.emp_name } <br>
		Emp Salary : ${ data.emp_salary } <br>
		<h2>=======================</h2>
	</c:forEach>

</body>
</html>