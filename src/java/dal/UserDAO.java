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
import model.Post;
import model.User;

/**
 *
 * @author ngoqu
 */
public class UserDAO extends DBContext {

    /**
     * Get user from database if it existed.
     *
     * @param email email of user
     * @param password password of user
     * @return
     */
    public User getUser(String email, String password) {
        String sql = "Select * from Users where email= ? and password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt("userId"),
                        rs.getString("name"), email,
                        password, rs.getInt("admin"),
                        rs.getString("avatar_path"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    /**
     *
     * @param id
     * @return
     */
    public User getUserById(int id) {
        String sql = "SELECT * FROM Users where userId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt("userId"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getInt("admin"),
                        rs.getString("avatar_path")
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<User> getUsersBySearch(String name) {
        List<User> list = new ArrayList<>();
        String sql = "Select * from users where name like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User user = new User(
                        rs.getInt("userId"),
                        rs.getString("name"),
                        rs.getString(("avatar_path"))
                );
                list.add(user);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }
    
    public List<String> getAllImageById(int userId){
        List<String> listImagePath = new ArrayList<>();
        listImagePath.add(new UserDAO().getUserById(userId).getAvatarPath());
        PostDAO pd = new PostDAO();
        List<Post> listPost = pd.getAllPostsByUserId(userId);
        for (Post post : listPost) {
            if(post.getImagePath() != null){
                listImagePath.add(post.getImagePath());
            }
        }
        return listImagePath;
    }

    /**
     * Check a email is existed or not?
     *
     * @param email
     * @return
     */
    public boolean checkExistedUser(String email) {
        String sql = "Select * from Users where email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    /**
     * This method will add user information to database.
     *
     * @param user the information of user
     */
    public void insert(User user) {
        String sql = "Insert into Users VALUES(?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getName());
            st.setString(2, user.getEmail());
            st.setString(3, user.getPassword());
            st.setInt(4, user.getAdmin());
            if (user.getAvatarPath() != null) {
                st.setString(5, user.getAvatarPath());
            }else{
                st.setString(5, "images/default_image.png");
            }
            st.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     * Update information of user
     *
     * @param user
     */
    public void update(User user) {
        String sql = "update users set name = ?, avatar_path = ? where email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getName());
            st.setString(2, user.getAvatarPath());
            st.setString(3, user.getEmail());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void change(User user) {
        String sql = "update users set password = ? where email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getPassword());
            st.setString(2, user.getEmail());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        UserDAO ud = new UserDAO();
        User user = ud.getUserById(1);
        List<String> list = ud.getAllImageById(1);
        for (String string : list) {
            System.out.println(string);
        }
    }
}
