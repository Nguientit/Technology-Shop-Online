package controller.customer;

import dal.FeedbackDBContext;
import dal.ProductDetailDBContext;
import entity.Account;
import entity.Feedback;
import entity.Product;
import entity.ProductDetail;
import entity.User;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import util.UploadFile;

@WebServlet(name = "FeedbackController", urlPatterns = {"/feedback"})
@MultipartConfig
public class FeedbackController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Feedback> tempFeedbacks = (List<Feedback>) session.getAttribute("tempFeedbacks");
        if (tempFeedbacks == null) {
            tempFeedbacks = new ArrayList<>();
        }

        // Handle file upload
        UploadFile uploadFile = new UploadFile();
        List<String> imgProduct1 = uploadFile.fileUpload(request, response);

        // Parse form parameters
        Feedback feedback = new Feedback();
        Product product = new Product();
        product.setId(Integer.parseInt(request.getParameter("pid")));
        feedback.setProduct(product);

        Account account = new Account();
        account.setId(Integer.parseInt(request.getParameter("aid")));
        feedback.setAccount(account);

        feedback.setRate(Integer.parseInt(request.getParameter("rate")));
        feedback.setContent(request.getParameter("content"));
        feedback.setRateTime(LocalDate.now());

        String currentImages = request.getParameter("currentImages");
            if (!imgProduct1.isEmpty() && imgProduct1.get(0) != null && !imgProduct1.get(0).isEmpty()) {
                feedback.setImg(String.join(",", imgProduct1)); // sử dụng ảnh mới tải lên nếu có 
            } else {
                feedback.setImg(currentImages); // Sử dụng hình ảnh hiện có nếu không có hình ảnh mới được tải lên
            }

        tempFeedbacks.add(feedback);
        session.setAttribute("tempFeedbacks", tempFeedbacks);
        session.setAttribute("feedback", feedback);

        // Save to database
        FeedbackDBContext db = new FeedbackDBContext();
        for (Feedback fb : tempFeedbacks) {
            db.insertFeedback(fb);
        }
        session.removeAttribute("tempFeedbacks");

        response.sendRedirect("feedbackSuccess");
    }

    @Override
    public String getServletInfo() {
        return "Feedback Servlet";
    }
}
