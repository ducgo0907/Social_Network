/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ngoqu
 */
public class User {
    private int userId;
    private String name;
    private String email;
    private String password;
    private int admin;

    public User() {
    }
    
    public User(int userId, String name, String email, int admin){
        this.name = name;
        this.userId = userId;
        this.email = email;
        this.admin = admin;
    }

    public User(String name, String email, String password, int admin) {
        this.email = email;
        this.name = name;
        this.password = password;
        this.admin = admin;
    }

    public User(int userId, String name, String email, String password, int admin) {
        this.userId = userId;
        this.name = name;
        this.email = email;
        this.password = password;
        this.admin = admin;
    }

    public String getEmail() {
        return email;
    }

    public int getUserId() {
        return userId;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getAdmin() {
        return admin;
    }

    public void setAdmin(int admin) {
        this.admin = admin;
    }

}
