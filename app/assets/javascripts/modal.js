//= require bootbox/bootbox
/**
 * Modal
 * @type {Object}
 */
var Modal = {
  selectors: {
    destroyConfirmation: "a[data-destroy]"
  },

  /**
   * Bootbox buttons init
   * @return {[type]} [description]
   */
  init: function() {
    $(this.selectors.destroyConfirmation).on("click", function (e){
      var self = $(this),
          link = self.attr("href"),
          message = self.data("destroy-message");

      e.preventDefault();
      bootbox.confirm(message, function(result){
        if (result) {
          window.location.href = link;
        }
      });
    });
  }
}
