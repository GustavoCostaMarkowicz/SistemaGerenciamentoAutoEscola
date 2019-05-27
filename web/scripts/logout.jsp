<%-- 
    Document   : logout
    Created on : 08/10/2018, 09:22:37
    Author     : João Vitor Gonçalves
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    session = request.getSession();
    
    if(session != null){
        session.invalidate();
        session = null;
    }
    
    response.sendRedirect("../index.jsp");
    


%>
