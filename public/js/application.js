$(document).ready(function() {

  $(".new-question-form").on("submit", function(event){
    var form = $(this);
    var action = form.attr('action');
    var data = form.serialize();
    $.ajax({
      method: form.attr('method'),
      url: action,
      data: data
    }).done(function(response){
      // can't see what my response is- do I need to isolate only the new form info to prepend?
      $("ul").prepend(response)
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
