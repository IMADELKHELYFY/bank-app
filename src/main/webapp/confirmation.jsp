<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Confirmation</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f7f7f7;
            color: #333;
            padding: 50px;
            text-align: center;
        }
        h1, h2 {
            color: #4CAF50;
        }
        p, ul {
            background-color: white;
            display: inline-block;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            margin: 10px 0;
        }
        li {
            text-align: left;
        }
        a {
            display: inline-block;
            margin-top: 30px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Confirmation</h1>
    
    <p>Le client et le compte bancaire ont �t� ajout�s avec succ�s.</p>
    
    <h2>D�tails du Client</h2>
    <ul>
        <li><strong>Nom:</strong> ${client.nom}</li>
        <li><strong>Pr�nom:</strong> ${client.prenom}</li>
        <li><strong>Email:</strong> ${client.email}</li>
        <li><strong>Telephone :</strong> ${client.tel}</li>
        
    </ul>
    
    <h2>D�tails du Compte Bancaire</h2>
    <ul>
        <li><strong>Num�ro de Compte:</strong> ${compte.numero}</li>
        <li><strong>Solde Initial:</strong> ${compte.solde}</li>
    </ul>
    
    <a href="home.jsp">Retour � l'accueil</a>
</body>
</html>
