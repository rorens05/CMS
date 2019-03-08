var questions = null;
var counter = 0;
var limit = 0;
var finalScore = 0;

$(document).ready(function(){

  function updateTime(){
    $.get("/ongoing_exam/get_test?id=" + $("#testId").val(), function(data, status){
      console.log("Data: " + data.data.remaining_time + "\nStatus: " + status);
      $("#exam-time").html( data.data.remaining_time)
    });
  }

  if ($("#titleExam").val() == "exam") {
    setInterval(updateTime, 1000);
  }

  $(window).blur(function() {

    if($("#titleExam").val() == null){
    }else{
      $("#submitExam").hide();
      $("#examPanel").hide();
      $("#examResult").hide();
      $("#examStart").hide(); 
      $("#statusInfo").html("<p style='color:red !important'>your exam have been paused</p>");     
      $("#action").hide();
      $.get(`/ongoing_exam/update_status?id=${$("#testResultId").val()}&status=Paused&reason=Change Window`, function(data, status){
        console.log("Start exam status: " + data.message);
      });
      alert("Exam window lost focus");
    }
  });

  $("#submitExam").hide();
  $("#examPanel").hide();
  $("#examResult").hide();
  $("#examStart").hide();
 
  if ($("#status").val() == "Finished") {
    $("#statusInfo").html("You already finished the exam");
    $("#action").hide();
  }else if ($("#status").val() == "Online") {
    $("#statusInfo").html("You are Online");
  }else if ($("#status").val() == "Paused") {
    $("#statusInfo").html("<p style='color:red !important'>your exam have been paused</p>");
    $("#action").hide();
  }

  $.get(`/ongoing_exam/get_test_answer_sheet?id=${$("#testResultId").val()}`, function(data, status){
    questions = data.data;
    limit = questions.length;
    console.log(limit);
    $("#examStart").show();
  });

  $("#submitExam").click(function(){
    $("#examPanel").hide();
    $("#submitExam").hide();
    $("#examResult").show();
    $("#statusInfo").html("You already finished the exam");
    $("#action").hide();
    $.get(`/ongoing_exam/update_status?id=${$("#testResultId").val()}&status=Finished&reason=`, function(data, status){
      console.log("Start exam status: " + data.message);
    });
  });

  $("#examStart").click(function(){
    $("#submitExam").show();
    $("#examStart").hide();
    if(limit == 0){
      $("#examPanel").html("No questions here");
    }else{
      $.get(`/ongoing_exam/update_status?id=${$("#testResultId").val()}&status=Taking Exam&reason=`, function(data, status){
        console.log("Start exam status: " + data.message);
      });
      setExamPanelValue(questions[counter]);
    }
    $("#examPanel").show();
  });

  function setExamPanelValue(question){
    template = `
      <input type="hidden" id="testQuestionId" value="${question.id}">
      <h4><pre>${question.question}</pre></h4>
      <textarea name="answer" id="answer">${question.answer == null ? "" : question.answer}</textarea>
      <a href="#" class="btn btn-primary btn-sm exam-btn" id="answerSubmit">next</a>
    `;
    $("#examPanel").html(template);

    $("#answerSubmit").click(function(){
      var testAnswerId = $("#testQuestionId").val();
      var answer = $("#answer").val();
      console.log("test answer id: " + testAnswerId);
      console.log("answer: " +answer);

      $.post("/ongoing_exam/check_answer", {id: testAnswerId, answer: answer}, function(data, status){
        console.log("\nStatus: " + status);
        console.log("\nCheck: " + data.check);
        console.log("\nScore: " + data.score);
        finalScore = data.score;
        $("#examResult").html(`<br><h3>Your score ${finalScore} out of ${limit}</h3>`);
      });

      counter = counter + 1;
      if(counter  < limit){
        setExamPanelValue(questions[counter]);
      }else{
        $("#examPanel").hide();
        $("#submitExam").hide();
        $.get(`/ongoing_exam/update_status?id=${$("#testResultId").val()}&status=Finished&reason=`, function(data, status){
          console.log("Start exam status: " + data.message);
        });
        $("#examResult").show();
        $("#statusInfo").html("You already finished the exam");
        $("#action").hide();
      }
    });
  }
});