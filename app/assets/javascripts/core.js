//= require jquery/jquery
//= require bootstrap/bootstrap
//= require bootbox/bootbox
//= require moment/moment
//= require moment/locale/pt-br
//= require medium-editor
//= require_self

$(function(){
  /**
   * FreakTags Front-end Core
   * @type {Object}
   */
  var FreakTags = {
    version: $("#freaktags-version").val(),
    locale: $("#freaktags-locale").val(),
    dateFormat: "ddd, DD MMM YYYY HH:mm:ss ZZ", //RFC822

    /**
     * Booting up front-end core
     * @return {Function}
     */
    init: function() {
      this._momentInit()
      this._mediumInit();
    },

    /**
     * MomentJS Locale and live update settings
     * @return {Function}
     */
    _momentInit: function() {
      moment.locale(FreakTags.locale);
      FreakTags._momentUpdate();
      setInterval(FreakTags._momentUpdate, 60000);
    },

    /**
     * MomentJS Live update on date/time inputs
     * @return {Function}
     */
    _momentUpdate: function(){
      $("date, time").each(function(i, e) {
        var d = moment.utc($(e).data("source"), FreakTags.dateFormat);
        $(e).html(d.fromNow());
      });
    },

    /**
     * Medium editor start
     * @return {Function}
     */
    _mediumInit: function() {
      var elements = $(".html-editor"),
      editor = new MediumEditor(elements, {
        delay: 150,
        buttonLabels: 'fontawesome'
      });
    },
  };

  // Booting up core
  FreakTags.init();
});

