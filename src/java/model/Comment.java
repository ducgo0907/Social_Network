/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ngoqu
 */
public class Comment {
    private int commentId;
    private String content;
    private int userId;
    private int postId;
    private User user;

    public Comment(int commentId, String content, int userId, int postId) {
        this.commentId = commentId;
        this.content = content;
        this.userId = userId;
        this.postId = postId;
    }

    public Comment(String content, int userId, int postId) {
        this.content = content;
        this.userId = userId;
        this.postId = postId;
    }

    public Comment(int commentId, String content, int userId, int postId, User user) {
        this.commentId = commentId;
        this.content = content;
        this.userId = userId;
        this.postId = postId;
        this.user = user;
    }
    
    

    public Comment() {
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
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

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
    
}
