//= require underscore
//= require jquery/jquery
//= require bootstrap/bootstrap
//= require datetime_ago
//= require follow_button
//= require modal
//= require html_editor
//= require tag_input
/**
 * FreakTags Front-end Core
 * @type {Object}
 */
var FreakTags = {
  /**
   * Booting up front-end core
   * @return {Function}
   */
  init: function() {
    this.loadBackendData();
    $("[title]").tooltip();
    // Components init
    DateTimeAgo.init(this.locale);
    FollowButton.init();
    Modal.init();
    HtmlEditor.init();
    TagInput.init();
  },

  loadBackendData: function(){
    _.extend(this, {
      version: $("#freaktags-version").val(),
      locale: $("#freaktags-locale").val(),
      CSRF: $("meta[name=csrf-token]").attr("content")
    });
  }
};
