<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dépôt</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px;
        }
        .container {
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 5px;
            display: inline-block;
            margin-bottom: 20px;
        }
        input {
            margin: 10px 0;
            padding: 10px;
            width: calc(100% - 22px);
        }
        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Dépôt</h1>
        <form action="ServletDepot" method="post">
            <input type="number" name="compteId" placeholder="ID du compte" required><br>
            <input type="number" name="montant" placeholder="Montant du dépôt" step="0.01" required><br>
            <button type="submit">Déposer</button>
        </form>
    </div>

    <div class="container">
        <h1>Recherche de compte</h1>
        <form action="ServletRechercheCompte" method="get">
            <input type="text" name="numeroCompte" placeholder="Numéro de compte" required><br>
            <button type="submit">Rechercher</button>
        </form>
    <div class="container">
        <h1>Résultat de la Recherche</h1>
        <c:choose>
            <c:when test="${not empty compte}">
                <h2>Informations du Compte</h2>
                <p>ID du compte: ${compte.id}</p>
                <p>Numéro de compte: ${compte.numero}</p>
                <p>Solde: ${compte.solde}</p>
                <p>ID du client: ${compte.clientId}</p>

                <c:if test="${not empty client}">
                    <h2>Informations du Client</h2>
                    <p>ID du client: ${client.id}</p>
                    <p>Nom: ${client.nom}</p>
                    <p>Prénom: ${client.prenom}</p>
                    <p>CNE: ${client.CNE}</p>
                    <p>Email: ${client.email}</p>
                    <p>Téléphone: ${client.tel}</p>
                    <p>Nom d'utilisateur: ${client.username}</p>
                </c:if>
            </c:when>
            <c:otherwise>
                <p>${message}</p>
            </c:otherwise>
        </c:choose>
    </div>
    </div>
</body>
</html>
