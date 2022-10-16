package kasp.app.todo.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kasp.app.todo.model.DatabaseConnection;
import kasp.app.todo.model.Todo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

@WebServlet(name = "AllListServlet", value = "/admin")
public class AllListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ArrayList<Todo> todoList = new ArrayList<>();
            Connection con = DatabaseConnection.initializeDatabase();
            String query = "SELECT * FROM kasp_todos.todolist";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                Todo t = new Todo(rs.getInt("id"), rs.getString("owner"), rs.getString("title"), rs.getString("status"), rs.getString("completionDate"));
                todoList.add(t);
            }
            st.close();
            con.close();

            request.setAttribute("todoList", todoList);
            request.getRequestDispatcher("/admin.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}