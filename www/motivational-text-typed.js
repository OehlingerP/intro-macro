$(document).ready(function() {
  // Array of texts to be typed
  var texts = [
    "Ever wondered why central banks raise interest rates when inflation surges? Discover the answers and more in this introduction to macroeconomics.",
    "Ever wondered why unemployment rates rise during economic recessions? Uncover the connection between economic cycles and job markets in this introduction to macroeconomics.",
    "Ever wondered how government spending influences national economic growth? Explore the impact of fiscal policies on the economy in this introduction to macroeconomics."
  ];

  var options = {
    strings: texts,
    typeSpeed: 15, // Speed of typing
    backSpeed: 10, // Speed of deleting
    backDelay: 2000, // Delay before starting to delete
    startDelay: 0000, // Delay before starting to type
    loop: true, // Loop the typing effect
    showCursor: false, // Show cursor
    cursorChar: '|' // Cursor character
  };

  new Typed('#motivational-text', options);
});
