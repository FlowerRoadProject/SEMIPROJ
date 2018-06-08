package com.fr.jsp.admin.model.vo;

public class AdminStatisticsProduct {
	
	private String productNum;
	private String productName;
	private String productImage;
	private int productMerchandiseCount;
	private double rateByTotalMerchandiseCount;
	private int productSellAmount;
	private double rateBytotalSellAmount;
	private int productClickCount;
	private int productFavoriteCount;
	private double rateBytotalClickCount;
	private double productStarAverage;
	private int productReviewCount;
	private double rateBytotalReviewCount;
	
	public AdminStatisticsProduct() {
		super();
	}

	public AdminStatisticsProduct(String productNum, String productName, String productImage,
			int productMerchandiseCount, double rateByTotalMerchandiseCount, int productSellAmount,
			double rateBytotalSellAmount, int productClickCount, int productFavoriteCount, double rateBytotalClickCount,
			double productStarAverage, int productReviewCount, double rateBytotalReviewCount) {
		super();
		this.productNum = productNum;
		this.productName = productName;
		this.productImage = productImage;
		this.productMerchandiseCount = productMerchandiseCount;
		this.rateByTotalMerchandiseCount = rateByTotalMerchandiseCount;
		this.productSellAmount = productSellAmount;
		this.rateBytotalSellAmount = rateBytotalSellAmount;
		this.productClickCount = productClickCount;
		this.productFavoriteCount = productFavoriteCount;
		this.rateBytotalClickCount = rateBytotalClickCount;
		this.productStarAverage = productStarAverage;
		this.productReviewCount = productReviewCount;
		this.rateBytotalReviewCount = rateBytotalReviewCount;
	}

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

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public int getProductMerchandiseCount() {
		return productMerchandiseCount;
	}

	public void setProductMerchandiseCount(int productMerchandiseCount) {
		this.productMerchandiseCount = productMerchandiseCount;
	}

	public double getRateByTotalMerchandiseCount() {
		return rateByTotalMerchandiseCount;
	}

	public void setRateByTotalMerchandiseCount(double rateByTotalMerchandiseCount) {
		this.rateByTotalMerchandiseCount = rateByTotalMerchandiseCount;
	}

	public int getProductSellAmount() {
		return productSellAmount;
	}

	public void setProductSellAmount(int productSellAmount) {
		this.productSellAmount = productSellAmount;
	}

	public double getRateBytotalSellAmount() {
		return rateBytotalSellAmount;
	}

	public void setRateBytotalSellAmount(double rateBytotalSellAmount) {
		this.rateBytotalSellAmount = rateBytotalSellAmount;
	}

	public int getProductClickCount() {
		return productClickCount;
	}

	public void setProductClickCount(int productClickCount) {
		this.productClickCount = productClickCount;
	}

	public int getProductFavoriteCount() {
		return productFavoriteCount;
	}

	public void setProductFavoriteCount(int productFavoriteCount) {
		this.productFavoriteCount = productFavoriteCount;
	}

	public double getRateBytotalClickCount() {
		return rateBytotalClickCount;
	}

	public void setRateBytotalClickCount(double rateBytotalClickCount) {
		this.rateBytotalClickCount = rateBytotalClickCount;
	}

	public double getProductStarAverage() {
		return productStarAverage;
	}

	public void setProductStarAverage(double productStarAverage) {
		this.productStarAverage = productStarAverage;
	}

	public int getProductReviewCount() {
		return productReviewCount;
	}

	public void setProductReviewCount(int productReviewCount) {
		this.productReviewCount = productReviewCount;
	}

	public double getRateBytotalReviewCount() {
		return rateBytotalReviewCount;
	}

	public void setRateBytotalReviewCount(double rateBytotalReviewCount) {
		this.rateBytotalReviewCount = rateBytotalReviewCount;
	}


}
