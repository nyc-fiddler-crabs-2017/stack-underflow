$(document).ready(function() {

  $(".new-question-form").on("submit", function(event){
    event.preventDefault();
    var form = $(this);
    var action = form.attr('action');
    var data = form.serialize();
    $.ajax({
      method: $(this).attr('method'),
      url: action,
      data: data
    }).done(function(response){
      $(".questions-list").prepend(response)
      $(".new-question-form").trigger('reset');
    });
  });

  $(".new-answer-form").on("submit", function(event){
    event.preventDefault();
    var form = $(this);
    var action = form.attr('action');
    var data = form.serialize();
    $.ajax({
      method: $(this).attr("method"),
      url: action,
      data: data
    }).done(function(response){
      $(".answers-ul").append(response);
      $('.new-answer-form').trigger('reset');
    });
  });

});
