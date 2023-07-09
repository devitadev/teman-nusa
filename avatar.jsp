<%@include file="./database/connect.jsp" %>

<%
    String query = "SELECT * FROM TrUserAvatar JOIN MsAvatar ON MsAvatar.avatarID=TrUserAvatar.avatarID WHERE userID=" + session.getAttribute("userID");
    ResultSet result = st.executeQuery(query);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bidang Pekerjaan</title>

    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/home.css">
    <link rel="stylesheet" href="./css/avatar.css">

    <script src="js/javascript.js"></script>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <section>
        <p class="title">Your Avatar Collection</p>

        <div class="button shop"><a class="shop" href="./avatarShop.jsp">Shop For More Avatar</a></div>

        <p style="color:red;text-align: center;font-size: 20px;background-color: white;"><% if(request.getParameter("err") != null) out.println(request.getParameter("err")); %></p>
        
        <div class="cards">
            <%
                while(result.next()){
            %>
                <div class="card">
                    <center>
                        <img class="avatar-img" src="./assets/avatar/<%= result.getString("avatar") %>" alt="">
                        <div class="button"><a href="./controller/changeAvatar.jsp?id=<%= result.getString("TrUserAvatar.avatarID") %>">Use this Avatar !</a></div>
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