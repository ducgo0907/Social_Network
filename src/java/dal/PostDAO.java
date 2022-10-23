/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import model.Post;

/**
 *
 * @author ngoqu
 */
public class PostDAO extends DBContext {

    public List<Post> getAllPosts() {
        String sql = "Select * from posts ORDER BY dateCreated DESC";
        List<Post> list = new ArrayList<>();
        UserDAO ud = new UserDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Post post = new Post(rs.getInt("postId"), rs.getString("content"),
                        rs.getInt("userId"),
                        ud.getUserById(rs.getInt("userId")),
                        rs.getString("dateCreated"));
                list.add(post);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    /**
     * Get Post by post_id.
     *
     * @param id
     * @return
     */
    public Post getPostById(int id) {
        String sql = "Select * from posts where postId = ? ";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Post(
                        rs.getInt("postId"),
                        rs.getString("content"),
                        rs.getInt("userId"),
                        rs.getString("dateCreated")
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * This method will add post information to database.
     *
     * @param post
     */
    public void insert(Post post) {
        String sql = "Insert into Posts VALUES(?, ?, ?)";
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, post.getContent());
            st.setInt(2, post.getUserId());
            st.setString(3, dtf.format(now));
            st.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     * Destroy post by id
     *
     * @param id
     */
    public void destroyPostById(int id) {
        String sql = "Delete from Posts where postId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        PostDAO c = new PostDAO();
        List<Post> list = c.getAllPosts();
        Post post = c.getPostById(12);
        System.out.println(post.getContent());
        System.out.println(list.get(1).getPostId());
    }
}
