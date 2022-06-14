package product.model.service;

import static common.JdbcTemplate.close;
import static common.JdbcTemplate.commit;
import static common.JdbcTemplate.getConnection;
import static common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import product.model.dao.ProductDao;
import product.model.dto.Product;
import product.model.dto.ProductBrand;
import product.model.dto.ProductExt;
import product.model.dto.ProductImage;
import product.model.dto.ProductMainCode;
import product.model.dto.ProductSubCode;

public class ProductService {
	public static final int NUM_PER_PAGE = 10;
	private ProductDao productDao = new ProductDao();
	
	public List<ProductExt> findAllProducts(Map<String, Object> param) {
		Connection conn = getConnection();
		List<ProductExt> productList = productDao.findAllProducts(conn, param);
		close(conn);
		return productList;
	}

	public int getTotalProducts() {
		Connection conn = getConnection();
		int totalContents = productDao.getTotalProducts(conn);
		close(conn);
		return totalContents;
	}

	public int enrollProduct(ProductExt product) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = productDao.enrollProduct(conn, product);
			
			String productId = product.getProductId();
			System.out.println("productId@service = " + productId);
			List<ProductImage> productImages = product.getProductImages();
			if(productImages != null && !productImages.isEmpty()) {
				for(ProductImage img : productImages) {
					img.setProductId(productId);
					result = productDao.enrollProductImages(conn, img);
				}
			}
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public List<ProductImage> findProductImagesByProductId(String productId) {
		Connection conn = getConnection();
		List<ProductImage> productImages = productDao.findProductImagesByProductId(conn, productId);
		close(conn);
		return productImages;
	}

	public int deleteProduct(String productId) {
		Connection conn = getConnection();
		int result = 0;
		int resultImg = 0;
		try {
			result = productDao.deleteProduct(conn, productId);
			resultImg = productDao.deleteProductProductImages(conn, productId);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public int updateProduct(ProductExt product) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = productDao.updateProduct(conn, product);
			String id = product.getProductId();
			List<ProductImage> productImages = product.getProductImages();
			if(productImages != null && !productImages.isEmpty()) {
				for(ProductImage img : productImages) {
					img.setProductId(id);
					result = productDao.enrollProductImages(conn, img);
				}
			}
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public ProductImage findProductImagesByImgNo(int no) {
		Connection conn = getConnection();
		ProductImage img = productDao.findProductImagesByImgNo(conn, no);
		close(conn);
		return img;
	}

	public int deleteProductImage(int no) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = productDao.deleteProductImage(conn, no);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public ProductExt findProductByProductId(String productId) {
		Connection conn = getConnection();
		ProductExt product = productDao.findProductByProductId(conn, productId);
		List<ProductImage> productImages = productDao.findProductImagesByProductId(conn, productId);
		product.setProductImages(productImages);
		close(conn);
		return product;
	}

	public List<ProductMainCode> findAllMainCodes() {
		Connection conn = getConnection();
		List<ProductMainCode> mainCodeList = productDao.findAllMainCodes(conn);
		close(conn);
		return mainCodeList;
	}

	public List<ProductSubCode> findAllSubCodes() {
		Connection conn = getConnection();
		List<ProductSubCode> subCodeList = productDao.findAllSubCodes(conn);
		close(conn);
		return subCodeList;
	}

	public List<ProductBrand> findAllBrandIds() {
		Connection conn = getConnection();
		List<ProductBrand> brandList = productDao.findAllBrandIds(conn);
		close(conn);
		return brandList;
	}

}
