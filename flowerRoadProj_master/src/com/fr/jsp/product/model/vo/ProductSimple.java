package com.fr.jsp.product.model.vo;

import java.util.Comparator;

public class ProductSimple implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8269690660877403820L;

	private String productNum;
	private String productName;
	private int productPrice;
	private String image;
	private int reviewCount;
	private String productTypeName;
	private int reviewAvg;

	public String getProductNum() {
		return productNum;
	}

	public void setProductNum(String productNum) {
		this.productNum = productNum;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public String getProductTypeName() {
		return productTypeName;
	}

	public void setProductTypeName(String productTypeName) {
		this.productTypeName = productTypeName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((image == null) ? 0 : image.hashCode());
		result = prime * result + ((productName == null) ? 0 : productName.hashCode());
		result = prime * result + ((productNum == null) ? 0 : productNum.hashCode());
		result = prime * result + productPrice;
		result = prime * result + ((productTypeName == null) ? 0 : productTypeName.hashCode());
		result = prime * result + reviewAvg;
		result = prime * result + reviewCount;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ProductSimple other = (ProductSimple) obj;
		if (image == null) {
			if (other.image != null)
				return false;
		} else if (!image.equals(other.image))
			return false;
		if (productName == null) {
			if (other.productName != null)
				return false;
		} else if (!productName.equals(other.productName))
			return false;
		if (productNum == null) {
			if (other.productNum != null)
				return false;
		} else if (!productNum.equals(other.productNum))
			return false;
		if (productPrice != other.productPrice)
			return false;
		if (productTypeName == null) {
			if (other.productTypeName != null)
				return false;
		} else if (!productTypeName.equals(other.productTypeName))
			return false;
		if (reviewAvg != other.reviewAvg)
			return false;
		if (reviewCount != other.reviewCount)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ProductSimple [productNum=" + productNum + ", productName=" + productName + ", productPrice="
				+ productPrice + ", image=" + image + ", reviewCount=" + reviewCount + ", productTypeName="
				+ productTypeName + ", reviewAvg=" + reviewAvg + "]";
	}

	public ProductSimple(String productNum, String productName, int productPrice, String image, int reviewCount,
			String productTypeName, int reviewAvg) {
		super();
		this.productNum = productNum;
		this.productName = productName;
		this.productPrice = productPrice;
		this.image = image;
		this.reviewCount = reviewCount;
		this.productTypeName = productTypeName;
		this.reviewAvg = reviewAvg;
	}

	public int getReviewAvg() {
		return reviewAvg;
	}

	public void setReviewAvg(int reviewAvg) {
		this.reviewAvg = reviewAvg;
	}

	public ProductSimple() {
		super();
		// TODO Auto-generated constructor stub
	}

	public static Comparator<ProductSimple> reviewComparator = new Comparator<ProductSimple>() {

		public int compare(ProductSimple p1, ProductSimple p2) {

			return p2.getReviewAvg() - p1.getReviewAvg();
		}
	};
	
	public static Comparator<ProductSimple> priceDescComparator = new Comparator<ProductSimple>() {

		public int compare(ProductSimple p1, ProductSimple p2) {

			return p2.getProductPrice() -p1.getProductPrice();
		}
	};
	
	public static Comparator<ProductSimple> priceAscComparator = new Comparator<ProductSimple>() {

		public int compare(ProductSimple p1, ProductSimple p2) {

			return p1.getProductPrice() -p2.getProductPrice();
		}
	};
	
	public static Comparator<ProductSimple> priceNameComparator = new Comparator<ProductSimple>() {

		public int compare(ProductSimple p1, ProductSimple p2) {

			return p1.getProductName().compareTo(p2.getProductName());
		}
	};

}
