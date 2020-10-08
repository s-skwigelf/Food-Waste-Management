

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
        <title>Get Contact</title>
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
            <h1>Contact Info</h1>
            <hr>
            
            <div class="row">
            <% 
                String x=request.getParameter("x");
                String id=request.getParameter("id");
                
            try{

                Db_Connection dbconn=new Db_Connection();
                Connection connection= dbconn.Connection();
                String queryString1 = "select * from food_offers where id = '"+id+"'";
                String queryString = "select * from users where username = '"+x+"'";
                
                
                PreparedStatement pstatement1 = connection.prepareStatement(queryString1);
                PreparedStatement pstatement = connection.prepareStatement(queryString);


                ResultSet rs1=pstatement1.executeQuery();
                ResultSet rs=pstatement.executeQuery();
                
                if(rs1.next()){
                    if(rs1.getString("status").equals("available")){
                        
                    while(rs.next()){
                %>
                <div class="col-lg-4">
                    <div class="card border-info" style="max-width: 30rem;">
                             <div class="card-header border-info">Contact Card</div>
                        <div class="card-body">
                       
                          <h5 class="card-title"><%=rs.getString("fname")%> <%=rs.getString("lname")%></h5>
                          
                          <h6 class="card-subtitle mb-2 text-muted"><%=rs.getString("type")%></h6>
                          
                          <p class="card-text">Email : <%=rs.getString("email")%></p>
                          <p class="card-text">Phone no : <%=rs.getString("phone")%></p>
                          <p class="card-text">Address : <%=rs1.getString("address")%></p>
                          
                          
                          
                          
                          

                        </div>
                          <div class="card-footer bg-transparent border-success"><a href="tel:<%=rs.getString("phone")%>" class="btn btn-success">Call Now</a></div>
                    </div>
                          
                </div>
                          
                          
                       
                
                
                <%
                    }
                    
                }else{
                    out.println("<div class='container'><div class='alert alert-success alert-dismissible fade show' role='alert'><strong>Sorry!</strong> This food offer is no more available<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div></div>");
                    out.println("<div class='container'><div class='alert alert-success alert-dismissible fade show' role='alert'><strong>But its good that someone else has picked up food and delivered to the needy peoples.</strong><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div></div>");


                    }
                }
                
                
                

            }catch(Exception ex){
            out.println(ex);
            }
            %>
            
            
            
            
            
            
         </div>
            
        </div>
    </body>
</html>
