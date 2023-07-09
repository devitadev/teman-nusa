<%@include file="../database/connect.jsp" %>

<%
    String avatarID = request.getParameter("id");
    String userID = session.getAttribute("userID").toString();

    String query = String.format("SELECT visible FROM MsUser WHERE userID LIKE %s", userID);
    ResultSet result = st.executeQuery(query);
    result.next();

    if(result.getString("visible").equals("true")){
        query = String.format("UPDATE MsUser SET avatarID=%s WHERE userID LIKE %s", avatarID, userID);
        st.executeUpdate(query);
        response.sendRedirect("../avatar.jsp");
    }
    else{
        response.sendRedirect("../avatar.jsp?err=anda tidak dapat mengubah avatar karena sedang berada dalam mode private");
    }
    con.close();
%>