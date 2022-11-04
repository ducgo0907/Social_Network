/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

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
    private List<Comment> comments;
    private int likeAmout;
    private String imagePath;
    private List<User> userLike;
    private String Status;

    public Post() {
    }

    public Post(String content, int userId) {
        this.content = content;
        this.userId = userId;
    }

    public Post(String content, int userId, String image_path) {
        this.content = content;
        this.userId = userId;
        this.imagePath = image_path;
    }

    public Post(String content, int userId, String imagePath, String Status) {
        this.content = content;
        this.userId = userId;
        this.imagePath = imagePath;
        this.Status = Status;
    }

    public Post(String content, int userId, String dateCreated, String imagePath, String Status) {
        this.content = content;
        this.userId = userId;
        this.dateCreated = dateCreated;
        this.imagePath = imagePath;
        this.Status = Status;
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

    public Post(int postId, String content, int userId, User user, String dateCreated, List<Comment> comments) {
        this.postId = postId;
        this.content = content;
        this.userId = userId;
        this.user = user;
        this.dateCreated = dateCreated;
        this.comments = comments;
    }

    public Post(int postId, String content, int userId, User user, String dateCreated, List<Comment> comments, int likeAmout) {
        this.postId = postId;
        this.content = content;
        this.userId = userId;
        this.user = user;
        this.dateCreated = dateCreated;
        this.comments = comments;
        this.likeAmout = likeAmout;
    }

    public Post(int postId, String content, int userId, User user, String dateCreated, List<Comment> comments, int likeAmout, String image_path) {
        this.postId = postId;
        this.content = content;
        this.userId = userId;
        this.user = user;
        this.dateCreated = dateCreated;
        this.comments = comments;
        this.likeAmout = likeAmout;
        this.imagePath = image_path;
    }

    public Post(int postId, String content, int userId, User user, String dateCreated, List<Comment> comments, int likeAmout, String imagePath, List<User> userLike) {
        this.postId = postId;
        this.content = content;
        this.userId = userId;
        this.user = user;
        this.dateCreated = dateCreated;
        this.comments = comments;
        this.likeAmout = likeAmout;
        this.imagePath = imagePath;
        this.userLike = userLike;
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

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public int getLikeAmout() {
        return likeAmout;
    }

    public void setLikeAmout(int likeAmout) {
        this.likeAmout = likeAmout;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public List<User> getUserLike() {
        return userLike;
    }

    public void setUserLike(List<User> userLike) {
        this.userLike = userLike;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

}
