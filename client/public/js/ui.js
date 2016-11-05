(function(){

  "use strict";

  window.election = window.election || {};


  // console.log("I am in ui.js");

  window.election.buildList = function buildList(candidate_data) {
    candidate_data.forEach(function loopArray(candidate){
      // console.log(obj);
      $(".list-of-candidates ul")
        .append(
          '<li>' +
           " ID:" + candidate.id +
           " <img src=" + candidate.image_url + "height='40' width='30'>" +
           " Name:" + candidate.name +
           " Charisma: "+ candidate.charisma +
           " Willpower: " + candidate.willpower +
           " Intelligence: " + candidate.intelligence +
           " <a href='#' class='delete-candidate' data-candidate-id= '" + candidate.id + "'>Delete</a>"+
          '</li>'
        );
    });
  };











///Close of IIFE
})();
