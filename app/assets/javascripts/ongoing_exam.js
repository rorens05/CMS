var template = "<div class='student-status'><h5>Laurence Bautista</h5><p>status: <strong>Ongoing</strong></p><p>reason: <strong>Change tab</strong></p><p>time finished: <strong>Change tab</strong></p><p>Score: <strong>100</strong></p></div>"

$(document).ready(function(){
  if(window.location.pathname == "/ongoing_exam/start_exam"){
    function updateStudent(){
      $.get("/ongoing_exam/get_exam_results?id=" + $("#test_id").val(), function(data, status){
        console.log("name: " + data.data[0].name + "\nStatus: " + status);
          var contents = "";
          for(var i = 0; i < data.data.length; i++){
            var temp = "<div class='student-status'>";
            temp = temp + "<h5>" + data.data[i].name + "</h5>";
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
});