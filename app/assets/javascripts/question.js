var ready
ready = function () {
  $('body').on('DOMNodeInserted', function () {
    make_radio_from_checkbox();
  })
}

function make_radio_from_checkbox () {
  $('.correct').click(function () {
    if ($('#question_question_type').val() == 'single') {
      $('.correct').not(this).attr('checked', false);
    }
  })

  $('#question_question_type').on('change', function() {
    $('.correct').attr('checked', false);
  });
}

$(document).ready(ready)
$(document).on('page:load', ready)
