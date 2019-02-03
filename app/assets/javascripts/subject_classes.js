$(document).ready(function(){
  $("#school_year_select").change(function(){
    updateClassList();
  });

  $("#sem_select").change(function(){
    updateClassList();   
  });

  function updateClassList(){
    var sem_select = document.getElementById("sem_select");
    var sem = sem_select.options[sem_select.selectedIndex].value;
    
    var year_select = document.getElementById("school_year_select");
    var year = year_select.options[year_select.selectedIndex].value;
    window.location.href = 
    "/subject_classes?school_year=" + year + 
    "&sem=" + sem;
  }

});
