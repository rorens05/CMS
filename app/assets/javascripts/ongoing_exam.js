var template = "<div class='student-status'><h5>Laurence Bautista</h5><p>status: <strong>Ongoing</strong></p><p>reason: <strong>Change tab</strong></p><p>time finished: <strong>Change tab</strong></p><p>Score: <strong>100</strong></p></div>"
var countDownDate = new Date().getTime();
var mdate = moment('2016-01-01');
var stime = mdate.format("MMM DD, YYYY h:mm:ss");
console.log("date " + stime);
$(document).ready(function(){

  $("#stop").hide();
  if(window.location.pathname == "/ongoing_exam/start_exam"){
    function updateStudent(){
      console.log("/ongoing_exam/get_exam_results?id=" + $("#test_id").val());
      $.get("/ongoing_exam/get_exam_results?id=" + $("#test_id").val(), function(data, status){
        console.log("message: " + data.message + "\nStatus: " + status);
          var contents = "";
          for(var i = 0; i < data.data.length; i++){
            var temp = "<div class='student-status'>";
            temp = temp + "<h5>" + data.data[i].name + "</h5>";
            temp = temp + `<input type='hidden' value='${data.data[i].id}' class='tempid'>`;
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
            temp = temp + `<p>Score: <strong>${data.data[i].score}</strong></p>`;
            if (data.data[i].status == "Paused") {
              temp = temp + `<input type='submit' value="resume" class="btn btn-warning btn-sm btnResume">`;
            }
            temp = temp + `</div>`;
            contents = contents + temp;
          }
        $(".student-list-exam").html(contents)
        $(".btnResume").click(function(){
          var testResultId = $(".btnResume").parent("div").children(".tempid").val();
          $.get(`/ongoing_exam/update_status?id=${testResultId}&status=Online&reason=`, function(data, status){
            console.log("Start exam status: " + data.message);
          });

        });
      });
    }
    updateStudent();
    setInterval( updateStudent, 500);
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
        
      var myTime = hours + "h "
      + minutes + "m " + seconds + "s ";
      // Output the result in an element with id="demo"
      document.getElementById("time").innerHTML = myTime;
      
      //insert to database remaining time hours + "h " + minutes + "m " + seconds + "s "
      $.get(`/ongoing_exam/synchronize_time?id=${$("#test_id").val()}&time=${myTime}`, function(data, status){
        console.log("current time: " + data.message);
      });

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

    if($("#status").html() == "Ongoing"){
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
    }
});