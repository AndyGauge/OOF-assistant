# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on('turbolinks:load', ->
  $("#display_new_message_modal").click ->
    $("#new_message_modal").modal({
      opacity: 50,
      closeHTML: 'X',
      overlayClose:true})


  )
