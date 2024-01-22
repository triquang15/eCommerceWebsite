$(document).ready(function() {		
	$("a[name='linkRemoveDetail']").each(function(index) {
		$(this).click(function() {
			removeDetailSectionByIndex(index);
		});
	});
	
});

function addNextDetailSection() {
	allDivDetails = $("[id^='divDetail']");
	divDetailsCount = allDivDetails.length;
	
	htmlDetailSection = `
		<div class="row g-3 mb-3" id="divDetail${divDetailsCount}">
		<input type="hidden" name="detailIDs" value="0" />
			<div class="col-md-10">
				<div class="row g-3">
					<div class="col-md-6">
						<input type="text" class="form-control form-control-sm"
							name="detailNames" maxlength="255" placeholder="Name"/>
					</div>
					<div class="col-md-6">
						<input type="text" class="form-control form-control-sm" name="detailValues" maxlength="255" placeholder="Value" />							
					</div>
					
				</div>
			</div>
		</div>
	`;
	
	$("#divProductDetails").append(htmlDetailSection);

	previousDivDetailSection = allDivDetails.last();
	previousDivDetailID = previousDivDetailSection.attr("id");
	 	
	htmlLinkRemove = `
	
		<a class="fas fa-trash" style="color: #DC143C"
			href="javascript:removeDetailSectionById('${previousDivDetailID}')"
			title="Remove this detail"></a
	`;
	
	previousDivDetailSection.append(htmlLinkRemove);
	
	$("input[name='detailNames']").last().focus();
}

function removeDetailSectionById(id) {
	$("#" + id).remove();
}

function removeDetailSectionByIndex(index) {
	$("#divDetail" + index).remove();	
}