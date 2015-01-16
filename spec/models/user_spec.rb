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
    expect(@chloe).to be_valid
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
     it "not present" do
        @jack.username = nil
        expect(@jack).to_not be_valid
      end
      it "has less than 3 chars" do
        @jack.username = Faker::Lorem.characters(2)
        expect(@jack).to_not be_valid
      end
      it "has more than 30 chars" do
        @jack.username = Faker::Lorem.characters(31)
        expect(@jack).to_not be_valid
      end
      it "is not unique" do
        @chloe.username = @jack.username
        expect(@chloe).to_not be_valid
      end
      #it "is in the pattern"
    end
  end

  describe "email" do
    describe "is invalid if" do
      it "not present" do
        @jack.email = nil
        expect(@jack).to_not be_valid
      end
      it "has less than 5 chars" do
        @jack.email = Faker::Lorem.characters(4)
        expect(@jack).to_not be_valid
      end
      it "has more than 50 chars" do
        @jack.email = Faker::Lorem.characters(51)
        expect(@jack).to_not be_valid
      end
      it "is not unique" do
        @chloe.email = @jack.email
        expect(@chloe).to_not be_valid
      end
      it "is not a valid email" do
        addresses = %w[user@foo. THE_USER@fg_ ~@~.com my_email invalidA@dres 1@2.3]
        addresses.each do |email|
          @jack.email = email
          expect(@jack).to_not be_valid
        end
      end
      #it "is not unique"
    end
  end

  describe "sex" do
    describe "is valid if" do
      it "is male" do
        @jack.male! #just making sure of it
        expect(@jack).to be_valid
        expect(@jack).to be_male
      end
      it "is female" do
        @chloe.female! #just making sure of it
        expect(@chloe).to be_valid
        expect(@chloe).to be_female
      end
    end
    describe "is invalid if" do
      it "not present" do
        @jack.sex = nil
        expect(@jack).to_not be_valid
      end
      it "is out of enum pattern" do
        @chloe.sex = Faker::Lorem.characters(5)
        expect(@chloe).to_not be_valid
      end
    end
  end
end
