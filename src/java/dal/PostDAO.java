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
import utils.Helper;

/**
 *
 * @author ngoqu
 */
public class PostDAO extends DBContext {

    public List<Post> getAllPosts(int userId) {
        FriendDAO fd = new FriendDAO();
        String friendsIds = Helper.listIdFriend(fd.getFriendById(userId));
        String sql = "Select * from posts where userId = ? or (status = 'public' and "
                + "userId in " + friendsIds + ")"
                + " order by dateCreated desc";
        List<Post> list = new ArrayList<>();
        UserDAO ud = new UserDAO();
        CommentDAO cd = new CommentDAO();
        LikeDAO ld = new LikeDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Post post = new Post(
                        rs.getInt("postId"),
                        rs.getString("content"),
                        rs.getInt("userId"),
                        ud.getUserById(rs.getInt("userId")),
                        rs.getString("dateCreated"),
                        cd.getAllCommentByPostId(rs.getInt("postID")),
                        ld.likeAmount(rs.getInt("postId")),
                        rs.getString("image_path"),
                        ld.getAllUserLikePost(rs.getInt("postId")),
                        rs.getString("status")
                );
                list.add(post);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Post> getAllPostsByUserId(int userId) {
        String sql = "Select * from posts where userId = ? ORDER BY dateCreated DESC";
        List<Post> list = new ArrayList<>();
        UserDAO ud = new UserDAO();
        CommentDAO cd = new CommentDAO();
        LikeDAO ld = new LikeDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Post post = new Post(
                        rs.getInt("postId"),
                        rs.getString("content"),
                        rs.getInt("userId"),
                        ud.getUserById(rs.getInt("userId")),
                        rs.getString("dateCreated"),
                        cd.getAllCommentByPostId(rs.getInt("postID")),
                        ld.likeAmount(rs.getInt("postId")),
                        rs.getString("image_path")
                );
                list.add(post);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Post> getAllPostsByContent(String content) {
        String sql = "Select * from posts where content like ? ORDER BY dateCreated DESC";
        List<Post> list = new ArrayList<>();
        UserDAO ud = new UserDAO();
        CommentDAO cd = new CommentDAO();
        LikeDAO ld = new LikeDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + content + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Post post = new Post(
                        rs.getInt("postId"),
                        rs.getString("content"),
                        rs.getInt("userId"),
                        ud.getUserById(rs.getInt("userId")),
                        rs.getString("dateCreated"),
                        cd.getAllCommentByPostId(rs.getInt("postID")),
                        ld.likeAmount(rs.getInt("postId")),
                        rs.getString("image_path")
                );
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
        UserDAO ud = new UserDAO();
        CommentDAO cd = new CommentDAO();
        LikeDAO ld = new LikeDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Post(
                        rs.getInt("postId"),
                        rs.getString("content"),
                        rs.getInt("userId"),
                        ud.getUserById(rs.getInt("userId")),
                        rs.getString("dateCreated"),
                        cd.getAllCommentByPostId(rs.getInt("postID")),
                        ld.likeAmount(rs.getInt("postId")),
                        rs.getString("image_path"),
                        ld.getAllUserLikePost(rs.getInt("postId")),
                        rs.getString("status")
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
        String sql = "Insert into Posts VALUES(?, ?, ?, ?, ?)";
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, post.getContent());
            st.setInt(2, post.getUserId());
            st.setString(3, dtf.format(now));
            st.setString(4, post.getImagePath());
            if (post.getStatus() == null) {
                post.setStatus("public");
            }
            st.setString(5, post.getStatus());
            st.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int insertReturnId(Post post) {
        String sql = "Insert into Posts VALUES(?, ?, ?, ?, ?)";
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, post.getContent());
            st.setInt(2, post.getUserId());
            st.setString(3, dtf.format(now));
            st.setString(4, post.getImagePath());
            if (post.getStatus() == null) {
                post.setStatus("public");
            }
            st.setString(5, post.getStatus());
            st.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
        sql = "Select * from posts where dateCreated = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, dtf.format(now));
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("postId");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public void insertPostGroup(int postId, int groupId) {
        String sql = "INSERT INTO PostGroup values (?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, groupId);
            st.setInt(2, postId);
            st.executeUpdate();
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
        String sql = "Delete Posts where postId = ?";
        CommentDAO cd = new CommentDAO();
        LikeDAO ld = new LikeDAO();
        NoficationDAO nd = new NoficationDAO();
        cd.destroyCommentByPostId(id);
        ld.destroyByPostId(id);
        nd.destroyByPostId(id);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updatePost(int postId, String content) {
        String sql = "Update Posts set content = ? where postId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, content);
            st.setInt(2, postId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void changeStatusPost(int postId, String status) {
        String sql = "Update Posts set status = ? where postId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setInt(2, postId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        PostDAO c = new PostDAO();
//        List<Post> list = c.getAllPosts();
        Post post = new Post("Hello Everyone", 13);
        System.out.println(c.getAllPosts(26).get(0).getContent());
    }
}
