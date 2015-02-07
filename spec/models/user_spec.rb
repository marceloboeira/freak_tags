require "spec_helper"

describe User do
  let (:jack) { create(:user, username: "jack", birthday: 30.years.ago) }
  let (:chloe) { create(:female_user, username: "chloe", birthday: (30.years + 20.days).ago) }

  before :each do
    create(:user)
  end

  describe "validates" do
    it "a valid factory" do
      expect(jack).to be_valid
      expect(chloe).to be_valid
    end
    it { expect(jack).to validate_presence_of(:username) }
    it { expect(jack).to validate_presence_of(:email) }
    it { expect(jack).to_not validate_presence_of(:password) }
    it { expect(jack).to_not validate_presence_of(:name) }
    it { expect(jack).to_not validate_presence_of(:birthday) }
    it { expect(jack).to_not validate_presence_of(:gender) }
    it { expect(jack).to_not validate_presence_of(:description) }
    it { expect(jack).to validate_uniqueness_of(:username) }
    it { expect(jack).to validate_uniqueness_of(:email) }
    it { expect(jack).to ensure_length_of(:name).is_at_most(50) }
    it { expect(jack).to ensure_length_of(:password).is_at_least(8).is_at_most(128) }
    it { expect(jack).to ensure_length_of(:username).is_at_least(2).is_at_most(50) }
    it { expect(jack).to ensure_length_of(:email).is_at_least(5).is_at_most(50) }
    it { expect(jack).to ensure_length_of(:description).is_at_most(500) }
    it "name pattern" do
      expect(jack).to_not allow_value("J$ack Bauer", "J4CK", "Chloe O&brien!", "Mr. JACK!", "#JACK").for(:name)
      expect(jack).to allow_value("Jack Bauer", "Jack", "Dr. Jack Bauer", "Jack Baüer", "Chloe O'Brian").for(:name)
    end
    it "username pattern" do
      expect(jack).to_not allow_value("jAcK.", "j@k", "j4.ck", "?jac", "*ja*ck").for(:username)
      expect(jack).to allow_value("jack", "jack_bauer", "jack-bauer", "j4ck-", "jac").for(:username)
    end
    it "email pattern" do
      expect(jack).to_not allow_value("user@foo..", "HE_USER@fg_", "e mail@a.com", "invalidA@dres", "1@2.3").for(:email)
    end
    it "email downcasing on validation" do
      kim = create(:user, email: "KiM.bauer@gmail.com")
      expect(kim.email).to eq("kim.bauer@gmail.com")
    end
    it "gender enum defaults" do
      expect(jack).to allow_value(Gender::MALE, Gender::FEMALE, Gender::OTHER).for(:gender)
    end
    it "gender invalid values" do
      expect(jack).to_not allow_value("fremale", "___", "MALES", "9", "???").for(:gender)
    end
    it "gender default value" do
      kim = create(:user, gender: nil)
      expect(kim.gender).to eq(Gender::OTHER)
      expect(kim).to be_valid
    end
    it "role enum defaults" do
      expect(jack).to allow_value(UserRole::GUEST, UserRole::REGULAR, UserRole::CONTRIBUTOR, UserRole::MODERATOR, UserRole::DEVELOPER, UserRole::ROOT).for(:role)
    end
    it "role invalid values" do
      expect(jack).to_not allow_value("master", "deve)_", "28282", "null", "none").for(:role)
    end
    it "role default value" do
      kim = create(:user, role: nil)
      expect(kim.role).to eq(UserRole::REGULAR)
      expect(kim).to be_valid
    end
    describe "birthday" do
      it "invalid values" do
        expect(jack).to_not allow_value("not-a-date", "0000").for(:birthday)
      end
      it "date range" do
        expect(jack).to_not allow_value(11.months.ago, 101.years.ago).for(:birthday)
      end
      it "age as an alias of birthday_age" do
        expect(jack.age).to be(jack.birthday_age)
      end
      it "is today" do
        jack.birthday = DateTime.now
        expect(jack.birthday_today?).to be(true)
        expect(chloe.birthday_today?).to be(false)
      end
      it "age number" do
        expect(jack.age).to be(30)
      end
    end
  end
end
