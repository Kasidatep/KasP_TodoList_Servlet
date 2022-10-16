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

@WebServlet(name = "TodoDoneServlet", value = "/done")
public class TodoDoneServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            String id = (String) request.getParameter("todoDone");
            if(request.getParameter("todoDone")==null){
                id = "0";
                request.setAttribute("status","alertStatus");
            }
            String doneUpdateStatusQuery = "update kasp_todos.todolist set status = 'Done' where id = " + id;
            Statement st = con.createStatement();
            st.executeUpdate(doneUpdateStatusQuery);

            st.close();
            con.close();
            request.getRequestDispatcher("list").forward(request, response);
            System.out.println("todoID "+id+" is change status to DONE");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
