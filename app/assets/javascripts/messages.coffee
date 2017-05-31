# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on('turbolinks:load', ->
  $("#display_new_message_modal").click ->
    $("#new_message_modal").modal({
      opacity: 50,
      overlayCss: {backgroundColor:"#888"},
      containerCss: { backgroundColor:"#FFF", padding: "10px", borderRadius: "10px", maxWidth: "400px", border: "1px solid #888"},
      overlayClose:true})


  )
