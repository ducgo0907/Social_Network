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
import model.Comment;

/**
 *
 * @author ngoqu
 */
public class CommentDAO extends DBContext{
    
    /**
     * Get all comment in a post by postId;
     * 
     * @param postId
     * @return 
     */
    public List<Comment> getAllCommentByPostId(int postId){
        List<Comment> list = new ArrayList<>();
        String sql = "Select * from Comments where postId = ?";
        UserDAO ud = new UserDAO();
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, postId);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Comment comment = new Comment(
                        rs.getInt("commentId"),
                        rs.getString("content"),
                        rs.getInt("userId"),
                        rs.getInt("postId"),
                        ud.getUserById(rs.getInt("userId"))
                );
                list.add(comment);
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
    
    public void insertComment(Comment comment){
        String sql = "INSERT INTO Comments VALUES (?, ?, ?)";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, comment.getContent());
            st.setInt(2, comment.getUserId());
            st.setInt(3, comment.getPostId());
            st.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    
    public void destroyComment(int commentId){
        String sql = "Delete from comments where commentId = ?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, commentId);
            st.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    
    public void destroyCommentByPostId(int postId){
        String sql = "Delete from comments where postId = ?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, postId);
            st.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    
    
    public Comment getCommentById(int commentId){
        String sql = "SELECT * FROM comments where commentId = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, commentId);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                Comment comment = new Comment(
                        commentId,
                        rs.getString("content"),
                        rs.getInt("userId"),
                        rs.getInt("postId")
                );
                return comment;
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return null;
    }
    
    public static void main(String[] args) {
        CommentDAO cd = new CommentDAO();
//        Comment comment = new Comment(1, "Wow, that's amazing", 2, 11);
//        cd.insertComment(comment);
//        System.out.println(cd.getAllCommentByPostId(11).get(0).getContent());
//        System.out.println(cd.getCommentById(1).getContent());
        cd.destroyCommentByPostId(11);
         
    }
}
