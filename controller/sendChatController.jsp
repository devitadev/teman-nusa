<%@include file="../database/connect.jsp" %>

<%
    String senderID = request.getParameter("senderID");
    String receiverID = request.getParameter("receiverID");
    String content = request.getParameter("content").trim();
    String nama = request.getParameter("nama");
    
    if(content == null || content.equals("")){
        response.sendRedirect(String.format("../chat.jsp?id=%s&nama=%s&err=message tidak boleh kosong", receiverID, nama));
    }
    else{
        String query = String.format("INSERT INTO TrChat (senderID, receiverID, content, date) VALUE (%s, %s, '%s', CURRENT_TIMESTAMP)", senderID, receiverID, content);
        st.executeUpdate(query);
        response.sendRedirect(String.format("../chat.jsp?id=%s&nama=%s", receiverID, nama));
    }

    con.close();
%>