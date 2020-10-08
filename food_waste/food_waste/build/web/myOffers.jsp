

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
        <title>My Offers</title>
        <%@ include file="header.jsp" %> 
    </head>
    <body>
        <%
        
    
    if(session.getAttribute("username")==null){
        out.println("<script> alert('You have to login first !!'); window.location.href = 'index.jsp' ; </script>");
        
    }
    else{ 
        if(type.equals("hotel") || type.equals("house")){
        
        }else{
        out.println("<script> alert('You are not allowed !!'); window.location.href = 'index.jsp' ; </script>");
        } 
    }
        %>
        <div class="container">
            <h1>My Food Offers</h1>
            <hr>
            
            <table class="table table-bordered table-dark">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">No of peoples</th>
      <th scope="col">Food Items</th>
      <th scope="col">Address</th>
      <th scope="col">Status</th>
      <th scope="col">Option</th>
    </tr>
  </thead>
  <tbody>
    
    
  
            <% 
            try{

                Db_Connection dbconn=new Db_Connection();
                Connection connection= dbconn.Connection();                
                String queryString = "select * from food_offers where posted_by_username = '"+username+"' order by status asc";

                PreparedStatement pstatement = connection.prepareStatement(queryString);



                ResultSet rs=pstatement.executeQuery();
                int index = 1;
                while(rs.next()){
                %>
                
  
                    <tr>
                        <th scope="row"><%=index%></th>
                        <td><%=rs.getString("no_of_peoples")%></td>
                        <td><%=rs.getString("food_items")%></td>
                        <td><%=rs.getString("address")%></td>
                        <%if(rs.getString("status").equals("available"))
                        {
                            %>
                        <td><a class="btn btn-success" href="changeStatus.jsp?id=<%=rs.getString("id")%>"><%=rs.getString("status")%> | change</a></td>
                        <%
                        }
                        else
                        {
                           %>
                        <td><a class="btn btn-warning" href="">Completed</a></td>
                        <%
                        }%>
                        
                        <td><a class="btn btn-danger" href="deleteFoodOffer.jsp?id=<%=rs.getString("id")%>">Delete</a></td>
                    </tr>
                
                
                <%
                    index++;
                }

            }catch(Exception ex){
            out.println(ex);
            }
            %>
            
            </tbody>
</table>
            
            
            
            
         
            
        </div>
    </body>
</html>
