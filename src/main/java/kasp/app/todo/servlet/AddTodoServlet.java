package kasp.app.todo.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import kasp.app.todo.model.DatabaseConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "AddTodoServlet", value = "/add")
public class AddTodoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String o ="";
            Connection con = DatabaseConnection.initializeDatabase();
            o = o+"connection successfully <br>";
            PreparedStatement st = con.prepareStatement("insert into todolist (`owner`, `title`, `status`,`completionDate`) values (?,?,?,?)");

            // INSERT INTO `kasp_todos`.`todolist` (`owner`, `title`, `status`) VALUES ('unkhown', 'conncetion test', 'process');
            st.setString(1, request.getParameter("username"));
            st.setString(2, request.getParameter("title"));
            st.setString(3, "In Process");
            st.setString(4, request.getParameter("completionDate"));

//            st.setString(2, request.getParameter("title"));
//            st.setString(3, request.getParameter("status"));

            st.executeUpdate();
            st.close();

            con.close();

            request.setAttribute("status",o);
            request.getRequestDispatcher("list").forward(request,response);
            System.out.println(request.getParameter("username")+" add new todo");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
