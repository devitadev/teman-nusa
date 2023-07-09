<%@include file="./database/connect.jsp" %>

<%
    String userID = session.getAttribute("userID").toString();
    String query = String.format("SELECT wishUserID, status, nama, profesi, bidangPekerjaan, usernameLinkedin, gender, avatar FROM TrWishlist JOIN MsUser ON MsUser.userID=TrWishlist.wishUserID JOIN MsAvatar ON MsUser.avatarID=MsAvatar.avatarID JOIN MsMinat ON MsUser.userID=MsMinat.userID JOIN MsBidangPekerjaan ON MsBidangPekerjaan.bidangPekerjaanID=MsMinat.bidangPekerjaanID WHERE TrWishlist.userID LIKE %s ORDER BY wishUserID", userID);
    ResultSet result = st.executeQuery(query);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>wishlist</title>

    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/home.css">
    <link rel="stylesheet" href="./css/status.css">

    <script src="js/javascript.js"></script>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <section>
        <p class="title">My Wishlist</p>
        <div class="cards">
            <%
                while(result.next()){
                    int wishUserID = result.getInt("wishUserID");
                    String href = String.format("./profile.jsp?id=%d", wishUserID);
            %>
                    <a class="card" href="<%= href %>">
                        <center>
                            <img class="user-avatar" src="./assets/avatar/<%= result.getString("avatar") %>" alt="">
                            <div class="user-profile">
                                <p><%= result.getString("nama") %></p>
                                <p><%= result.getString("profesi") %></p>
                                <p><%= result.getString("bidangPekerjaan") %>
                                    <%
                                        while(result.next()){
                                            if(result.getInt("wishUserID") == wishUserID){
                                                out.println(" - " + result.getString("bidangPekerjaan"));
                                            }
                                            else{
                                                break;
                                            }
                                        }
                                    %>
                                </p>
                                <%
                                    result.previous();
                                    if(result.getString("status").equals("true")) {
                                %>
                                        <p class="status">Connected</p>
                                <%
                                    }
                                    else{
                                %>
                                        <p class="status">Not Connected</p>
                                <%
                                    }
                                %>
                            </div>
                        </center>
                    </a>
            <%
                }
            %>
        </div>
    </section>

    <%@ include file="footer.jsp" %>
</body>
</html>
<% con.close(); %>