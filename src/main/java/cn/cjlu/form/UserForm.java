package cn.cjlu.form;

import java.io.Serializable;

/**
 * @create: 2020-10-04 14:51
 */
public class UserForm implements Serializable {

    private String username;
    private String password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
