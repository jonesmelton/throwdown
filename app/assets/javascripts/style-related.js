$(document).ready(function() {
  $('main.container').has('#home-jumbo').addClass('home');


  $('.container').on('click', '.team-tabs a, .user_tabs a', function (e) {
    e.preventDefault();
    $(this).tab('show');
  })

  $('body').on('click', function (e) {
    var x = e.clientX - 20;
    var y = e.clientY - 20;

    $('#twinkle').css({top: y, left: x}).fadeIn('fast').delay(200).fadeOut('slow')
  })

})
