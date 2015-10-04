// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui.min
//= require turbolinks
//= require_tree .

$(document).ready(function () {

	$('.parallax-window').parallax();

	$(".slider").each(function(){
    $(this).slider({
      max: parseFloat($(this).data('max')),
      min: parseFloat($(this).data('min')),
      step: parseFloat($(this).data('step')),
      value: parseFloat($(this).data('value')),
      change: function(event, ui) { 
        $(this).parent().find('input[type=hidden]').val(ui.value);
    	}
		})
    .slider("pips", {
      rest: "label",
      pips: true
    });
	});

  $(document).find('.popup_modal').magnificPopup({
    type: 'inline'
  });

  $('.close_popup').on( "click", function(e) {
    e.preventDefault();
    $.magnificPopup.close();
  });

});