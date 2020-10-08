

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>




<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <%@ include file="header.jsp" %> 
    </head>
    <body>
        <div class="container">
        <h1></h1> 
        
        <div class="jumbotron">
  <h1 class="display-4">Welcome <% if(session.getAttribute("username")!=null){ %> <%=fname%> <%}%></h1>
  <p class="lead">This is a platform for food waste management. Which helps needy peoples by providing them remaining food from hotel, parties or weddings instead of throwing them.</p>
  <hr class="my-4">
  <p>Just add food offer and it will go directly to needy people.</p>
  <% if(session.getAttribute("username")!=null){ %>
  <p class="lead">
     <% if(session.getAttribute("type").equals("hotel") || session.getAttribute("type").equals("house")){ %>
    <a class="btn btn-primary btn-lg" href="addFoodOffer.jsp" role="button">Add Food Offers</a>
    <%}%>
    <% if(session.getAttribute("type").equals("ngo") || session.getAttribute("type").equals("house")){ %>
    <a class="btn btn-primary btn-lg" href="foodOffers.jsp" role="button">Show Food Offers</a>
    <%}%>
  </p>
  <%}
else{
%>
  <a class="btn btn-primary btn-lg" href="addFoodOffer.jsp" role="button">Add Food Offers</a>
  <a class="btn btn-primary btn-lg" href="foodOffers.jsp" role="button">Show Food Offers</a>
  <%
}%>
</div>
        
        </div>
    </body>
</html>
