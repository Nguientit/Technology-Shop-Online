/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class UploadFile extends HttpServlet {

    private String UPLOAD_DIRECTORY;

    public List<String> fileUpload(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UPLOAD_DIRECTORY = request.getServletContext().getRealPath("") + File.separator + "images";
        Path uploadPath = Paths.get(UPLOAD_DIRECTORY);
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }
        UPLOAD_DIRECTORY = uploadPath.toString();

        List<String> uploadedFileNames = new ArrayList<>();

        try {
            // Tìm tất cả các phần được gửi từ form
            for (Part part : request.getParts()) {
                // Lấy tên của tập tin được gửi
                String fileName = extractFileName(part);
                if (!fileName.equals("") || !fileName.isEmpty()) {
                    // Lưu tập tin vào thư mục upload
                    part.write(UPLOAD_DIRECTORY + File.separator + fileName);
                    // Thêm tên tập tin vào danh sách
                    uploadedFileNames.add(fileName);
                }
            }
        } catch (ServletException | IOException e) {
            System.out.println("===========================");
            System.out.println("Error at upload file: " + e.getMessage());
            e.getStackTrace();
        }
        return uploadedFileNames;
    }

    /**
     * Phương thức hỗ trợ để trích xuất tên tập tin từ phần được gửi trong yêu
     * cầu HTTP multipart.
     *
     * @param part Phần chứa thông tin về tập tin được gửi.
     * @return Tên của tập tin được trích xuất từ phần, hoặc chuỗi trống nếu
     * không tìm thấy.
     */
    //private String extractFileName(Part part) {
    // Lấy tiêu đề "content-disposition" từ phần
//        String contentDisp = part.getHeader("content-disposition");
//        String[] items = contentDisp.split(";");
//        for (String s : items) {
//            if (s.trim().startsWith("filename")) {
//                // Lấy tên tập tin ban đầu
//                String originalFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
//                // Tạo một chuỗi duy nhất (UUID) để thêm vào tên tập tin
//                String uniqueID = UUID.randomUUID().toString();
//                // Tách phần mở rộng của tập tin (nếu có)
//                String fileExtension = "";
//                int dotIndex = originalFileName.lastIndexOf('.');
//                if (dotIndex != -1) {
//                    fileExtension = originalFileName.substring(dotIndex);
//                    originalFileName = originalFileName.substring(0, dotIndex);
//                }
//                // Kết hợp tên tập tin ban đầu với UUID để tạo ra tên tập tin duy nhất
//                return originalFileName + "_" + uniqueID + fileExtension;
//            }
//        }
//        return "";
//    }
    private String extractFileName(Part part) {
        // Lấy tiêu đề "content-disposition" từ phần
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                // Lấy tên tập tin ban đầu
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
