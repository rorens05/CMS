var template = "<div class='student-status'><h5>Laurence Bautista</h5><p>status: <strong>Ongoing</strong></p><p>reason: <strong>Change tab</strong></p><p>time finished: <strong>Change tab</strong></p><p>Score: <strong>100</strong></p></div>"

$(document).ready(function(){

  $("#stop").hide();
  if(window.location.pathname == "/ongoing_exam/start_exam"){
    function updateStudent(){
      $.get("/ongoing_exam/get_exam_results?id=" + $("#test_id").val(), function(data, status){
        console.log("name: " + data.data[0].name + "\nStatus: " + status);
          var contents = "";
          for(var i = 0; i < data.data.length; i++){
            var temp = "<div class='student-status'>";
            temp = temp + "<h5>" + data.data[i].name + data.data[i].id + "</h5>";
            var statusColor = "black";

            if(data.data[i].status == "Online"){
              statusColor = "green";
            }else if(data.data[i].status == "Offline"){
              statusColor = "gray";
            }else if(data.data[i].status == "Paused"){
              statusColor = "brown";
            }else if(data.data[i].status == "Prohibited"){
              statusColor = "red";
            }else if(data.data[i].status == "Taking Exam"){
              statusColor = "blue";
            }else if(data.data[i].status == "Finished"){
              statusColor = "green";
            }

            temp = temp + "<p>status: <strong style='color:" + statusColor + "'>" + data.data[i].status + "</strong></p>";
            if(data.data[i].status == "Paused"){
              temp = temp + "<p>reason: <strong style='color:red'>" + data.data[i].reason + "</strong></p>"
            }
            if(data.data[i].time_finished != null){
              temp = temp + "<p>time finished: <strong>Change tab</strong></p>";
            }
            temp = temp + `<p>Score: <strong>${data.data[i].score}</strong></p></div>`;
            contents = contents + temp;
          }
        $(".student-list-exam").html(contents)
      });
    }
    updateStudent();
    setInterval( updateStudent, 3000);
  }
    // Set the date we're counting down to
    var today = new Date();
    var duration = $("#duration").val();
    today.setMinutes(today.getMinutes() + Number(duration))
    console.log(duration)
    var countDownDate = today.getTime();

    function startTimer() {
  
      // Get todays date and time
      var now = new Date().getTime();
        
      // Find the distance between now and the count down date
      var distance = countDownDate - now;
        
      // Time calculations for days, hours, minutes and seconds
      var days = Math.floor(distance / (1000 * 60 * 60 * 24));
      var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
      var seconds = Math.floor((distance % (1000 * 60)) / 1000);
        
      // Output the result in an element with id="demo"
      document.getElementById("time").innerHTML = hours + "h "
      + minutes + "m " + seconds + "s ";
        
      // If the count down is over, write some text 
      if (distance < 0) {
        clearInterval(x);
        document.getElementById("time").innerHTML = "ended";
        $("#stop").hide();
        $("#start").show();
        $("#time").html("Finished")
      }
    }

    // Update the count down every 1 second
    var x = null;
    
    $("#stop").click(function(){
      $("#stop").hide();
      $("#start").show();
      clearInterval(x); // stop the interval
      $("#time").html("Finished")
      $.get(`/ongoing_exam/update_test_status?test_id=${$("#test_id").val()}&status=Ended`, function(data, status){
        alert("Message: " + data.message);
        $("#status").html("Ended");
      });

    });


    $("#start").click(function(){
      $("#stop").show();
      $("#start").hide();
      today = new Date();
      duration = $("#duration").val();
      today.setMinutes(today.getMinutes() + Number(duration))
      console.log(duration)
      countDownDate = today.getTime();
      x = setInterval(startTimer, 1000)
      $.get(`/ongoing_exam/update_test_status?test_id=${$("#test_id").val()}&status=Ongoing`, function(data, status){
        // alert("Message: " + data.message + "\nStatus: " + status);
        $("#status").html("Ongoing");
      });
    });
});