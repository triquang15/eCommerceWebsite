$(document).ready(function() {
	dropdownCategories = $("#categories");
		divChosenCategories = $("#chosenCategories");
		
		dropdownCategories.change(function() {
			divChosenCategories.empty();
			showChosenCategories();
		});
		
		showChosenCategories();
		
		$("#logoutLink").on("click", function(e) {
			e.preventDefault();
			document.logoutForm.submit();
		});
	});
	
	function showChosenCategories() {
		dropdownCategories.children("option:selected").each(function() {
			selectedCategory = $(this);
			catId = selectedCategory.val();
			catName = selectedCategory.text().replace(/-/g, "");
			
			divChosenCategories.append("<span class='badge bg-warning text-dark m-1'>" + catName + "</span>");
		});
	}