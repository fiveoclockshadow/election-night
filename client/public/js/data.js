(function(){

"use strict";

window.election = window.election || {};



$(".formCrtCand").on("submit", function CreateCand(event){
  event.preventDefault();

  var candidate = {
    name: $("#new-name").val(),
    img_url: $("#new-avatar").val(),
    intelligence: $("#intel").val(),
    charisma: $("#charis").val(),
    willpower: $("#power").val(),
  };

 console.log(candidate);

});








console.log("I am in data.js");


// //Ajax call to get list of all candidate //////////////////////////////////////
//
// $("").on("click", function listAllCand(event){
//   event.preventDefault();
//
//   $.ajax({
//     url:"/candidates",
//     method: "GET",
//     data: JSON.stringify({REPLACE-ME}),
//     headers: {
//       "Content-Type": "application/json"
//     }
//   })
//
//   .done(function handleSuccess(data){
//     console.log("It worked", data);
//
//
//   })
//
//   .fail(function handleFailure(xhr){
//     console.log("Unable to communicate", xhr);
//
//
//   })
//
// });
//
//
// // /Ajax call to get list of campaigns//////////////////////////////////////////
//
// $("").on("click", function listAllCamp(event){
//   event.preventDefault();
//
//   $.ajax({
//     url:"/campaigns",
//     method: "GET",
//     data: JSON.stringify({}),
//     headers:{
//       "Content-Type": "application/json"
//     },
//   })
//
//   .done(function handleSuccess(data){
//     console.log("It worked", data);
//
//   })
//
//   .fail(function handleFailure(xhr){
//     console.log("Unable to communicate", xhr);
//
//
//   })
// });
//
//
// ///Ajax call to create a new campaign ////////////////////////////////////////
//
// $("").on("click", function listAllCamp(event){
//   event.preventDefault();
//
//   $.ajax({
//     url:"/campaigns",
//     method: "POST",
//     data: JSON.stringify({}),
//     headers:{
//       "Content-Type": "application/json"
//     },
//   })
//
//   .done(function handleSuccess(data){
//     console.log("It worked", data);
//
//   })
//
//   .fail(function handleFailure(xhr){
//     console.log("Unable to communicate", xhr);
//
//
//   })
// });
//
//
//
// ///Ajax call to create a new candidate ////////////////////////////////////////
//
// $("").on("click", function listAllCamp(event){
//   event.preventDefault();
//
//   $.ajax({
//     url:"/candidates",
//     method: "POST",
//     data: JSON.stringify({}),
//     dataType:
//     headers:{
//       "Content-Type": "application/json"
//     },
//   })
//
//   .done(function handleSuccess(data){
//     console.log("It worked", data);
//
//   })
//
//   .fail(function handleFailure(xhr){
//     console.log("Unable to communicate", xhr);
//
//
//   })
// });
//
//
// ///Ajax call to get a specific candidate with campaign history ///////////////
//
// $("").on("click", function listAllCamp(event){
//   event.preventDefault();
//
//   $.ajax({
//     //  Get a specific candidate object, with campaign history
//     url:"/candidates/:candidate_id",
//     method: "GET",
//     data: JSON.stringify({}),
//     dataType:
//     headers:{
//       "Content-Type": "application/json"
//     },
//   })
//
//   .done(function handleSuccess(data){
//     console.log("It worked", data);
//
//   })
//
//   .fail(function handleFailure(xhr){
//     console.log("Unable to communicate", xhr);
//
//
//   })
// });
//
//
//
//
// ///Ajax call to update a specific candidate///////////////////////////////////
//
// $("").on("click", function listAllCamp(event){
//   event.preventDefault();
//
//   $.ajax({
//     //Update a specific candidate object
//     url:"/candidates/:candidate_id",
//     method: "PATCH",
//     data: JSON.stringify({}),
//     dataType:
//     headers:{
//       "Content-Type": "application/json"
//     },
//   })
//
//   .done(function handleSuccess(data){
//     console.log("It worked", data);
//
//   })
//
//   .fail(function handleFailure(xhr){
//     console.log("Unable to communicate", xhr);
//
//
//   })
// });
//
//
//
// ///Ajax call to delete a candidate////////////////////////////////////////////
//
// $("").on("click", function listAllCamp(event){
//   event.preventDefault();
//
//   $.ajax({
//     url:
//     method: "DELETE",
//     data: JSON.stringify({}),
//     dataType:
//     headers:{
//       "Content-Type": "application/json"
//     },
//   })
//
//   .done(function handleSuccess(data){
//     console.log("It worked", data);
//
//   })
//
//   .fail(function handleFailure(xhr){
//     console.log("Unable to communicate", xhr);
//
//
//   })
// });
//
//
//
//
// ////////////////////////////////////////////////////////////////////////////
// // /Ajax call to return a collection of campaign objects for a candidate////////
//
//
// $("").on("click", function listAllCamp(event){
//   event.preventDefault();
//
//   $.ajax({
//     url:
//     method: "GET",
//     data: JSON.stringify({}),
//     dataType:
//     headers:{
//       "Content-Type": "application/json"
//     },
//   })
//
//   .done(function handleSuccess(data){
//     console.log("It worked", data);
//
//   })
//
//   .fail(function handleFailure(xhr){
//     console.log("Unable to communicate", xhr);
//
//
//   })
// });

///////////////////////////////////////////////////////////////////////////////





// iife closing
})();
