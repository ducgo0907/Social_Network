/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.group;

import dal.GroupDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Group;
import model.User;

/**
 *
 * @author ngoqu
 */
@WebServlet(name = "ShowGroup", urlPatterns = {"/showgroup"})
public class ShowGroup extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ShowGroup</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShowGroup at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String id_raw = request.getParameter("id");
        GroupDAO gd = new GroupDAO();
        HttpSession sesion = request.getSession();
        User current_user = (User) sesion.getAttribute("account");
        boolean isAccess = false;
        try {
            int id = Integer.parseInt(id_raw);
            Group group = gd.getGroupById(id);
            List<User> listRequest = gd.getAllRequestMemberOfGroup(id);
            List<User> listMember = gd.getAllMemberOfGroup(id);
            for (User user : listMember) {
                if (user.getUserId() == current_user.getUserId()
                        || current_user.getUserId() == group.getOwnerId()) {
                    isAccess = true;
                    break;
                }
            }
            request.setAttribute("group", group);
            request.setAttribute("listPost", group.getListPost());
            request.setAttribute("listRequest", listRequest);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        if (isAccess) {
            request.getRequestDispatcher("show_group.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("home").forward(request, response);
        }
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
