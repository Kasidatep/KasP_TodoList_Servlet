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

@WebServlet(name = "SignInServlet", value = "/sign-in")
public class SignInServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String username = request.getParameter("username");
         String password = request.getParameter("password");
         String remember = request.getParameter("remember-account");

        try {

            Connection con = DatabaseConnection.initializeDatabase();
            String checkUserAccount = "SELECT * FROM kasp_todos.user where username like '" + username + "' and password like '" + password + "'";
            Statement account = con.createStatement();
            ResultSet accountInfo = account.executeQuery(checkUserAccount);
            String accountID = null;
            Account user = null;
            while (accountInfo.next()) {
                accountID = accountInfo.getString("username");
                String accountName = accountInfo.getString("accountName");
                String accountRoll = accountInfo.getString("roll");
                user = new Account(accountID, accountName, accountRoll);
            }
            Cookie rememberAccount = new Cookie("account", remember);
       //     System.out.println("+" +accountID);
            rememberAccount.setMaxAge(60 * 60 * 24 * 3);
            rememberAccount.setSecure(true);
            account.close();
            con.close();

            HttpSession session = request.getSession(); //Attribute("account",user);
            session.setAttribute("account", user);
            assert user != null;
            session.setAttribute("accountID",user.getAccountID());
            session.setMaxInactiveInterval(60*15);
         //   System.out.println(session.getAttribute("account")+"++");
            request.setAttribute("account", user);
            request.getRequestDispatcher("list").forward(request, response);
            System.out.println("sign in servlet working");
            System.out.println("Hello > "+accountID);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
