<%@include file="../database/connect.jsp" %>

<%
    String nama = request.getParameter("nama");
    String profesi = request.getParameter("profesi");
    String usernameLinkedin = request.getParameter("usernameLinkedin");
    String email = request.getParameter("email");
    String nomorHandphone = request.getParameter("nomorHandphone");
    String gender = request.getParameter("gender");
    String[] bidangPekerjaan = request.getParameterValues("bidangPekerjaan");
    String password = request.getParameter("password");
    int price = Integer.parseInt(request.getParameter("price"));
    int payment = Integer.parseInt(request.getParameter("payment"));
    int saldo = payment - price;

    String query = String.format("INSERT INTO MsUser (nama, profesi, avatarID, usernameLinkedin, email, gender, nomorHandphone, password, harga, saldo, visible) VALUES ('%s', '%s', 1, '%s', '%s', '%s', '%s', '%s', %s, %s, 'true')", nama, profesi, usernameLinkedin, email, gender, nomorHandphone, password, price, saldo);
    st.executeUpdate(query);

    query = String.format("SELECT userID FROM MsUser WHERE email LIKE '%s'", email);
    ResultSet result = st.executeQuery(query);
    if(result.next()){
        String userID = result.getString("userID");
        query = String.format("INSERT INTO MsMinat VALUES (%s, %s)", userID, bidangPekerjaan[0]);
        for (int i = 1; i < bidangPekerjaan.length; i++) {
            query = query + String.format(", (%s, %s)", userID, bidangPekerjaan[i]);
        }
        st.executeUpdate(query);

        query = String.format("INSERT INTO TrUserAvatar VALUES (%s, 1, %s)", userID, userID);
        st.executeUpdate(query);
        
        response.sendRedirect("../login.jsp");
    }
    con.close();
%>