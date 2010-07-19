$(function() {
  
  $('.title a').click(function () {
    $(".title").hide();
    $(this).parent().parent().find(".details").fadeIn();
    return false;
  });
  
  $('.back').click(function () {
    $(".details").hide();
    $(".title").show();
    return false;
  });
  
});
