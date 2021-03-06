<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html xmlns:th="http://www.thymeleaf.org">
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
    <title>Overzicht</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<h1><spring:message code="language.headerOverzicht"/></h1>

<main>
<table class="table">
    <thead class="thead-light">

    <th scope="col"><spring:message code="language.beschrijving"/></th>
    <th scope="col"><spring:message code="language.duur"/></th>
    <th scope="col"><spring:message code="language.werkgever"/></th>
    <th scope="col"><spring:message code="language.score"/></th>
    <th scope="col"><spring:message code="language.datum"/></th>
    <th scope="col"><spring:message code="language.details"/></th>

    </thead>
    <tbody>
    <c:forEach var="job" items="${jobs}">
        <tr scope="row">
            <td>${job.beschrijving}</td>
            <td>${job.duur}</td>
            <td>${job.werkgever.name}</td>
            <td>${job.werkgever.score}</td>
            <td>${job.datum}</td>
            <td>${job.jobStatus}</td>
            <td><a class="btn btn-secondary" href="/overzicht/details/${job.id}">details</a></td>
        </tr>
</c:forEach>
</tbody>

</table>
</main>
<jsp:include page="footer.jsp"/>
</body>
</html>