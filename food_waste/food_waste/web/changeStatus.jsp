

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
    
    
    <%!String sql1,sql2;%>
    
    <%
    
    String id=request.getParameter("id");
    

                    Db_Connection dbconn=new Db_Connection();
                    Connection conn= dbconn.Connection();
                    
                    
                    
                    sql1 = "select * from food_offers where id ='"+id+"'";
                    PreparedStatement statement1 = conn.prepareStatement(sql1);
                    ResultSet rs=statement1.executeQuery();
                    if(rs.next())
                    {
                        if(rs.getString("status").toString().equals("available")){
                            sql2 = "update food_offers set status= 'completed' where id = '"+id+"'";
                            PreparedStatement statement2 = conn.prepareStatement(sql2);
                            int i = statement2.executeUpdate();
                        }
                        else{
                            
                        }
                    
                    
                    
                    }
                    conn.close();
                    response.sendRedirect("myOffers.jsp");


    %>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
