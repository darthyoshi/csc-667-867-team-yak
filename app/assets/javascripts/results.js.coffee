# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#disables pagination links that go nowhere
$(document).on('click', '.disabled, .active', ( ->
    return false
));

#click on pagination ellipses to jump to a page
$(document).on('click', '.disabled', ( ->
    if $(this).text() is "…"
        page = ''
        while isNaN(page) or page.length is 0
            page = prompt("Enter the page to jump to")

        action = location.pathname.split('/')
        path = "http://" + top.location.host.toString() 

        #results pages
        if action[1].length > 0
            act = ''
            for i in action
                if isNaN(i)
                    act += i + '/'

            path += '/' + act + page + location.search
        #home page
        else
            path += "/?page=" + page

        window.location = path
));
