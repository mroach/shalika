$ ->
  $('button[data-preview-endpoint]').on 'click', () ->
    url = $(this).attr('data-preview-endpoint')
    target = $(this).attr('data-reveal-id')
    source = $(this).attr('data-preview-source')
    $("##{target}").foundation 'reveal', 'open',
      url: url
      method: 'post'
      data:
        content: $("##{source}").val()

  # WTF WHY ARE YOU BROKEN
  $(document).on 'opened.fndtn.reveal', '[data-reveal]', () ->
    $modal = $(this)
    $modal.append($('<a class="close-reveal-modal">&#215;</a>'))
