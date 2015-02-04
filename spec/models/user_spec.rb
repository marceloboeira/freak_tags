require 'spec_helper'

describe User do

  let (:jack) { create(:user, username: "jack", birthday: 30.years.ago) }
  let (:chloe) { create(:female_user, username: "chloe", birthday: (30.years + 20.days).ago) }

  before :each do
    create(:user)
  end

  it "has a valid factory" do
    expect(jack).to be_valid
    expect(chloe).to be_valid
  end

  it { expect(jack).to validate_presence_of(:username) }
  it { expect(jack).to validate_presence_of(:email) }

  it { expect(jack).to_not validate_presence_of(:password) }
  it { expect(jack).to_not validate_presence_of(:birthday) }
  it { expect(jack).to_not validate_presence_of(:gender) }

  it { expect(jack).to_not validate_presence_of(:description) }

  it { expect(jack).to validate_uniqueness_of(:username) }
  it { expect(jack).to validate_uniqueness_of(:email) }

  it { expect(jack).to ensure_length_of(:name).is_at_least(2).is_at_most(50) }
  it { expect(jack).to ensure_length_of(:password).is_at_least(8).is_at_most(128) }
  it { expect(jack).to ensure_length_of(:username).is_at_least(2).is_at_most(50) }
  it { expect(jack).to ensure_length_of(:email).is_at_least(5).is_at_most(50) }
  it { expect(jack).to ensure_length_of(:description).is_at_most(500) }

  it "validate name default value" do
    kim = create(:user, name: nil, username: "kim")
    expect(kim.name).to eq(kim.username)
    expect(kim).to be_valid
  end

  it "validate username pattern" do
    expect(jack).to_not allow_value("jAcK.", "j@k", "j4.ck", "?jac", "*ja*ck").for(:username)
  end

  it "validate email pattern" do
    expect(jack).to_not allow_value("user@foo..", "HE_USER@fg_", "e mail@a.com", "invalidA@dres", "1@2.3").for(:email)
  end

  it "validate gender enum defaults" do
    expect(jack).to allow_value(Gender::MALE, Gender::FEMALE, Gender::OTHER).for(:gender)
  end

  it "validate gender invalid values" do
    expect(jack).to_not allow_value("fremale", "___", "MALES", "9", "???").for(:gender)
  end

  it "validate gender default value" do
    kim = create(:user, gender: nil)
    expect(kim.gender).to eq(Gender::OTHER)
    expect(kim).to be_valid
  end

  it "validate role enum defaults" do
    expect(jack).to allow_value(Role::GUEST, Role::REGULAR, Role::CONTRIBUTOR, Role::MODERATOR, Role::DEVELOPER, Role::ROOT).for(:role)
  end

  it "validate role invalid values" do
    expect(jack).to_not allow_value("master", "deve)_", "28282", "null", "none").for(:role)
  end

  it "validate role default value" do
    kim = create(:user, role: nil)
    expect(kim.role).to eq(Role::REGULAR)
    expect(kim).to be_valid
  end

  describe "birthday" do
    it "validate birthday invalid values" do
      expect(jack).to_not allow_value("not-a-date", "0000").for(:birthday)
    end

    it "validate birthday date range" do
      expect(jack).to_not allow_value(11.months.ago, 101.years.ago).for(:birthday)
    end

    it "validate age as an alias of birthday_age" do
      expect(jack.age).to be(jack.birthday_age)
    end

    it "validate birthday today" do
      jack.birthday = DateTime.now
      expect(jack.birthday_today?).to be(true)
      expect(chloe.birthday_today?).to be(false)
    end

    it "validate birthday age number" do
      expect(jack.age).to be(30)
    end
  end

  describe "friendships" do
    let (:jax) { create(:user, username: "jax") }
    let (:chibs) { create(:user, username: "chibs") }
    let (:bobby) { create(:user, username: "bobby") }
    let (:tig) { create(:user, username: "tig") }
    let (:juice) { create(:user, username: "juice") }
    let (:cley) { create(:user, username: "cley") }
    let (:gemma) { create(:female_user, username: "gemma") }
    let (:tara) { create(:female_user, username: "tara") }
    let (:friend_list) { [bobby, tig, juice, cley, gemma, tara] }

    it "validate a friendship request" do
      jax.invite chibs

      expect(jax.pending_invited).to include(chibs)
      expect(chibs.pending_invited_by).to include(jax)
      expect(jax.friends).to_not include(chibs)
      expect(chibs.friends).to_not include(jax)
      expect(jax.friend_with? chibs).to be(false)
      expect(chibs.friend_with? jax).to be(false)
    end

    it "validate an approved friendship" do
      jax.invite bobby
      bobby.approve jax

      expect(jax.friends).to include(bobby)
      expect(jax.invited).to include(bobby)
      expect(bobby.friends).to include(jax)
      expect(bobby.invited_by).to include(jax)
      expect(jax.friend_with? bobby).to be(true)
      expect(bobby.friend_with? jax).to be(true)
    end

    it "validate a removed friendship" do
      tig.invite cley
      cley.approve tig
      tig.remove_friendship cley

      expect(tig.friends).to_not include(cley)
      expect(cley.friends).to_not include(tig)
    end

    it "validate a friend list" do
      friend_list.each do |c|
        chibs.invite c
        c.approve chibs
      end

      expect(chibs.friends).to match(friend_list)
    end
  end
end
