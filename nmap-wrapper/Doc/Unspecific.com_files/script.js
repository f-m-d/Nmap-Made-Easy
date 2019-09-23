/*
* Author:      Marco Kuiper (http://www.marcofolio.net/)
*/

// Speed of the automatic slideshow
var slideshowSpeed = 6000;

// Variable to store the images we need to set as background
// which also includes some text and url's.
var photos = [ {
		"title" : "Marlee",
		"image" : "IMG_9351.JPG",
		"url" : "/picasa.php",
		"firstline" : "Looking for",
		"secondline" : "inspiration?"
	}, {
		"title" : "Mark",
		"image" : "IMG_7417.JPG",
		"url" : "/software.php",
		"firstline" : "Or still busy",
		"secondline" : "working?"
	}, {
		"title" : "Sleepy",
		"image" : "IMG_1165.jpg",
		"url" : "/twitter.php",
		"firstline" : "Get out and be",
		"secondline" : "active"
	}, {
		"title" : "'The Cat'",
		"image" : "IMG_9324.JPG",
		"url" : "/picasa.php",
		"firstline" : "Take a new look at",
		"secondline" : "everything"
	}, {
		"title" : "Homeless",
		"image" : "IMG_9395.jpg",
		"url" : "/twitter.php",
		"firstline" : "Enjoy your",
		"secondline" : "life"
	}
];

var photosSub = [ {
		"title" : "",
		"url" : "",
		"firstline" : "",
		"secondline" : "",
		"image" : "header_back.jpg"
	}, {
		"title" : "",
		"url" : "",
		"firstline" : "",
		"secondline" : "",
		"image" : "header_back2.jpg"
	}, {
		"title" : "",
		"url" : "",
		"firstline" : "",
		"secondline" : "",
		"image" : "header_back3.jpg"
	}, {
		"title" : "",
		"url" : "",
		"firstline" : "",
		"secondline" : "",
		"image" : "header_back4.jpg"
	}
];



jQuery(document).ready(function() {
		
	// Backwards navigation
	jQuery("#back").click(function() {
		stopAnimation();
		navigate("back");
	});
	
	// Forward navigation
	jQuery("#next").click(function() {
		stopAnimation();
		navigate("next");
	});
	var interval;
	jQuery("#control").toggle(function(){
		stopAnimation();
	}, function() {
		// Change the background image to "pause"
		jQuery(this).css({ "background-image" : "url(/images/btn_pause.png)" });
		
		// Show the next image
		navigate("next");
		
		// Start playing the animation
		interval = setInterval(function() {
			navigate("next");
		}, slideshowSpeed);
	});
	
	
	var activeContainer = 1;	
	var currentImg = 0;
	var animating = false;
	var navigate = function(direction) {
		// Check if no animation is running. If it is, prevent the action
		if(animating) {
			return;
		}

		if(document.getElementById('header') == null) {
			photos = photosSub;
		} else {
			photos = photos;
		}
		// Check which current image we need to show
		if(direction == "next") {
			currentImg++;
			if(currentImg == photos.length + 1) {
				currentImg = 1;
			}
		} else {
			currentImg--;
			if(currentImg == 0) {
				currentImg = photos.length;
			}
		}
		
		// Check which container we need to use
		var currentContainer = activeContainer;
		if(activeContainer == 1) {
			activeContainer = 2;
		} else {
			activeContainer = 1;
		}
		
		showImage(photos[currentImg - 1], currentContainer, activeContainer);
		
	};
	
	var currentZindex = -1;
	var showImage = function(photoObject, currentContainer, activeContainer) {
		animating = true;
		
		// Make sure the new container is always on the background
		currentZindex--;
		
		// Set the background image of the new active container
		jQuery("#headerimg" + activeContainer).css({
			"background-image" : "url(/images/" + photoObject.image + ")",
			"display" : "block",
			"z-index" : currentZindex
		});
	
		// Hide the header text
		jQuery("#headertxt").css({"display" : "none"});
			
		// Set the new header text
		jQuery("#firstline").html(photoObject.firstline);
		jQuery("#secondline")
			.attr("href", photoObject.url)
			.html(photoObject.secondline);
		jQuery("#pictureduri")
			.attr("href", photoObject.url)
			.html(photoObject.title);


		// Fade out the current container
		// and display the header text when animation is complete
		jQuery("#headerimg" + currentContainer).fadeOut(function() {
			setTimeout(function() {
				jQuery("#headertxt").css({"display" : "block"});
				animating = false;
			}, 500);
		});
	};
	
	var stopAnimation = function() {
		// Change the background image to "play"
		jQuery("#control").css({ "background-image" : "url(/images/btn_play.png)" });
		
		// Clear the interval
		clearInterval(interval);
	};
	
	// We should statically set the first image
	navigate("next");
	
	// Start playing the animation
	interval = setInterval(function() {
		navigate("next");
	}, slideshowSpeed);
	
});
