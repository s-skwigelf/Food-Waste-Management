

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>
<%@page import="database.Db_Connection"%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
     <%!String sql1;%>
    
    <%
    
    String id=request.getParameter("id");
    

                    Db_Connection dbconn=new Db_Connection();
                Connection connection= dbconn.Connection(); 
                    
                    
                    
                    sql1 = "delete from users where username ='"+id+"'";
                    
                    
                    PreparedStatement statement2 = connection.prepareStatement(sql1);
                    int i = statement2.executeUpdate();
                    response.sendRedirect("users.jsp");


    %>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
