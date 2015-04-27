//= require bootstrap-tagsinput

var TagInput = {
  selector: 'input.tags',

  init: function() {
    $(this.selector).tagsinput({
      tagClass: "label label-primary"
    });
  }
}
