//= require jquery
//= require bootstrap
//= require bootbox
//= require moment
//= require_self

$(function(){
  var RFC822 = "ddd, DD MMM YYYY HH:mm:ss ZZ";
  /**
   * MomentJS Live update on date/time inputs
   * @return self
   */
  var momentLiveUpdate = function() {
    $('date, time').each(function(i, e) {
      var d = moment($(e).data('source'), RFC822);
      $(e).html(d.fromNow());
    });
  };
  momentLiveUpdate();
  setInterval(momentLiveUpdate, 60000);
});

