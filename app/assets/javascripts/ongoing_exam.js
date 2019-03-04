var template = "<div class='student-status'>    <h5>Laurence Bautista</h5><p>status: <strong>Ongoing</strong></p><p>reason: <strong>Change tab</strong></p><p>time finished: <strong>Change tab</strong></p><p>Score: <strong>100</strong></p></div>"
$(document).ready(function(){
  var i;
  for (i = 0; i < 10; i++) { 
    $(".student-list-exam").append(template);
  }
});