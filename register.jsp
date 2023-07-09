<%@include file="./database/connect.jsp" %>
<%@page import="java.util.*" %>

<%
    Random rand = new Random();
    int price = rand.nextInt(25001) + 100000;

    String query = "SELECT * FROM MsBidangPekerjaan";
    ResultSet result = st.executeQuery(query);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>register</title>

    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/register.css">

    <script src="js/javascript.js"></script>
    <script src="js/register.js"></script>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <section>
        <div class="wrapper">
            <p class="title">Register</p>
            <form action="./payment.jsp" method="post" name="formRegister" onsubmit="return(validateRegister())">
                <p class="label">Nama :</p>
                <input type="text" name="nama" placeholder="Nama">
                <p id="errNama" class="errMsg">nama harus diisi</p>

                <p class="label">Profesi :</p>
                <input type="text" name="profesi" placeholder="Profesi">
                <p id="errProfesi" class="errMsg">profesi harus diisi</p>

                <p class="label">Username Linkedin :</p>
                <input type="text" name="usernameLinkedin" placeholder="Username Linkedin">
                <p id="errUsernameLinkedin" class="errMsg">username linkedin harus diisi</p>

                <p class="label">Email :</p>
                <input type="text" name="email" placeholder="Email">
                <p id="errEmail" class="errMsg">email harus diisi</p>
                <p style="color:red;"><% if(request.getParameter("err") != null) out.println(request.getParameter("err")); %></p>
               
                <p class="label">Nomor Handphone :</p>
                <input type="text" name="nomorHandphone" placeholder="Nomor Handphone">
                <p id="errNomorHandphone1" class="errMsg">nomor handphone harus diisi</p>
                <p id="errNomorHandphone2" class="errMsg">nomor handphone harus angka</p>

                <p class="label">Gender :</p>
                <div class="inline">
                    <input type="radio" name="gender" value="laki-laki">
                    <p>Laki-laki</p> 
                    <input type="radio" name="gender" value="perempuan">
                    <p>Perempuan</p>
                </div>
                <p id="errGender" class="errMsg">gender harus dipilih</p>

                <p class="label">Bidang Pekerjaan Yang Diminati :</p>
                <%
                    while(result.next()){
                %>
                        <div class="inline">
                            <input type="checkbox" name="bidangPekerjaan" value="<%= result.getInt("bidangPekerjaanID") %>" id="">
                            <p><%= result.getString("bidangPekerjaan") %></p>
                        </div>
                <%
                    }
                %>
                <p id="errBidangPekerjaan" class="errMsg">bidang pekerjaan harus dipilih minimal 3</p>
                
                <p class="label">Password :</p>
                <input type="password" name="password" placeholder="Password">
                <p id="errPassword" class="errMsg">password harus diisi</p>

                <p class="label">Confirm Password :</p>
                <input type="password" name="confirmPassword" placeholder="Confirm Password">
                <p id="errConfirmPassword" class="errMsg">confirm password harus sama dengan password</p>
                
                <div class="inline price-wrapper">
                    <p class="price">PRICE : </p>
                    <input class="readonly" type="text" name="price" value="<%= price %>" readonly>
                </div>
                
                <button>Register</button>
            </form>

            <div class="login">
                <p>already have an account?</p>
                <a href="./login.jsp">login</a>
            </div>
        </div>
    </section>

    <%@ include file="footer.jsp" %>
</body>
</html>
<% con.close(); %>