$(document).on 'ready page:load', ->
  $('.breadcrumbs li:not(:has(a))').addClass('unavailable')
