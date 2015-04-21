//= require underscore
//= require jquery/jquery
//= require bootstrap/bootstrap
//= require bootbox/bootbox
//= require moment/moment
//= require moment/locale/pt-br
//= require medium-editor
//
//= require follow_button
//= require_self

$(function(){
  /**
   * FreakTags Front-end Core
   * @type {Object}
   */
  var FreakTags = {
    version: $("#freaktags-version").val(),
    locale: $("#freaktags-locale").val(),
    CSRF: $("meta[name=csrf-token]").attr("content"),

    /**
     * Booting up front-end core
     * @return {Function}
     */
    init: function() {
      this._momentInit();
      this._mediumInit();
      this._tooltipInit();
      FollowButton.init();
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
        var d = moment.unix($(e).data("source"));
        $(e).html(d.fromNow());
      });
    },

    /**
     * Bootbox buttons init
     * @return {[type]} [description]
     */
    _bootboxInit: function() {

      /* Delete button */
      $("a[data-destroy]").on("click", function (e){
        var self = $(this);
        var link = self.attr("href");
        var message = self.data("destroy-message");
        e.preventDefault();
        bootbox.confirm(message, function(result){
          if (result) {
            window.location.href = link;
          }
        });
      });
    },

    /**
     * Medium editor start
     * @return {Function}
     */
    _mediumInit: function() {
      var e = new MediumEditor(".html-editor", {
        buttonLabels: "fontawesome",
        paste: {
          cleanPastedHTML: false,
          forcePlainText: false
        }
      });
    },

    /**
     * Bootstrap tooltip ini
     * @return {function}
     */
    _tooltipInit: function() {
      $("[title]").tooltip();
    },

    /**
     * Bootstrap tooltip refresh
     * @return {function}
     */
    _tooltipRefresh: function() {
      $("[title]").tooltip();
    }
  };

  // Booting up core
  FreakTags.init();
});




