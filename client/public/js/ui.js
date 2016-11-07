(function(){

  "use strict";

  window.election = window.election || {};


/////Showing list of all existing candidates//////////////////////////////////

  window.election.buildList = function buildList(candidate_data) {
    candidate_data.forEach(function loopArray(candidate){
      // console.log(obj);
      $(".list-of-candidates ul")
        .append(
          '<li>' +
           "  <img src='" + candidate.image_url + "' height='50' width='50'> " +
           " ID:" + candidate.id +
           " Name: " + candidate.name +
           " Charisma: "+ candidate.charisma +
           " Willpower: " + candidate.willpower +
           " Intelligence: " + candidate.intelligence +
           " <a href='#' class='delete-candidate' data-candidate-id= '" + candidate.id + "'>Delete</a>"+
           " <a href='#' class='update-candidate' data-candidate-id= '" + candidate.id + "'>Update</a>"+
          '</li>'
        );
    });
  };


////Producing result of campagin by showing winner//////////////////////////////

  window.election.displayElectionResults = function displayElectionResults(campaign_data) {
    console.log(campaign_data.winning_candidate.name);

    $(".create-a-campaign").append("<p>" + campaign_data.winning_candidate.name + " won!</p>");
  };


/////////////Show history of campaigns//////////////////////////////////////

window.election.displayOldCampaigns = function displayOldCampaigns(old_campaigns_data){
  old_campaigns_data.forEach(function loopRecords(records){
    $(".list-of-campaigns ul")
      .append(
        "<li>" +
        " Campaign Id: " + records.id +
        "   Campaign Start Dt: " + records.start_at +
        "   Winner Id: " + records.winning_candidate_id +
        "</li>"
      );
  });
};







///Close of IIFE
})();
