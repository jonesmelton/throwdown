$(document).ready(function() {
  $('main.container').has('#home-jumbo').addClass('home');

  $('.team-tabs a').click(function (e) {
    e.preventDefault()
    $(this).tab('show')
  })

})
