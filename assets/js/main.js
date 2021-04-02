document.addEventListener("DOMContentLoaded", function() {  
  initBV();
});

function initBV() {
  var bv = new Bideo();

  bv.init({
    videoEl: document.querySelector('#bg-video'),

    container: document.querySelector('#container'),

    resize: true,

    src: [
      {
        src: '../assets/images/bg-1.mp4',
        type: 'video/mp4'
      }
    ],
  })
}
