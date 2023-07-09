<%@include file="../database/connect.jsp" %>

<%
    String giftFrom = session.getAttribute("userID").toString();
    String userID = request.getParameter("userID");
    String avatarID = request.getParameter("avatarID");
    String price = request.getParameter("price");


    String query = String.format("SELECT * FROM TrUserAvatar WHERE userID LIKE %s AND avatarID LIKE %s", userID, avatarID);
    ResultSet result = st.executeQuery(query);
    if (result.next()){
        response.sendRedirect(String.format("../sendGift.jsp?avatarID=%s&err=pembelian gagal karena user sudah memiliki avatar ini", avatarID));
    }
    else{
        query = String.format("UPDATE MsUser SET saldo=saldo-%s WHERE userID LIKE %s", price, giftFrom);
        st.executeUpdate(query);

        query = String.format("INSERT INTO TrUserAvatar VALUES (%s, %s, %s)", userID, avatarID, giftFrom);
        st.executeUpdate(query);

        response.sendRedirect("../avatarShop.jsp?msg=gift berhasil dikirim");
    }
    con.close();
%>