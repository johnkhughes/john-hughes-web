document.addEventListener('DOMContentLoaded', function() {

    var nav = document.querySelector('.nav');
    var button = document.createElement('a');
    var hidden = 'hidden';

    button.addEventListener('click', function(e) {
        e.preventDefault();
        nav.classList.toggle(hidden);
    });

    button.innerHTML = 'Menu';
    button.href = '#';
    nav.insertBefore(button, nav.firstChild);
    nav.classList.add(hidden);

});
