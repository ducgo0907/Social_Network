/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Group;
import model.Post;
import model.User;

/**
 *
 * @author ngoqu
 */
public class GroupDAO extends DBContext{
    
    public List<Group> getAllGroup(){
        List<Group> list = new ArrayList<>();
        String sql = "Select * from groups";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            GroupDAO gd = new GroupDAO();
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Group group = new Group(
                         rs.getInt("groupId"),
                        rs.getString("name"),
                        rs.getInt("userId"),
                        rs.getString("avatar_path"),
                        gd.getAllPostInGroup(rs.getInt("groupId")),
                        gd.getAllMemberOfGroup(rs.getInt("groupId")),
                        gd.getAllRequestMemberOfGroup(rs.getInt("groupId"))
                );
                list.add(group);
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
    
    public List<Post> getAllPostInGroup(int groupId){
        List<Post> list = new ArrayList<>();
        String sql = "Select * from PostGroup where groupId = ? ORDER BY id DESC";
        PostDAO pd = new PostDAO();
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, groupId);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Post post = pd.getPostById(rs.getInt("postId"));
                list.add(post);
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        
        return list;
    }
    
    public Group getGroupById(int groupId){
        String sql= "Select * from Groups where groupId = ?";
        GroupDAO gd = new GroupDAO();
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, groupId);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                return new Group(
                        rs.getInt("groupId"),
                        rs.getString("name"),
                        rs.getInt("userId"),
                        rs.getString("avatar_path"),
                        gd.getAllPostInGroup(rs.getInt("groupId")),
                        gd.getAllMemberOfGroup(rs.getInt("groupId")),
                        gd.getAllRequestMemberOfGroup(rs.getInt("groupId"))
                );
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return null;
    }
    
    public void insertGroup(Group group){
        String sql = "INSERT INTO Groups VALUES(?, ?, ?)";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, group.getName());
            st.setInt(2, group.getOwnerId());
            st.setString(3, group.getAvtarGroupPath());
            st.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    
    public void requestJoinGroup(int memberId, int groupId){
        String sql = "INSERT INTO JoinGroup VALUES (?, ?, ?)";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, memberId);
            st.setInt(2, groupId);
            st.setString(3, "pending");
            st.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    
    public void acceptMember(int memberId, int groupId){
        String sql = "Update JoinGroup set status = 'accepted'"
                + " where memberId = ? and group_id = ?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, memberId);
            st.setInt(2, groupId);
            st.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    
    public List<User> getAllMemberOfGroup(int groupId){
        List<User> list = new ArrayList<>();
        String sql = "Select * from JoinGroup where group_id = ? and status='accepted'";
        UserDAO ud = new UserDAO();
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, groupId);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                User user = ud.getUserById(rs.getInt("memberId"));
                list.add(user);
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        
        return list;
    }
    
    public List<User> getAllRequestMemberOfGroup(int groupId){
        List<User> list = new ArrayList<>();
        String sql = "Select * from JoinGroup where group_id = ? and status='pending'";
        UserDAO ud = new UserDAO();
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, groupId);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                User user = ud.getUserById(rs.getInt("memberId"));
                list.add(user);
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        
        return list;
    }
    
    public void refuseMember(int memberId, int groupId){
        String sql = "Delete JoinGroup"
                + " where memberId = ? and group_id = ?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, memberId);
            st.setInt(2, groupId);
            st.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    
    public static void main(String[] args) {
        GroupDAO gd = new GroupDAO();
        Group group = new Group("Hoi nhung nguoi tin T1 se vo dich 2022", 1, null);
//        gd.requestJoinGroup(12, 1);
//        gd.refuseMember(11, 1);
    }
}
