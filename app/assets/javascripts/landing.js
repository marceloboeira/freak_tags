var urls = [
'/assets/images/background/landing/daredevil.jpg',
'/assets/images/background/landing/dexter.jpg',
'/assets/images/background/landing/soa.jpg',
'/assets/images/background/landing/bb_got.jpg',
'/assets/images/background/landing/sw.jpg',
],
count = 0;

var change_background = function(array_urls, counter, callback){
	counter = (counter)? (parseInt(counter) > (array_urls.length - 1) )? 0: parseInt(counter): 0;
	$('.landing').animate({
		opacity:0
	},500, function(){
		$(this).css({
			'background-image':'url('+ array_urls[counter] +')'
		}).animate({
			opacity:1
		},500)
	});



	(typeof callback !== 'undefined')? callback(counter + 1): true;
}

setInterval(function(){
	change_background(urls, count, function(e){
		count = e;
	});
},5000);
