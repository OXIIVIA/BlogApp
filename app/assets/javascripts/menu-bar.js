$(document).on('turbolinks:load', function() {

  $('#nickname-form').on('keyup', function() {
    var input = $(this).val();
    $.ajax({
      type: 'GET',
      url: '/users',
      data: {keyword: input},
      dataType: 'json'
    })






  });






  $('.fa-bars').on('click', function() {
    $('.header__links').css('display', 'block');
    $('.header__icon').css('display', 'none');
  })

  $('.header__links__back').on('click', function() {
    $('.header__links').css('display', 'none');
    $('.header__icon').css('display', 'block');
  })
});