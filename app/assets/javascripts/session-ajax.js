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
  }); // end signup click handler

// -------- team click handler ajax in users teams ------------------
$('.user-teams-table').on('click', '.user-team-link', function(event) {
    event.preventDefault();

    var $link = $(this);
    console.log("login link" + $link.attr("href"));
    var ajaxRequest = $.ajax({
      url: $link.attr("href"),
      type: 'get'
    });

    ajaxRequest.done(function (formHtml) {
      console.log(formHtml);
      $('.app-wrapper').html(formHtml)
    });
  }); // end team-link click handler





});
