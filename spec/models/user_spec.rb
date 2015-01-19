require 'spec_helper'


describe User do

  before :each do
    @jack = FactoryGirl.create(:user)
    @chloe = FactoryGirl.create(:user)
    @chloe.female!
  end

  it "has a valid factory" do
    expect(@jack).to be_valid
    expect(@chloe).to be_valid
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:gender) }
  it { should_not validate_presence_of(:birthday) }
  it { should_not validate_presence_of(:description) }

  it { should validate_uniqueness_of(:username) }
  it { should validate_uniqueness_of(:email) }

  it { should ensure_length_of(:name).is_at_least(2).is_at_most(50) }
  it { should ensure_length_of(:username).is_at_least(2).is_at_most(50) }
  it { should ensure_length_of(:email).is_at_least(5).is_at_most(50) }
  it { should ensure_length_of(:description).is_at_most(500) }

  it "validate username pattern" do
    should_not allow_value("jAcK.", "j@k", "j4.ck", "?jac", "*ja*ck").for(:username)
  end

  it "validate email pattern" do
    should_not allow_value("user@foo..", "HE_USER@fg_", "e mail@a.com", "invalidA@dres", "1@2.3").for(:email)
  end

  it "validate gender enum defaults" do
    should allow_value(Gender::MALE, Gender::FEMALE, Gender::OTHER).for(:gender)
  end

  it "validate gender invalid values" do
    should_not allow_value("fremale", "___", "MALES", "9", "???").for(:gender)
  end

  it "validate birthday invalid values" do
    should_not allow_value("not-a-date", "0000").for(:birthday)
  end

  it "validate birthday date range" do
    should_not allow_value(DateTime.now - 11.months, DateTime.now - 101.years).for(:birthday)
  end

  it "validate age as an alias of birthday_age" do
    @jack.birthday = DateTime.now - 20.years
    expect(@jack.age).to be(@jack.birthday_age)
  end

  it "validate birthday today" do
    @jack.birthday = DateTime.now - 30.years
    @chloe.birthday = DateTime.now - 20.years - 20.days
    expect(@jack.birthday_today?).to be(true)
    expect(@chloe.birthday_today?).to be(false)
  end

  it "validate birthday age number" do
    @jack.birthday = DateTime.now - 30.years
    expect(@jack.age).to be(30)
  end
end
