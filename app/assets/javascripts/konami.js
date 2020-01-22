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
  window.scrollTo(0, 0);
  element.innerHTML = '<img class="ui fluid image animate" src="/assets/irrelevant_pests-97ff456474e761eb8f50b682f8b1e50908db805c16947fb6b6239e8a9240b386.jpg">'
  alert("THE IRRELEVANT PESTS!!!");
});
