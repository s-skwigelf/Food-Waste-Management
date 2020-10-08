

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
        <title>Signup</title>
        <%@ include file="header.jsp" %> 
    </head>
    <body>
        
        <%
    if(session.getAttribute("username")!=null){
    response.sendRedirect("index.jsp");
    }
String username=request.getParameter("username");
String pass=request.getParameter("password");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
String phone=request.getParameter("phone");
String type=request.getParameter("type");
String queryString;
PreparedStatement pstatement = null;



if(username!=null && pass!=null){
    
try{
Db_Connection dbconn=new Db_Connection();
Connection conn= dbconn.Connection();

queryString = "INSERT INTO users (username, fname, lname, email, password, phone,type) values (?, ?, ?, ?, ?, ?, ?)";

pstatement = conn.prepareStatement(queryString);

                    pstatement.setString(1, username);
                    pstatement.setString(2, fname);
                    pstatement.setString(3, lname);
                    pstatement.setString(4, email);
                    pstatement.setString(5, pass);
                    pstatement.setString(6, phone);
                    pstatement.setString(7, type);

int returnedRows=pstatement.executeUpdate();


        if(returnedRows > 0)
        {
            out.println("<div class='container'><div class='alert alert-success alert-dismissible fade show' role='alert'>Account created <strong>Successfully!</strong><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div></div>");
            
        }
conn.close();

}
catch (SQLIntegrityConstraintViolationException e) {
    // Duplicate entry
    out.println("<div class='container'><div class='alert alert-warning alert-dismissible fade show' role='alert'><strong>Sorry!</strong> Username already exists<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div></div>");
}
catch(SQLException ex){
out.println(ex);
}
}


%>
        
        
        
        
        
        
        
        
        
        
        <div class="container">
        <h1>Signup</h1>
        <hr>
        
        <form action="signup.jsp" method="post">
   <div class="form-row">
    <div class="form-group col-md-6">
      <label for="fname">First Name</label>
      <input type="text" name="fname" class="form-control" id="fname" placeholder="First Name">
    </div>
    <div class="form-group col-md-6">
      <label for="lname">Last Name</label>
      <input type="text" name="lname" class="form-control" id="lname" placeholder="Last Name">
    </div>
       
    <div class="form-group col-md-6">
      <label for="username">Username</label>
      <input type="text" name="username" class="form-control" id="username" placeholder="Username">
    </div>
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Email</label>
      <input type="email" name="email" class="form-control" id="inputEmail4" aria-describedby="emailHelp" placeholder="Email">
      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Password</label>
      <input type="password" name="password" class="form-control" id="inputPassword4" placeholder="Password">
    </div>
  </div>
  
  
            
            
  <div class="form-row">
      <div class="form-group col-md-6">
      <label for="phone">phone</label>
      <input type="number" name="phone" class="form-control" id="phone" placeholder="Phone">
    </div>
    <div class="form-group col-md-4">
      <label for="type">Account Type</label>
      <select id="type" name="type" class="form-control">
        <option value="ngo" selected>NGO</option>
        <option value="hotel">Hotel</option>
        <option value="house">House Hold</option>
      </select>
    </div>
    
  </div>
  
  <button type="submit" class="btn btn-primary">Sign up</button>
</form>
       


        </div>
    </body>
</html>
