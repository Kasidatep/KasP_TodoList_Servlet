package kasp.app.todo.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import kasp.app.todo.model.DatabaseConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;
import java.util.Objects;

@WebServlet(name = "TodoEditServlet", value = "/edit")
public class TodoEditServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            String id = (String) request.getParameter("id");
            if (request.getParameter("id") == null) {
                id = "0";
                request.setAttribute("status", "alertStatus");
            }
            String setTitle = null;
            String setCompletionDate = null;
            if (request.getParameter("title") != null) {
                setTitle = "title = '" + request.getParameter("title")+"' ";
            }
            if (request.getParameter("completionDate")!=null) {
                setCompletionDate = "completionDate = '" + request.getParameter("completionDate")+"'";
            }

            System.out.println(id);
            String editUpdateStatusQuery = "update kasp_todos.todolist set " + setTitle + ", " + setCompletionDate+ " where id = " + id;
            System.out.println(editUpdateStatusQuery);
            Statement st = con.createStatement();
            st.executeUpdate(editUpdateStatusQuery);

            st.close();
            con.close();
            request.getRequestDispatcher("list").forward(request, response);
            System.out.println("todoID "+id+" has edit");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
