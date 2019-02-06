$(document).ready(function(){

  function setActive(){
    // /users.json
    // var request = new XMLHttpRequest();
    // request.open();

    // request.onload = function(){
    //   // var users = JSON.parse();
    //   console.log(request.responseText)
    // };

    // request.onerror = function(){
    //   console.log("yep");
    // };
    // request.send();
    // console.log("your active..");
  }

  setActive(); // This will run on page load

  setInterval(function(){
    setActive() // this will run after every 5 seconds
  }, 5000);
});