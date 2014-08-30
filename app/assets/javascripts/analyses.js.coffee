$ ->
  $('.stylesheet, .javascript').tooltip
    title: ->
      $(this).data('url')

  $('.stylesheet, .javascript').on 'click', ->
    url = $(this).data('url')
    window.open(url, '_blank')
