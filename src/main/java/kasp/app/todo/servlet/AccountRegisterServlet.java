package kasp.app.todo.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import kasp.app.todo.model.Account;
import kasp.app.todo.model.DatabaseConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "AccountRegisterServlet", value = "/register")
public class AccountRegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            PreparedStatement st = con.prepareStatement("insert into user (`username`, `accountName`, `password`,`roll`) values (?,?,?,?)");

            st.setString(1, request.getParameter("username"));
            st.setString(2, request.getParameter("accountName"));
            st.setString(3, request.getParameter("password"));
            st.setString(4, "user");
            st.executeUpdate();
            st.close();
            con.close();
            Account user = new Account(request.getParameter("username"), request.getParameter("accountName"), "user");
            HttpSession session = request.getSession(); //Attribute("account",user);
            session.setAttribute("account", user);
            assert user != null;
            session.setAttribute("accountID",user.getAccountID());
            session.setMaxInactiveInterval(60*15);
            request.setAttribute("account", user);
            request.getRequestDispatcher("list").forward(request, response);
            System.out.println("sign in");
            System.out.println("Hello > "+ request.getParameter("username"));
            request.getRequestDispatcher("list").forward(request, response);
            System.out.println(request.getParameter("username") + " has register");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
