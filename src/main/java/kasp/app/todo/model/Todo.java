package kasp.app.todo.model;

import lombok.Getter;
import lombok.Setter;

public class Todo {
    @Setter
    @Getter
    private int id;
    private String title, status, completionDate, owner;

    public Todo(int id, String owner, String title, String status, String completionDate) {
        this.id = id;
        this.owner = owner;
        this.title = title;
        this.status = status;
        this.completionDate = completionDate;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCompletionDate() {
        return completionDate;
    }

    public void setCompletionDate(String completionDate) {
        this.completionDate = completionDate;
    }

    public String getOwner() {
        return owner;
    }

    @Override
    public String toString() {
        return "Todo{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", status='" + status + '\'' +
                ", completionDate='" + completionDate + '\'' +
                ", owner='" + owner + '\'' +
                '}';
    }
}