/* global $, history */
$(document).ready(function () {
  $("a[href^='#']").on('click', function (e) {
    e.preventDefault()
    var haash = this.hash
    var paddingTop = parseInt($('body').css('padding-top').replace('px', '')) + 20
    // window.location.hash = haash
    $('html, body').animate({
      scrollTop: $(haash).position().top - paddingTop
    }, 300, function () {
      history.pushState(null, null, haash)
    })
  })
  $('.nav a').on('click', function () {
    $('.navbar-toggle').click() // bootstrap 3.x by Richard
  })
})
