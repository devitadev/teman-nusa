<%@include file="./database/connect.jsp" %>

<%
    String nama = request.getParameter("nama");
    String profesi = request.getParameter("profesi");
    String usernameLinkedin = request.getParameter("usernameLinkedin");
    String email = request.getParameter("email");
    String nomorHandphone = request.getParameter("nomorHandphone");
    String gender = request.getParameter("gender");
    String[] bidangPekerjaan = request.getParameterValues("bidangPekerjaan");
    String password = request.getParameter("password");
    int price = Integer.parseInt(request.getParameter("price"));

    String query = String.format("SELECT * FROM MsUser WHERE email LIKE '%s'", email);
    ResultSet result = st.executeQuery(query);

    if(result.next()) response.sendRedirect("register.jsp?err=email ini sudah terdaftar sebelumnya");
    else {
%>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>register</title>

        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="./css/payment.css">

        <script src="js/javascript.js"></script>
        <script src="js/payment.js"></script>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        
        <section>
            <p class="title">Payment</p>
            <form action="./controller/registerController.jsp" name="formPayment" method="post" onsubmit="return(validatePayment())">
                <input type="hidden" name="nama" value="<%= nama %>">
                <input type="hidden" name="profesi" value="<%= profesi %>">
                <input type="hidden" name="usernameLinkedin" value="<%= usernameLinkedin %>">
                <input type="hidden" name="email" value="<%= email %>">
                <input type="hidden" name="nomorHandphone" value="<%= nomorHandphone %>">
                <input type="hidden" name="gender" value="<%= gender %>">
                <input type="hidden" name="password" value="<%= password %>">
                <% for(int i=0; i<bidangPekerjaan.length; i++){ %>
                    <input type="hidden" name="bidangPekerjaan" value="<%= bidangPekerjaan[i] %>">
                <% } %>
                
                <div class="inline">
                    <p class="price">PRICE : </p>
                    <input class="readonly" type="text" name="price" value="<%= price %>" readonly>
                </div>
                
                <p class="label">Masukan Jumlah Payment :</p>
                <input class="payment" type="number" name="payment">
                <p id="errPayment" class="errMsg">pembayaran harus diisi</p>

                <button>Pay</button>
            </form>
        </section>

        <%@ include file="footer.jsp" %>
    </body>
    </html>
<%
    }
    con.close();
%>