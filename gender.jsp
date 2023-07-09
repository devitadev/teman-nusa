<%@include file="./database/connect.jsp" %>

<%
    String[] gender = request.getParameterValues("gender");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gender</title>

    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/home.css">
    <link rel="stylesheet" href="./css/browse.css">

    <script src="js/javascript.js"></script>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <section>
        <p class="title">Browse by Gender</p>

        <form action="">
            <p class="label">Gender :</p>
            <div class="inline">
                <input type="checkbox" name="gender" value="Laki-laki" id="">
                <p>Laki-laki</p>
            </div>
            <div class="inline">
                <input type="checkbox" name="gender" value="Perempuan" id="">
                <p>Perempuan</p>
            </div>
            <button>Search</button>
        </form>

        <div class="cards">
            <%
                if(gender != null){
                    String query;
                    if (gender.length == 1){
                        query = String.format("SELECT MsUser.userID, nama, profesi, bidangPekerjaan, avatar, visible FROM MsUser JOIN MsMinat ON MsMinat.userID=MsUser.userID JOIN MsBidangPekerjaan ON MsBidangPekerjaan.bidangPekerjaanID=MsMinat.bidangPekerjaanID JOIN MsAvatar ON MsUser.avatarID=MsAvatar.avatarID WHERE gender LIKE '%s' ORDER BY MsUser.userID", gender[0]);
                    }
                    else {
                        query = String.format("SELECT MsUser.userID, nama, profesi, bidangPekerjaan, avatar, visible FROM MsUser JOIN MsMinat ON MsMinat.userID=MsUser.userID JOIN MsBidangPekerjaan ON MsBidangPekerjaan.bidangPekerjaanID=MsMinat.bidangPekerjaanID JOIN MsAvatar ON MsUser.avatarID=MsAvatar.avatarID ORDER BY MsUser.userID");
                    }
                    ResultSet result = st.executeQuery(query);
                    while(result.next()){
                        if (result.getString("visible").equals("true")){
                            int userID = result.getInt("MsUser.userID");
                            String href;
                            if(session.getAttribute("userID") == null) href = "./login.jsp";
                            else href = String.format("./profile.jsp?id=%s", result.getString("userID"));
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
                }
            %>
        </div>
    </section>

    <%@ include file="footer.jsp" %>
</body>
</html>
<% con.close(); %>