<!-- Sidebar -->
    <div class="bg-light border-right" id="sidebar-wrapper">
      <a href="dashboard.jsp"><div class="sidebar-heading"><% if(session.getAttribute("username")!=null){ %><%=fname%> <%=lname%><%}%></div></a>
      <div class="list-group list-group-flush">        
        <a href="users.jsp" class="list-group-item list-group-item-action bg-light">Users (HOTEL/HOUSE)</a>
        <a href="ngo.jsp" class="list-group-item list-group-item-action bg-light">NGOs</a>
        <a href="dashboardFoodOffers.jsp" class="list-group-item list-group-item-action bg-light">Food Offers</a>
        
      </div>
    </div>
      
      
    <!-- /#sidebar-wrapper -->