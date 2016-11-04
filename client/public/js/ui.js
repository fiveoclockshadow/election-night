(function(){

  "use strict";

  window.election = window.election || {};


  console.log("I am in ui.js");

  window.election.buildList = function buildList(data) {
    $.each(data, function loopArray(i, obj){
      console.log(obj);
    });
  }


})();
