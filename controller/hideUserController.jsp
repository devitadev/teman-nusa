<%@include file="../database/connect.jsp" %>
<%@page import="java.util.*" %>

<%
    String userID = session.getAttribute("userID").toString();
    String lastAvatarID = request.getParameter("avatarID");

    String query = String.format("SELECT saldo FROM MsUser WHERE userID LIKE %s", userID);
    ResultSet result = st.executeQuery(query);
    result.next();

    int saldo = result.getInt("saldo");
    if(saldo < 50){
        response.sendRedirect("../settings.jsp?err=saldo anda tidak mencukupi. silahkan topup saldo terlebih dahulu");
    }
    else{
        Random rand = new Random();
        int avatarID = rand.nextInt(3) + 2;
        query = String.format("UPDATE MsUser SET saldo=saldo-50, visible='false', avatarID=%d, lastAvatarID=%s WHERE userID LIKE %s", avatarID, lastAvatarID, userID);
        st.executeUpdate(query);
        response.sendRedirect("../settings.jsp");
    }
    con.close();
%>