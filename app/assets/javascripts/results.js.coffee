# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#disables pagination links that go nowhere
$(document).on('click', '.disabled, .active', ( ->
    return false
));
