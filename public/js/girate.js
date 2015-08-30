elvisGirate = {


  wiggleHips: function () {
    $('img.elvis2').mouseover(function(){
      $('img.elvis2').addClass('girate');
      elvisGirate.elvisThePelvis();
      setTimeout(elvisGirate.stopHips, 11300);
    });
  },

  elvisThePelvis: function () {
    if ($('img.elvis2').hasClass('girate')) {
      girate_start.play();
      // setTimeout(elvisGirate.stopHips, 11000);
    }
  },

  stopHips: function () {

      $('img.elvis2').removeClass('girate');

  },


  init: function () {
    elvisGirate.wiggleHips();
    elvisGirate.elvisThePelvis();
  }

}


$(document).ready(function() {
    elvisGirate.init();
});



  // setTimeout(mouseout, 10000);
