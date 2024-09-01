<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter un Client et un Compte Bancaire</title>
    <style>
        /* Style de base */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        h1, h2 {
            color: #0275d8;
        }

        label {
            display: block;
            margin-top: 10px;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="number"],
        input[type="file"] {
            padding: 10px;
            margin-top: 5px;
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        button {
            background-color: #0275d8;
            color: white;
            border: none;
            padding: 10px 20px;
            text-transform: uppercase;
            margin-top: 20px;
            cursor: pointer;
        }

        button:hover {
            background-color: #025aa5;
        }

        form {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <h1>Ajouter un Client et un Compte Bancaire</h1>
    
    <form action="ServletAjouterClientEtCompte" method="post" enctype="multipart/form-data">
        <h2>Informations du Client</h2>
        
        <label for="nom">Nom:</label>
        <input type="text" id="nom" name="nom" required>
        <br><br>
        
        <label for="prenom">Prénom:</label>
        <input type="text" id="prenom" name="prenom" required>
        <br><br>
        
         <label for="CNE">CNE:</label>
        <input type="text" id="CNE" name="CNE" required>
        <br><br>
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        <br><br>
        
        <label for="tel">Téléphone :</label>
        <input type="text" id="tel" name="tel">
        <br><br>
        
         <label for="username">Username :</label>
        <input type="text" id="username" name="username">
        <br><br>
        
         <label for="password">Password :</label>
        <input type="text" id="password" name="password">
        <br><br>
        
        
        
        <h2>Informations du Compte</h2>
        
        <!-- Numéro de Compte sera auto-incrémenté, pas besoin de le saisir -->
        
        <label for="solde">Solde Initial:</label>
        <input type="number" id="solde" name="solde" step="0.01" required>
        <br><br>
        
        <button type="submit">Ajouter Client et Compte</button>
    </form>
</body>
</html>
