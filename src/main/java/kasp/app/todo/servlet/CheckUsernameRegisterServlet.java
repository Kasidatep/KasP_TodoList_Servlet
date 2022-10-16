package kasp.app.todo.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import kasp.app.todo.model.DatabaseConnection;
import kasp.app.todo.model.Todo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

@WebServlet(name = "CheckUsernameRegisterServlet", value = "/checkusername")
public class CheckUsernameRegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            String username = request.getParameter("username");
            String query = "SELECT username FROM user where username like '" + username + "'";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            String user = null;
            while (rs.next()){
                user = rs.getString("username");
            }
            st.close();
            con.close();
            if (user == null) {
                request.setAttribute("username_status","Username can be used.");
                request.setAttribute("username",username);
                request.getRequestDispatcher("/register.jsp").forward(request, response);
                System.out.println("Register : Username already exists, please try again.");
            }else{
                request.setAttribute("username_status", "Username already exists, please try again.");
                request.setAttribute("username",null);
                request.getRequestDispatcher("/register.jsp").forward(request, response);
                System.out.println("Register : Username already exists, please try again.");
            }




        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
