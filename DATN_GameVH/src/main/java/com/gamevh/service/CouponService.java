package com.gamevh.service;

import com.gamevh.entities.Coupon;
import com.gamevh.handle.BASE64DecodedMultipartFile;
import com.gamevh.handle.CustomException;
import com.gamevh.repository.CouponRepository;
import com.gamevh.request.CouponAddRequest;
import com.gamevh.request.CouponSearchRequest;
import jakarta.annotation.Resource;
import jakarta.xml.bind.DatatypeConverter;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.thymeleaf.util.StringUtils;

import java.awt.image.BufferedImage;
import java.io.*;
import java.security.GeneralSecurityException;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class CouponService {
    @Resource
    private CouponRepository couponRepository;

    @Autowired
    private GoogleDriveService driveService;
    public List<Coupon> getAllCoupon(CouponSearchRequest couponSearchRequest) {
        return couponRepository.getAllCouponBySearch(couponSearchRequest.getCouponId(),couponSearchRequest.getCouponName());
    }

    public ResponseEntity<?> addCoupon(CouponAddRequest couponAddRequest) throws GeneralSecurityException, IOException {
        Coupon coupon = new Coupon();
        BeanUtils.copyProperties(couponAddRequest,coupon);
        if(couponAddRequest.getStatus() == 1){
            coupon.setStatus(true);
        }else{
            coupon.setStatus(false);
        }
        String[] strings = couponAddRequest.getImage().split(",");
        if(strings.length <2){
            return ResponseEntity.ok(couponRepository.save(coupon));
        }
        String extension;
        switch (strings[0]) {//check image's extension
            case "data:image/jpeg;base64":
                extension = "jpeg";
                break;
            case "data:image/png;base64":
                extension = "png";
                break;
            default://should write cases for more images types
                extension = "jpg";
                break;
        }
        //convert base64 string to binary data
        byte[] data = DatatypeConverter.parseBase64Binary(strings[1]);
        BASE64DecodedMultipartFile multipartFile = new BASE64DecodedMultipartFile(data);
        String fileName = UUID.randomUUID().toString();
        String mimeType = strings[0];
        String folderId = "1FzsvJUCDFnb5bNqsoK5hwL2Ohimc9tqG"; // ID của thư mục trên Google Drive để lưu file
        // URL example:
        String fileId = driveService.uploadFile(multipartFile, fileName, mimeType, folderId);
        // Xử lý thành công
        String responseData = "{\"fileId\": \"" + fileId + "\"}";
        if(StringUtils.isEmpty(fileId)){
           return ResponseEntity.badRequest().build();
        }
        coupon.setImage(fileId);
        return ResponseEntity.ok(couponRepository.save(coupon));
    }

    public void deleteCoupon(Integer couponId) throws CustomException {
        Optional<Coupon> coupon = couponRepository.findById(couponId);
        if(coupon.isPresent()){
            throw new CustomException("Không tìm thấy danh mục sản phẩm với id " + couponId, HttpStatus.NOT_FOUND);
        }
        couponRepository.delete(coupon.get());
    }
}
