# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#clears default message
$(document).on('focus', '#search', ( ->
    if $('#search').attr("class") is "blank"
        $('#search').val('')
        $('#search').removeClass("blank")
));

#restores default message if search bar is blank
$(document).on('blur', '#search', ( ->
    if $('#search').val() is ''
        $('#search').val("Search by item name, item tag, seller name")
        $('#search').addClass("blank")
));

#hides modal windows
$(document).ready ->
    $('#dialogue1').dialog({
        autoOpen: false;
        closeOnEscape: true;
        draggable: false;
        modal: true;
        resizable: false;
    })
    $('#dialogue2').dialog({
        autoOpen: false;
        closeOnEscape: true;
        draggable: false;
        modal: true;
        resizable: false;
    })

#show modal window for registration
$(document).on('click', '#register', ( ->
    $('#dialogue1').dialog('open')
    return false
));

#show modal window for login
$(document).on('click', '#signin', ( ->
    $('#dialogue2').dialog('open')
));
