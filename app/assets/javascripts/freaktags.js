//= require underscore
//= require jquery/jquery
//= require bootstrap/bootstrap
//= require datetime_ago
//= require follow_button
//= require modal
//= require html_editor

/**
 * FreakTags Front-end Core
 * @type {Object}
 */
var FreakTags = {
  version: $("#freaktags-version").value,
  locale: $("#freaktags-locale").value,
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
