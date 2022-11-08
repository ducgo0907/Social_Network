/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ngoqu
 */
public class Nofication {

    private int id;
    private int postId;
    private int userId;
    private String message;
    private User user;
    private Post post;

    public Nofication() {
    }

    public Nofication(int id, int postId, int userId, String message) {
        this.id = id;
        this.postId = postId;
        this.userId = userId;
        this.message = message;
    }

    public Nofication(int id, int postId, int userId, String message, User user, Post post) {
        this.id = id;
        this.postId = postId;
        this.userId = userId;
        this.message = message;
        this.user = user;
        this.post = post;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

}
