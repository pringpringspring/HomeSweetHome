package product.model.dto;

import java.util.List;

public class ProductExt extends Product {

	private int productImgCount;
	private List<ProductImage> productImages;
	
	public int getProductImgCount() {
		return productImgCount;
	}
	
	public void setProductImgCount(int productImgCount) {
		this.productImgCount = productImgCount;
	}
	
	public List<ProductImage> getProductImages() {
		return productImages;
	}
	
	public void setProductImages(List<ProductImage> productImages) {
		this.productImages = productImages;
	}

	@Override
	public String toString() {
		return "ProductExt [productImgCount=" + productImgCount + ", productImages=" + productImages
				+ ", getProductId()=" + getProductId() + ", getProductName()=" + getProductName() + ", getMainCode()="
				+ getMainCode() + ", getSubCode()=" + getSubCode() + ", getBrandId()=" + getBrandId()
				+ ", getProductHeight()=" + getProductHeight() + ", getProductWidth()=" + getProductWidth()
				+ ", getProductDepth()=" + getProductDepth() + ", getProductColor()=" + getProductColor()
				+ ", getProductPrice()=" + getProductPrice() + ", getRegDate()=" + getRegDate() + ", getPContent()="
				+ getPContent() + ", toString()=" + super.toString() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + "]";
	}

	
}