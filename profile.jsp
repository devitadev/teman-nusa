<%@include file="./database/connect.jsp" %>

<%
    String userID = request.getParameter("id");
    String myID = session.getAttribute("userID").toString();

    String query = String.format("SELECT status FROM TrWishlist WHERE userID LIKE %s AND wishUserID LIKE %s", userID, myID);
    ResultSet result = st.executeQuery(query);
    String connected = "false";
    if (result.next()) connected = result.getString("status");

    query = String.format("SELECT MsUser.userID, nama, usernameLinkedin, profesi, bidangPekerjaan, avatar FROM MsUser JOIN MsMinat ON MsMinat.userID=MsUser.userID JOIN MsBidangPekerjaan ON MsBidangPekerjaan.bidangPekerjaanID=MsMinat.bidangPekerjaanID JOIN MsAvatar ON MsUser.avatarID=MsAvatar.avatarID WHERE MsUser.userID LIKE %s", userID);
    result = st.executeQuery(query);

    if(result.next()){
%>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile</title>

        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="./css/profile.css">

        <script src="js/javascript.js"></script>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        
        <section>
            <p class="title"><%= result.getString("nama") %></p>

            <%
                if(connected.equals("true")){
            %>
                    <div>
                        <center>
                            <p class="status">Connected</p>
                            <div class="icon-wrapper">
                                <a href="./chat.jsp?id=<%= userID %>&nama=<%= result.getString("nama") %>"><img class="icon" src="./assets/chat.png" alt=""></a>
                                <a href=""><img class="icon" src="./assets/video-call.png" alt=""></a>
                            </div>
                        </center>
                    </div>
            <%
                }
            %>

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
                
                <br><br>
                <a class="wishlist-button" href="./controller/addWishlistController.jsp?id=<%= userID %>"><img src="./assets/wishlist.svg.png" alt="">Add to Wishlist</a>
                <p style="color:red;margin-top: 20px;"><% if(request.getParameter("err") != null) out.println(request.getParameter("err")); %></p>
            </center>
        </section>

        <%@ include file="footer.jsp" %>
    </body>
    </html>
<%
    }
    con.close();
%>