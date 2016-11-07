(function(){

"use strict";

window.election = window.election || {};

// console.log("I am in data.js");

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


});



////Ajax call to get list of all candidates //////////////////////////////////

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

/////Ajax call to delete a candidate//////////////////////////////////////////

$(".list-of-candidates").on("click", ".delete-candidate", function listAllCamp(event){
  event.preventDefault();


      // console.log(this);
      var candidate_id = $(event.target).attr("data-candidate-id");
      // console.log($(event.target).attr("data-candidate-id"));
      // console.log(candidate_id);


      $.ajax({
        url:"/api/candidates/" + candidate_id,
        method: "DELETE",
        data: JSON.stringify(candidate_id),
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


/////Ajax call to create a new campaign /////////////////////////////////////


$(".create-a-campaign form").on("submit", function Create(event){
    event.preventDefault();

      // console.log("I am in create candidate");

      var candidate1 = $("#candidate-id-1").val();
      // console.log(candidate1);
      var candidate2 = $("#candidate-id-2").val();
      // console.log(candidate2);


      var campaign = {
        candidate_ids: [candidate1, candidate2]
      };


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
          window.election.displayElectionResults(data);
      })

      .fail(function handleFailure(xhr){
        console.log("Unable to communicate", xhr);
      });


});



/////Ajax call to get list of campaigns///////////////////////////////////

$(".seeOldCamp").on("click", function listAllCamp(event){
  event.preventDefault();

      $.ajax({
        url:"/api/campaigns",
        method: "GET",
        headers:{
          "Content-Type": "application/json"
        },
      })

      .done(function handleSuccess(data){
        console.log("It worked", data);
        window.election.displayOldCampaigns(data);
      })

      .fail(function handleFailure(xhr){
        console.log("Unable to communicate", xhr);
      });
});


/////Ajax call to update a specific candidate///////////////////////////////////

$(".list-of-candidates").on("click", ".update-candidate", function updateCandidate(event){
  event.preventDefault();

      var candidate_id = $(event.target).attr("data-candidate-id");
      // console.log($(event.target).attr("data-candidate-id"));
      // console.log(candidate_id);

      $.ajax({
        url:"/api/candidates/" + candidate_id,
        method: "GET",
        headers:{
          "Content-Type": "application/json"
        },
      })

      .done(function handleSuccess(data){
        console.log("It worked", data);
        $(".edit-a-candidate").append($(".formCrtCand").clone());
        $(".edit-cand").val(data.name);
        $(".canAva").val(data.image_url);
        $(".canIntel").val(data.intelligence);
        $(".canChar").val(data.charisma);
        $(".canPower").val(data.willpower);
      })

      .fail(function handleFailure(xhr){
          console.log("Unable to communicate", xhr);
      });
});



// iife closing
})();
