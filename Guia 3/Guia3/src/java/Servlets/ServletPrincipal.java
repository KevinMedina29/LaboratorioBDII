package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ServletPrincipal extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletPrincipal</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletPrincipal at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion= request.getParameter("accion");
        if(accion==null){
            request.getRequestDispatcher("/index.html").forward(request, response);
        }else if(accion.equals("Login")){
            request.getRequestDispatcher("/Login.html").forward(request, response);
        }else if(accion.equals("RegistroEmpleado")){
            request.getRequestDispatcher("/RegistroEmpleado.html").forward(request, response);
        }else if(accion.equals("RegistroProducto")){
            request.getRequestDispatcher("/RegistroProducto.html").forward(request, response);
        }else if(accion.equals("RegistroCliente")){
            request.getRequestDispatcher("/RegistroCliente.html").forward(request, response);
        }else if(accion.equals("RegistroProveedor")){
            request.getRequestDispatcher("/RegistroProveedor.html").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
