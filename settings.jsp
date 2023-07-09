<%@include file="./database/connect.jsp" %>

<%
    String userID = session.getAttribute("userID").toString();
    
    String query = String.format("SELECT MsUser.userID, nama, usernameLinkedin, profesi, bidangPekerjaan, avatar, MsUser.avatarID, visible FROM MsUser JOIN MsMinat ON MsMinat.userID=MsUser.userID JOIN MsBidangPekerjaan ON MsBidangPekerjaan.bidangPekerjaanID=MsMinat.bidangPekerjaanID JOIN MsAvatar ON MsUser.avatarID=MsAvatar.avatarID WHERE MsUser.userID LIKE %s", userID);
    ResultSet result = st.executeQuery(query);
    result.next();

    String visible = result.getString("visible");
    String avatarID = "0";
    if(visible.equals("true")) avatarID = result.getString("MsUser.avatarID");
    
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bidang Pekerjaan</title>

    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/settings.css">

    <script src="js/javascript.js"></script>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <section>
        <p class="title">Settings</p>

        <center>
            <img class="user-avatar" src="./assets/avatar/<%= result.getString("avatar") %>" alt="">
            
            <p class="label">Profesi :</p>
            <p><%= result.getString("profesi") %></p>

            <p class="label">Linkedin :</p>
            <a href=" https://www.linkedin.com/in/<%= result.getString("usernameLinkedin") %>">https://www.linkedin.com/in/<%= result.getString("usernameLinkedin") %></a>

            <p class="label">Bidang Pekerjaan Yang Diminati :</p>
            <p><%= result.getString("bidangPekerjaan") %></p>
            <%
                while(result.next()){
            %>
                <p><%= result.getString("bidangPekerjaan") %></p>
            <%
                }
            %>

            <p class="label">Visible Status :</p>
            <p><%= visible %></p>
            
            <%
                if(visible.equals("true")){
            %>
                    <div class="visible-button"><a href="./controller/hideUserController.jsp?avatarID=<%= avatarID %>">Hide</a></div>
            <%
                }
                else{
            %>
                    <div class="visible-button"><a href="./controller/showUserController.jsp">Show</a></div>
            <%
                }
            %>

            <p style="color:red;text-align: center;font-size: 18px;"><% if(request.getParameter("err") != null) out.println(request.getParameter("err")); %></p>
        </center>
    </section>

    <%@ include file="footer.jsp" %>
</body>
</html>
<% con.close(); %>