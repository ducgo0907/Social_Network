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
import model.User;

/**
 *
 * @author ngoqu
 */
public class LikeDAO extends DBContext {

    public int likeAmount(int postId) {
        int likeAmount = 0;
        String sql = "SELECT COUNT(id)as likeAmount\n"
                + "from Like_Comments\n"
                + "where post_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, postId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("likeAmount");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return likeAmount;
    }

    public List<User> getAllUserLikePost(int postId) {
        List<User> list = new ArrayList<>();
        String sql = "Select * from Like_comments where post_id = ?";
        UserDAO ud = new UserDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, postId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User user = ud.getUserById(rs.getInt("user_id"));
                list.add(user);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public boolean checkExisted(int userId, int postId) {
        String sql = "Select * from Like_Comments where user_id = ? and post_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            st.setInt(2, postId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public void insert(int userId, int postId) {
        String sql = "INSERT INTO Like_Comments VALUES (?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            st.setInt(2, postId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void destroy(int userId, int postId) {
        String sql = "DELETE FROM Like_Comments where user_id = ? and post_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            st.setInt(2, postId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void destroyByPostId(int postId) {
        String sql = "DELETE FROM Like_Comments where post_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, postId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        LikeDAO ld = new LikeDAO();
        boolean lm = ld.checkExisted(1, 14);
        System.out.println();
    }
}
