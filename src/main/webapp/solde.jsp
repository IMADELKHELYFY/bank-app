<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Consultation de Solde</title>
</head>
<body>
    <h1>Consultation de Solde</h1>
    
    <c:if test="${not empty solde}">
        <h2>Solde du client : ${solde}</h2>
    </c:if>
    
    <form action="index.jsp" method="post">
        <button type="submit">Retour</button>
    </form>
</body>
</html>
