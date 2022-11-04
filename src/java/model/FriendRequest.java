/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ngoqu
 */
public class FriendRequest {
    private int id;
    private int userRequestId;
    private int userBeRequestId;
    private String status;
    private User userRequest;
    private User userBeRequest;

    public FriendRequest() {
    }

    public FriendRequest(int userRequestId, int userBeRequestId, String status) {
        this.userRequestId = userRequestId;
        this.userBeRequestId = userBeRequestId;
        this.status = status;
    }

    public FriendRequest(int id, int userRequestId, int userBeRequestId, String status) {
        this.id = id;
        this.userRequestId = userRequestId;
        this.userBeRequestId = userBeRequestId;
        this.status = status;
    }

    public FriendRequest(int userRequestId, int userBeRequestId, String status, User userRequest, User userBeRequest) {
        this.userRequestId = userRequestId;
        this.userBeRequestId = userBeRequestId;
        this.status = status;
        this.userRequest = userRequest;
        this.userBeRequest = userBeRequest;
    }

    public FriendRequest(int id, int userRequestId, int userBeRequestId, String status, User userRequest, User userBeRequest) {
        this.id = id;
        this.userRequestId = userRequestId;
        this.userBeRequestId = userBeRequestId;
        this.status = status;
        this.userRequest = userRequest;
        this.userBeRequest = userBeRequest;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserRequestId() {
        return userRequestId;
    }

    public void setUserRequestId(int userRequestId) {
        this.userRequestId = userRequestId;
    }

    public int getUserBeRequestId() {
        return userBeRequestId;
    }

    public void setUserBeRequestId(int userBeRequestId) {
        this.userBeRequestId = userBeRequestId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public User getUserRequest() {
        return userRequest;
    }

    public void setUserRequest(User userRequest) {
        this.userRequest = userRequest;
    }

    public User getUserBeRequest() {
        return userBeRequest;
    }

    public void setUserBeRequest(User userBeRequest) {
        this.userBeRequest = userBeRequest;
    }
    
    
}
