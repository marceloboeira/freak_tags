//= require jquery
//= require bootstrap
//= require bootbox
//= require moment
//= require moment/locale/pt-br.js
//= require_self

$(function(){
  /**
   * [FreakTags Front-end Core]
   * @type {Object}
   */
  var FreakTags = {
    version: $("#freaktags-version").val(),
    locale: $("#freaktags-locale").val(),
    dateFormat: "ddd, DD MMM YYYY HH:mm:ss ZZ", //RFC822

    /**
     * [Booting up front-end core]
     * @return {[type]} [description]
     */
    init: function() {
      this._momentInit()
    },

    /**
     * [MomentJS Locale and live update settings]
     * @return {[function]}
     */
    _momentInit: function() {
      moment.locale(FreakTags.locale);
      FreakTags._momentUpdate();
      setInterval(FreakTags._momentUpdate, 60000);
    },

    /**
     * [MomentJS Live update on date/time inputs]
     * @return {[function]}
     */
    _momentUpdate: function(){
      $("date, time").each(function(i, e) {
        var d = moment.utc($(e).data("source"), FreakTags.dateFormat);
        $(e).html(d.fromNow());
      });
    }
  };

  // Booting up core
  FreakTags.init();
});

