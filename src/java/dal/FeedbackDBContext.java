package dal;

import entity.Account;
import entity.Feedback;
import entity.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class FeedbackDBContext extends DBContext {

    public void deleteFeedbackByAccountId(int aid) {
        try {
            String sql = "DELETE FROM [Feedback] WHERE aid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, aid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void insertFeedback(Feedback feedback) {
        try {
            String sql = "INSERT INTO Feedback (pid, fcontent, frate, fratetime, aid, fimg) \n"
                    + "VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            //
            String imageString = feedback.getImg() != null ? String.join(",", feedback.getImg()) : null;

            stm.setInt(1, feedback.getProduct().getId());
            stm.setString(2, feedback.getContent());
            stm.setInt(3, feedback.getRate());
            stm.setDate(4, java.sql.Date.valueOf(feedback.getRateTime()));
            stm.setInt(5, feedback.getAccount().getId());
            stm.setString(6, imageString);

            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Feedback> getFeedbacksByProductDetailId(int pid, boolean hasImage, Integer rating) {
        List<Feedback> feedbacks = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT f.fid, f.pid, f.fcontent, f.frate, f.fratetime, f.fimg, a.username, a.aid, u.uname "
                + "FROM Feedback f "
                + "INNER JOIN Account a ON f.aid = a.aid "
                + "INNER JOIN UserProfile u ON f.aid = u.aid "
                + "WHERE f.pid = ?");

        // Thêm điều kiện lọc theo hình ảnh và số sao
        if (hasImage) {
            sql.append(" AND f.fimg IS NOT NULL AND f.fimg != '' AND f.fimg != 'null'");
        }
        if (rating != null) {
            sql.append(" AND f.frate = ?");
        }

        try (PreparedStatement stmt = connection.prepareStatement(sql.toString())) {
            stmt.setInt(1, pid);
            int paramIndex = 2;
            if (hasImage && rating != null) {
                stmt.setInt(paramIndex, rating);
            } else if (rating != null) {
                stmt.setInt(paramIndex, rating);
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setId(rs.getInt("fid"));
                feedback.setContent(rs.getString("fcontent"));
                feedback.setRate(rs.getInt("frate"));
                feedback.setRateTime(rs.getDate("fratetime").toLocalDate());
                // Parse the comma-separated image string into an array
                String imageString = rs.getString("fimg");
                if (imageString != null && !imageString.isEmpty() && !imageString.equals("null")) {
                    feedback.setImg(imageString.split(","));
                } else {
                    feedback.setImg(new String[]{});
                }

                Account account = new Account();
                account.setId(rs.getInt("aid"));
                account.setUsername(rs.getString("username"));

                User user = new User();
                user.setName(rs.getString("uname"));

                account.setUser(user);
                feedback.setAccount(account);
                feedbacks.add(feedback);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return feedbacks;
    }

}
