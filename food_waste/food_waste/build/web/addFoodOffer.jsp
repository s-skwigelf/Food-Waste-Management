

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>
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
        if(type.equals("hotel") || type.equals("house")){
        
        }else{
        out.println("<script> alert('You are not allowed !!'); window.location.href = 'index.jsp' ; </script>");
        } 
    }
        %>
        
       
        
        
        
        
        
        
       <div class="container">
           <h1>Add Food Offer</h1>
           
           <div class="row">
               
               <div class="col-md-6">
                   
                   <form method="post" action="addFoodOffer">
  <div class="form-group">
    <label for="formGroupExampleInput">Number of peoples (approximate): </label>
    <input type="number" class="form-control" name="no_of_peoples" id="formGroupExampleInput" placeholder="Number of peoples who can eat">
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">Food Items</label>
    <input type="text" class="form-control" name="food_items" id="formGroupExampleInput2" placeholder="Enter the Food items">
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">Address</label>
    <input type="text" class="form-control" name="address" id="formGroupExampleInput2" placeholder="Enter the location">
  </div>
                       
                       
  <button type="submit" class="btn btn-success">Submit</button>                     
                       
</form>
                   
               </div>
               
                <div class="col-md-6">
                   
               </div>
              
           </div>
               
           
       </div>
        
        
        
    </body>
</html>
