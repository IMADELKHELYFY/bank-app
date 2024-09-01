<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profil Client</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>Profil Client</h1>
    
    <h2>Informations du Client</h2>
    <ul>
        <li><strong>Nom:</strong> ${client.nom}</li>
        <li><strong>Prénom:</strong> ${client.prenom}</li>
        <li><strong>CNE:</strong> ${client.CNE}</li>
        <li><strong>Email:</strong> ${client.email}</li>
        <li><strong>Téléphone:</strong> ${client.tel}</li>
    </ul>
    
    <h2>Vos Comptes Bancaires</h2>
    <table>
        <tr>
            <th>Numéro de Compte</th>
            <th>Solde</th>
        </tr>
        <c:forEach var="compte" items="${comptes}">
            <tr>
                <td>${compte.numero}</td>
                <td>${compte.solde}</td>
            </tr>
        </c:forEach>
    </table>
    
    <form action="ClientDashboard.jsp" method="post">
        <button type="submit">Retour au Tableau de Bord</button>
    </form>
    
    <form action="login.jsp" method="post">
        <button type="submit">Déconnexion</button>
    </form>
</body>
</html>
