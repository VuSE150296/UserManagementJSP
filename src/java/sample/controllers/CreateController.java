/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.user.UserError;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "CreateController", urlPatterns = {"/CreateController"})
public class CreateController extends HttpServlet {

    private static final String ERROR = "create.jsp";
    private static final String SUCCESS = "login.jsp";     

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserError userError = new UserError();
        try {
           String userID = request.getParameter("userID");
           String fullName = request.getParameter("fullName");
           String roleID = request.getParameter("roleID");
           String password = request.getParameter("password");
           String confirm = request.getParameter("confirm");
           UserDAO dao = new UserDAO();
           
           boolean checkValidation = true;          
           //checkDuplicate trả về kiểu dữ liệu boolean
           //nếu checkDuplicate bằng true thì nó sẽ trùng và tạo ra lỗi
//           boolean checkDuplicate = dao.checkDuplicate(userID);        
//           if(checkDuplicate){
//               checkValidation = false;
//               userError.setUserIDError("Duplicate!!!");
//           }
           if(userID.length()<2 || userID.length()>10) {
               checkValidation = false;
               userError.setUserIDError("UserID must be in [2,10]!!!");
           }
           if(fullName.length()<3 || fullName.length()>20) {
               checkValidation = false;
               userError.setFullNameError("FullName must be in [3,20]!!!");
           }
           if(!password.equals(confirm)) {
               checkValidation = false;
               userError.setConfirmError("Two passwords are not the same!!");
           }
           //checkValidation = true thì nó pass được những validation ở trên
           // tạo 2 hàm checkValidation trả về true nếu user này có
           // và hàm create để insert dữ liệu vào trong database
           if(checkValidation){
               UserDTO user = new UserDTO(userID, fullName, roleID, password);
//               boolean checkCreate = dao.create(user);
               boolean checkCreate = dao.createV2(user);
               if(checkCreate){
                   url= SUCCESS; 
               }
           }else{
               request.setAttribute("USER_ERROR", userError); 
           }
        } catch (Exception e) {
            if(e.toString().contains("duplicate")){
                userError.setUserIDError("Trung userID roi kia!!");
                request.setAttribute("USER_ERROR", userError);
            }
            log("Error at CreateController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
