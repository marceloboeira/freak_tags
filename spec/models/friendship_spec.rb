require "spec_helper"

describe "Friendship" do

  let (:jax) { create(:user, username: "jax") }
  let (:chibs) { create(:user, username: "chibs") }
  let (:bobby) { create(:user, username: "bobby") }
  let (:tig) { create(:user, username: "tig") }
  let (:juice) { create(:user, username: "juice") }
  let (:cley) { create(:user, username: "cley") }
  let (:gemma) { create(:female_user, username: "gemma") }
  let (:tara) { create(:female_user, username: "tara") }
  let (:friend_list) { [bobby, tig, juice, cley, gemma, tara] }

  before :each do
    create(:user)
  end

  describe "validates"

  it "friendship request" do
    jax.invite chibs

    expect(jax.pending_invited).to include(chibs)
    expect(chibs.pending_invited_by).to include(jax)
    expect(jax.friends).to_not include(chibs)
    expect(chibs.friends).to_not include(jax)
    expect(jax.friend_with? chibs).to be(false)
    expect(chibs.friend_with? jax).to be(false)
  end

  it "approved friendship" do
    jax.invite bobby

    bobby.approve jax
    expect(jax.friends).to include(bobby)
    expect(jax.invited).to include(bobby)
    expect(bobby.friends).to include(jax)
    expect(bobby.invited_by).to include(jax)
    expect(jax.friend_with? bobby).to be(true)
    expect(bobby.friend_with? jax).to be(true)
  end

  it "removed friendship" do
    tig.invite cley
    cley.approve tig
    tig.remove_friendship cley

    expect(tig.friends).to_not include(cley)
    expect(cley.friends).to_not include(tig)
  end

  it "friends list" do
    friend_list.each do |c|
      chibs.invite c
      c.approve chibs
    end
    expect(chibs.friends).to match(friend_list)
  end
end
