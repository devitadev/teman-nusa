<%@include file="../database/connect.jsp" %>

<%
    String avatarID = request.getParameter("avatarID");
    String userID = session.getAttribute("userID").toString();


    String query = String.format("SELECT * FROM TrUserAvatar WHERE userID LIKE %s AND avatarID LIKE %s", userID, avatarID);
    ResultSet result = st.executeQuery(query);

    if(result.next()){
        response.sendRedirect("../avatarShop.jsp?err=Pembelian avatar gagal karena kamu sudah memiliki avatar ini");
    }
    else{
        query = String.format("SELECT saldo FROM MsUser WHERE userID LIKE %s", userID);
        result = st.executeQuery(query);
        result.next();
        int saldo = result.getInt("saldo");

        query = String.format("SELECT price FROM MsAvatar WHERE avatarID LIKE %s", avatarID);
        result = st.executeQuery(query);
        result.next();
        int price = result.getInt("price");

        if(saldo - price < 0){
            response.sendRedirect(String.format("../avatarShop.jsp?err=Pembelian avatar gagal karena saldomu tidak mencukupi, kurang %d. Silahkan topup saldo terlebih dahulu", (price-saldo)));
        }
        else{
            query = String.format("UPDATE MsUser SET saldo=%d WHERE userID LIKE %s", (saldo - price), userID);
            st.executeUpdate(query);

            query = String.format("INSERT INTO TrUserAvatar VALUES (%s, %s, %s)", userID, avatarID, userID);
            st.executeUpdate(query);

            response.sendRedirect("../avatar.jsp");
        }
    }
    con.close();
%>