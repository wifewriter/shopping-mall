package com.qf1801.group4.shop.common.util;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

public class UploadUtil<T> {

    /**
     * 储存文件夹路径
     */
    private static final String STORE_DIRECTORY = "/upload/";

    /**
     * 上传图片
     *
     * @param multipartFile 图片文件
     * @param request       请求
     * @return
     * @throws IOException
     */
    public static String pictureUploadPicture(MultipartFile multipartFile, HttpServletRequest request) throws IOException {
        String src = null;
        InputStream inputStream = null;
        FileOutputStream fileOutputStream = null;
        String uploadName = null;
        try {
            // 获取文件名
            uploadName = generateUploadName(multipartFile);
            // 上传路径
            String uploadPath = request.getServletContext().getRealPath("/upload");
            File uploadPathDir = new File(uploadPath);
            if (!uploadPathDir.exists()) {
                uploadPathDir.mkdir();
            }
            inputStream = multipartFile.getInputStream();
            src = uploadPath + "/" + uploadName;
            fileOutputStream = new FileOutputStream(src);
            // 缓存
            byte[] bytes = new byte[1024];
            int read = 0;
            while ((read = inputStream.read(bytes)) > 0) {
                fileOutputStream.write(bytes);
            }
        } finally {
            closeResource(inputStream, fileOutputStream);
        }
        return STORE_DIRECTORY + uploadName;
    }

    /**
     * 关闭io资源
     *
     * @param inputStream
     * @param fileOutputStream
     * @throws IOException
     */
    private static void closeResource(InputStream inputStream, FileOutputStream fileOutputStream) throws IOException {
        if (fileOutputStream != null) {
            fileOutputStream.close();
        }
        if (inputStream != null) {
            inputStream.close();
        }
    }

    /**
     * 生成上传到服务器时的文件名
     *
     * @param multipartFile 接收上传的文件
     * @return
     */
    private static String generateUploadName(MultipartFile multipartFile) {
        String originalFilename = multipartFile.getOriginalFilename();
        // 获取上传的文件类型
        String fileType = originalFilename.substring(originalFilename.lastIndexOf("."));
        // 上传文件名
        return UUID.randomUUID() + fileType;
    }

    /**
     * 验证是否为图片
     *
     * @param multipartFile
     * @return true为图片，false不是图片
     */
    public static boolean isPicture(MultipartFile multipartFile) {
        // 验证是否为图片
        String originalFilename = multipartFile.getOriginalFilename();
        String postfix = originalFilename.substring(originalFilename.lastIndexOf("."));
        String[] imgPostfixes = new String[]{".jpg", ".jpeg", ".png", ".gif"};
        for (String pf : imgPostfixes) {
            if (pf.equals(postfix)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 验证上传文件是否符合规定大小
     *
     * @param multipartFile 上传的图片文件
     * @param MaxSize 文件允许的最大大小(单位M)
     * @return true符合图片大小，false不符合图片大小
     */
    public static boolean validateSize(MultipartFile multipartFile, Integer MaxSize) {
        if (multipartFile.getSize() <= MaxSize * 1024 * 1024) {
            return true;
        }
        return false;
    }
}
