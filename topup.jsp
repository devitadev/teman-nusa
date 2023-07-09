<%@include file="./database/connect.jsp" %>

<%
    String query = String.format("SELECT saldo FROM MsUser WHERE userID LIKE %s", session.getAttribute("userID").toString());
    ResultSet result = st.executeQuery(query);
    result.next();

    int saldo = result.getInt("saldo");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Topup</title>

    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/topup.css">

    <script src="js/javascript.js"></script>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <section>
        <p class="title">Topup</p>

        <p class="saldo">Saldo : <%= saldo %></p>

        <div class="button-topup"><a href="./controller/topupController.jsp">Topup</a></div>
    </section>

    <%@ include file="footer.jsp" %>
</body>
</html>
<% con.close(); %>