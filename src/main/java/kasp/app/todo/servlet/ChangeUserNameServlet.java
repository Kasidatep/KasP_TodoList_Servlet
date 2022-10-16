package kasp.app.todo.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import kasp.app.todo.model.Account;
import kasp.app.todo.model.DatabaseConnection;
import kasp.app.todo.model.Todo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

@WebServlet(name = "ChangeUserNameServlet", value = "/changeName")
public class ChangeUserNameServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession s = request.getSession();
        Account acc = (Account) s.getAttribute("account");
        String accountID = (acc.getAccountID());
        String name = request.getParameter("accountName");
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            String query = "update kasp_todos.user set accountName = '"+ name +"' where username like '" + accountID +"'";
            System.out.println(query);
            Statement st = con.createStatement();
            st.executeUpdate(query);

            st.close();
            con.close();
            request.getRequestDispatcher("list").forward(request, response);
            System.out.println(accountID+ " is change accountName to "+ name);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
