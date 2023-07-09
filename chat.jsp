<%@include file="./database/connect.jsp" %>

<%
    String userID = request.getParameter("id");
    String nama = request.getParameter("nama");
    String myID = session.getAttribute("userID").toString();

    String query = String.format("SELECT senderID, receiverID, content FROM TrChat WHERE (senderID LIKE %s OR senderID LIKE %s) AND (receiverID LIKE %s OR receiverID LIKE %s) ORDER BY date", userID, myID, userID, myID);
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
    <link rel="stylesheet" href="./css/chat.css">

    <script src="js/javascript.js"></script>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <section>
        <p class="title"><%= nama %></p>

        <div class="chatting">
            <%
                while(result.next()){
                    if(result.getString("senderID").equals(myID)){
            %>
                        <div class="sent">
                            <p class="content"><%= result.getString("content") %></p>
                        </div>
            <%
                    }
                    else {
            %>
                        <div class="receive">
                            <p class="name"><%= nama %></p>
                            <p class="content"><%= result.getString("content") %></p>
                        </div>
            <%
                    }
                }
            %>
        </div>

        <div class="form-wrapper">
            <form action="./controller/sendChatController.jsp">
                <input type="hidden" name="senderID" value="<%= myID %>">
                <input type="hidden" name="receiverID" value="<%= userID %>">
                <input type="hidden" name="nama" value="<%= nama %>">
                <textarea name="content" id="" rows="2" placeholder="Enter a message.."></textarea>
                <button class="send">send</button>
                <p style="color:red;margin-top: 42px;"><% if(request.getParameter("err") != null) out.println(request.getParameter("err")); %></p>
            </form>
        </div>
    </section>

    <%@ include file="footer.jsp" %>
</body>
</html>
<% con.close(); %>