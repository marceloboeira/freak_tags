//= require moment/moment
//= require moment/locale/pt-br

/**
 * DateTimeAgo class, to setup dynamic data-sources
 *
 * @type {DateTimeAgo}
 */
var DateTimeAgo = {
  selector: "date, time",
  refreshRate: 60000,

  /**
   * MomentJS Locale and live update settings
   *
   * @param locale -
   * @param refreshRate -
   * @return {Function}
   */
  init: function(locale, refreshRate) {
    moment.locale(locale);
    this.refresh();
    setInterval(this.refresh, refreshRate || this.refreshRate);
  },

  /**
   * MomentJS Live update on date/time inputs
   *
   * @return {Function}
   */
  refresh: function(){
    $(this.selector).each(function(i, e) {
      var d = moment.unix($(e).data("source"));
      $(e).html(d.fromNow());
    });
  },
}
