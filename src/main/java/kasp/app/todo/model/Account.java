package kasp.app.todo.model;

import lombok.Getter;
import lombok.Setter;

public class Account {
    @Getter
    @Setter
    String accountID,accountName,accountRoll;
    public Account(String accountID, String accountName, String accountRoll){
        this.accountID=accountID;
        this.accountName=accountName;
        this.accountRoll=accountRoll;
    }

    public String getAccountID() {
        return accountID;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getAccountRoll() {
        return accountRoll;
    }

    public void setAccountRoll(String accountRoll) {
        this.accountRoll = accountRoll;
    }

    @Override
    public String toString() {
        return "account{" +
                "accountID='" + accountID + '\'' +
                ", accountName='" + accountName + '\'' +
                ", accountRoll='" + accountRoll + '\'' +
                '}';
    }
}
