function doIframe(){
	o = document.getElementsByTagName('iframe');
	for(i=0;i<o.length;i++){
		if (/\bautoHeight\b/.test(o[i].className)){
			setHeight(o[i]);
			addEvent(o[i],'load', doIframe);
		}
	}
}

function setHeight(e){
	if(e.contentDocument){
		if(e.contentDocument.body){
			e.height = e.contentDocument.body.offsetHeight + 35;
		}else{
			if(e.contentWindow.document.body){
				e.height = e.contentWindow.document.body.scrollHeight;
			}else{
				e.height = 350;
			}
		}
	} else {
		if(e.contentWindow.document.body){
			e.height = e.contentWindow.document.body.scrollHeight;
		}else{
			e.height = 350;
		}
	}
}

function addEvent(obj, evType, fn){
	if(obj.addEventListener)
	{
	obj.addEventListener(evType, fn,false);
	return true;
	} else if (obj.attachEvent){
	var r = obj.attachEvent("on"+evType, fn);
	return r;
	} else {
	return false;
	}
}

if (document.getElementById && document.createTextNode){
 addEvent(window,'load', doIframe);	
 setInterval(function(){ 
	 doIframe();
  },500);	
}