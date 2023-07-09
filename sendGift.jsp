<%@include file="./database/connect.jsp" %>

<%
    String userID = session.getAttribute("userID").toString();
    String query = String.format("SELECT saldo FROM MsUser WHERE userID LIKE %s", userID);
    ResultSet result = st.executeQuery(query);
    result.next();
    int saldo = result.getInt("saldo");

    String avatarID = request.getParameter("avatarID");
    query = String.format("SELECT price FROM MsAvatar WHERE avatarID LIKE %s", avatarID);
    result = st.executeQuery(query);
    result.next();
    int price = result.getInt("price");

    if(saldo - price < 0){
        response.sendRedirect("avatarShop.jsp?err=saldo anda tidak cukup. silahkan melakukan topup terlebih dahulu");
    }
    else{
        query = String.format("SELECT wishUserID, status, nama, profesi, bidangPekerjaan, usernameLinkedin, gender, avatar FROM TrWishlist JOIN MsUser ON MsUser.userID=TrWishlist.wishUserID JOIN MsAvatar ON MsUser.avatarID=MsAvatar.avatarID JOIN MsMinat ON MsUser.userID=MsMinat.userID JOIN MsBidangPekerjaan ON MsBidangPekerjaan.bidangPekerjaanID=MsMinat.bidangPekerjaanID WHERE TrWishlist.userID LIKE %s ORDER BY wishUserID", userID);
        result = st.executeQuery(query);
%>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Send Gift</title>

        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="./css/sendGift.css">

        <script src="js/javascript.js"></script>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        
        <section>
            <p class="title">Send Gift</p>
            <p style="color:red;text-align: center;font-size: 20px;background-color: white;"><% if(request.getParameter("err") != null) out.println(request.getParameter("err")); %></p>
        
            <div class="cards">
                <%
                    while(result.next()){
                        int wishUserID = result.getInt("wishUserID");
                        String href = String.format("./controller/sendGiftController.jsp?avatarID=%s&userID=%s&price=%d", avatarID, wishUserID, price);
                %>
                        <div class="card-wrapper">
                            <a class="card" href="<%= href %>">
                                <div class="inline">
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
                                    </div>
                                </div>
                            </a>
                        </div>
                <%
                    }
                %>
            </div>
        </section>

        <%@ include file="footer.jsp" %>
    </body>
    </html>
<%
    }
    con.close();
%>