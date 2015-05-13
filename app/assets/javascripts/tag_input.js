//= require bootstrap-tagsinput
/**
 * Tag input
 * @type {Object}
 */
var TagInput = {
  selector: 'input.tags',

  init: function() {
    $(this.selector).tagsinput({
      tagClass: "label label-primary"
    });
  }
}
