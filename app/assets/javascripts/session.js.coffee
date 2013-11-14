$(document).ready ->
    $('#account-details').hide()

$(document).on('mouseenter', '#account', ( ->
    $('#account-details').show()
));

$(document).on('mouseleave', '#account', ( ->
    $('#account-details').hide()
));
