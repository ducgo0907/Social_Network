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
import model.Message;

/**
 *
 * @author ngoqu
 */
public class MessageDAO extends DBContext {

    public List<Message> getAllMessage(int user_send_id, int user_receive_id) {
        List<Message> list = new ArrayList<>();
        String sql = "Select * from messagesuser where (user_send_id = ? and"
                + " user_receive_id = ?) or (user_send_id = ? and user_receive_id = ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user_send_id);
            st.setInt(2, user_receive_id);
            st.setInt(3, user_receive_id);
            st.setInt(4, user_send_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Message message = new Message(
                        rs.getInt("messageId"),
                        rs.getString("messageContent"),
                        rs.getInt("user_send_id"),
                        rs.getInt("user_receive_id"),
                        rs.getString("date_created")
                );
                list.add(message);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertMessage(String content, int user_send_id, int user_receive_id) {
        String sql = "Insert into messagesuser VALUES(?, ?, ?, ?)";
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, content);
            st.setInt(2, user_send_id);
            st.setInt(3, user_receive_id);
            st.setString(4, dtf.format(now));
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        MessageDAO md = new MessageDAO();
//        md.insertMessage("I want to talk with you", 1, 11);
        System.out.println(md.getAllMessage(1, 11).get(0).getContent());
    }
}
