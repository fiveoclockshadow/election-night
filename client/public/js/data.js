(function(){

"use strict";

window.election = window.election || {};


// Variables to hold candidate's data
var candId;
var candName;
var candAvatar;
var candIntel;
var candCharis;
var candPower;


// Variables to hold campaign data
var campId;
var campName;
var campDate;
var campCand;



console.log("I am in data.js");


//Ajax call to get list of all candidate //////////////////////////////////////

// $("").on("click", function listAllCand(event){
//   event.preventDefault();
//
//   $.ajax({
//     url:
//     method: "GET",
//     data: JSON.stringify({}),
//     dataType:
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


///Ajax call to get list of campaigns//////////////////////////////////////////

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
//
//
// ///Ajax call to create a new campaign ////////////////////////////////////////
//
// $("").on("click", function listAllCamp(event){
//   event.preventDefault();
//
//   $.ajax({
//     url:
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
//
// ///Ajax call to create a new candidate ////////////////////////////////////////
//
// $("").on("click", function listAllCamp(event){
//   event.preventDefault();
//
//   $.ajax({
//     url:
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
//     url:
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




//////////////////////////////////////////////////////////////////////////////
///Ajax call to return a collection of campaign objects for a candidate////////


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
