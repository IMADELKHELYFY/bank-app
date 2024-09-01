<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/login.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/test.css">
    <title>Signin-Signup</title>
    <style type="text/css">
        @charset "ISO-8859-1";
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            background: #444;
            background-image: url("back.jpg");
            background-size: cover;
        }
        .container {
            position: relative;
            width: 70vw;
            height: 80vh;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 20px 0 rgba(0, 0, 0, 0.3), 0 6px 20px 0 rgba(0, 0, 0, 0.3);
            overflow: hidden;
        }
        .container::before {
            content: "";
            position: absolute;
            top: 0;
            left: -50%;
            width: 100%;
            height: 100%;
            background: linear-gradient(-45deg, #df4adf, #520852);
            z-index: 6;
            transform: translateX(100%);
            transition: 1s ease-in-out;
        }
        .signin-signup {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: space-around;
            z-index: 5;
        }
        form {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            width: 40%;
            min-width: 238px;
            padding: 0 10px;
            background: rgba(255, 255, 255, 0.52);
            border-radius: 16px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(8.2px);
            -webkit-backdrop-filter: blur(8.2px);
        }
        form.sign-in-form {
            opacity: 1;
            transition: 0.5s ease-in-out;
            transition-delay: 1s;
        }
        form.sign-up-form {
            opacity: 0;
            transition: 0.5s ease-in-out;
            transition-delay: 1s;
        }
        .title {
            font-size: 35px;
            color: #df4adf;
            margin-bottom: 10px;
        }
        .input-field {
            width: 100%;
            height: 50px;
            background: #f0f0f0;
            margin: 10px 0;
            border: 2px solid #df4adf;
            border-radius: 50px;
            display: flex;
            align-items: center;
        }
        .input-field i {
            flex: 1;
            text-align: center;
            color: #666;
            font-size: 18px;
        }
        .input-field input,
        .input-field select {
            flex: 5;
            background: none;
            border: none;
            outline: none;
            width: 100%;
            font-size: 18px;
            font-weight: 600;
            color: #444;
        }
        .input-field select {
            padding-left: 15px;
            appearance: none; /* Remove default dropdown arrow */
        }
        .input-field::after {
            content: '\f107'; /* FontAwesome arrow down */
            font-family: 'FontAwesome';
            position: absolute;
            right: 20px;
            font-size: 16px;
            color: #666;
        }
        .btn {
            width: 150px;
            height: 50px;
            border: none;
            border-radius: 50px;
            background: #df4adf;
            color: #fff;
            font-weight: 600;
            margin: 10px 0;
            text-transform: uppercase;
            cursor: pointer;
        }
        .btn:hover {
            background: #c03cc0;
        }
        .social-text {
            margin: 10px 0;
            font-size: 16px;
        }
        .social-media {
            display: flex;
            justify-content: center;
        }
        .social-icon {
            height: 45px;
            width: 45px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #444;
            border: 1px solid #444;
            border-radius: 50px;
            margin: 0 5px;
        }
        .social-icon:hover {
            color: #df4adf;
            border-color: #df4adf;
        }
        a {
            text-decoration: none;
        }
        .panels-container {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: space-around;
        }
        .panel {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-around;
            width: 35%;
            min-width: 238px;
            padding: 0 10px;
            text-align: center;
            z-index: 6;
        }
        .left-panel {
            pointer-events: none;
        }
        .content {
            color: #fff;
            transition: 1.1s ease-in-out;
            transition-delay: 0.5s;
        }
        .panel h3 {
            font-size: 24px;
            font-weight: 600;
        }
        .panel p {
            font-size: 15px;
            padding: 10px 0;
        }
        .image {
            width: 100%;
            transition: 1.1s ease-in-out;
            transition-delay: 0.4s;
        }
        .left-panel .image,
        .left-panel .content {
            transform: translateX(-200%);
        }
        .right-panel .image,
        .right-panel .content {
            transform: translateX(0);
        }
        .account-text {
            display: none;
        }
        /*Animation*/
        .container.sign-up-mode::before {
            transform: translateX(0);
        }
        .container.sign-up-mode .right-panel .image,
        .container.sign-up-mode .right-panel .content {
            transform: translateX(200%);
        }
        .container.sign-up-mode .left-panel .image,
        .container.sign-up-mode .left-panel .content {
            transform: translateX(0);
        }
        .container.sign-up-mode form.sign-in-form {
            opacity: 0;
        }
        .container.sign-up-mode form.sign-up-form {
            opacity: 1;
        }
        .container.sign-up-mode .right-panel {
            pointer-events: none;
        }
        .container.sign-up-mode .left-panel {
            pointer-events: all;
        }
        /*Responsive*/
        @media (max-width:779px) {
            .container {
                width: 100vw;
                height: 100vh;
            }
        }
        @media (max-width:635px) {
            .container::before {
                display: none;
            }
            form {
                width: 80%;
            }
            form.sign-up-form {
                display: none;
            }
            .container.sign-up-mode2 form.sign-up-form {
                display: flex;
                opacity: 1;
            }
            .container.sign-up-mode2 form.sign-in-form {
                display: none;
            }
            .panels-container {
                display: none;
            }
            .account-text {
                display: initial;
                margin-top: 30px;
            }
        }
        @media (max-width:320px) {
            form {
                width: 90%;
            }
        }
    </style>
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function() {
            const sign_in_btn = document.querySelector("#sign-in-btn");
            const sign_up_btn = document.querySelector("#sign-up-btn");
            const container = document.querySelector(".container");
            const sign_in_btn2 = document.querySelector("#sign-in-btn2");
            const sign_up_btn2 = document.querySelector("#sign-up-btn2");
            
            sign_up_btn.addEventListener("click", () => {
                container.classList.add("sign-up-mode");
            });
            sign_in_btn.addEventListener("click", () => {
                container.classList.remove("sign-up-mode");
            });
            sign_up_btn2.addEventListener("click", () => {
                container.classList.add("sign-up-mode2");
            });
            sign_in_btn2.addEventListener("click", () => {
                container.classList.remove("sign-up-mode2");
            });
        });
    </script>
</head>
<body>
    
    <div class="container">
        <div class="signin-signup">
            <form action="loginServlet" method="post" class="sign-in-form"> 
                <h2 class="title">Se connecter</h2>
                <div class="input-field">
                    <i class="fas fa-user"></i>
                    <input type="text" placeholder="Username" name="username" required>
                </div>
                <div class="input-field">
                    <i class="fas fa-lock"></i>
                    <input type="password" placeholder="Password" name="password" required>
                </div>
                
                <input type="submit" value="Login" class="btn">
                <p class="account-text">Don't have an account? <a href="#" id="sign-up-btn2">S'inscrire</a></p>
            </form>
            <form action="inscrireServlet" class="sign-up-form" method="get">
                <h2 class="title">S'inscrire</h2>
                <div class="input-field">
                    <i class="fas fa-user"></i>
                    <input type="hidden" name="id">
                    <input type="text" placeholder="Username" name="username" required>
                </div>
                <div class="input-field">
                    <i class="fas fa-envelope"></i>
                    <input type="text" placeholder="Email" name="email" required>
                </div>
                <div class="input-field">
                    <i class="fas fa-lock"></i>
                    <input type="password" placeholder="Password" name="password" required>
                </div>
                <input type="submit" value="S'inscrire" class="btn">
                <p class="account-text">Already have an account? <a href="#" id="sign-in-btn2">Se connecter</a></p>
            </form>
        </div>
        <div class="panels-container">
            <div class="panel left-panel">
                <div class="content">
                    <h3>Membre de la Banque?</h3>
                    <button class="btn" id="sign-in-btn">Se connecter</button>
                </div>
                <img src="Sign_in.png" alt="" class="image">
            </div>
            <div class="panel right-panel">
                <div class="content">
                    <h3>Nouveau sur Notre Banque ?</h3>
                    <button class="btn" id="sign-up-btn">S'inscrire</button>
                </div>
                <img src="sign_up.png" alt="" class="image">
            </div>
        </div>
    </div>
</body>
</html>
