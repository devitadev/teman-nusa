<%@include file="../database/connect.jsp" %>

<%
    String wishUserID = request.getParameter("id");
    String userID = session.getAttribute("userID").toString();

    String query = String.format("SELECT * FROM TrWishlist WHERE userID LIKE %s AND wishUserID LIKE %s", userID, wishUserID);
    ResultSet result = st.executeQuery(query);
    if (result.next()){
        response.sendRedirect(String.format("../profile.jsp?id=%s&err=user ini sudah ada di wishlistmu", wishUserID));
    }
    else{
        query = String.format("SELECT * FROM TrWishlist WHERE userID LIKE %s AND wishUserID LIKE %s", wishUserID, userID);
        result = st.executeQuery(query);
        if (result.next()){
            query = String.format("INSERT INTO TrWishlist VALUES (%s, %s, 'true')", userID, wishUserID);
            st.executeUpdate(query);

            query = String.format("UPDATE TrWishlist SET status='true' WHERE userID LIKE %s AND wishUserID LIKE %s", wishUserID, userID);
            st.executeUpdate(query);
        }
        else {
            query = String.format("INSERT INTO TrWishlist VALUES (%s, %s, 'false')", userID, wishUserID);
            st.executeUpdate(query);
        }
        response.sendRedirect("../wishlist.jsp");
    }
    con.close();
%>