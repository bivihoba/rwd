
$.fn.cut = function(aParams){
	var aOptions = {
		expandSelector: 	getOption('expandSelector', '.b-link_action_expand'),
		collapseSelector: 	getOption('collapseSelector', '.b-link_action_collapse'),
		expandClass: 		getOption('expandClass', 'b-cut_state_expanded'),
		collapseClass: 		getOption('collapseClass', 'b-cut_state_collapsed'),
		dualClass: 			getOption('dualClass', 'b-cut__action_type_dual'),
		type: 				getOption('typeClass', 'b-cut_type_addition')
	}

	var cutBlock = $(this);

	cutBlock.find(aOptions.collapseSelector).first().click(collapse);

	cutBlock.find(aOptions.expandSelector).first().click(function(event) {
		if ($(this).hasClass(aOptions.dualClass)) {
			if ($(this).closest(cutBlock).hasClass(aOptions.expandClass)) {
				collapse();
			}
			else {
				expand();
			}
		}
		else {
			expand();
		}
	});

	function expand() {
		cutBlock.addClass(aOptions.expandClass).removeClass(aOptions.collapseClass);
		cutBlock.trigger('cut');
	}

	function collapse() {
		cutBlock.addClass(aOptions.collapseClass).removeClass(aOptions.expandClass);
		cutBlock.trigger('cut');
	}
	function getOption(sName, sDefault) {
		if (typeof(aParams) == 'undefined' || typeof(aParams[sName]) == 'undefined') {
			return sDefault;
		}
		return aParams[sName];
	}
}


$(function(){
	$('.b-cut').cut();

	$('.b-popup__close').click(function(event) {
		event.preventDefault();

		$(this).closest('.b-popup').removeClass("b-popup_state_opened");
	});

});