(function($, undefined){
    var Gallery = function(elements, startIndex, options){
	this.settings = $.extend({
	    duration: 1000,
	}, options || {});
	this.elements = elements.get().map(function(element){ return $(element); });
	this.size = this.elements.length;
	this.current = startIndex;

	this.initialize();
    };
    Gallery.prototype.initialize = function(){
	this.hideAll();
	this.showCurrent();
    };
    Gallery.prototype.hideAll = function(){
	this.elements.forEach(function(element){ element.hide(); });
    };
    Gallery.prototype.showCurrent = function(){
	this.elements[this.current].show();
    };
    Gallery.prototype.hideCurrent = function(){
	this.elements[this.current].hide();
    }
    Gallery.prototype.advance = function(){
	this.hideCurrent();
	this.next();
	this.showCurrent();
    }
    Gallery.prototype.next = function(){
	this.current = (this.current + 1) % this.size;
    };
    Gallery.prototype.automatic = function(){
	var self = this;
	var interval = setInterval(function(){
	    self.advance();
	}, self.settings.duration);
    }

    $.fn.gallery = function(options){
	var settings = $.extend({
	    selector : "div",
	    startIndex : 0,
	    duration: 1000,
	}, options);

	this.each(function(){
	    var $this = $(this);
	    var children = $this.children(settings.selector);
	    
	    var gallery = new Gallery(children, settings.startIndex, settings);
	    gallery.automatic();
	});

	return this;
    };
})(jQuery);