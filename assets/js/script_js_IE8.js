WebFontConfig = {
	    
	    google: {
	      families: ['Roboto+Slab:700','Noto+Sans:400,400i,700,700i']
	    },
	    

	    custom: {
	      families: ['icomoon'],
	      urls: ['assets/icomoon/style.css']
	    }
	  };
	  (function(d) {
	    var wf = d.createElement('script'), s = d.scripts[0];
	    wf.src = "assets/bower_components/webfontloader/webfontloader.js";
	    s.parentNode.insertBefore(wf, s);
	  }(document));