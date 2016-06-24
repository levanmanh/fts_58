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
//= require bootstrap
//= require turbolinks
//= require_tree .
function set_value_checkbox () {
  $('.is_correct').click(function () {
    if ($('#question_type').val() == 'single') {
      $('.is_correct').not(this).attr('checked', false);
    }
  })
  $('#question_type').on('change', function() {
    $(".is_correct").attr('checked', false);
  });
}

function get_questions () {
  var lesson_id = $('#lesson_subject_id').val();
  $.ajax({
    url: '/admin/subjects/' + lesson_id,
    type: 'GET'
  })
}

$(document).ready(function(){
  get_questions();
  $('#lesson_subject_id').on('change', function() {
    get_questions();
  });
  $('#finish_mark').on('click', function(){
    $('.status_question').val("checked")
  });
});

$(document).on('page:load', function () {
  if($('#add_index').length)
  {
    get_questions();
  }
  $('#lesson_subject_id').on('change', function() {
    get_questions();
  });
})
