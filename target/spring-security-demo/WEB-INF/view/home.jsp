<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Home page</title>
</head>
<body>
<h2>Udemy Course</h2>
<hr>

<p>Welcome to the home page</p>
<hr>
<!--Display user name and role -->
<p>User: <security:authentication property="principal.username"/></p>
<br><br>
<p>User Role(s): <security:authentication property="principal.authorities"/></p>
<hr>
<!--Add link to leaders and managers pages -->
<security:authorize access="hasRole('MANAGER')">
    <p><a href="${pageContext.request.contextPath}/leaders">Leadership Meeting</a> (Only for managers) </p>
</security:authorize>

<security:authorize access="hasRole('ADMIN')">
    <p><a href="${pageContext.request.contextPath}/systems">System Meeting</a> (Only for managers) </p>
</security:authorize>
<hr>
<form:form action="${pageContext.request.contextPath}/logout" method="post">
    <input type="submit" value="Logout">
</form:form>
</body>
</html>