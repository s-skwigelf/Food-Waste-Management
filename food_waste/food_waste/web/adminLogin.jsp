

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>
<%@page import="database.Db_Connection"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <%@ include file="header.jsp" %>  
    </head>
    <body>
        
        <%
    if(session.getAttribute("username")!=null){
    response.sendRedirect("index.jsp");
    }
String username=request.getParameter("username");
String pass=request.getParameter("password");
String queryString;
PreparedStatement pstatement = null;


if(username!=null && pass!=null){
try{

Db_Connection dbconn=new Db_Connection();
Connection connection= dbconn.Connection();
queryString = "select * from admin where username='"+username+"'";

pstatement = connection.prepareStatement(queryString);



ResultSet rs=pstatement.executeQuery();


if(rs.next())
{
        if(rs.getString("password").equals(pass))
            {
            out.println("welcome"+rs.getString("fname"));
            session.setAttribute("username",username);
            
            session.setAttribute("fname", rs.getString("fname"));
            session.setAttribute("lname", rs.getString("lname"));
            session.setAttribute("email", rs.getString("email"));
            session.setAttribute("phone", rs.getString("phone"));
            session.setAttribute("type", rs.getString("type"));
            
            
            

            response.sendRedirect("index.jsp");
            }
            else
            {
                                      out.println("<div class='container'><div class='alert alert-danger alert-dismissible fade show' role='alert'><strong>Wrong Password!</strong><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div></div>");
 
            session.invalidate();
            // response.sendRedirect("login.html");
            }
}
else{
session.invalidate();
                                        out.println("<div class='container'><div class='alert alert-danger alert-dismissible fade show' role='alert'>sorry <strong>Username is not registered!</strong><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div></div>");
 
  //out.println("<script>alert('Username is not registered');</script>");
}

connection.close();

}
catch(Exception ex){
out.println(ex);
}
}


%>
        
        
        
        
        
        
        
        
        
        
        <div class="container">
            <div class="float-right"><a class="btn btn-sm btn-success" href="">Normal User Login</a></div>
        <h1> Admin Login Page</h1>
        
        <hr>
        
        <form action="adminLogin.jsp" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Username</label>
    <input type="text" name="username" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
    
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <div class="form-group form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Check me out</label>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
        
        </div>
    </body>
</html>
