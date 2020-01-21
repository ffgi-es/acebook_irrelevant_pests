function onKonamiCode(assertion) {
  var input = '';
  var key = '38384040373937396665';
  document.addEventListener('keydown', function (e) {
    input += ("" + e.keyCode);
    if (input === key) {
      return assertion();
    }
    if (!key.indexOf(input)) return;
    input = ("" + e.keyCode);
  });
}

// animation for konami code
$(document).keydown(function(e) {
  if(e.which === 65 ||
     e.which === 76 ||
     e.which === 65 ||
     e.which === 83 ||
     e.which === 84 ||
     e.which === 65 ||
     e.which === 73 ||
     e.which === 82 ||
     ) {
    alert("Gotcha!!")
  }
  e.preventDefault();
});

onKonamiCode(function() {
  var element = document.getElementById("konami");
  window.scrollTo(0, 0);
  element.innerHTML = '<img src="https://i.imgflip.com/1jng63.jpg" class="ui fluid image">'
  // alert("FAKE NEWS!!!");
});
