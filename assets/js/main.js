/* global $ */
$(document).ready(function () {
  $("a[href^='#']").on('click', function (e) {
    e.preventDefault()
    var haash = this.hash
    $('html, body').animate({
      scrollTop: $(haash).offset().top - 70
    }, 300, function () {
      window.location.hash = haash
    })
  })
  $('.nav a').on('click', function () {
    $('.navbar-toggle').click() // bootstrap 3.x by Richard
  })
})
