require 'spec_helper'
require 'faker'

describe User do

  before :each do
    @jack = FactoryGirl.create(:user)
    @chloe = FactoryGirl.create(:user)
    @chloe.female!
  end

	it "has a valid factory" do
    expect(@jack).to be_valid
  end

  describe "name" do
    describe "is invalid if" do
      it "not present" do
        @jack.name = nil
        expect(@jack).to_not be_valid
      end
      it "it has less than 3 chars" do
        @jack.name = Faker::Lorem.characters(2)
        expect(@jack).to_not be_valid
      end
      it "it has more than 30 chars" do
        @jack.name = Faker::Lorem.characters(31)
        expect(@jack).to_not be_valid
      end
    end
  end

  describe "username" do
    describe "is invalid if" do
      it "not present"
      it "it has less than 3 chars"
      it "it has more than 50 chars"
      it "it is not unique"
    end
  end

  describe "email" do
    describe "is invalid if" do
      it "not present"
      it "it is not a valid email"
      it "it has less than 5 chars"
      it "it has more than 50 chars"
      it "it is not unique"
    end
  end
end
