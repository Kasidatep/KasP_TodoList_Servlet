package kasp.app.todo.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kasp.app.todo.model.DatabaseConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

@WebServlet(name = "TodoUnDoneServlet", value = "/process")
public class TodoUnDoneServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            String id = request.getParameter("todo-undone");
            System.out.println(id);
            if(request.getParameter("todo-undone")==null){
                id = "0";
                request.setAttribute("status","alertStatus");
            }
            System.out.println(id);
            String undoneUpdateStatusQuery = "update kasp_todos.todolist set status = 'In Process' where id = " + id;
            System.out.println(undoneUpdateStatusQuery);
            Statement undone = con.createStatement();
            undone.executeUpdate(undoneUpdateStatusQuery);

            undone.close();
            con.close();
            request.getRequestDispatcher("list").forward(request, response);
            System.out.println("todoID "+id+" is change status to IN PROCESS");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
