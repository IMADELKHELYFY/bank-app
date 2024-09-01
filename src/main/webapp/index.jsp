<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Îndex</title>
<style type="text/css">
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body,
html {
    height: 100%;
}

.header {
    position: absolute;
    top: 0;
    width: 100%;
    height: 60px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 40px;
    background: rgba(255, 255, 255, 0.3);
    /* Header transparent */
    backdrop-filter: blur(10px);
    /* Optional: blur background behind header */
    z-index: 1000;
}

.logo {
    display: flex;
    align-items: center;
}

.logo span {
    color: #5073fb;
}

.header--items {
    display: flex;
    align-items: center;
    
}

.hero {
    position: relative;
    height: 100vh;
    overflow: hidden;
}

.hero--video {
    width: 100%;
    height: 100%;
    object-fit: cover;
    pointer-events: none;
}

.hero--text--cover {
    position: absolute;
    top: 0;
    left: 0;
    height: 50%;
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: rgba(0, 0, 0, 0.3);
}

.hero--text {
    text-align: center;
    color: #fff;
}

.hero--text h1 {
    font-size: 5rem;
    margin-bottom: 1rem;
}

.hero--text p {
    font-size: 1.5rem;
    margin-bottom: 2rem;
}

.btn {
    display: inline-block;
    padding: 0.5rem 2rem;
    background-color: blue;
    font-size: 1.1rem;
    text-decoration: none;
    color: white;
    border-radius: 3rem;
    cursor: pointer;
    text-align: right;
}

.btn:hover {
    background-color: #8e00c9;
    box-shadow: white;
}

.dark--theme--btn {
    display: flex;
    align-items: center;
}

.dark--theme--btn i {
    cursor: pointer;
    margin: 0 5px;
    font-size: 1.5rem;
}
</style>
</head>
<body>
    <header class="header">
        <div class="logo">
            <i class="ri-menu-line icon icon-0 menu"></i>
            <h2>IMAD<span>Banque</span></h2>
        </div>
        <div class="hero--text">
            <form action="login.jsp">
                <button type="submit" class="btn">Connexion</button>
            </form>
        </div>
    </header>

    <section class="hero">
        <video class="hero--video" muted autoplay loop playsinline>
            <source src="v1.mp4" type="video/mp4">
        </video>
    </section>

    <script>
        // Fallback for browsers or environments that do not recognize 'playsinline'
        document.querySelector('video').setAttribute('playsinline', '');
    </script>
</body>
</html>