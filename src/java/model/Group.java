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
public class Group {
    private int groupId;
    private String name;
    private int ownerId;
    private String avtarGroupPath;
    private List<Post> listPost;
    private List<User> listMember;
    private List<User> listRequest;

    public Group() {
    }

    public Group(int groupId, String name, int ownerId) {
        this.groupId = groupId;
        this.name = name;
        this.ownerId = ownerId;
    }

    public Group(String name, int ownerId, String avtarGroupPath) {
        this.name = name;
        this.ownerId = ownerId;
        this.avtarGroupPath = avtarGroupPath;
    }

    public Group(int groupId, String name, int ownerId, String avtarGroupPath, List<Post> listPost) {
        this.groupId = groupId;
        this.name = name;
        this.ownerId = ownerId;
        this.avtarGroupPath = avtarGroupPath;
        this.listPost = listPost;
    }

    public Group(int groupId, String name, int ownerId, String avtarGroupPath, List<Post> listPost, List<User> listMember, List<User> listRequest) {
        this.groupId = groupId;
        this.name = name;
        this.ownerId = ownerId;
        this.avtarGroupPath = avtarGroupPath;
        this.listPost = listPost;
        this.listMember = listMember;
        this.listRequest = listRequest;
    }
    
    

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(int ownerId) {
        this.ownerId = ownerId;
    }

    public String getAvtarGroupPath() {
        return avtarGroupPath;
    }

    public Group(int groupId, String name, int ownerId, String avtarGroupPath) {
        this.groupId = groupId;
        this.name = name;
        this.ownerId = ownerId;
        this.avtarGroupPath = avtarGroupPath;
    }

    public void setAvtarGroupPath(String avtarGroupPath) {
        this.avtarGroupPath = avtarGroupPath;
    }

    public List<Post> getListPost() {
        return listPost;
    }

    public void setListPost(List<Post> listPost) {
        this.listPost = listPost;
    }

    public List<User> getListMember() {
        return listMember;
    }

    public void setListMember(List<User> listMember) {
        this.listMember = listMember;
    }

    public List<User> getListRequest() {
        return listRequest;
    }

    public void setListRequest(List<User> listRequest) {
        this.listRequest = listRequest;
    }
    
}
