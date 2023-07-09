<%@include file="./database/connect.jsp" %>

<%
    String query = "SELECT MsUser.userID, nama, profesi, bidangPekerjaan, avatar, visible FROM MsUser JOIN MsMinat ON MsMinat.userID=MsUser.userID JOIN MsBidangPekerjaan ON MsBidangPekerjaan.bidangPekerjaanID=MsMinat.bidangPekerjaanID JOIN MsAvatar ON MsUser.avatarID=MsAvatar.avatarID ORDER BY MsUser.userID";
    ResultSet result = st.executeQuery(query);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>

    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/home.css">

    <script src="js/javascript.js"></script>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <section>
        <p class="title">Our Members</p>
        <div class="cards">
            <%
                while(result.next()){
                    int userID = result.getInt("MsUser.userID");

                    String href;
                    if(session.getAttribute("userID") == null) href = "./login.jsp";
                    else href = String.format("./profile.jsp?id=%s", result.getString("userID"));

                    if (result.getString("visible").equals("true")){
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
                                                if(result.getInt("MsUser.userID") == userID){
                                                    out.println(" - " + result.getString("bidangPekerjaan"));
                                                }
                                                else{
                                                    result.previous();
                                                    break;
                                                }
                                            }
                                        %>
                                    </p>
                                </div>
                            </center>
                        </a>
            <%
                    }
                }
            %>
        </div>
    </section>

    <%@ include file="footer.jsp" %>
</body>
</html>
<% con.close(); %>