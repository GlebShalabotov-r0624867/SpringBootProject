<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<link rel="stylesheet" type="text/css" href="./../../css/reset.css"/>
<link rel="stylesheet" type="text/css" href="./../../css/bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="./../../css/eigen.css"/>
<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
<!doctype html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Huidige job</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<h1>Jouw huidige job</h1>
<main>
    <p>Op dit moment is dit je huidige baan</p>
    <p>Ben je klaar? Meld dit dan zeker tegen uw begeleider</p>

    <table class="table">
        <thead>

        <th scope="col"><spring:message code="language.beschrijving"/></th>
        <th scope="col"><spring:message code="language.duur"/></th>
        <th scope="col"><spring:message code="language.werkgever"/></th>
        <th scope="col"><spring:message code="language.datum"/></th>
        <th scope="col"><spring:message code="language.details"/></th>

        </thead>
        <tbody>
        <tr scope="row">
            <td scope="col">${job.beschrijving}</td>
            <td>${job.duur}</td>
            <td>${job.werkgever.name}</td>
            <td>${job.datum}</td>
            <td><a class="btn btn-secondary" href="/overzicht/details/${job.id}"><spring:message code="language.details"/></a></td>
            <td><a class="btn btn-primary" href="/overzicht/finish/${job.id}">finish</a></td>


        </tr>
        </tbody>
    </table>
</main>
</body>
</html>