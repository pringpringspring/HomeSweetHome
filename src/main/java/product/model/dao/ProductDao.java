package product.model.dao;

import static common.JdbcTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import member.model.exception.MemberException;
import product.model.dto.Product;
import product.model.dto.ProductBrand;
import product.model.dto.ProductExt;
import product.model.dto.ProductImage;
import product.model.dto.ProductMainCode;
import product.model.dto.ProductSubCode;
import product.model.exception.ProductException;

public class ProductDao {
	
	private Properties prop = new Properties();
	
	public ProductDao() {
		String fileName = ProductDao.class.getResource("/sql/product-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private ProductExt handleProductResultSet(ResultSet rset) throws SQLException {
		ProductExt product = new ProductExt();
		product.setProductId(rset.getString("product_id"));
		product.setProductName(rset.getString("product_name"));
		product.setMainCode(rset.getString("main_code"));
		product.setSubCode(rset.getString("sub_code"));
		product.setBrandId(rset.getString("brand_id"));				
		product.setProductHeight(rset.getDouble("product_height"));
		product.setProductWidth(rset.getDouble("product_width"));
		product.setProductDepth(rset.getDouble("product_depth"));
		product.setProductColor(rset.getString("product_color"));				
		product.setProductPrice(rset.getInt("product_price"));				
		product.setRegDate(rset.getDate("reg_date"));				
		return product;
	}
	
	private ProductImage handleProductImageResultSet(ResultSet rset) throws SQLException {
		ProductImage img = new ProductImage();
		img.setNo(rset.getInt("attach_no"));
		img.setProductId(rset.getString("product_id"));
		img.setOriginalFilename(rset.getString("original_filename"));
		img.setRenamedFilename(rset.getString("renamed_filename"));
		img.setRegDate(rset.getDate("reg_date"));
		return img;
	}

	public List<ProductExt> findAllProducts(Connection conn, Map<String, Object> param) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<ProductExt> productList = new ArrayList<>();
		String sql = prop.getProperty("findAllProducts");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (int) param.get("start"));
			pstmt.setInt(2, (int) param.get("end"));
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ProductExt product = handleProductResultSet(rset);
				productList.add(product);
			}
		} catch (Exception e) {
			throw new ProductException("관리자 상품 리스트 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return productList;
	}

	public int getTotalProducts(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalContents = 0;
		String sql = prop.getProperty("getTotalProducts");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				totalContents = rset.getInt(1);
			}
		} catch (Exception e) {
			throw new ProductException("총 등록 상품수 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalContents;
	}

	public int enrollProduct(Connection conn, ProductExt product) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("enrollProduct");
		try {	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getProductId());
			pstmt.setString(2, product.getProductName());
			pstmt.setString(3, product.getMainCode());
			pstmt.setString(4, product.getSubCode());
			pstmt.setString(5, product.getBrandId()); 
			pstmt.setDouble(6, product.getProductHeight());
			pstmt.setDouble(7, product.getProductWidth());
			pstmt.setDouble(8, product.getProductDepth());
			pstmt.setString(9, product.getProductColor());
			pstmt.setInt(10, product.getProductPrice());
			pstmt.setString(11, product.getPContent());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ProductException("상품 등록 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public List<ProductImage> findProductImagesByProductId(Connection conn, String productId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<ProductImage> productImages = new ArrayList<>();
		String sql = prop.getProperty("findProductImagesByProductId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				ProductImage img = handleProductImageResultSet(rset);
				productImages.add(img);
			}
		} catch (Exception e) {
			throw new ProductException("상품 아이디에 의한 첨부파일 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return productImages;
	}

	public int deleteProduct(Connection conn, String productId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ProductException("상품 삭제 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateProduct(Connection conn, ProductExt product) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateProduct");
		try {	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getProductName());
			pstmt.setString(2, product.getMainCode());
			pstmt.setString(3, product.getSubCode());
			pstmt.setString(4, product.getBrandId()); 
			pstmt.setDouble(5, product.getProductHeight());
			pstmt.setDouble(6, product.getProductWidth());
			pstmt.setDouble(7, product.getProductDepth());
			pstmt.setString(8, product.getProductColor());
			pstmt.setInt(9, product.getProductPrice());
			pstmt.setString(10, product.getPContent());
			pstmt.setString(11, product.getProductId());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ProductException("상품 수정 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}


	public ProductExt findProductByProductId(Connection conn, String productId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ProductExt product = null;
		String sql = prop.getProperty("findProductByProductId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				product = handleProductResultSet(rset);
			}
		} catch (Exception e) {
			throw new ProductException("상품 아이디로 상품 찾기 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return product;
	}
	
	public int enrollProductImages(Connection conn, ProductImage img) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("enrollProductImages");
		System.out.println("img@dao" + img.getProductId());
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, img.getProductId());
			pstmt.setString(2, img.getOriginalFilename());
			pstmt.setString(3, img.getRenamedFilename());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ProductException("첨부파일 등록 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ProductImage findProductImagesByImgNo(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ProductImage img = null;
		String sql = prop.getProperty("findProductImagesByImgNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				img = handleProductImageResultSet(rset);
			}
		} catch (Exception e) {
			throw new ProductException("번호에 의한 첨부파일조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return img;
	}

	public int deleteProductProductImages(Connection conn, String productId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteProductProductImages");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ProductException("상품삭제 - 첨부파일 삭제 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteProductImage(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteProductImage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ProductException("상품 수정 - 이미지 첨부파일 삭제 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateProductImages(Connection conn, ProductImage img) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateProductImages");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, img.getOriginalFilename());
			pstmt.setString(2, img.getRenamedFilename());
			pstmt.setInt(3, img.getNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ProductException("이미지 첨부파일 수정 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public List<ProductMainCode> findAllMainCodes(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<ProductMainCode> mainCodeList = new ArrayList<>();
		String sql = prop.getProperty("findAllMainCodes");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ProductMainCode productMainCode = new ProductMainCode();
				productMainCode.setProductMainCode(rset.getString("main_code"));
				productMainCode.setProductMainName(rset.getString("main_category_name"));  
				mainCodeList.add(productMainCode);
			}
		} catch (Exception e) {
			throw new ProductException("상품 대분류 리스트 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return mainCodeList;
	}

	public List<ProductSubCode> findAllSubCodes(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<ProductSubCode> subCodeList = new ArrayList<>();
		String sql = prop.getProperty("findAllSubCodes");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ProductSubCode productSubCode = new ProductSubCode();
				productSubCode.setProductSubCode(rset.getString("sub_code"));
				productSubCode.setProductMainCode(rset.getString("main_code"));
				productSubCode.setProductSubName(rset.getString("sub_category_name"));  
				subCodeList.add(productSubCode);
			}
		} catch (Exception e) {
			throw new ProductException("상품 소분류 리스트 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return subCodeList;
	}

	public List<ProductBrand> findAllBrandIds(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<ProductBrand> brandList = new ArrayList<>();
		String sql = prop.getProperty("findAllBrandIds");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ProductBrand productBrand = new ProductBrand();
				productBrand.setBrandId(rset.getString("brand_id"));
				productBrand.setBrandName(rset.getString("brand_name"));  
				brandList.add(productBrand);
			}
		} catch (Exception e) {
			throw new ProductException("상품 브랜드 리스트 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return brandList;
	}




}
