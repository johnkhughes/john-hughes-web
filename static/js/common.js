document.addEventListener('DOMContentLoaded', function() {

    var nav = document.querySelector('.nav');
    var button = document.createElement('a');
    var hidden = 'hidden';

    if (!('classList' in nav)) {
        return;
    }

    button.addEventListener('click', function(e) {
        e.preventDefault();
        nav.classList.toggle(hidden);
    });

    button.innerHTML = 'Menu';
    button.href = '#';
    nav.insertBefore(button, nav.firstChild);
    nav.classList.add(hidden);

});
