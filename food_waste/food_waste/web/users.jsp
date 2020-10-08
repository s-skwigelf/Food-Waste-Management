






<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>
<%@page import="database.Db_Connection"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard | Users</title>
        <link href="css/simple-sidebar.css" rel="stylesheet">
        <%@ include file="header.jsp" %> 
    </head>
    <body>

  <div class="d-flex" id="wrapper">

    <!-- Sidebar -->
    <%@ include file="sidebar.jsp" %> 
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">
        

     

      <div class="container">
          <button class="btn btn-primary" id="menu-toggle">< Toggle Menu</button>
            <h1>Users (HOTEL/HOUSE)</h1>
            <hr>
            
            <table class="table table-bordered table-dark">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Phone</th>
      <th scope="col">Option</th>
    </tr>
  </thead>
  <tbody>
    
    
  
            <% 
            try{

                Db_Connection dbconn=new Db_Connection();
                Connection connection= dbconn.Connection();                
                String queryString = "select * from users where type = 'hotel' or type = 'house'";

                PreparedStatement pstatement = connection.prepareStatement(queryString);



                ResultSet rs=pstatement.executeQuery();
                int index = 1;
                while(rs.next()){
                %>
                
  
                    <tr>
                        <th scope="row"><%=index%></th>
                        <td><%=rs.getString("fname")%> <%=rs.getString("lname")%></td>
                        <td><%=rs.getString("email")%></td>
                        <td><%=rs.getString("phone")%></td>
                        
                        
                        <td><a class="btn btn-danger" href="deleteUser.jsp?id=<%=rs.getString("username")%>">Delete</a></td>
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
    </div>
    <!-- /#page-content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Menu Toggle Script -->
  <script>
    $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
    });
  </script>

</body>
</html>
