(function(){

"use strict";

window.election = window.election || {};

console.log("I am in data.js");

////Creation of Object candidate with it's properties

$(".formCrtCand").on("submit", function CreateCand(event){
  event.preventDefault();

  var candidate = {
    name: $("#new-name").val(),
    image_url: $("#new-avatar").val(),
    intelligence: $("#intel").val(),
    charisma: $("#charis").val(),
    willpower: $("#power").val(),
  };

///Ajax call to create a new candidate ////////////////////////////////////////

    $.ajax({
      url:"/api/candidates",
      method: "POST",
      data: JSON.stringify(candidate),
      headers:{
        "Content-Type": "application/json"
      },
    })

    .done(function handleSuccess(data){
      console.log("It worked", data);
    })

    .fail(function handleFailure(xhr){
      console.log("Unable to communicate", xhr);
    });

    console.log(candidate.image_url);

});



// //Ajax call to get list of all candidate //////////////////////////////////////

$(".listOfCand").on("click", function listAllCand(event){
  event.preventDefault();

  $.ajax({
    url:"/api/candidates",
    method: "GET",
    headers: {
      "Content-Type": "application/json"
    }
  })

  .done(function handleSuccess(data){
    console.log("It worked", data);
    window.election.buildList(data);
  })

  .fail(function handleFailure(xhr){
    console.log("Unable to communicate", xhr);
  });

});

// ///Ajax call to delete a candidate////////////////////////////////////////////

$(".list-of-candidates").on("click", ".delete-candidate", function listAllCamp(event){
  event.preventDefault();


  console.log(this);
 var candidate_id = $(event.target).attr("data-candidate-id");
 console.log($(event.target).attr("data-candidate-id"));
 console.log(candidate_id);


  $.ajax({
    url:"/api/candidates/" + candidate_id,
    method: "DELETE",
    headers:{
      "Content-Type": "application/json"
    },
  })

  .done(function handleSuccess(data){
    console.log("It worked", data);

  })

  .fail(function handleFailure(xhr){
    console.log("Unable to communicate", xhr);


  });
});


// ///Ajax call to create a new campaign ////////////////////////////////////////


$(".create-a-campaign form").on("submit", function Create(event){
    event.preventDefault();

    console.log("I am in create candidate");

    var candidate1 = $("#candidate-id-1").val();
    console.log(candidate1);
    var candidate2 = $("#candidate-id-2").val();
    console.log(candidate2);


    var campaign = {
      candidate_ids: [candidate1, candidate2]
    };

    console.log(campaign);


    $.ajax({
      url:"/api/campaigns",
      method: "POST",
      data: JSON.stringify(campaign),
      headers: {
        "Content-Type": "application/json"
      },
    })

    .done(function handleSuccess(data){
      console.log("It worked", data);
    })

    .fail(function handleFailure(xhr){
      console.log("Unable to communicate", xhr);
    });


});























//
// //
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
//     url:"/api/candidates/:candidate_id",
//     method: "PATCH",
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
//   });
// });
//
//
//

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
