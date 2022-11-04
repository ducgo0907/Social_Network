/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.post;

import dal.PostDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import model.Post;
import model.User;

/**
 *
 * @author ngoqu
 */
@WebServlet(name = "NewPost", urlPatterns = {"/new_post"})
@MultipartConfig
public class NewPost extends HttpServlet {

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
            out.println("<title>Servlet NewPost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewPost at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        PostDAO pd = new PostDAO();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");
        String content = request.getParameter("content");
        String imagePath = null;
        String groupId_raw = request.getParameter("groupId");
        // Luu anh vao trong project

        try {
            Part part = request.getPart("image");
            String realPath = request.getServletContext().getRealPath("/uploads");
            String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();

            if (!Files.exists(Paths.get(realPath))) {
                Files.createDirectory(Paths.get(realPath));
            }
            part.write(realPath + "/" + filename);

            imagePath = "uploads/" + filename;

        } catch (IOException e) {
            System.out.println(e);
        }
        int groupId = 0;

        try {
            groupId = Integer.parseInt(groupId_raw);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }

        // Luu post vao trong database
        if (user != null) {
            Post post;
            if (groupId != 0) {
                post = new Post(content, user.getUserId(), imagePath, "private");
                int postId = pd.insertReturnId(post);
                pd.insertPostGroup(postId, groupId);
            } else {
                post = new Post(content, user.getUserId(), imagePath);
                pd.insert(post);
            }
        }
        response.sendRedirect("home");
    }

}
