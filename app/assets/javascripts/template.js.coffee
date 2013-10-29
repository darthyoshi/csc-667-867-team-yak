# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#clears default message
$(document).on('focus', '#search', ( ->
    if $('#search').attr("class") is "blank"
        $('#search').val('')
        $('#search').removeClass("blank")
));

#
$(document).on('blur', '#search', ( ->
    if $('#search').val() is ''
        $('#search').val("Search by item name, item tag, seller name")
        $('#search').addClass("blank")
));
