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

@WebServlet(name = "TodoListServlet", value = "/info")
public class TodoListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession s = request.getSession();
        System.out.println("//SESSION G " +request.getSession());
        System.out.println("//USEROBJ " +s.getAttribute("accountID"));
        System.out.println("//ID " +s.getAttribute("account"));
        Account acc = (Account) s.getAttribute("account");
        System.out.println("//O-ID "+acc.getAccountID());
        //doPost(request, response);
    }

   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       HttpSession s = request.getSession();
       System.out.println("//SESSION P " +request.getSession());
       System.out.println("//USEROBJ " +s.getAttribute("accountID"));
       System.out.println("//ID " +s.getAttribute("account"));
       Account acc = (Account) s.getAttribute("account");
       System.out.println("//O-ID "+acc.getAccountID());
    }
}