document.addEventListener('DOMContentLoaded', function() {

    var nav = document.querySelector('.nav');
    var button = document.createElement('a');
    var visible = nav.className;
    var hidden = visible + ' hidden';

    button.addEventListener('click', function(e) {
        e.preventDefault();
        if (nav.className === visible) {
            nav.className = hidden;
        } else {
            nav.className = visible;
        }
    });

    button.innerHTML = 'Menu';
    button.href = '#';
    nav.insertBefore(button, nav.firstChild);
    nav.className = hidden;

});
