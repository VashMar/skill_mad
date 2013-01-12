/*
 * jQuery hashchange event - v1.3 - 7/21/2010
 * http://benalman.com/projects/jquery-hashchange-plugin/
 * 
 * Copyright (c) 2010 "Cowboy" Ben Alman
 * Dual licensed under the MIT and GPL licenses.
 * http://benalman.com/about/license/
 */
(function(a,b,c){function j(a){return a=a||location.href,"#"+a.replace(/^[^#]*#?(.*)$/,"$1")}var d="hashchange",e=document,f,g=a.event.special,h=e.documentMode,i="on"+d in b&&(h===c||h>7);a.fn[d]=function(a){return a?this.bind(d,a):this.trigger(d)},a.fn[d].delay=50,g[d]=a.extend(g[d],{setup:function(){if(i)return!1;a(f.start)},teardown:function(){if(i)return!1;a(f.stop)}}),f=function(){function n(){var c=j(),e=m(h);c!==h?(l(h=c,e),a(b).trigger(d)):e!==h&&(location.href=location.href.replace(/#.*/,"")+e),g=setTimeout(n,a.fn[d].delay)}var f={},g,h=j(),k=function(a){return a},l=k,m=k;return f.start=function(){g||n()},f.stop=function(){g&&clearTimeout(g),g=c},a.browser.msie&&!i&&function(){var b,c;f.start=function(){b||(c=a.fn[d].src,c=c&&c+j(),b=a('<iframe tabindex="-1" title="empty"/>').hide().one("load",function(){c||l(j()),n()}).attr("src",c||"javascript:0").insertAfter("body")[0].contentWindow,e.onpropertychange=function(){try{event.propertyName==="title"&&(b.document.title=e.title)}catch(a){}})},f.stop=k,m=function(){return j(b.location.href)},l=function(c,f){var g=b.document,h=a.fn[d].domain;c!==f&&(g.title=e.title,g.open(),h&&g.write('<script>document.domain="'+h+'"</script>'),g.close(),b.location.hash=c)}}(),f}()})(jQuery,this);