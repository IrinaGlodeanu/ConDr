
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up Form</title>
    <link rel="stylesheet" href="css/normalize.css">
    <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/forReg.css">
</head>
<body>

<form action="registerServlet" method="post">

    <h1>Sign Up</h1>

    <fieldset>
        <legend><span class="number">1</span>Bine ati venit!</legend>
        <label>Nume:</label>
        <input type="text" name="user_nume">

        <label >Prenume:</label>
        <input type="text" name="user_prenume">

        <label >Email:</label>
        <input type="email"  name="user_email">

        <label>Parola dorita:</label>
        <input type="password" name="user_parola">

    </fieldset>

    <fieldset>
        <legend><span class="number">2</span>Profilul tau</legend>
    </fieldset>
    <label>Data nasterii:</label>
    <input type="date" name="user_nastere">
    <button type="submit">Sign Up</button>
</form>

<script src="js/jquery.js"></script>
<script src="js/moment.js"></script>
<script src="js/combodate.js"></script>
</body>
</html>
