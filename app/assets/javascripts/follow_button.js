
var FollowButton = {
  selector: '[data-follow-button]',

  init: function() {
    $(this.selector).each(function() {
      var self = $(this);

      // Initial Data TODO: move to private method
      var isFollowing = self.data('following') == true;
      if (isFollowing) {
        self.html(_.unescape(self.data('unfollow-content')))
        self.attr('href',self.data('unfollow-url'));
      }
      else {
        self.html(_.unescape(self.data('follow-content')));
        self.attr('href',self.data('follow-url'));
      }

      self.on('click', function(e){
        e.preventDefault();
        // Ajax Call
      });
    });
  },
};
