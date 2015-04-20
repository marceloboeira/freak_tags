
var FollowButton = {
  selector: '[data-follow-button]',

  init: function() {
    $(this.selector).each(function() {
      var self = $(this);

      FollowButton.padronize(self);

      self.on('click', function(event){
        event.preventDefault();
        var self = $(this),
            url = self.attr('href'),
            isFollowing = self.data('following') == true;

        self.data('following', !isFollowing);

        $.get(url, function(a) {
          FollowButton.padronize(self);
        });
      });
    });
  },

  padronize: function(self) {
    var isFollowing = self.data('following') == true;
    if (isFollowing) {
      self.html(_.unescape(self.data('unfollow-content')))
      self.attr('href',self.data('unfollow-url'));
    }
    else {
      self.html(_.unescape(self.data('follow-content')));
      self.attr('href',self.data('follow-url'));
    }
  }
};
