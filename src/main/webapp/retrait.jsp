<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Retrait</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            text-align: center;
            padding: 50px;
            background-color: #f7f7f7;
            color: #333;
        }
        .container {
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            border: none;
            padding: 40px;
            border-radius: 10px;
            display: inline-block;
            background-color: white;
            margin-top: 50px;
        }
        input, button {
            margin: 15px 0;
            padding: 15px;
            width: calc(100% - 30px);
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        input:focus, button:focus {
            outline: none;
            border-color: #719ECE;
            box-shadow: 0 0 8px 0 #719ECE;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Retrait</h1>
        <form action="ServletRetrait" method="post">
            <input type="number" name="compteId" placeholder="ID du compte" required><br>
            <input type="number" name="montant" placeholder="Montant du retrait" step="0.01" required><br>
            <button type="submit">Retirer</button>
        </form>
    </div>
</body>
</html>
