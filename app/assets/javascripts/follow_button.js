/**
 * Follow button class
 * @type {FollowButton}
 */
var FollowButton = {
  selector: "[data-follow-button]",
  target: "[data-follow-count-id=?]",

  /**
   * Set main function for each button and main events
   * @return {[type]} [description]
   */
  init: function() {
    $(this.selector).each(function() {
      var self = $(this);

      FollowButton._standardize(self);
      self.on("click", function(event){
        event.preventDefault();
        var self = $(this),
            url = self.attr("href"),
            isFollowing = self.data("following") == true;

        self.data("following", !isFollowing);
        $.get(url, function(followers) {
          FollowButton._standardize(self);
          FollowButton._updateTarget(self, followers);
        });
      });
    });
  },

  /**
   * Update target counter
   */
  _updateTarget: function(self, value) {
    var target = $(this.target.replace("?", self.data("followable-id")));
    target.html(value);
  },

  /**
   * Standardize the button input
   */
  _standardize: function(self) {
    var isFollowing = self.data("following") == true;
    self.html(_.unescape(self.data(isFollowing ? "unfollow-content" : "follow-content")));
    self.attr("href",self.data(isFollowing ? "unfollow-url" : "follow-url"));
  }
};
