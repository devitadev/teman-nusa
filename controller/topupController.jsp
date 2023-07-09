<%@include file="../database/connect.jsp" %>

<%
    String userID = session.getAttribute("userID").toString();
    
    String query = String.format("UPDATE MsUser SET saldo=saldo+100 WHERE userID LIKE %s", userID);
    st.executeUpdate(query);

    response.sendRedirect("../topup.jsp");
    con.close();
%>