/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import database.Db_Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class addFoodOffer extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession(); 
            
String no_of_peoples=request.getParameter("no_of_peoples");
String food_items=request.getParameter("food_items");
String address=request.getParameter("address");
String type=session.getAttribute("type").toString();
String username=session.getAttribute("username").toString();



        try{
                    Db_Connection dbconn=new Db_Connection();
                    Connection conn= dbconn.Connection();
                    
                    String sql = "INSERT INTO food_offers ( no_of_peoples, food_items, address, posted_by, status, posted_by_username) values (?, ?, ?, ?, ?, ?)";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, no_of_peoples);
                    statement.setString(2, food_items);
                    statement.setString(3, address);
                    statement.setString(4, type);
                    statement.setString(5, "available");
                    statement.setString(6, username);
                    
                    int row = statement.executeUpdate();
                    
                     if (row > 0)
                    {   
                         //out.println("<script>alert('Food Offer added successfully');</script>");    
                        RequestDispatcher rs = request.getRequestDispatcher("addFoodOffer.jsp");
                        rs.include(request, response);
                        out.println("<div class='container'><div class='alert alert-success alert-dismissible fade show' role='alert'><strong>Food offer added!</strong><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div></div>");
                        
                        
                    }else{
                         
                         RequestDispatcher rs = request.getRequestDispatcher("addFoodOffer.jsp");
                        rs.include(request, response);
                      out.println("<div class='container'><div class='alert alert-danger alert-dismissible fade show' role='alert'><strong>Something went wrong!</strong><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div></div>");
                    
                     
                     }
                     
                     
                     conn.close();
                    
                    
                    
                    
             }catch(Exception e){
                 out.println(e);
             }







    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
