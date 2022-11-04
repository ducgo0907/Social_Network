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
import model.FriendRequest;

/**
 *
 * @author ngoqu
 */
public class FriendDAO extends DBContext {

    public List<FriendRequest> getAllFriendRequestById(int userBeRequestId) {
        List<FriendRequest> list = new ArrayList<>();
        String sql = "Select * from Friend_Requests where"
                + " user_be_request_id = ? and status = 'pending'";
        UserDAO ud = new UserDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userBeRequestId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                FriendRequest fq = new FriendRequest(
                        rs.getInt("user_request_id"),
                        rs.getInt("user_be_request_id"),
                        rs.getString("status"),
                        ud.getUserById(rs.getInt("user_request_id")),
                        ud.getUserById(rs.getInt("user_be_request_id"))
                );
                list.add(fq);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<FriendRequest> getAllFriend(int userId) {
        List<FriendRequest> list = new ArrayList<>();
        String sql = "Select * from Friend_Requests where"
                + " (user_be_request_id = ? or user_request_id = ?) and status = 'accepted'";
        UserDAO ud = new UserDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            st.setInt(2, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                FriendRequest fq = new FriendRequest(
                        rs.getInt("user_request_id"),
                        rs.getInt("user_be_request_id"),
                        rs.getString("status"),
                        ud.getUserById(rs.getInt("user_request_id")),
                        ud.getUserById(rs.getInt("user_be_request_id"))
                );
                list.add(fq);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public FriendRequest getRequest(int userRequestId, int userBeRequestId) {
        String sql = "SELECT * FROM Friend_Requests Where (user_request_id = ?"
                + " and user_be_request_id = ?) or "
                + "(user_request_id = ? and user_be_request_id = ?) ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userRequestId);
            st.setInt(2, userBeRequestId);
            st.setInt(3, userBeRequestId);
            st.setInt(4, userRequestId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new FriendRequest(
                        rs.getInt("user_request_id"),
                        rs.getInt("user_be_request_id"),
                        rs.getString("status")
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void requestFriend(FriendRequest friendRequest) {
        String sql = "INSERT INTO Friend_Requests VALUES (?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, friendRequest.getUserRequestId());
            st.setInt(2, friendRequest.getUserBeRequestId());
            st.setString(3, friendRequest.getStatus());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void acceptRequest(int userRequestId, int userBeRequestId) {
        String sql = "Update Friend_Requests SET status = 'accepted'"
                + "where user_be_request_id = ? and user_request_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userBeRequestId);
            st.setInt(2, userRequestId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteRequest(int userRequestId, int userBeRequestId) {
        String sql = "DELETE FROM Friend_Requests "
                + "where (user_be_request_id = ? and user_request_id = ?)"
                + " or (user_be_request_id = ? and user_request_id = ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userBeRequestId);
            st.setInt(2, userRequestId);
            st.setInt(3, userRequestId);
            st.setInt(4, userBeRequestId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        FriendDAO fd = new FriendDAO();
        FriendRequest fq = new FriendRequest(1, 2, "pending");
//        System.out.println(fd.getRequest(1, 11).getStatus());
        fd.deleteRequest(21, 1);
    }
}
