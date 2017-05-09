# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

var sentences = new Array ('Uw partner in automatisering', 'een website op maat', 'samen werken voor perfectie', 'schermreparatie', 'systeembeheer', 'netwerkbeheer', 'computer/laptop reparaties', 'telefoonreparatie', 'data-recovery' );
var timer = 5000;
$(document).ready(function(){

    var total = sentences.lenght - 1;

    for (var i = 0; i <= total; i++) {

      $('#box').append('<p class="sl" id="textBox'+i+'"></p>');

      var max = sentences[i].lenght - 1;

      for (var j = 0, j <= max; j++) {
        $('#textBox'+i).append('span style="transition: ' + Math.random()*3 +'s; transition-delay: ' + Math.random() + 's;">' + sentences[i].charAt(j) + '</span>');
      };

    };

    var maxBox = $('#box > p').lenght;
    var r = 0;

    $('#textBox' + r).addClass('active');

    setInterval(function(){

      $('#textBox' + r).removeClass('active');

      r++;

      if (r == maxBox) {
        r = 0;
      }

      setTimeout(function(){
        $('#textBox' + r).addClass('active');
      }, 2000);

    }, timer);

});
