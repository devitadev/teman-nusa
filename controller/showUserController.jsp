<%@include file="../database/connect.jsp" %>
<%@page import="java.util.*" %>

<%
    String userID = session.getAttribute("userID").toString();

    String query = String.format("SELECT saldo FROM MsUser WHERE userID LIKE %s", userID);
    ResultSet result = st.executeQuery(query);
    result.next();

    int saldo = result.getInt("saldo");
    if(saldo < 5){
        response.sendRedirect("../settings.jsp?err=saldo anda tidak mencukupi. silahkan topup saldo terlebih dahulu");
    }
    else{
        query = String.format("UPDATE MsUser SET saldo=saldo-5, visible='true', avatarID=lastAvatarID WHERE userID LIKE %s", userID);
        st.executeUpdate(query);
        response.sendRedirect("../settings.jsp");
    }
    con.close();
%>