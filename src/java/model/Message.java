/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ngoqu
 */
public class Message {
    private int id;
    private String content;
    private int userSendId;
    private int userReceiveId;
    private String dateCreated;

    public Message() {
    }

    public Message(int id, String content, int userSendId, int userReceiveId, String dateCreated) {
        this.id = id;
        this.content = content;
        this.userSendId = userSendId;
        this.userReceiveId = userReceiveId;
        this.dateCreated = dateCreated;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getUserSendId() {
        return userSendId;
    }

    public void setUserSendId(int userSendId) {
        this.userSendId = userSendId;
    }

    public int getUserReceiveId() {
        return userReceiveId;
    }

    public void setUserReceiveId(int userReceiveId) {
        this.userReceiveId = userReceiveId;
    }

   

    public String getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(String dateCreated) {
        this.dateCreated = dateCreated;
    }
    
    
}
