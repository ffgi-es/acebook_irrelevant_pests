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

onKonamiCode(function() {
  var element = document.getElementById("konami");
  element.innerHTML = `<img src="https://i.imgflip.com/1jng63.jpg" class="ui fluid image">`
  alert("FAKE NEWS!!!");
});
