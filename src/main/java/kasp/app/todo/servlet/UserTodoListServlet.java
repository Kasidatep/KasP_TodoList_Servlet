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

@WebServlet(name = "UserTodoListServlet", value = "/list")
public class UserTodoListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession s = request.getSession();
        //Account acc = new Account("0","Guest","Guest");
        Account acc = (Account) s.getAttribute("account");
        String accountID = (acc.getAccountID()==null?"Guest":acc.getAccountID());

        try {
            ArrayList<Todo> todoList = new ArrayList<>();
            ArrayList<Todo> doneList = new ArrayList<>();
            Connection con = DatabaseConnection.initializeDatabase();

            String query = "SELECT * FROM kasp_todos.todolist where owner like '"+accountID+"' order by status desc, id desc, completionDate asc";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                Todo t = new Todo(rs.getInt("id"), rs.getString("owner"), rs.getString("title"), rs.getString("status"), rs.getString("completionDate"));
                todoList.add(t);
            }
            st.close();
            con.close();
            request.setAttribute("todoList", todoList);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            System.out.println("get todo list for"+accountID);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
