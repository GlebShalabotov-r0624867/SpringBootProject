<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="./../../css/reset.css"/>

    <link rel="stylesheet" type="text/css" href="./../../css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="./../../css/eigen.css"/>
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
    <title>Annpassen</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<h1>Aanpassen</h1>
<main>
<table>
    <thead>
    <th><spring:message code="language.beschrijving"/></th>
    <th><spring:message code="language.duur"/></th>
    <th><spring:message code="language.werkgever"/></th>
    <th><spring:message code="language.datum"/></th>


    </thead>
    <tbody>
    <c:forEach var="job" items="${jobs}">
        <tr>
            <td>${job.beschrijving}</td>
            <td>${job.duur}</td>
            <td>${job.werkgever.name} ${job.werkgever.lastName}</td>
            <td>${job.datum}</td>


            <td> <a href="/aanpassen/update/${job.id}"> Update </a> </td>
            <td> <a href="/aanpassen/verwijder/${job.id}"> Delete</a></td>

        </tr>
    </c:forEach>
    </tbody>
</table>
</main>
<jsp:include page="footer.jsp"/>
</body>
</html>