<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
      <script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    <title>Admin Dashboard</title>
    <script type="text/javascript">
        function confirmDeletion() {
            var conf = confirm("Êtes-vous sûr de vouloir effacer ce compte ?");
            return conf;
        }
    </script>
    <style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap');
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Roboto', sans-serif;
}
body {
    position: relative;
    width: 100%;
}
.header {
    height: 60px;
    width: 100%;
    display: flex;
    align-items: center;
    border-bottom: 2px solid #f1f1f1;
}
.logo {
    display: flex;
    align-items: center;
    width: 300px;
    padding-left: 40px;
}
.logo span {
    color: #5073fb;
}
.search--notification--profile {
    display: flex;
    align-items: center;
    justify-content: space-between;
    width: calc(100% - 300px);
    padding: 0 40px;
}
.search {
    background-color: #f1f4f8;
    border-radius: 50px;
    width: 400px;
    padding: 5px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}
.search input {
    background-color: transparent;
    outline: none;
    border: none;
    text-indent: 15px;
    width: 85%;
}
.search button {
    outline: none;
    border: none;
    border-radius: 50%;
    background-color: #fff;
    padding: 8px;
    display: flex;
    align-items: center;
    justify-content: center;
}
.search button i {
    font-size: 1.1rem;
    color: #5073fb;
}
.notification--profile {
    display: flex;
    align-items: center;
}
.picon {
    margin-left: 20px;
    font-size: 1.1rem;
    padding: 5px;
    border-radius: 5px;
}
.lock {
    color: #5073fb;
    background-color: rgba(80, 115, 251, .2);
}
.bell {
    color: #f1d243;
    background-color: rgba(241, 210, 67, .2);
}
.chat {
    color: #70d7a5;
    background-color: rgba(112, 215, 165, .2);
}
.profile {
    position: relative;
    width: 40px;
    height: 40px;
    border-radius: 50%;
    overflow: hidden;
}
img {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
}
.main {
    position: relative;
    width: 100%;
    min-height: calc(100vh - 60px);
}
/* sidebar */
.sidebar {
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    width: 300px;
    background-color: #fff;
    padding: 30px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    border-right: 2px solid #f1f1f1;
    transition: .3s;
}
.sidebar.active {
    width: 103px;
    overflow: hidden;
}
.sidebar.active .sidebar--item {
    display: none;
}
li {
    list-style: none;
}
a {
    text-decoration: none;
}
.sidebar--items a,
.sidebar--bottom-items a {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
    font-size: 1.1rem;
    color: #000;
    padding: 10px;
    border-radius: 10px;
}
.sidebar--items a:hover,
.sidebar--bottom-items a:hover {
    background-color: #5073fb;
    color: #fff;
}
#active--link {
    background-color: #5073fb;
    color: #fff;
}
.sidebar--bottom-items li:last-child a {
    margin-bottom: 0;
}
.icon {
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 20px;
    font-size: 1.3rem;
}
.icon-0 {
    color: #5073fb;
}
.icon-1 {
    color: #c5bc58;
}
.icon-2 {
    color: #a280e9;
}
.icon-3 {
    color: #85ade3;
}
.icon-4 {
    color: #e36ac8;
}
.icon-5 {
    color: #70d7a5;
}
.icon-6 {
    color: #5f5ce0;
}
.icon-7 {
    color: #e86786;
}
.icon-8 {
    color: #f1d243;
}
/* main--content */
.main--content {
    position: absolute;
    top: 0;
    right: 0;
    height: 100%;
    width: calc(100% - 300px);
    padding: 0 40px;
    overflow-y: scroll;
    transition: .3s;
}
.main--content.active {
    width: calc(100% - 103px);
}
.title {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 10px;
    margin-top: 30px;
}
.section--title {
    font-weight: 400;
}
.dropdown {
    outline: none;
    border: none;
    background-color: #f1f4f8;
    border-radius: 5px;
    width: 150px;
    padding: 5px;
}
.cards {
    display: flex;
    gap: 20px;
}
.card {
    padding: 20px;
    border-radius: 20px;
    min-width: 230px;
    height: auto;
    transition: .3s;
}
.card:hover {
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}
.card--data {
    display: flex;
    align-items: flex-start;
    justify-content: space-between;
}
.card h1 {
    font-size: 30px;
    margin-top: 10px;
}
.card--icon--lg {
    font-size: 80px;
}
.card--stats {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 5px;
}
.card--stats span {
    display: flex;
    align-items: center;
}
.card--icon {
    margin-right: 5px;
}
.stat--icon {
    color: #5f5ce0;
}
.up--arrow {
    color: #70d7a5;
}
.down--arrow {
    color: #e86786;
}
.card-1 {
    background-color: rgba(80, 115, 251, .1);
}
.card-1 .card--title {
    color: rgba(80, 115, 251, 1);
}
.card-1 .card--icon--lg {
    color: rgba(80, 115, 251, .4);
}
.card-2 {
    background-color: rgba(241, 210, 67, .1);
}
.card-2 .card--title {
    color: rgba(241, 210, 67, 1);
}
.card-2 .card--icon--lg {
    color: rgba(241, 210, 67, .4);
}
.card-3 {
    background-color: rgba(112, 215, 165, .1);
}
.card-3 .card--title {
    color: rgba(112, 215, 165, 1);
}
.card-3 .card--icon--lg {
    color: rgba(112, 215, 165, .4);
}
.card-4 {
    background-color: rgba(227, 106, 200, .1);
}
.card-4 .card--title {
    color: rgba(227, 106, 200, 1);
}
.card-4 .card--icon--lg {
    color: rgba(227, 106, 200, .4);
}
/* doctors */
.doctors--right--btns {
    display: flex;
    align-items: center;
    gap: 30px;
}
.add {
    display: flex;
    align-items: center;
    padding: 5px 10px;
    outline: none;
    border: none;
    background-color: #5073fb;
    color: #fff;
    border-radius: 5px;
    cursor: pointer;
    transition: .3s;
}
.add:hover {
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}
.add i {
    margin-right: 10px;
    padding: 5px;
    background-color: #fff;
    border-radius: 50%;
    color: #000;
}
.doctors--cards {
    display: flex;
    gap: 20px;
}
.doctor--card {
    padding: 20px;
    border-radius: 20px;
    height: auto;
    transition: .3s;
    border: 2px solid #f1f1f1;
    display: flex;
    flex-direction: column;
    align-items: center;
    font-size: .8rem;
}
.doctor--card:hover {
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}
.img--box--cover {
    border: 1px solid #5073fb;
    padding: 2px;
    border-radius: 50%;
    display: inline-block;
    margin-bottom: 10px;
}
.img--box {
    position: relative;
    width: 71px;
    height: 71px;
    overflow: hidden;
    border-radius: 50%;
}
.free {
    color: #70d7a5;
}
.scheduled {
    color: #5073fb;
}
/* recent--patients */
.recent--patients {
    margin-bottom: 20px;
}
.table {
    height: 200px;
    overflow-y: scroll;
}
table {
    width: 100%;
    text-align: left;
    border-collapse: collapse;
}
tr {
    border-bottom: 1px solid #f1f1f1;
}
td,
th {
    padding-block: 10px;
}
.edit {
    color: #70d7a5;
    margin-right: 10px;
}
.delete {
    color: #e86786;
}
.pending {
    color: #f1d243;
}
.confirmed {
    color: #70d7a5;
}
.rejected {
    color: #e86786;
}
/* responsive starts here */
@media screen and (max-width:1350px) {
    .cards,
    .doctors--cards {
        overflow-x: scroll;
    }
}
@media screen and (max-width:1024px) {
    table {
        min-width: 600px;
    }
}
@media screen and (max-width:768px) {
    .logo {
        padding-left: 30px;
        width: fit-content;
    }
    .search--notification--profile {
        padding: 0 20px;
        margin-left: auto;
    }
    .main--content {
        padding: 0 20px;
    }
    .sidebar {
        padding: 20px;
    }
    .sidebar.active {
        width: 85px;
    }
    .main--content.active {
        width: calc(100% - 85px);
    }
}
@media screen and (max-width:590px) {
    .search,
    .lock,
    .chat {
        display: none;
    }
    .notification--profile {
        margin-left: auto;
    }
    .search--notification--profile {
        width: fit-content;
    }
    .sidebar {
        transform: translateX(-100%);
        z-index: 10;
        background-color: #fff;
    }
    .sidebar.active {
        transform: translateX(0);
        width: 300px;
    }
    .sidebar.active .sidebar--item {
        display: block;
    }
    .main--content {
        width: calc(100% - 0px);
    }
    .main--content.active {
        width: calc(100% - 0px);
    }
}
@media screen and (max-width:450px) {
    .doctor--filter {
        display: none;
    }
    .main--content {
        padding: 0 10px;
    }
    .logo {
        padding-left: 10px;
    }
    .search--notification--profile {
        padding: 0 10px;
    }
    .sidebar {
        padding: 10px;
    }
}
.header--items {
    display: flex;
    align-items: center;
}

.header--items i {
    font-size: 1.3rem;
    margin-right: 25px;
    cursor: pointer;
    color: var(--text-color-first);
}

.header--items i:hover {
    color: var(--text-color-third);
}
.dark--theme--btn {
    display: flex;
    align-items: center;
}
.delete-button {
    background-color: transparent; /* Remove default button background */
    border: none; /* Remove default button border */
    cursor: pointer;
    display: flex;
    align-items: center;
}

.delete-button i {
    font-size: 20px; /* Adjust icon size as needed */
    margin-right: 5px; /* Add spacing between icon and text */
}
.accept-button,
.refuse-button {
  background-color: #fff; /* White background */
  border: 1px solid #ddd; /* Light gray border */
  border-radius: 5px; /* Rounded corners */
  padding: 10px 20px; /* Padding for spacing */
  cursor: pointer; /* Indicate clickable button */
  margin: 5px; /* Add some margin between buttons */
}

.accept-button {
  background-color: blue; /* Green background for accept */
  color: #fff; /* White text for accept */
}

.refuse-button {
  background-color: blue; /* Red background for refuse */
  color: #fff; /* White text for refuse */
}

.accept-button:hover,
.refuse-button:hover {
  opacity: 0.8; /* Slight transparency on hover */
}

.section--operation {
    font-size: 24px;
    font-weight: 700;
    margin-bottom: 20px;
    color: #333;
}

form {
    margin-bottom: 20px;
}

form select {
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 4px;
    margin-right: 10px;
}

form button {
    padding: 10px 20px;
    font-size: 16px;
    color: #fff;
    background-color: #007bff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

form button:hover {
    background-color: #0056b3;
}
.moon-icon.hidden,
.sun-icon.hidden {
    display: none;
}
    </style>
</head>
<body>
<section class="header">
        <div class="logo">
            <i class="ri-menu-line icon icon-0 menu"></i>
            <h2>Med<span>Ex</span></h2>
        </div>
        <div class="search--notification--profile">
          <form action="rechercherClientParNom" method="get">
            <div class="search">
                <input type="text" placeholder="Cherche par nom " name="nom">
                <button><i class="ri-search-2-line"></i></button>
            </div>
           </form>
        </div>
       
       
    </section>
<section class="main">
                <div class="sidebar">
                  <ul class="sidebar--items">
                        <li>
                           <form action="homeServlet" method="get">
                            <a href="homeServlet" id="active--link">
                                <span class="icon icon-1"><i class="ri-layout-grid-line"></i></span>
                                <span class="sidebar--item">Tableau de bord</span>
                            </a>
                            </form>
                        </li>
                        <li>
                            <form action="ServletListOperation" method="get">
                                <a href="ServletListOperation" id="active--link">
                                    <span class="icon icon-2"><i class="ri-calendar-2-line"></i></span>
                                    <span class="sidebar--item">Operations</span>
                                </a>
                            </form>
                        </li>
                        <li>
                            <form action="ServletAfficherListClient" method="get">
                                <a href="ServletAfficherListClient" id="active--link">
                                    <span class="icon icon-3"><i class="ri-user-2-line"></i></span>
                                    <span class="sidebar--item" style="white-space: nowrap;">Clients</span>
                                </a>
                            </form>
                        </li>

                        <li>
                            <form action="ServletAfficherListCompte" method="get">
                                <a href="ServletAfficherListCompte" id="active--link">
                                    <span class="icon icon-4"><i class="ri-user-line"></i></span>
                                    <span class="sidebar--item">Comptes</span>
                                </a>
                            </form>
                        </li>
                        <li>
                            <a href="ServletAfficherListeDemande" id="active--link">
                                <span class="icon icon-5"><i class="ri-line-chart-line"></i></span>
                                <span class="sidebar--item">Demandes</span>
                            </a>
                        </li>

                    </ul>
                    <ul class="sidebar--bottom-items">

                        <li>
                            <a href="loginAdmin.jsp">
                                <span class="icon icon-8"><i class="ri-logout-box-r-line"></i></span>
                                <span class="sidebar--item">Déconnecter</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="main--content">
            <div class="overview">
                <div class="title">
                </div>
                <div class="cards">
                    <div class="card card-1">
                        <div class="card--data">
                            <div class="card--content">
                                <h3 class="card--title">Clients</h3>
                                <h1>${totalClients}</h1>
                            </div>
                            <i class="ri-user-2-line card--icon--lg"></i>
                        </div>
                        <div class="card--stats">
                            <span><i class="ri-bar-chart-fill card--icon stat--icon"></i></span>
                            <span><i class="ri-arrow-up-s-fill card--icon up--arrow"></i></span>
                            <span><i class="ri-arrow-down-s-fill card--icon down--arrow"></i></span>
                        </div>
                    </div>
                    <div class="card card-2">
                        <div class="card--data">
                            <div class="card--content">
                                <h3 class="card--title">Comptes</h3>
                                <h1>${totalComptes}</h1>
                            </div>
                            <i class="ri-user-line card--icon--lg"></i>
                        </div>
                        <div class="card--stats">
                            <span><i class="ri-bar-chart-fill card--icon stat--icon"></i></span>
                            <span><i class="ri-arrow-up-s-fill card--icon up--arrow"></i></span>
                            <span><i class="ri-arrow-down-s-fill card--icon down--arrow"></i></span>
                        </div>
                    </div>
                    <div class="card card-3">
                        <div class="card--data">
                            <div class="card--content">
                                <h3 class="card--title">Operations</h3>
                                <h1>${totalOperations}</h1>
                            </div>
                            <i class="ri-import-fill"></i>
                            <i class="ri-calendar-2-line card--icon--lg"></i>
                        </div>
                        <div class="card--stats">
                            <span><i class="ri-bar-chart-fill card--icon stat--icon"></i></span>
                            <span><i class="ri-arrow-up-s-fill card--icon up--arrow"></i></span>
                            <span><i class="ri-arrow-down-s-fill card--icon down--arrow"></i></span>
                        </div>
                    </div>
                    <div class="card card-4">
                        <div class="card--data">
                            <div class="card--content">
                                <h3 class="card--title">Demandes</h3>
                                <h1>${totalDemandes}</h1>
                            </div>
									<i class="ri-line-chart-line card--icon--lg" ></i>
                        </div>
                        <div class="card--stats">
                            <span><i class="ri-bar-chart-fill card--icon stat--icon"></i></span>
                            <span><i class="ri-arrow-up-s-fill card--icon up--arrow"></i></span>
                            <span><i class="ri-arrow-down-s-fill card--icon down--arrow"></i></span>
                        </div>
                    </div>
                </div>
            </div>
	              
						<h1 class="section--operation" >Effectuer une Opération</h1>
					    <form action="ServletGlobal" method="get">
					        <select name="operation" id="operation">
					            <option value="depot">Dépôt</option>
					            <option value="retrait">Retrait</option>
					            <option value="virement">Virement</option>
					        </select>
					        <button type="submit">Continuer</button>
					    </form>
                    <form action="AjouterClientEtCompte.jsp" method="get">
                        <div class="title">
                            <button class="add"><i class="ri-add-line"></i>Ajouter un Client et un Compte</button>
                        </div>
                    </form>
                    <canvas id="myChart" width="400" height="200"></canvas>
                    
                 <c:if test="${not empty listCompte}">
            <div class="title">
                    <h2 class="section--title">Liste des Comptes Bancaires</h2>>
             </div>
	        <div class="table">
	        	<table>
                         <thead>
                <tr>
                    <th>ID</th>
                    <th>Numéro de Compte</th>
                    <th>Solde</th>
                    <th>Action</th> <!-- Added Action column for delete functionality -->
                </tr>
            </thead>
            <tbody>
                <c:forEach var="compte" items="${listCompte}">
                    <tr>
                     <td>${compte.id}</td>
                     <td>${compte.numero}</td>
                     <td>${compte.solde} DH</td>
                      <td>
                     <form action="ServletSupprimerCompte" method="post" onsubmit="return confirmDeletion();">
                     <input type="hidden" name="id" value="${compte.id}" />
                     <input type="hidden" name="clientId" value="${compte.clientId}" />
				       <button type="submit" class="delete-button">
						    <i class="ri-delete-bin-2-line"></i>
				        </button>
                    </form>
                    </tr>
                </c:forEach>
            </tbody>
            </table>
	        </div>
	        </c:if>
	         <c:if test="${not empty listClient}">
            <div class="title">
                    <h2 class="section--title">Liste des Clients </h2>>
             </div>
	        <div class="table">
	        	<table>
                         <thead>
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Prénom</th>
                    <th>CNE</th>
                    <th>Email</th>
                    <th>Téléphone</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
               <c:forEach var="client" items="${listClient}">
                    <tr>
                        <td>${client.id}</td>
                        <td>${client.nom}</td>
                        <td>${client.prenom}</td>
                         <td>${client.CNE}</td>
                        <td>${client.email}</td>
                        <td>${client.tel}</td>
                        <td><a href="ServletClientModifier?id=${client.id}"><i class="ri-sound-module-line"></i></a></td>
                    </tr>
                </c:forEach>
            </tbody>
            </table>
	        </div>
	        </c:if>
    <c:if test="${not empty operations}">
            <div class="title">
                      <h1>Liste des Opérations Bancaires</h1>
             </div>
	        <div class="table">
	        	<table>
                         <thead>
                <tr>
                     <th>ID</th>
                    <th>Type</th>
                    <th>Montant</th>
                    <th>Date</th>
                    <th>ID Compte</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="operation" items="${operations}">
                    <tr>
                        <td>${operation.id}</td>
                        <td>${operation.type}</td>
                        <td>${operation.montant} DH</td>
                        <td>${operation.date}</td>
                        <td>${operation.compteId}</td>
                    </tr>
                </c:forEach>
            </tbody>
            </table>
	        </div>
	        </c:if> 
	        <c:if test="${not empty demandes}">
            <div class="title">
				<h1>Liste des Demandes</h1>             
				</div>
	        <div class="table">
	        	<table>
                <thead>
                <tr>
                    <th>ID</th>
		            <th>Username</th>
		            <th>Email</th>
		            <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="demande" items="${demandes}">
                    <tr>
                        <td>${demande.id}</td>
		                <td>${demande.username}</td>
		                <td>${demande.email}</td>
		                <td>
				               <form action="ServletAccepterouRefuser" method="post" style="display:inline;">
							  <input type="hidden" name="demandeId" value="${demande.id}">
							  <input type="hidden" name="action" value="accepter">
							  <button type="submit" class="accept-button">
							    Accepter
							  </button>
							</form>
							<form action="ServletAccepterouRefuser" method="post" style="display:inline;">
							  <input type="hidden" name="demandeId" value="${demande.id}">
							  <input type="hidden" name="action" value="refuser">
							  <button type="submit" class="refuse-button">
							    Refuser
							  </button>
							</form>
		                </td>
                    </tr>
                </c:forEach>
            </tbody>
            </table>
	        </div>
	        </c:if> 
	</div>                 
</section>
   <script type="text/javascript">
   let menu = document.querySelector('.menu')
   let sidebar = document.querySelector('.sidebar')
   let mainContent = document.querySelector('.main--content')
   menu.onclick = function() {
       sidebar.classList.toggle('active')
       mainContent.classList.toggle('active')
   }
   function showRefusalConfirmation() {
	   Swal.fire({
	     position: "top-end",
	     icon: "success",  // Change to "error" for a more appropriate icon
	     title: "Demande refusée",  // Update message to reflect refusal
	     showConfirmButton: false,
	     timer: 1500
	   });
	 }
   
   
   </script>
 
</body>
</html>
