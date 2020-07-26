;(function($){
	$.debug = function(_msg, _flag) { var __msg = ""; if ($.eiui.typeOf(_msg, 'object')) { __msg = $.eiui.jsonToFormatString(_msg); } else { __msg = ($.eiui.typeOf(_msg, 'string') ? _msg.replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/\n/g, '<br />') : _msg); } var n = "DIV#eiuiDebugBox"; if ($.eiui.typeOf(_flag)) { $(n).html(''); } $(n).append(($(n).html() != '' ? "<hr style='clear:both;'/>" : "") + __msg).css({ "display": "block" }); };
	$.debug.init = function() { $("<DIV id='eiuiDebugBox' class='debugBox'/>").bind("dblclick", function() { if ($(this).css("overflow-y") != 'visible') { $(this).addClass('disp'); } else { $(this).removeClass('disp'); } }).appendTo("BODY"); };
	Date.prototype.formate=function(a){var c={"M+":this.getMonth()+1,"d+":this.getDate(),"h+":this.getHours()%12==0?12:this.getHours()%12,"H+":this.getHours(),"m+":this.getMinutes(),"s+":this.getSeconds(),"q+":Math.floor((this.getMonth()+3)/3),S:this.getMilliseconds()};var d={"0":"\u65e5","1":"\u4e00","2":"\u4e8c","3":"\u4e09","4":"\u56db","5":"\u4e94","6":"\u516d"};if(/(y+)/.test(a)){a=a.replace(RegExp.$1,(this.getFullYear()+"").substr(4-RegExp.$1.length))}if(/(E+)/.test(a)){a=a.replace(RegExp.$1,((RegExp.$1.length>1)?(RegExp.$1.length>2?"\u661f\u671f":"\u5468"):"")+d[this.getDay()+""])}for(var b in c){if(new RegExp("("+b+")").test(a)){a=a.replace(RegExp.$1,(RegExp.$1.length==1)?(c[b]):(("00"+c[b]).substr((""+c[b]).length)))}}return a};

	$.eiui = {
		typeOf : function(_obj,_type){return ((typeof _obj != 'undefined' && typeof _type !='undefined' && typeof _obj == _type)?true:((typeof _obj != 'undefined'&&typeof _type !='undefined')?false:((typeof _obj != 'undefined'&&typeof _type =='undefined')?typeof _obj:false)));},
		title : function(_title,_wTitle){
			if($("BODY").find("DIV.pageTitle").size() == 0){
				$("BODY").prepend($("<DIV class=\"pageTitle\"/>").html($("<DIV class=\"title\"/>").html(_title)));
			}
			else{
				$("DIV.pageTitle .title").html(_title);
			}
			$.each(arguments,function(__i,__v){
				if (__i > 0) _title += ' - ' + __v;}
			);
			document.title=_title;
		},
		titleRight : function(_div){
			if($("DIV.pageTitle .titleRight").size() == 0){
				$("DIV.pageTitle").append($("<DIV class=\"titleRight\"/>").html(_div));
			}
			else{
				$("<DIV class=\"titleRight\"/>").html(_div);
			}
		},
		rand      : function(){return ('' + eval(Math.random(100000)+Math.random(100000))*1000000000000000).substr(0,($.eiui.typeOf(arguments[0])?arguments[0]:5));},
		param : function(_param){var _url = location.href;var _pString = _url.substring(_url.indexOf("?")+1,_url.length).split("&");var _pObj = {};for (i=0;j=_pString[i];i++){_pObj[j.substring(0,j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=")+1,j.length);} var returnValue = _pObj[_param.toLowerCase()];if(!$.eiui.typeOf(returnValue)){return "";}else{return returnValue;}},
		parseParam : function(_param){_param = $.param(_param);},
		getFormData : function(form){
			formData = form.serializeArray();
			var _form = {};
			for(var v in formData){
				_form[formData[v]['name']] = formData[v]['value']
			}
			return _form;
		},
		jsonToString : function (obj) {var t = typeof (obj);if (t != "object" || obj === null) {if (t == "string") obj = '"'+obj+'"';return String(obj);}else {var n, v, json = [], arr = (obj && obj.constructor == Array);for (n in obj) {v = obj[n]; t = typeof(v);if (t == "string") v = '"'+v+'"';else if (t == "object" && v !== null) v = $.eiui.jsonToString(v);json.push((arr ? "" : '"' + n + '":') + String(v));}return (arr ? "[" : "{") + String(json) + (arr ? "]" : "}");}},
		jsonToFormatString : function(obj) {return $.eiui.__jsonWriteObj(obj,1);},
		__strLn: "<br>",
		__strIntent: "<span style='width:12px;'></span>",
		__jsonWriteObj : function(obj, level, isInArray) {if (obj == null) {return "null";}if (obj.constructor == Number || obj.constructor == Date || obj.constructor == String || obj.constructor == Boolean) {var v = obj.toString();var tab = isInArray ? $.eiui.__jsonRepeatStr($.eiui.__strIntent, level - 1) : "";if (obj.constructor == String || obj.constructor == Date) {return tab + ("\"" + v + "\"");}else if (obj.constructor == Boolean) {return tab + v.toLowerCase();}else {return tab + (v);}}var currentObjStrings = [];for (var name in obj) {var temp = [];var paddingTab = $.eiui.__jsonRepeatStr($.eiui.__strIntent, level);temp.push(paddingTab);temp.push(name + " : ");var val = obj[name];if (val == null) {temp.push("null");}else{var c = val.constructor;if (c == Array) {temp.push($.eiui.__strLn + paddingTab + "[" + $.eiui.__strLn);var levelUp = level + 2;var tempArrValue = [];for (var i = 0; i < val.length; i++) {tempArrValue.push($.eiui.__jsonWriteObj(val[i], levelUp, true));}temp.push(tempArrValue.join("," + $.eiui.__strLn));temp.push($.eiui.__strLn + paddingTab + "]");}else if (c == Function) {temp.push("[Function]");}else {temp.push($.eiui.__jsonWriteObj(val, level + 1));}}currentObjStrings.push(temp.join(""));}return (level > 1 && !isInArray ? $.eiui.__strLn : "")+ $.eiui.__jsonRepeatStr($.eiui.__strIntent, level - 1) + "{" + $.eiui.__strLn+ currentObjStrings.join("," + $.eiui.__strLn)+ $.eiui.__strLn + $.eiui.__jsonRepeatStr($.eiui.__strIntent, level - 1) + "}";},
		__jsonIsArray  : function(obj) {if (obj) {return obj.constructor == Array;}return false;},
		__jsonRepeatStr: function(str, times) {var newStr = [];if (times > 0) {for (var i = 0; i < times; i++) {newStr.push(str);}}return newStr.join("");},
		dateFormat:function(_f,_v){return (_v.indexOf("Date(")!=-1?new Date(+/[0-9]+/.exec(_v)).formate(_f):eval('new Date(' + _v.replace(/\d+(?=-[^-]+$)/,function (a) { return parseInt(a, 10)-1; }).match(/\d+/g) + ')').formate(_f))},
		ajax : function(_ops){
			var _return = [];
			if($.eiui.typeOf(_ops) && $.eiui.typeOf(_ops.url)){$.getJSON(_ops.url,function(data){_return = data;});}
			return _return;
		},
		post : function(_options){
			$.ajax({
				url :_options.url,
				data : $.eiui.typeOf(_options.data) ? _options.data : {},
				traditional : _options.url.indexOf(".php")!=-1?false:true,
				type : "post",
				dataType : "json",
				success : function(response){
					if(response.result == 'success' && $.eiui.typeOf(_options.success,"function")){
						_options.success(response);
					}
					//else{$.eiui.alert("load error : <br/>"+ ($.eiui.typeOf(response.resume)?response.resume:response));}	
					else{
						$.eiui.showTip(($.eiui.typeOf(response.resume)?response.resume:response));
					}					
				},
				complete : function(){
				}
			});
		},
        _ajax_request : function (_options){
            if ($.isFunction(_options.data)) {callback = _options.data;_options.data = {};}
            return $.ajax({
                type: _options.type || 'post',
                url: _options.url,
                data: _options.data,
                dataType: _options.dataType || 'json',
                success: function(response){if(response.result == 'success'){_options.success(response);}else{$.eiui.alert($.eiui.error.getErrorMsg(response.resume));}$.eiui.loading.unload();},
                error : function(response){$.eiui.alert($.eiui.error.getErrorMsg(response.resume));}
            });
        },
        REST : {   
            GET: function(_options) {_options.type = 'GET';return $.eiui._ajax_request(_options);}, 
            POST: function(_options) {_options.type = 'POST';return $.eiui._ajax_request(_options);},
            PUT: function(_options) {_options.type = 'PUT';return $.eiui._ajax_request(_options);},
            DEL: function(_options) {_options.type = 'DELETE';return $.eiui._ajax_request(_options);},
            HEAD: function(_options) {_options.type = 'HEAD';return $.eiui._ajax_request(_options);},
            OPTIONS: function(_options) {_options.type = 'OPTIONS';return $.eiui._ajax_request(_options);}    
        },
		postJSON : function(_url,_data,_success){
			$.post(_url,_data,function(_response){
				if($.eiui.typeOf(_response.result)){
					if(_response.result == "sucess" && $.eiui.typeOf(_success,"function")){
						if($.eiui.typeOf(_response.data)){_success(_response.data);}
						else if($.eiui.typeOf(_response.items)){_success(_response.items);}
						else{_success(_response);}
					}
					//else{$.eiui.alert("load error : <br/>"+ _response.resume);}
					else{$.eiui.alert(_response.resume);}
				}
				else{$.eiui.alert(_response);}
			},"json");
		},
		copyText : function (t){if (window.clipboardData) window.clipboardData.setData("Text", t);},
		encodeURI: function(t){return encodeURIComponent(t)},
		cookie : function(name, value, options) {
			if (typeof value != 'undefined') {
				options = options || {};
				if (value === null) {
					value = '';
					options.expires = -1;
				}
				var expires = '';
				if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
					var date;
					if (typeof options.expires == 'number') {
						date = new Date();
						date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
					} else {
						date = options.expires;
					}
					expires = '; expires=' + date.toUTCString();
				}
				var path = options.path ? '; path=' + (options.path) : '';
				var domain = options.domain ? '; domain=' + (options.domain) : '';
				var secure = options.secure ? '; secure' : '';
				document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
			} 
			else {
				var cookieValue = null;
				if (document.cookie && document.cookie != '') {
					var cookies = document.cookie.split(';');
					for (var i = 0; i < cookies.length; i++) {
						var cookie = jQuery.trim(cookies[i]);
						if (cookie.substring(0, name.length + 1) == (name + '=')) {cookieValue = decodeURIComponent(cookie.substring(name.length + 1));break;}
					}
				}
				return cookieValue;
			}
		},
		alert : function(content,callback){
			$.eiui.popwindows("alert","操作提醒",content,callback||function(){});
		},
		confirm : function(title,content,callback1,callback2){
			$.eiui.popwindows("confirm",title,content,callback1||function(){},callback2||function(){});
		},
		success : function(_params,_close){
		},
		window : {
			alert : function(content,callback,callback3,options){
				$.eiui.popwindows("alert","操作提醒",content,callback||function(){},function(){},callback3||function(){},options||{});
			},
			confirm : function(title,content,callback1,callback2,callback3,options){
				$.eiui.popwindows("confirm",title,content,callback1||function(){},callback2||function(){},callback3||function(){},options||{});
			}
		},
		showTip : function(txt){
			var poplayer = $("<DIV class='poplayer'>"+txt+"</DIV>");
			$("BODY").append(poplayer);
			var bw = $(window).width();
			var pw = poplayer.outerWidth();
			var bh = $(window).height();
			var ph = poplayer.outerHeight();
			$(".poplayer").css({left:parseInt((bw - pw)/2)+'px',top:(parseInt((bh - ph)/2))+'px',zIndex:29999}).fadeIn(200);
			setTimeout(function(){
				$(".poplayer").fadeOut(1000,function(){$(this).remove()});
			},2000);
		},
		_popwindow_layer : function(){	
			popwindows = $("<DIV class='popwindows'></DIV>");
			popwindows.width($(document).width());
			popwindows.height($(document).height());
			$("BODY").append(popwindows);
			return popwindows;
		},
		popwindows_close : function(){
			$(".popwindows").fadeOut(100,function(){$(this).remove()});
		},
		popwindows : function(type,title,content,callback1,callback2,callback3,options){
			options = options || {};
			popwindows = $.eiui._popwindow_layer();
			popwindows.append("<DIV class='popwindows_back'></DIV>")
						.append("<DIV class='popwindows_body'></DIV>");
			popwindows.children(".popwindows_body")
				.append("<DIV class='pop_title'></DIV>")
				.append("<DIV class='pop_content'></DIV>")
				.append("<DIV class='pop_buttons'></DIV>");
			var pb = popwindows.children(".popwindows_body");
			if(typeof options.width !='undefined') pb.css({'width':options.width});
			if(typeof options.height !='undefined') pb.css({'height':options.height});
			pb.children(".pop_title").html(title || '提示');
			pb.children(".pop_content").html(content || '确定要这样操作吗？');

			if(type == 'alert'){
				pb.children(".pop_buttons").append($("<DIV class='pop_button pop_button_all'>关闭</DIV>").click(callback1||function(){}).click($.eiui.popwindows_close));
			}
			else if(type == 'confirm'){
				pb.children(".pop_buttons").append($("<DIV class='pop_button pop_button_left'>确定</DIV>").click(callback1||function(){$.eiui.popwindows_close()}));
				pb.children(".pop_buttons").append($("<DIV class='pop_button pop_button_right'>取消</DIV>").click(callback2||function(){$.eiui.popwindows_close()}).click($.eiui.popwindows_close));
			}
			else if(type == 'auto'){
				popwindows.fadeOut(1000,callback1||function(){});
			}

			popwindows.fadeIn(10,function(){$.eiui.popcenter($('.popwindows_body'));});
			//var height = popwindows.children(".popwindows_body").children(".pop_title").height();
			//    height += popwindows.children(".popwindows_body").children(".pop_content").height();
			//    height += popwindows.children(".popwindows_body").children(".pop_buttons").height();
			//popwindows.children(".popwindows_body").height(height);

			if(typeof callback3 == 'function') callback3();
		},
		popcenter : function(obj){
		 	$.eiui._popcenter(obj);
		 	//$(window).scroll(function(){
		  	//	$.eiui._popcenter(obj);
		 	//});
		 	//$(window).resize(function(){
		  	//	$.eiui._popcenter(obj);
		 	//}); 
		},
		_popcenter : function (obj){
			var windowWidth = document.documentElement.clientWidth;   
			var windowHeight = document.documentElement.clientHeight;   
			var popupHeight = $(obj).height();   
			var popupWidth = $(obj).width();    
			$(obj).css({   
				"position": "absolute",   
				"top": (windowHeight-popupHeight)/2+$(document).scrollTop(),   
				"left": (windowWidth-popupWidth)/2   
			});  
		}
	};
	
	$.fn.extend({
		showTip : function(txt){
			$.eiui.showTip(txt);
			$(this).focus();
			return;

			//alert(txt);
			$(this).addClass("tip");
			setTimeout(function(){$("INPUT.tip").removeClass("tip")},3000);
			$(this).focus();
			$('.tipmsg').show(200).html(txt);
		},
		isPhone : function(){
			if(!/^(1[34578][0-9])\d{8}$/i.test($.trim($(this).val()||$(this).text()))){
			  	return false;
			}
			return true;
		},
		autoScroll : function(_scrollObj){
			$(_scrollObj).scrollTop(60);
			var pos = $(this).position();
			var hi = $(_scrollObj).height()
			//$.eiui.showTip('left='+ pos.left + ',top' + pos.top);
			$(_scrollObj).scrollTop(pos.top - hi/2);
		}
	});


})(jQuery);

	var getChgUserInfoUrlRequest = function(_title,_field,_value,_datas,callback){
		if(!_datas) $.eiui.showTip('没有填写修改的内容');
		_data = {action:'upinfo'};
		for(k in _datas){
			_data[k] = _datas[k];
		}
		$.eiui.post({
			url     : './user',
			data    : _data,
			success : function(response){
				if(response.result == 'success'){
					$("#"+ _field).children('.main').html(response['data'][_field]);
					$.eiui.showTip(_title + '修改成功');
					if(typeof callback == 'function') callback(response);
					$.eiui.popwindows_close();
				}
				else{
					$.eiui.showTip(_title + '修改失败');
				}
			}
		});
	}