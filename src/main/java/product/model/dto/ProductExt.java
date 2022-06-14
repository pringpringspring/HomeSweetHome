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


}