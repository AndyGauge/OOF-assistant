# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on('turbolinks:load', ->
  $("#display_new_mailbox_modal").click ->
    $("#new_mailbox_modal").modal({
      opacity: 50,
      closeHTML: 'X',
      overlayClose:true})

  $('#mailbox_message_message').on 'change', ->
    if $(this).find(':selected')
      $("#message_body").html($(this).find(':selected').data('body'))

  $(".display_out_of_office_modal").click ->
    $("#mailbox_message_mailbox").val($(this).data("mailbox"))
    if $(this).data("lastmessage") != undefined
      $("#mailbox_message_message").val($(this).data("lastmessage"))
      $("#mailbox_message_message").trigger("change")
    $("#set_oof_modal").modal({
      opacity: 50,
      closeHTML: 'X',
      overlayClose:true})

  )