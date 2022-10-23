/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ngoqu
 */
public class Post {
    private int postId;
    private String content;
    private int userId;
    private User user;
    private String dateCreated;

    public Post() {
    }

    public Post(String content, int userId) {
        this.content = content;
        this.userId = userId;
    }

    public Post(String content, int userId, User user) {
        this.content = content;
        this.userId = userId;
        this.user = user;
    }

    public Post(String content, int userId, User user, String dateCreated) {
        this.content = content;
        this.userId = userId;
        this.user = user;
        this.dateCreated = dateCreated;
    }

    public Post(int postId, String content, int userId, String dateCreated) {
        this.postId = postId;
        this.content = content;
        this.userId = userId;
        this.dateCreated = dateCreated;
    }

    public Post(int postId, String content, int userId, User user, String dateCreated) {
        this.postId = postId;
        this.content = content;
        this.userId = userId;
        this.user = user;
        this.dateCreated = dateCreated;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(String dateCreated) {
        this.dateCreated = dateCreated;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }
    
    
}
