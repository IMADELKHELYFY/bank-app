<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css">
    <title>Admin Login</title>
    <style type="text/css">
    /* Reset default styles and set the font */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

/* Remove underlines from links */
a {
    text-decoration: none;
}
/* Create a centered, dark-themed container */
body {
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 100vh;
    background: #333;
}

.container {
    width: 350px;
    height: 500px;
    background: #333;
    box-shadow: 10px 20px 20px 0 rgba(0, 0, 0, 0.4), -10px 20px 20px 0 rgba(0, 0, 0, 0.4), 0 -2px 20px 0 rgba(0, 0, 0, 0.5);
    display: flex;
    align-items: center;
    justify-content: center;
}
/* Style the grid layout containing forms */
.signin-signup {
    display: grid;
    grid-template-columns: 1fr;
}

/* Style the forms and hide the sign-up form initially */
form {
    grid-column: 1 / 2;
    grid-row: 1/2;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
}

form.sign-up-form {
    visibility: hidden;
}

/* Style form titles, input fields, icons, and buttons */
.title {
    font-size: 35px;
    color: #999;
    margin-bottom: 10px;
}

.input-field {
    width: 280px;
    height: 50px;
    border-bottom: 2px solid #999;
    margin: 10px 0;
    display: flex;
    align-items: center;
}

.input-field i {
    flex: 1;
    text-align: center;
    font-size: 20px;
    color: #999;
}

.input-field input {
    flex: 5;
    border: none;
    outline: none;
    background: none;
    font-size: 18px;
    color: #f0f0f0;
    font-weight: 600;
}

/* Style paragraphs and links */
p,
a {
    font-size: 14px;
    color: #999;
}

.forgot-password {
    align-self: flex-end;
}

.btn {
    width: 130px;
    height: 40px;
    background: none;
    outline: none;
    border: 2px solid #999;
    text-transform: uppercase;
    font-size: 18px;
    font-weight: 600;
    margin: 20px 0;
    color: #999;
}

.btn:hover {
    color: #333;
    border: none;
    background: #999;
}

.account-text {
    color: #f0f0f0;
}

/* Make the sign-up form visible when in sign-up mode */
.container.sign-up-mode form.sign-up-form {
    visibility: visible;
}

/* Hide the sign-in form when in sign-up mode */
.container.sign-up-mode form.sign-in-form {
    visibility: hidden;
}
/* Adjust container styles for smaller screens */
@media (max-width: 400px) {
    .container {
        width: 100vw;
        height: 100vh;
    }
}
    </style>
</head>
<body>
    <div class="container">
        <div class="signin-signup">
            <form action="loginAdmin" method="post" class="sign-in-form">
                <h2 class="title">Se connecter</h2>
                <div class="input-field">
                    <i class="fas fa-user"></i>
                    <input type="text" placeholder="username" name="username">
                </div>
                <div class="input-field">
                    <i class="fas fa-lock"></i>
                    <input type="password" placeholder="Password" name="password">
                </div>
                <input type="submit" value="Login" class="btn">
                 </div>
                  
                  <script type="text/javascript">
                  const sign_in_link = document.querySelector("#sign-in-link");
                  const sign_up_link = document.querySelector("#sign-up-link");
                  const container = document.querySelector(".container");

                  sign_up_link.addEventListener("click", () => {
                      container.classList.add("sign-up-mode");
                  })

                  sign_in_link.addEventListener("click", () => {
                      container.classList.remove("sign-up-mode");
                  })
                  </script>
</body>
</html>