$(document).on('turbolinks:load', function() {
  function appendUser(user) {
    var userHTML = `<div class="blog-user">
                      <p class="blog-user__nickname">${user.nickname}</p>
                    </div>`

    $('.main').append(userHTML);
  }

  function appendErrorMessage(message) {
    var messageHTML = `<div class="blog-user">
                        <p class="blog-user__nickname">${message}</p>
                      </div>`
    $('.main').append(messageHTML);
  }
  $('#nickname-form').on('keyup', function() {
    var input = $(this).val();

    $.ajax({
      type: 'GET',
      url: '/users',
      data: {keyword: input},
      dataType: 'json'
    })
    .done(function(users) {
      $('.main').empty();
      if (input.length !== 0) {
        if (users.length !== 0) {
          users.forEach(function(user) {
            appendUser(user);
          })
        } else {
          appendErrorMessage("一致するユーザーが見つかりません");
        }
      }
    })
    .fail(function() {
      alert('ユーザーの検索に失敗しました')
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