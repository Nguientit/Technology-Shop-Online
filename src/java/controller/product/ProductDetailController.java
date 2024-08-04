package controller.product;

import com.google.gson.Gson;
import dal.BrandDBContext;
import dal.CategoryDBContext;
import dal.DiscountDBContext;
import dal.FeedbackDBContext;
import dal.ProductDBContext;
import dal.ProductDetailDBContext;
import entity.Category;
import entity.Discount;
import entity.Feedback;
import entity.ProductDetail;
import entity.ProductDetailDTO;
import java.io.IOException;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class ProductDetailController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String color = request.getParameter("color");
        String criteria = request.getParameter("criteria");

        if (color != null && criteria != null) {
            handleAjaxRequest(request, response);
        } else if (criteria != null) {
            handleCriteriaRequest(request, response);
        } else if (request.getParameter("action") != null && request.getParameter("action").equals("filterFeedbacks")) {
            handleFilterRequest(request, response);
        } else {
            handlePageRequest(request, response);
        }
    }

    private void handleAjaxRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pid = request.getParameter("pid");
        String color = request.getParameter("color");
        String criteria = request.getParameter("criteria");
        ProductDetailDBContext db = new ProductDetailDBContext();
        ProductDetailDTO productDetailDTO = db.getProductDetailByColorAndCriteria(pid, color, criteria);

        String json = new Gson().toJson(productDetailDTO);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

    private void handleCriteriaRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pid = request.getParameter("pid");
        String criteria = request.getParameter("criteria");
        ProductDetailDBContext db = new ProductDetailDBContext();
        List<ProductDetailDTO> productDetails = db.getProductDetailsByPidAndCriteria(pid, criteria);

        String json = new Gson().toJson(productDetails);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

    private void handleFilterRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int pid = Integer.parseInt(request.getParameter("pid"));
        boolean hasImage = Boolean.parseBoolean(request.getParameter("hasImage"));
        String ratingParam = request.getParameter("rating");
        Integer rating = ratingParam != null ? Integer.parseInt(ratingParam) : null;
        FeedbackDBContext feedbackDB = new FeedbackDBContext();

        List<Feedback> feedbacks = feedbackDB.getFeedbacksByProductDetailId(pid, hasImage, rating);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(new Gson().toJson(feedbacks));
    }

    private void handlePageRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pid = request.getParameter("pid");
        String pdcriteria = request.getParameter("pdcriteria");
        ProductDetailDBContext db = new ProductDetailDBContext();
        ProductDetail pd = db.getProductById(pid);

        List<ProductDetailDTO> productDetails = db.getProductDetailsByPidAndCriteria(pid, pdcriteria);
        Set<String> allCriteria = db.getAllCriteriaByPid(pid);
        Set<String> uniqueCriteria = productDetails.stream()
                .map(dto -> dto.getProductDetail().getCriteria())
                .collect(Collectors.toSet());

        // Lấy danh sách feedbacks
        FeedbackDBContext feedbackDB = new FeedbackDBContext();
        List<Feedback> feedbacks = feedbackDB.getFeedbacksByProductDetailId(Integer.parseInt(pid), false, null);

        // Tính toán các thông số đánh giá
        int[] starCounts = new int[5];
        int totalRatings = feedbacks.size();
        int totalStars = 0;

        for (Feedback feedback : feedbacks) {
            int rate = feedback.getRate();
            if (rate >= 1 && rate <= 5) {
                starCounts[rate - 1]++;
                totalStars += rate;
            }
        }

        double averageRating = totalRatings == 0 ? 0 : (double) totalStars / totalRatings;

        double[] starPercentages = new double[5];
        for (int i = 0; i < 5; i++) {
            starPercentages[i] = totalRatings == 0 ? 0 : (double) starCounts[i] * 100 / totalRatings;
        }

        // Tìm kiếm sản phẩm
        String searchP = request.getParameter("search");
        ProductDBContext productDB = new ProductDBContext();
        CategoryDBContext cateDB = new CategoryDBContext();
        DiscountDBContext disDB = new DiscountDBContext();
        List<ProductDetail> list = productDB.searchByName(searchP);
        List<Category> listC = cateDB.getAllCategory();
        List<Discount> listDC = disDB.getDiscounts();

        request.setAttribute("allCriteria", allCriteria);
        request.setAttribute("productDetail", pd);
        request.setAttribute("productDetails", productDetails);
        request.setAttribute("uniqueCriteria", uniqueCriteria);
        request.setAttribute("feedbacks", feedbacks);
        request.setAttribute("starCounts", starCounts);
        request.setAttribute("starPercentages", starPercentages);
        request.setAttribute("totalRatings", totalRatings);
        request.setAttribute("averageRating", averageRating);
        request.setAttribute("listP", list);
        request.setAttribute("listC", listC);
        request.setAttribute("listDC", listDC);
        request.getRequestDispatcher("/view/guest/product-details.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
