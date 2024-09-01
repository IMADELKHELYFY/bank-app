<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Virement</title>
    <style>
        /* Style de base */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            color: #333;
            text-align: center;
        }

        .container {
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 5px;
            display: inline-block;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        input[type="number"] {
            margin: 10px 0;
            padding: 10px;
            width: calc(100% - 22px);
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        button {
            padding: 10px 20px;
            background-color: #0275d8;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-transform: uppercase;
            margin-top: 20px;
        }

        button:hover {
            background-color: #025aa5;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Virement</h1>
        <form action="ServletVirement" method="post">
            <input type="number" name="compteIdSource" placeholder="ID du compte source" required><br>
            <input type="number" name="compteIdDestination" placeholder="ID du compte destination" required><br>
            <input type="number" name="montant" placeholder="Montant du virement" step="0.01" required><br>
            <button type="submit">Effectuer le virement</button>
        </form>
    </div>
</body>
</html>
