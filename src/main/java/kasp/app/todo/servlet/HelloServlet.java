package kasp.app.todo.servlet;

import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import kasp.app.todo.model.Account;

@WebServlet(name = "helloServlet", value = "/hello")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        HttpSession s = request.getSession();
        System.out.println("//SESSION " +request.getSession());
        System.out.println("//USEROBJ " +s.getAttribute("accountID"));
        System.out.println("//ID " +s.getAttribute("account"));
        Account acc = (Account) s.getAttribute("account");
        System.out.println("//O-ID "+acc.getAccountID());
        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

    public void destroy() {
    }
}