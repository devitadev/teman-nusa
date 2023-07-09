<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/login.css">

    <script src="js/javascript.js"></script>
    <script src="js/login.js"></script>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <section>
        <div class="wrapper">
            <p class="title">Login</p>
            <form action="controller/loginController.jsp" name="formLogin" method="post" onsubmit="return(validateLogin())">
                <p class="label">Email :</p>
                <input type="text" name="email" placeholder="Email">
                <p class="errMsg" id="errEmail">email harus diisi</p>
                
                <p class="label">Password :</p>
                <input type="password" name="password" placeholder="Password">
                <p class="errMsg" id="errPassword">password harus diisi</p>
  
                <button>Login</button>
                <p style="color:red;"><% if(request.getParameter("err") != null) out.println(request.getParameter("err")); %></p>
            </form>
            <div class="register">
                <p>dont have an account yet?</p>
                <a href="./register.jsp">register</a>
            </div>
        </div>
    </section>

    <%@ include file="footer.jsp" %>
</body>
</html>