$(document).ready(function() {
  var texts = [
    "Ever wondered why central banks raise interest rates when inflation surges? Discover the answers and more in this Introduction to Macroeconomics course.",
    "Ever wondered why unemployment rates rise during economic recessions? Uncover the connection between economic cycles and job markets in this Introduction to Macroeconomics course.",
    "Ever wondered how government spending influences national economic growth? Explore the impact of fiscal policies on the economy in this comprehensive Introduction to Macroeconomics class."
  ];

  var index = 0;
  var $textContainer = $('#motivational-text');
  
  function showNextText() {
    $textContainer.addClass('fade-out');
    setTimeout(function() {
      $textContainer.text(texts[index]);
      $textContainer.removeClass('fade-out').addClass('fade-in-out');
      index = (index + 1) % texts.length;
    }, 1000); // Match the duration of fade-out
  }

  setInterval(showNextText, 5000); // Change text every 5 seconds
});