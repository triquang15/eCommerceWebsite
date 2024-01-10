package com.triquang.admin.dashboard;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DashboardInfo {
	private long totalUsers;
	private long totalCategories;
	private long totalBrands;
	private long totalProducts;
	private long totalQuestions;
	private long totalReviews;
	private long totalCustomers;
	private long totalShippingRates;
	private long totalArticles;
	private long totalOrders;
	private long totalMenuItems;
	private long totalSections;
	
	private long disabledUsersCount;
	private long enabledUsersCount;
	
	private long rootCategoriesCount;
	private long enabledCategoriesCount;
	private long disabledCategoriesCount;
	
	private long enabledProductsCount;
	private long disabledProductsCount;
	private long inStockProductsCount;
	private long outOfStockProductsCount;
	
	private long approvedQuestionsCount;
	private long unapprovedQuestionsCount;
	private long answeredQuestionsCount;
	private long unansweredQuestionsCount;
	
	private long enabledCustomersCount;
	private long disabledCustomersCount;
	
	private long codShippingRateCount;
	
	private long newOrdersCount;
	private long deliveredOrdersCount;
	private long processingOrdersCount;
	private long shippingOrdersCount;
	private long cancelledOrdersCount;
	
	private long menuBoundArticlesCount;
	private long freeArticlesCount;
	private long publishedArticlesCount;
	private long unpublishedArticlesCount;
	
	private long headerMenuItemsCount;
	private long footerMenuItemsCount;
	private long enabledMenuItemsCount;
	private long disabledMenuItemsCount;

	private long reviewedProductsCount;
	
	private long totalCountries;
	private long totalStates;
	
	private String siteName;
	private String currencyName;
	private String currencySymbol;
	private String decimalPointType;
	private String decimalDigits;
	private String thousandPointType;
	
	private long enabledSectionsCount;
	private long disabledSectionsCount;
	
	private String mailServer;
		
}
