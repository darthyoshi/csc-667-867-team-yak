$(document).on('mouseenter', '#account', ( ->
    $('.dropdown-menu').toggle('slide', {direction: 'up'})
));

$(document).on('mouseleave', '#account-menu', ( ->
    $('.dropdown-menu').toggle('slide', {direction: 'up'})
));
