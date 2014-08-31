$ ->
  $('.meta-tag').tooltip
    title: ->
      $(this).text()

  $('.stylesheet, .javascript').tooltip
    title: ->
      $(this).data('url')

  $('.stylesheet, .javascript').on 'click', ->
    url = $(this).data('url')
    window.open(url, '_blank')

  $('.color').each ->
    $(this).css('background-color', $(this).text())
    $(this).css('color', $(this).text())

  $('.color').tooltip
    title: ->
      $(this).text()
