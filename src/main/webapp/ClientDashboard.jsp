<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Formulaire de Préinscription</title>
    <link rel="stylesheet" type="text/css" href="DashboardClient.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.min.js"></script>
    <style type="text/css">
    body {
    font-family: Arial, sans-serif;
    background-color: #ffffff;
}

#form-container {
    width: 80%;
    margin: 20px auto;
    border: 1px solid #f2f2f2;
    border-radius: 10px;
    padding: 20px;
    background-color: #f4f4f4;
    box-shadow: 0 2px 4px rgb(0 0 0 / 10%);
}

h1,
h2 {
    text-align: center;
    color: #020007;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

table,
th,
td {
    border: 1px solid #000000;
}

th,
td {
    padding: 12px;
    text-align: left;
}

th {
    background-color: #5eaeff;
    color: #000000;
}

td {
    background-color: #c2daf1;
    color : black;
}

.button-container {
    margin-top: 20px;
    /* Adjust the spacing between buttons */
    text-align: center;
}

.glow-on-hover {
    width: 220px;
    height: 50px;
    border: none;
    outline: none;
    color: #fff;
    font-size: medium;
    background: #2e0303;
    cursor: pointer;
    position: relative;
    z-index: 0;
    border-radius: 10px;
    margin: 10px;
    /* Add margin between buttons */
}

.glow-on-hover:before {
    content: '';
    background: linear-gradient(45deg, #ff0000, #ff7300, #fffb00, #48ff00, #00ffd5, #002bff, #7a00ff, #ff00c8, #ff0000);
    position: absolute;
    top: -2px;
    left: -2px;
    background-size: 400%;
    z-index: -1;
    filter: blur(5px);
    width: calc(100% + 4px);
    height: calc(100% + 4px);
    animation: glowing 20s linear infinite;
    opacity: 0;
    transition: opacity .3s ease-in-out;
    border-radius: 10px;
}

.glow-on-hover:active {
    color: #a56565
}

.glow-on-hover:active:after {
    background: rgb(138 47 47 / 10%);
}

.glow-on-hover:hover:before {
    opacity: 1;
}

.glow-on-hover:after {
    z-index: -1;
    content: '';
    position: absolute;
    width: 100%;
    height: 100%;
    background: #5875f1;
    left: 0;
    top: 0;
    border-radius: 10px;
}

@keyframes glowing {
    0% {
        background-position: 0 0;
    }

    50% {
        background-position: 400% 0;
    }

    100% {
        background-position: 0 0;
    }
}
    </style>
</head>

<body>
<div><h1>${messageBienvenue}</h1></div>
    <div id="form-container">
        <h1>Formulaire</h1>
        <table>
            <tr>
                <th>Votre solde :</th>
                <td>${solde} DH</td>
            </tr>
            <tr>
                <th>Votre Numero de compte :</th>
                <td>${numero}</td>
            </tr>
            <tr>
                <th>Votre RIB de compte :</th>
                <td>${RIB}</td>
            </tr>
            <tr>
                <th>Nom :</th>
                <td>${client.nom}</td>
            </tr>
            <tr>
                <th>Prénom :</th>
                <td>${client.prenom}</td>
            </tr>
            <tr>
                <th>CNE :</th>
                <td>${client.CNE}</td>
            </tr>
            <tr>
                <th>Email :</th>
                <td>${client.email}</td>
            </tr>
            <tr>
                <th>Téléphone :</th>
                <td>${client.tel}</td>
            </tr>
        </table>
    </div>

    <div id="logoutButton" class="button-container">
        <form action="login.jsp" >
            <button type="submit" class="glow-on-hover">Déconnexion</button>
        </form>
    </div>

    <div id="download" class="button-container">
        <button type="button" class="glow-on-hover">Télécharger PDF</button>
    </div>

    <script type="text/javascript">
        window.onload = function () {
            document.querySelector("#download button").addEventListener("click", () => {
                const invoice = document.getElementById("form-container");
                var opt = {
                    margin: 1,
                    filename: 'preinscription.pdf',
                    image: { type: 'jpeg', quality: 0.98 },
                    html2canvas: { scale: 2 },
                    jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' }
                };
                html2pdf().from(invoice).set(opt).save();
            })
        }
    </script>
</body>

</html>