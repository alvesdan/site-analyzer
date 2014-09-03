$ ->
  $('.meta-tag').tooltip
    title: ->
      $(this).text()

  $('.stylesheet, .javascript, .image').tooltip
    title: ->
      $(this).data('url')

  $('.stylesheet, .javascript, .image').on 'click', ->
    url = $(this).data('url')
    window.open(url, '_blank')

  $('.color').each ->
    $(this).css('background-color', $(this).text())
    $(this).css('color', $(this).text())

  $('.color').tooltip
    title: ->
      $(this).text()

  $('.image-wrapper').each ->
    imageUrl = $(this).data('image')
    console.log(imageUrl)
    # if imageUrl?
    $(this).css('background-image', "url(#{imageUrl})")
