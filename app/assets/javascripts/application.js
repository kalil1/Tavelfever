// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require_tree .




$(document).ready(function(){
  var countDownDate = new Date( `<%= current_user.checklists.last.date %> 08:00:00`).getTime();
  var x = setInterval(function() {

      var now = new Date().getTime();

      var distance = countDownDate - now;


      var days = Math.floor(distance / (1000 * 60 * 60 * 24));

      var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));

      var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));

      var seconds = Math.floor((distance % (1000 * 60)) / 1000);


      document.getElementById("demo").innerHTML = days + "days " + hours + "h ";


      if (distance < 0) {
          clearInterval(x);
          document.getElementById("demo").innerHTML = "WE MADE IT!";
      }
  }, 1000);



  function myFunction() {
      var x = document.getElementById("navDemo");
      if (x.className.indexOf("w3-show") == -1) {
          x.className += " w3-show";
      } else {
          x.className = x.className.replace(" w3-show", "");
      }
  }

  // When the user clicks anywhere outside of the modal, close it
  var modal = document.getElementById('ticketModal');
  window.onclick = function(event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }



  $('.modal').modal({
      dismissible: true, // Modal can be dismissed by clicking outside of the modal
      opacity: .5, // Opacity of modal background
      inDuration: 300, // Transition in duration
      outDuration: 200, // Transition out duration
      startingTop: '4%', // Starting top style attribute
      endingTop: '10%', // Ending top style attribute

    }
  );
});
