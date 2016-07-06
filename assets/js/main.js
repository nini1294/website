$(document).ready(function() {  
  initBV();
  $('#video-cover').ready(function() {
    $('#video-cover').fadeIn(1000);
  })
});

function initBV() {
  var bv = new Bideo();

  bv.init({
    videoEl: $('#bg-video').get(0),

    container: $('#container').get(0),

    resize: true,

    src: [
      {
        src: '../assets/images/bg-2.mp4',
        type: 'video/mp4'
      }
    ],
  })
}
