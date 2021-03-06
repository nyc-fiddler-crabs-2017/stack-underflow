$(document).ready(function() {

  $(".new-question-form").on("submit", function(event){
    event.preventDefault();
    var form = $(this);
    var action = form.attr('action');
    var data = form.serialize();
    $.ajax({
      method: form.attr('method'),
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
      method: form.attr("method"),
      url: action,
      data: data
    }).done(function(response){
      $(".answers-ul").append(response);
      $('.new-answer-form').trigger('reset');
    });
  });

  $(".new-comment-form").on("submit", function(event){
    event.preventDefault();
    var form = $(this);
    var action = form.attr('action');
    var data = form.serialize();
    $.ajax({
      method: form.attr("method"),
      url: action,
      data: data
    }).done(function(response){
      console.log(response)
      $(".comments-ul").append(response);
      $('.new-comment-form').trigger('reset');
    });
  });

  $(".answer-comment-button").on("click", function(event){
    debugger
    var question_id =
    $.ajax({
      method: "get",
      url: '/questions/:question_id/comments/new',
    })
  })

});
