<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profil Client</title>
    <style>
        /* Style de base */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        h1 {
            color: #0275d8;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th {
            background-color: #0275d8;
            color: white;
            padding: 10px;
        }

        td {
            padding: 10px;
            text-align: center;
        }

        /* Améliorations pour l'affichage des images */
        td img {
            max-width: 100px;
            height: auto;
            border-radius: 50%;
        }
    </style>
</head>
<body>
    <h1>Profil du Client</h1>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Prénom</th>
                <th>CNE</th>
                <th>Email</th>
                <th>Téléphone</th>
              
            </tr>
        </thead>
        <tbody>
            <c:forEach var="client" items="${clients}">
                <tr>
                    <td>${client.id}</td>
                    <td>${client.nom}</td>
                    <td>${client.prenom}</td>
                    <td>${client.CNE}</td>
                    <td>${client.email}</td>
                    <td>${client.tel}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="home.jsp">Roteur</a>
</body>
</html>
