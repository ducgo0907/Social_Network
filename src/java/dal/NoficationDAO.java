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
import model.Nofication;
import model.Post;
import utils.Helper;

/**
 *
 * @author ngoqu
 */
public class NoficationDAO extends DBContext {

    public List<Nofication> getTopFiveNofication(int userId) {
        PostDAO pd = new PostDAO();
        List<Post> listPost = pd.getAllPosts(userId);
        String listPostIds = Helper.listPostsIds(listPost);
        String sql = "Select TOP (5) * from Nofications where postId in " + listPostIds 
                + " ORDER BY id desc";
        List<Nofication> list = new ArrayList<>();
        UserDAO ud = new UserDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Nofication nofication = new Nofication(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        ud.getUserById(rs.getInt("userId")),
                        pd.getPostById(rs.getInt("postId"))
                );
                list.add(nofication);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertNofication(int postId, int userId, String message) {
        String sql = "Insert into nofications values (? , ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, postId);
            st.setInt(2, userId);
            st.setString(3, message);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void destroyByPostId(int postId){
        String sql = "DELETE Nofications where postId = ? ";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, postId);
            st.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
//        new NoficationDAO().insertNofication(34, 1, "like");
        new NoficationDAO().destroyByPostId(0);
    }
}
