<%@include file="./database/connect.jsp" %>

<%
    String query = String.format("SELECT saldo FROM MsUser WHERE userID LIKE %s", session.getAttribute("userID").toString());
    ResultSet result = st.executeQuery(query);
    result.next();

    int saldo = result.getInt("saldo");

    query = "SELECT * FROM MsAvatar WHERE avatarID > 4";
    result = st.executeQuery(query);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Avatar Shop</title>

    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/home.css">
    <link rel="stylesheet" href="./css/avatar.css">

    <script src="js/javascript.js"></script>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <section>
        <p class="title">Our Avatar Collection</p>
        
        <p style="color:red;text-align: center;font-size: 20px;background-color: white;"><% if(request.getParameter("err") != null) out.println(request.getParameter("err")); %></p>
        
        <p style="color:green;text-align: center;font-size: 20px;background-color: white;"><% if(request.getParameter("msg") != null) out.println(request.getParameter("msg")); %></p>
        
        <div class="cards">
            <%
                while(result.next()){
            %>
                <div class="card">
                    <center>
                        <img class="avatar-img" src="./assets/avatar/<%= result.getString("avatar") %>" alt="">
                        <p class="price">PRICE : <%= result.getString("price") %></p>
                        <div class="button"><a href="./controller/buyAvatarController.jsp?avatarID=<%= result.getString("avatarID") %>">Buy This!</a></div>
                        <div class="button gift"><a href="./sendGift.jsp?avatarID=<%= result.getString("avatarID") %>">Send this as Gift</a></div>
                    </center>
                </div>
            <%
                }
            %>
        </div>
    </section>

    <%@ include file="footer.jsp" %>
</body>
</html>
<% con.close(); %>