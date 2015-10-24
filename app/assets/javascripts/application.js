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
//= require jquery.ui.touch-punch.min
//= require turbolinks
//= require_tree .

$(document).ready(function () {

  function isInt(n) {
   return n % 1 === 0;
  }

  function roundit(which){
    return Math.round(which*100)/100
  }

  function cm_inches_convert(value, to){
    if (to == "cm"){
      return roundit(value*2.54);
    } else {
      return roundit(value*0.3937);
    }
  }

  function formatSizes(value) {
    if (isInt(value)) {
      return value;
    } else {
      if (isInt(value/0.5)) {
        return value-0.5 + "½";
      } else if (isInt(value-0.75)) {
        return value-0.75 + "¾";
      } else if (isInt(value-0.25)) {
        return value-0.25 + "¼";
      } else {
        return parseInt(value);
      }
    }
  }

  function convertInches(value) {
    var feet = parseInt(value / 12);
    var inches2 = parseInt(value % 12);
    var size = feet+"ft";
    if (inches2 > 0) {
      size += ", "+inches2+"in"
    }
    return size;
  }

	$(".slider").each(function(){
    $(this).slider({
      max: parseFloat($(this).data('max')),
      min: parseFloat($(this).data('min')),
      step: parseFloat($(this).data('step')),
      value: parseFloat($(this).data('value')),
      slide: function(event, ui) {
        var measure = $(this).data('measure');
        $(this).parent().find('input[type=hidden]').val(ui.value);
        if (measure == "standard") {
          measure_format = formatSizes(ui.value)+ " inches";
        } else if (measure == "inches") {
          measure_format = convertInches(ui.value);
        } else if (measure == "cm") {
          measure_format = ui.value + "cm";
        } else if (measure == 'lbs') {
          measure_format = ui.value + "lbs";
        } else if (measure == 'kg') {
          measure_format = ui.value + "kg";
        }
        $(this).parents('.single_option').find("span.size").text(measure_format);
    	}
		})
    .slider("pips", {
      rest: "pip",
      pips: true,
      // formatLabel: function(value) {
      //   return formatSizes(value)+" "+$(this).data('measure');
      // }
    });
	});

  $(document).find('.popup_modal').magnificPopup({
    type: 'inline'
  });

  $(document).on('change', '.click_through', function(e){
    $(this).parents('form').submit();
  })

  $('.close_popup').on( "click", function(e) {
    e.preventDefault();
    $.magnificPopup.close();
  });

  $(document).on("change", ".switch input", function(a){
    var height_inches_slider = $("#height_inches");
    var height_cm_slider = $("#height_cm");
    var hidden_height = $("#hidden_height");
    var weight_lbs_slider = $("#weight_lbs");
    var weight_kg_slider = $("#weight_kg");
    var hidden_weight = $("#hidden_weight");
    var option_val = $(this).val();
    if (option_val == "inches") {
      height_cm_slider.toggleClass('hide');
      height_inches_slider.toggleClass('hide');
      height_inches_slider.parents('.single_option').find("span.size").text("Select your height");
    } else if (option_val == "cm") {
      height_cm_slider.toggleClass('hide');
      height_inches_slider.toggleClass('hide');
      height_cm_slider.parents('.single_option').find("span.size").text("Select your height");
    } else if (option_val == "lbs") {
      weight_kg_slider.toggleClass('hide');
      weight_lbs_slider.toggleClass('hide');
      weight_lbs_slider.parents('.single_option').find("span.size").text("Select your weight")
    } else if (option_val == "kg") {
      weight_kg_slider.toggleClass('hide');
      weight_lbs_slider.toggleClass('hide');
      weight_kg_slider.parents('.single_option').find("span.size").text("Select your weight")
    }
    
  });

});