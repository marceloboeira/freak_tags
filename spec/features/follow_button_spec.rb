require "spec_helper"

describe "FollowButton", :type => :feature, :js => true  do
  let (:cal) { create(:confirmed_user) }
  let (:gillian) { create(:confirmed_user) }

  describe "at profile page" do
    it "shows the follow button" do
      login_as(cal)
      visit profile_path(gillian.username)
      expect(first("#profile-action-buttons i.fa")[:title]).to eq "Follow"
    end
    it "follows user when clicked" do
      login_as(cal)
      visit profile_path(gillian.username)
      first("#profile-action-buttons i.fa").click
      visit profile_path(gillian.username)
      expect(first("#profile-action-buttons i.fa")[:title]).to eq "Unfollow"
    end
    it "updates counter when user is followed" do
      login_as(cal)
      visit profile_path(gillian.username)
      first("#profile-action-buttons i.fa").click
      visit profile_path(gillian.username)
      expect(first(".followers-count").text).to eq "1"
    end
  end
end
