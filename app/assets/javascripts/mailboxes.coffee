# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on('turbolinks:load', ->
  $("#display_new_mailbox_modal").click ->
    $("#new_mailbox_modal").modal({
      opacity: 50,
      overlayCss: {backgroundColor:"#888"},
      containerCss: { backgroundColor:"#FFF", padding: "10px", borderRadius: "10px", maxWidth: "180px", border: "1px solid #888", height: "140px" },
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
      overlayCss: {backgroundColor:"#888"},
      containerCss: { backgroundColor:"#FFF", padding: "10px", borderRadius: "10px", maxWidth: "400px", border: "1px solid #888", minHeight: "240px" },
      overlayClose:true})

  )
