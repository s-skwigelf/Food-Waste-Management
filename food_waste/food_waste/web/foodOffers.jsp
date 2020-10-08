

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>
<%@page import="database.Db_Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@ include file="header.jsp" %> 
    </head>
    <body>
        <%
        
    
    if(session.getAttribute("username")==null){
        out.println("<script> alert('You have to login first !!'); window.location.href = 'index.jsp' ; </script>");
        
    }
    else{ 
        if(type.equals("ngo") || type.equals("house")){
        
        }else{
        out.println("<script> alert('You are not allowed to access this data!!'); window.location.href = 'index.jsp' ; </script>");
        } 
    }
        %>
        <div class="container">
            <h1>Food Offers</h1>
            <hr>
            
            <div class="row">
            <% 
            try{

                Db_Connection dbconn=new Db_Connection();
                Connection connection= dbconn.Connection();                
                String queryString = "select * from food_offers where status='available' and posted_by_username != '"+username+"'";

                PreparedStatement pstatement = connection.prepareStatement(queryString);



                ResultSet rs=pstatement.executeQuery();
                
                while(rs.next()){
                %>
                <div class="col-lg-4">
                    <div class="card border-success" style="width: 18rem;">
                        <div class="card-header bg-transparent border-success">Food for <%=rs.getString("no_of_peoples")%> Peoples</div>
                        <div class="card-body">
                          
                          
                          <h6 class="card-subtitle mb-2 text-muted"> Food Items : <%=rs.getString("food_items")%></h6>
                          
                          <p class="card-text">Location : <%=rs.getString("address")%></p>
                          <p class="card-text">Posted By : <%=rs.getString("posted_by_username")%> (<%=rs.getString("posted_by")%>)</p>
                          
                          
                          
                          

                        </div>
                          <div class="card-footer bg-transparent border-success"><a href="getContact.jsp?x=<%=rs.getString("posted_by_username")%>&id=<%=rs.getString("id")%>" class="btn btn-info">Get Contact</a></div>
                    </div>
                </div>
                
                
                <%
                }

            }catch(Exception ex){
            out.println(ex);
            }
            %>
            
            
            
            
            
            
         </div>
            
        </div>
    </body>
</html>
