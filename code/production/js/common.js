$.fn.cut = function(){

	var cutBlock = $(this);

	cutBlock.find('header').first().click(function(event) {

			if ($(this).closest(cutBlock).data('state') === 'opened') {
				collapse();
			}
			else {
				expand();
			}

	});

	cutBlock.find('span[role="presentation"]').first().click(function(event) {
		event.stopPropagation();
		$(this).closest('article[data-content="promo"]').data('state', 'off');
		$(this).closest('article[data-content="promo"]').attr('data-state', 'off');

	});

	function expand() {
		cutBlock.data('state', 'opened');
		cutBlock.attr('data-state', 'opened');
	}

	function collapse() {
		cutBlock.data('state', 'collapsed');
		cutBlock.attr('data-state', 'collapsed');
	}
}

$(function(){
	$('article[data-content="promo"]').cut();
});