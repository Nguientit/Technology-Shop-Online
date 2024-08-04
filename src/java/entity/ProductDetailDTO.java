/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class ProductDetailDTO {

    private ProductDetail productDetail;
    private float discountPrice;

    public ProductDetailDTO(ProductDetail productDetail, float discountPrice) {
        this.productDetail = productDetail;
        this.discountPrice = discountPrice;
    }

    public ProductDetail getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(ProductDetail productDetail) {
        this.productDetail = productDetail;
    }

    public float getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(float discountPrice) {
        this.discountPrice = discountPrice;
    }

    @Override
    public String toString() {
        return "ProductDetailDTO{" + "productDetail=" + productDetail + ", discountPrice=" + discountPrice + '}';
    }
    
}

