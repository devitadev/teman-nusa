<%@include file="../database/connect.jsp" %>

<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    String query = String.format("SELECT userID FROM MsUser WHERE email LIKE '%s' AND password LIKE '%s'", email, password);
    ResultSet result = st.executeQuery(query);
    if(result.next()){
        session.setAttribute("userID", result.getString("userID"));
        response.sendRedirect("../home.jsp");
    }
    else{
        response.sendRedirect("../login.jsp?err=email atau password yang anda masukan salah");
    }
    con.close();
%>