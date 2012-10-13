function evoGallery(container, options){
	
	this.options = {
		prev_link_class: 'eg_previous_link',
		next_link_class: 'eg_next_link',
        hide_links: false,
		loader_img: 'loader.gif'
	};
	$.extend(this.options, options);
		
	var evo = this;
	
	this.container = container;
	
	this.totalPages = this.container.data('totalPages') || 1;
	
	this.scrollable = $('.b-images__scrollable', this.container);
	this.pages = $('.b-images__pages', this.container);
	
	this.nextLink = this.getNextLink();
	this.prevLink = this.getPrevLink();
	
	this.scrollable.scrollable({
		items: '.b-images_pages',
		circular: false,
		keyboard: false
	});
	
	this.scroll = this.scrollable.data("scrollable");
	
	this.currentPage = this.getCurrentPage();
	
	this.nextLink.click(function(){
		return !!evo.next();
	});
	this.prevLink.click(function(){
		return !!evo.prev();
	});	
	
	this._initLoader();
	
	this.setLinks();
	
	//start preload
	this.loadNext();
	this.loadPrev();
	
}

evoGallery.prototype.currentPage = 1;

evoGallery.prototype.getPrevLink = function(){
	var elem = $("."+this.options.prev_link_class, this.container);
	if(!elem.length){
		elem = $('<a style="display:none;" href="?page=0" class="'+this.options.prev_link_class+'">Previous</a>').appendTo(this.container);
	}
	return elem;
}

evoGallery.prototype.getNextLink = function(){
	var elem = $("."+this.options.next_link_class, this.container);
	if(!elem.length){
		elem = $('<a style="display:none;" href="?page=0" class="'+this.options.next_link_class+'">Next</a>').appendTo(this.container);
	}
	return elem;	
}

evoGallery.prototype.getCurrentPage = function(){
	var re = /(\?|&)page=(\d+)/;
	var result = re.exec(document.location.href);
	if(result)
		return result[2] * 1;
	else
		return 1;
}

evoGallery.prototype.getCurrentPageItem = function(){
	var index = this.scroll.getIndex();
	var item = $('ul', this.pages)[index];
	return item;
}

evoGallery.prototype.next = function(){
	if(!this._canNext())
		return false;
			
	if(!$(this.getCurrentPageItem()).next().length){
		this._loader.show();
		this._onLoadNextAction = this._next;
	}
	else{
		this._next();
	}
}
evoGallery.prototype._next = function(){
	this.scroll.next();	
	this.currentPage++;
	this.setLinks();
	this.loadNext();		
}
evoGallery.prototype._canNext = function(){
	if(this.currentPage < this.totalPages){
		return true;
	}
	return false;
}

evoGallery.prototype.prev = function(){
	if(!this._canPrev())
		return false;
			
	if(!$(this.getCurrentPageItem()).prev().length){
		this._loader.show();
		this._onLoadPrevAction = this._prev;
	}
	else{
		this._prev();
	}	
}
evoGallery.prototype._prev = function(){
	this.scroll.prev();
	this.currentPage--;
	this.setLinks();
	this.loadPrev();
}
evoGallery.prototype._canPrev = function(){
	if(this.currentPage > 1){
		return true;
	}
	return false;
}

evoGallery.prototype.setLinks = function(){
	
	if(!this._canPrev()){
        this.setNotActiveLink(this.prevLink);
	}
	else{
		this.setPageInUrl(this.prevLink, this.currentPage - 1);
        this.setActiveLink(this.prevLink);
	}
	
	if(!this._canNext()){
        this.setNotActiveLink(this.nextLink);
	}	
	else{
		this.setPageInUrl(this.nextLink, this.currentPage + 1);
        this.setActiveLink(this.nextLink);
	}
}

evoGallery.prototype.setActiveLink = function(link)
{
    if(this.options.hide_links){
        link.hide();
    }
    else{
        link.show();
        link.removeClass('disabled');
    }
}

evoGallery.prototype.setNotActiveLink = function(link)
{
    if(this.options.hide_links){
        link.show();
    }
    else{
        link.show();
        link.addClass('disabled');
    }
}

evoGallery.prototype.setPageInUrl = function(link, page){
	var url = $(link).attr('href');
	if(!url)
		return false;
	var newUrl = url.replace(/^(.*)page=\d+(.*)$/, '$1page='+page+'$2');
	$(link).attr('href', newUrl);
}

evoGallery.prototype._onLoadNextAction = null;
evoGallery.prototype._onLoadPrevAction = null;

evoGallery.prototype._onLoadNext = function(){
	if(typeof this._onLoadNextAction == 'function'){
		this._onLoadNextAction();
		this._onLoadNextAction = null;
	}
	this._loader.hide();
}
evoGallery.prototype._onLoadPrev = function(){
	if(typeof this._onLoadPrevAction == 'function'){
		this._onLoadPrevAction();
		this._onLoadPrevAction = null;
	}
	this._loader.hide();
}

evoGallery.prototype.loadNext = function(){
	if(!this._canNext() || $(this.getCurrentPageItem()).next().length)
		return false;
	
	var evo = this;
	
	$.ajaxSetup({cache:false});
	$.get(evo.nextLink.attr('href'), function(data){
		if(evo.checkItem(data)){
			var ul = $(data).appendTo(evo.pages);
			
			evo._bindPage(ul);
			
			evo._onLoadNext();
		}
		
	});	
}

evoGallery.prototype.loadPrev = function(){
	if(!this._canPrev() || $(this.getCurrentPageItem()).prev().length)
		return false;
			
	var evo = this;
	
	$.ajaxSetup({cache:false});
	$.get(evo.prevLink.attr('href'), function(data){
		if(evo.checkItem(data)){
			evo.pages.prepend(data);
			
			//console.log( 'SEEK:'+ (evo.currentPage - 1) )
			//evo.scroll.seekTo(evo.currentPage - 1, 0);
			
			evo._onLoadPrev();
		}
	});	
}

/* Привязать lightbox к загруженной странице */
evoGallery.prototype._bindPage = function(ul){
	var ul = $(ul);
	
	var curUL = this.getCurrentPageItem();
	var lastElem = $(curUL).children('li:last-child').children('a').get(0);
	var cbdata = $(lastElem).data('colorbox');
	
	$('a', ul).each(function(){
		$.data(this, 'colorbox', cbdata);
		
		$(this).addClass('cboxElement');
	});
	
	//$.fn.colorbox.refresh();
}

evoGallery.prototype.checkItem = function(item){
	return $(item).length > 0 ? $(item).get(0).tagName == 'UL' : false;
}

evoGallery.prototype._loader = null;
evoGallery.prototype._initLoader = function(){
	this._loader = $('<div class="evoLoader" style="display:none; position:absolute;"><img src="'+this.options.loader_img+'"/></div>').appendTo(this.container);
}