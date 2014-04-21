$(function(){

	var aSpan = document.getElementsByTagName('span'),
		closeButton;

	for (var i = 0; i < aSpan.length; i++) {

        if ( aSpan[i].getAttribute('title') ) {
			var title = aSpan[i].getAttribute('title');
			if (title === 'Close') {
				closeButton = aSpan[i];
				break;
			}
		}
    }

	var articles = document.getElementsByTagName('article'),
		promo = articles[0],
		promoState = promo.getAttribute('data-state');

	if (promo.addEventListener) {

		promo.addEventListener('click',function(e){

			if (promoState == 'collapsed') {
				promo.setAttribute('data-state', 'opened');
				promoState = 'opened';
			} else {
				promo.setAttribute('data-state', 'collapsed');
				promoState = 'collapsed';
			}
		},false);
		closeButton.addEventListener('click',function(e){
			e.stopPropagation();
			closeButton.parentNode.parentNode.setAttribute('data-state', 'off');

		},false);
	}
	else {
		promo.attachEvent('onclick',function(e){

			if (promoState == 'collapsed') {
				promo.setAttribute('data-state', 'opened');
				promoState = 'opened';
			} else {
				promo.setAttribute('data-state', 'collapsed');
				promoState = 'collapsed';
			}
		});
		closeButton.attachEvent('onclick',function(e){
			e.cancelBubble = true;
			closeButton.parentNode.parentNode.setAttribute('data-state', 'off');
		});
	}
});