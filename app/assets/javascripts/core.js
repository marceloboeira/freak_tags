//= require jquery
//= require bootstrap
//= require bootbox
//= require moment
//= require_self

$(function(){

  /**
   * MomentJS Live update on date/time inputs
   * @return self
   */
  var momentLiveUpdate = function() {
    $('date, time').each(function(i, e) {
      var d = moment($(e).data('source'));
      $(e).html(d.fromNow());
    });
  };
  momentLiveUpdate();
  setInterval(momentLiveUpdate, 60000);
});

