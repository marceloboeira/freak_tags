//= require medium-editor
/**
 * HTML Editor
 * @type {FollowButton}
 */
var HtmlEditor = {
  selector: ".html-editor",

  /**
   * Medium editor start
   * @return {Function}
   */
  init: function() {
    new MediumEditor(this.selector, {
      buttonLabels: "fontawesome",
      paste: {
        cleanPastedHTML: false,
        forcePlainText: false
      }
    });
  }
};
