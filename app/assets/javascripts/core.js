//= require underscore
//= require jquery/jquery
//= require bootstrap/bootstrap
//
//= require datetime_ago
//= require follow_button
//= require modal
//= require html_editor
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
      $("[title]").tooltip();
      DateTimeAgo.init(this.locale);
      FollowButton.init();
      Modal.init();
      HtmlEditor.init();

    }
  };

  // Booting up core
  FreakTags.init();
});




