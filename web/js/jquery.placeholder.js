;(function ($) {
	var placeholder = {
		add : function (el) {
			if (!('placeholder' in document.createElement('input'))) {
				var self = placeholder;
				el.each(function (e) {
					if (IsEmpty(e.value()) || e.value() == e.attr('placeholder')) {
						e.value(e.attr('placeholder'));
						e.css('color', 'gray');
					} else {
						e.css('color', 'black');
					}
				});
				el.bind('focus', self._onfocus);
				el.bind('click', self._onfocus);
				el.bind('blur', self._onblur);
				el.bind('keyup', self._onkeyup);
			}
		},
		remove : function (el) {
			if (!('placeholder' in document.createElement('input'))) {
				var self = placeholder;
				el.unbind('focus', self._onfocus);
				el.unbind('click', self._onfocus);
				el.unbind('blur', self._onblur);
			}
		},
		check : function (el) {
			if (!('placeholder' in document.createElement('input'))) {
				el.each(function (tar) {
					if (IsEmpty(tar.value())) {
						tar.value(tar.attr('placeholder'));
					}
				});
			}
		},
		clear : function () {
			if (!('placeholder' in document.createElement('input'))) {
				$('input[type="text"]').each(function (el) {
					if (el.value() == el.attr('placeholder')) {
						el.value('');
					}
				});
				$('textarea').each(function (el) {
					if (el.value() == el.attr('placeholder')) {
						el.value('');
					}
				});
			}
		},
		_onfocus : function () {
			if ($(this).value() == $(this).attr('placeholder'))
				$(this).value('');
		},
		_onblur : function () {
			if (IsEmpty($(this).value()) || $(this).value() == $(this).attr('placeholder')) {
				$(this).value($(this).attr('placeholder'));
				$(this).css('color', 'gray');
			} else {
				$(this).css('color', 'black');
			}
		},
		_onkeyup : function () {
			if (IsEmpty($(this).value())) {
				$(this).css('color', 'gray');
			} else {
				$(this).css('color', 'black');
			}
		}
	};
	
	$(document).ready(function(){
		placeholder.add($('input[type="text"]'));
		placeholder.add($('textarea'));
	});
})(jQuery);