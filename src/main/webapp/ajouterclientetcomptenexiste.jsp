<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter un Client et un Compte Bancaire</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style type="text/css">
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
    <div class="form-container">
        <form id="clientCompteForm" action="ServletAjouterClientEtCompteexistante" method="post" enctype="multipart/form-data">
            <h2>Informations du Client</h2>
        
        <label for="nom">Nom:</label>
        <input type="text" id="nom" name="nom" required>
        <br><br>
        
        <label for="prenom">Pr�nom:</label>
        <input type="text" id="prenom" name="prenom" required>
        <br><br>
        
         <label for="CNE">CNE:</label>
        <input type="text" id="CNE" name="CNE" required>
        <br><br>
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="${demande.email}" required>
        <br><br>
        
        <label for="tel">T�l�phone :</label>
        <input type="text" id="tel" name="tel">
        <br><br>
        
         <label for="tel">Username :</label>
        <input type="text" id="username" name="username" value="${demande.username}">
        <br><br>
        
         <label for="tel">Password :</label>
        <input type="text" id="password" name="password" value="${demande.password}">
        <br><br>
        
        <h2>Informations du Compte</h2>
        
        <!-- Num�ro de Compte sera auto-incr�ment�, pas besoin de le saisir -->
        
        <label for="solde">Solde Initial:</label>
        <input type="number" id="solde" name="solde" step="0.01" required>
        <br><br>
        
        <button type="submit">Ajouter Client et Compte</button>
    </form>
       
    </div>
    <script src="AjouterClientEtCompte.js"></script>
</body>
</html>