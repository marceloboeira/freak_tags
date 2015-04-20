/**
 * Follow button class
 * @type {FollowButton}
 */
var FollowButton = {
  selector: "[data-follow-button]",
  target: "[data-follow-count-id=?]",

  init: function() {
    $(this.selector).each(function() {
      var self = $(this);

      FollowButton._padronize(self);
      self.on("click", function(event){
        event.preventDefault();
        var self = $(this),
            url = self.attr("href"),
            isFollowing = self.data("following") == true;

        self.data("following", !isFollowing);
        $.get(url, function(followers) {
          FollowButton._padronize(self);
          FollowButton._updateTarget(self, followers)
        });
      });
    });
  },

  _updateTarget: function(self, value) {
    var target = $(this.target.replace("?", self.data("followable-id")));
    target.html(value);
  },

  _padronize: function(self) {
    var isFollowing = self.data("following") == true;
    self.html(_.unescape(self.data(isFollowing ? "unfollow-content" : "follow-content")));
    self.attr("href",self.data(isFollowing ? "unfollow-url" : "follow-url"));
  }

};
