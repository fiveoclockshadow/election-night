(function(){

"use strict";

window.election = window.election || {};

console.log("I am in data.js");

$()
.on("click", function listAllCand(event){
  event.preventDefault();


//Ajax call to get list of all candidate
s  
  $.ajax({
    url:
    method: "GET",
    data:
    dataType:
    headers: {
      "Content-Type": "application/json"
    }
  })

  .done(function handleSuccess(){
    console.log("It worked");


  })

  .fail(function notWorking(xhr){
    console.log("Not working");


  })




})



















})();
