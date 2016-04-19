$( document ).ready(function() {

// --------- login click btn handeler ajax -----------------
  $('.login-landing-btn').on('click', function(event) {
    event.preventDefault();

    var $link = $(this);
    console.log("login link" + $link.attr("href"));
    var ajaxRequest = $.ajax({
      url: $link.attr("href"),
      type: 'get'
    });

    ajaxRequest.done(function (formHtml) {
      console.log(formHtml);
      $('.form-holder').html(formHtml)
    });
  }); // end login click handler

// -------- sign up click btn handler ajax ------------------
  $('.sign-up-landing-btn').on('click', function(event) {
    event.preventDefault();

    var $link = $(this);
    var ajaxRequest = $.ajax({
      url: $link.attr("href"),
      type: 'get'
    });

    ajaxRequest.done(function (formHtml) {
      console.log(formHtml);
      $('.form-holder').html(formHtml)
    });
  }); // end login click handler


$('.login-landing-btn').on('click', function(event) {
    event.preventDefault();

    var $link = $(this);
    console.log("login link" + $link.attr("href"));
    var ajaxRequest = $.ajax({
      url: $link.attr("href"),
      type: 'get'
    });

    ajaxRequest.done(function (formHtml) {
      console.log(formHtml);
      $('.form-holder').html(formHtml)
    });
  }); // end login click handler

});
