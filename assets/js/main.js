var bv = new Bideo();

bv.init({
  videoEl: $('#bg_video').get(0),
  container: $('#container').get(0),
  resize: true,
  src: [
    {
      src: '../assets/images/bg.mp4',
      type: 'video/mp4'
    }
  ]
})

$(document).ready(function() {
  $('#link').velocity("fadeIn", { duration: 1500 });
});
