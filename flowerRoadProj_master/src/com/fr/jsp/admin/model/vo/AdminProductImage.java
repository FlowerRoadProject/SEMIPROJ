package com.fr.jsp.admin.model.vo;

public class AdminProductImage {
	
	private String productNum;
	private String imagePath;
	private String mainImage;
	private String imageDescription;
	
	public AdminProductImage() {
		super();
	}

	public AdminProductImage(String productNum, String imagePath, String mainImage, String imageDescription) {
		super();
		this.productNum = productNum;
		this.imagePath = imagePath;
		this.mainImage = mainImage;
		this.imageDescription = imageDescription;
	}

	public String getProductNum() {
		return productNum;
	}

	public void setProductNum(String productNum) {
		this.productNum = productNum;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getMainImage() {
		return mainImage;
	}

	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}

	public String getImageDescription() {
		return imageDescription;
	}

	public void setImageDescription(String imageDescription) {
		this.imageDescription = imageDescription;
	}
	
}
