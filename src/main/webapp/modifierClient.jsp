<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modifier Client</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f7f7f7;
            color: #333;
            padding: 50px;
            text-align: center;
        }
        form {
            background-color: white;
            margin: auto;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            width: fit-content;
        }
        label {
            display: block;
            margin-top: 20px;
            color: #555;
        }
        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="file"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="tel"]:focus,
        input[type="file"]:focus {
            outline: none;
            border-color: #719ECE;
            box-shadow: 0 0 8px 0 #719ECE;
        }
        button {
            margin-top: 30px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Modifier Client</h1>

    <form action="ServletClientModifier" method="post">
        <input type="hidden" name="id" value="${client.id}">
        
        <label for="nom">Nom:</label>
        <input type="text" id="nom" name="nom" value="${client.nom}" required>
        
        <label for="prenom">Prénom:</label>
        <input type="text" id="prenom" name="prenom" value="${client.prenom}" required>
        
          <label for="prenom">CNE:</label>
        <input type="text" id="CNE" name="CNE" value="${client.CNE}" required>
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="${client.email}" required>
        
        <label for="tel">Téléphone:</label>
        <input type="tel" id="tel" name="tel" value="${client.tel}">
        
   
        
        <button type="submit">Enregistrer les modifications</button>
    </form>
</body>
</html>
