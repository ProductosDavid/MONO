(function(){var e=!0,h=null,i=!1,aa=function(a,b,c){return a.call.apply(a.bind,arguments)},ba=function(a,b,c){if(!a)throw Error();if(2<arguments.length){var g=Array.prototype.slice.call(arguments,2);return function(){var c=Array.prototype.slice.call(arguments);Array.prototype.unshift.apply(c,g);return a.apply(b,c)}}return function(){return a.apply(b,arguments)}},j=function(a,b,c){j=Function.prototype.bind&&-1!=Function.prototype.bind.toString().indexOf("native code")?aa:ba;return j.apply(h,arguments)};var k=(new Date).getTime();var ca=/&/g,da=/</g,ea=/>/g,fa=/\"/g,m={"\x00":"\\0","\u0008":"\\b","\u000c":"\\f","\n":"\\n","\r":"\\r","\t":"\\t","\x0B":"\\x0B",'"':'\\"',"\\":"\\\\"},p={"'":"\\'"};var ga=/^([\w-]+\.)*([\w-]{2,})(\:[0-9]+)?$/,q=function(a){return!a?"pagead2.googlesyndication.com":(a=a.match(ga))?a[0]:"pagead2.googlesyndication.com"};q("");var s=function(a){return!!a&&"function"==typeof a&&!!a.call},t=function(a,b){if(!(2>arguments.length))for(var c=1,g=arguments.length;c<g;++c)a.push(arguments[c])};function v(a){return"function"==typeof encodeURIComponent?encodeURIComponent(a):escape(a)}function ha(a,b){a.addEventListener?a.addEventListener("load",b,i):a.attachEvent&&a.attachEvent("onload",b)}var w=function(a){try{return!!a.location.href||""===a.location.href}catch(b){return i}};var x=h,ja=function(){if(!x){for(var a=window,b=a,c=0;a!=a.parent;)if(a=a.parent,c++,w(a))b=a;else break;x=b}return x};var y,z=function(a){this.c=[];this.a=a||window;this.b=0;this.d=h},ka=function(a,b){this.l=a;this.i=b};z.prototype.n=function(a,b){0==this.b&&0==this.c.length&&(!b||b==window)?(this.b=2,this.g(new ka(a,window))):this.h(a,b)};z.prototype.h=function(a,b){this.c.push(new ka(a,b||this.a));A(this)};z.prototype.o=function(a){this.b=1;a&&(this.d=this.a.setTimeout(j(this.f,this),a))};z.prototype.f=function(){1==this.b&&(this.d!=h&&(this.a.clearTimeout(this.d),this.d=h),this.b=0);A(this)};z.prototype.p=function(){return e};
z.prototype.nq=z.prototype.n;z.prototype.nqa=z.prototype.h;z.prototype.al=z.prototype.o;z.prototype.rl=z.prototype.f;z.prototype.sz=z.prototype.p;var A=function(a){a.a.setTimeout(j(a.m,a),0)};z.prototype.m=function(){if(0==this.b&&this.c.length){var a=this.c.shift();this.b=2;a.i.setTimeout(j(this.g,this,a),0);A(this)}};z.prototype.g=function(a){this.b=0;a.l()};
var la=function(a){try{return a.sz()}catch(b){return i}},ma=function(a){return!!a&&("object"==typeof a||"function"==typeof a)&&la(a)&&s(a.nq)&&s(a.nqa)&&s(a.al)&&s(a.rl)},E=function(){if(y&&la(y))return y;var a=ja(),b=a.google_jobrunner;return ma(b)?y=b:a.google_jobrunner=y=new z(a)},na=function(a,b){E().nq(a,b)},oa=function(a,b){E().nqa(a,b)};var pa=/MSIE [2-7]|PlayStation|Gecko\/20090226/i,qa=/Android|Opera/,ra=function(){var a=F,b=G.google_ad_width,c=G.google_ad_height,g=["<iframe"],d;for(d in a)a.hasOwnProperty(d)&&t(g,d+"="+a[d]);g.push('style="left:0;position:absolute;top:0;"');g.push("></iframe>");b="border:none;height:"+c+"px;margin:0;padding:0;position:relative;visibility:visible;width:"+b+"px";return['<ins style="display:inline-table;',b,'"><ins id="',a.id+"_anchor",'" style="display:block;',b,'">',g.join(" "),"</ins></ins>"].join("")};var sa=/^true$/.test("false")?e:i;var ta=function(a,b,c){c||(c=sa?"https":"http");return[c,"://",a,b].join("")};var ua=function(){},H=function(a,b,c){switch(typeof b){case "string":va(b,c);break;case "number":c.push(isFinite(b)&&!isNaN(b)?b:"null");break;case "boolean":c.push(b);break;case "undefined":c.push("null");break;case "object":if(b==h){c.push("null");break}if(b instanceof Array){var g=b.length;c.push("[");for(var d="",f=0;f<g;f++)c.push(d),H(a,b[f],c),d=",";c.push("]");break}c.push("{");g="";for(d in b)b.hasOwnProperty(d)&&(f=b[d],"function"!=typeof f&&(c.push(g),va(d,c),c.push(":"),H(a,f,c),g=","));
c.push("}");break;case "function":break;default:throw Error("Unknown type: "+typeof b);}},I={'"':'\\"',"\\":"\\\\","/":"\\/","\u0008":"\\b","\u000c":"\\f","\n":"\\n","\r":"\\r","\t":"\\t","\x0B":"\\u000b"},wa=/\uffff/.test("\uffff")?/[\\\"\x00-\x1f\x7f-\uffff]/g:/[\\\"\x00-\x1f\x7f-\xff]/g,va=function(a,b){b.push('"');b.push(a.replace(wa,function(a){if(a in I)return I[a];var b=a.charCodeAt(0),d="\\u";16>b?d+="000":256>b?d+="00":4096>b&&(d+="0");return I[a]=d+b.toString(16)}));b.push('"')};var J="google_ad_block google_ad_channel google_ad_client google_ad_format google_ad_height google_ad_host google_ad_host_channel google_ad_host_tier_id google_ad_output google_ad_override google_ad_region google_ad_section google_ad_slot google_ad_type google_ad_width google_adtest google_allow_expandable_ads google_alternate_ad_url google_alternate_color google_analytics_domain_name google_analytics_uacct google_bid google_city google_color_bg google_color_border google_color_line google_color_link google_color_text google_color_url google_container_id google_contents google_country google_cpm google_ctr_threshold google_cust_age google_cust_ch google_cust_gender google_cust_id google_cust_interests google_cust_job google_cust_l google_cust_lh google_cust_u_url google_disable_video_autoplay google_ed google_eids google_enable_ose google_encoding google_font_face google_font_size google_frame_id google_gl google_hints google_image_size google_kw google_kw_type google_language google_max_num_ads google_max_radlink_len google_mtl google_num_radlinks google_num_radlinks_per_unit google_num_slots_to_rotate google_only_ads_with_video google_only_pyv_ads google_only_userchoice_ads google_override_format google_page_url google_previous_watch google_previous_searches google_referrer_url google_region google_reuse_colors google_rl_dest_url google_rl_filtering google_rl_mode google_rt google_safe google_scs google_skip google_tag_info google_targeting google_tdsma google_tfs google_tl google_ui_features google_ui_version google_video_doc_id google_video_product_type google_with_pyv_ads".split(" ");var K=function(a){this.a=a;a.google_iframe_oncopy||(a.google_iframe_oncopy={handlers:{},log:[],shouldLog:0.01>Math.random()?e:i});this.e=a.google_iframe_oncopy;a.setTimeout(j(this.k,this),3E4)},xa;var L="var i=this.id,s=window.google_iframe_oncopy,H=s&&s.handlers,h=H&&H[i],w=this.contentWindow,d;try{d=w.document}catch(e){}if(h&&d&&(!d.body||!d.body.firstChild)){if(h.call){i+='.call';setTimeout(h,0)}else if(h.match){i+='.nav';w.location.replace(h)}s.log&&s.log.push(i)}";
/[&<>\"]/.test(L)&&(-1!=L.indexOf("&")&&(L=L.replace(ca,"&amp;")),-1!=L.indexOf("<")&&(L=L.replace(da,"&lt;")),-1!=L.indexOf(">")&&(L=L.replace(ea,"&gt;")),-1!=L.indexOf('"')&&(L=L.replace(fa,"&quot;")));xa=L;K.prototype.set=function(a,b){this.e.handlers[a]=b;this.a.addEventListener&&this.a.addEventListener("load",j(this.j,this,a),i)};K.prototype.j=function(a){var a=this.a.document.getElementById(a),b=a.contentWindow.document;if(a.onload&&b&&(!b.body||!b.body.firstChild))a.onload()};
K.prototype.k=function(){if(this.e.shouldLog){var a=this.e.log,b=this.a.document;if(a.length){b=["/pagead/gen_204?id=iframecopy&log=",v(a.join("-")),"&url=",v(b.URL.substring(0,512)),"&ref=",v(b.referrer.substring(0,512))].join("");a.length=0;a=this.a;b=ta(q(""),b);a.google_image_requests||(a.google_image_requests=[]);var c=a.document.createElement("img");c.src=b;a.google_image_requests.push(c)}}};var ya=function(){var a="script";return["<",a,' src="',ta(q(""),"/pagead/js/r20120606/r20120410/show_ads_impl.js",""),'"></',a,">"].join("")},za=function(a,b,c,g){return function(){var d=i;g&&E().al(3E4);try{if(w(a.document.getElementById(b).contentWindow)){var f=a.document.getElementById(b).contentWindow,o=f.document;if(!o.body||
!o.body.firstChild)o.open(),f.google_async_iframe_close=e,o.write(c)}else{var B=a.document.getElementById(b).contentWindow,O;f=c;f=""+f;if(f.quote)O=f.quote();else{for(var o=['"'],C=0;C<f.length;C++){var D=f.charAt(C),ia=D.charCodeAt(0),Ja=o,Ka=C+1,P;if(!(P=m[D])){var u;if(31<ia&&127>ia)u=D;else{var n=D;if(n in p)u=p[n];else if(n in m)u=p[n]=m[n];else{var l=n,r=n.charCodeAt(0);if(31<r&&127>r)l=n;else{if(256>r){if(l="\\x",16>r||256<r)l+="0"}else l="\\u",4096>r&&(l+="0");l+=r.toString(16).toUpperCase()}u=
p[n]=l}}P=u}Ja[Ka]=P}o.push('"');O=o.join("")}B.location.replace("javascript:"+O)}d=e}catch(Ra){B=ja().google_jobrunner,ma(B)&&B.rl()}d&&(new K(a)).set(b,za(a,b,c,i))}};var M=parseFloat("0"),Aa=isNaN(M)||1<M||0>M?0:M;window.google_loader_used=e;(function(a){"google_onload_fired"in a||(a.google_onload_fired=i,ha(a,function(){a.google_onload_fired=e}))})(window);if(!window.google_loader_experiment){var N;a:{var Ba=["async_bad_black","block_bad_black"];if(!(1.0E-4>Math.random())){var Ca=Math.random();if(Ca<Aa){N=Ba[Math.floor(Ca/Aa*Ba.length)];break a}}N=h}window.google_loader_experiment=N||""||"launch"}var Q;
a:{try{if(window.google_enable_async!==e&&"blockodd"==window.google_loader_experiment&&1==window.top.location.hostname.length%2){Q=i;break a}}catch(Da){}Q=e}var R;if(R=Q){var S;if(window.google_enable_async===i)S=0;else{var Ea=navigator.userAgent,Fa=window.google_loader_experiment;S=(pa.test(Ea)?i:qa.test(Ea)?"async_bad_black"==Fa:e)&&!window.google_container_id&&(!window.google_ad_output||"html"==window.google_ad_output)}R=S}
if(R){var T=window;T.google_unique_id?++T.google_unique_id:T.google_unique_id=1;var U=window;if(!U.google_slot_list||!U.google_slot_list.push)U.google_slot_list=[];U.google_slot_list.push([U.google_ad_slot||"",U.google_ad_format||"",U.google_ad_width||"",U.google_ad_height||""].join("."));for(var G=window,_script$$inline_76="script",V,F={allowtransparency:'"true"',frameborder:'"0"',height:'"'+G.google_ad_height+'"',hspace:'"0"',marginwidth:'"0"',marginheight:'"0"',onload:'"'+xa+'"',scrolling:'"no"',
vspace:'"0"',width:'"'+G.google_ad_width+'"'},Ga=G.document,W=F.id,Ha=0;!W||G.document.getElementById(W);)W="aswift_"+Ha++;F.id=W;F.name=W;Ga.write(ra());V=W;var Ia;G.google_page_url&&(G.google_page_url=""+G.google_page_url);for(var La=[],X=0,Ma=J.length;X<Ma;X++){var Y=J[X];if(G[Y]!=h){var Z;try{var Na=[];H(new ua,G[Y],Na);Z=Na.join("")}catch(Oa){}Z&&t(La,Y,"=",Z,";")}}Ia=La.join("");for(var $=0,Pa=J.length;$<Pa;$++)G[J[$]]=h;var Qa=(new Date).getTime(),Sa=window.google_loader_experiment,Ta=["<!doctype html><html><body><",
_script$$inline_76,">",Ia,"google_show_ads_impl=true;google_unique_id=",G.google_unique_id,';google_async_iframe_id="',V,'";google_start_time=',k,";",Sa?'google_loader_experiment="'+Sa+'";':"","google_bpp=",Qa>k?Qa-k:1,";</",_script$$inline_76,">",ya(),"</body></html>"].join("");(G.document.getElementById(V)?na:oa)(za(G,V,Ta,e))}else window.q=k,document.write(ya());})();
