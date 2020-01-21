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
  element.innerHTML = '<%= image_tag "irrelevant_pest.jpeg", class: "ui fluid image animate" %>'
  alert("THE IRRELEVANT PESTS!!!");
});
