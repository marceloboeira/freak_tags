require "spec_helper"

describe Follow do

  let (:jax) { create(:user, username: "jax") }
  let (:chibs) { create(:user, username: "chibs") }
  let (:bobby) { create(:user, username: "bobby") }
  let (:tig) { create(:user, username: "tig") }
  let (:juice) { create(:user, username: "juice") }
  let (:cley) { create(:user, username: "cley") }
  let (:gemma) { create(:female_user, username: "gemma") }
  let (:tara) { create(:female_user, username: "tara") }
  let (:followers_list) { [chibs, bobby, tig, tara, juice, gemma] }
  let (:follows_list) { [chibs, bobby, tig, tara] }

  before :each do
    create(:user)
  end
  describe "validates" do
    it "follows list" do
      follows_list.each do |user|
        jax.follow user
      end
      follows = jax.follows.map(&:followable)
      expect(follows).to eql(follows_list)
      expect(follows).to_not include([cley, gemma, juice])
    end
    it "followers list" do
      followers_list.each do |user|
        user.follow jax
      end
      followers = jax.followers
      expect(followers).to eql(followers_list)
      expect(followers).to_not include(cley)
    end
  end

end
