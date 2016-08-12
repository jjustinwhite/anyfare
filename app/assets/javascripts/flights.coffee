# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(window).bind "keypress", (event) ->
    return if $(event.target).closest("input, select, textarea, [contenteditable]").length
    return if event.altKey or event.ctrlKey or event.metaKey

    pressedKey = String.fromCharCode event.charCode
    if pressedKey == "/"
      $("#airport-search-input").focus()
      false

# autocomplete category js
$.widget 'custom.catcomplete', $.ui.autocomplete,
  _create: ->
    @_super()
    @widget().menu 'option', 'items', '> :not(.ui-autocomplete-category)'
    return
  _renderMenu: (ul, items) ->
    that = this
    currentCategory = ''
    $.each items, (index, item) ->
      li = undefined
      if item.category != currentCategory
        ul.append '<li class=\'ui-autocomplete-category\'>' + item.category + '</li>'
        currentCategory = item.category
      li = that._renderItemData(ul, item)
      if item.category
        li.attr 'aria-label', item.category + ' : ' + item.value
      return
    return

# autocomplete data, ac_data set in search/_form.html.erb
$ ->
  if airport_data?
    $('#airport-search-input').catcomplete
      source: airport_data
      minLength: 2
      delay: 0
      select: (event, ui) ->
        if ui.item
          $(event.target).val ui.item.value
        $(event.target.form).submit()
        return
    return


