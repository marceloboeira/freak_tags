require 'rails_helper'

describe Friendship do

  before :each do
    @jax = FactoryGirl.create(:user)
    @chibs = FactoryGirl.create(:user)
    @juice = FactoryGirl.create(:user)
    @tig = FactoryGirl.create(:user)
    @happy = FactoryGirl.create(:user)
    @cley = FactoryGirl.create(:user)


    @jax_friends = [ Friendship.create(:user => @jax, :friend => @chibs, :status => FriendshipStatus::ACCEPTED),
                     Friendship.create(:user => @jax, :friend => @tig, :status => FriendshipStatus::ACCEPTED),
                     Friendship.create(:user => @jax, :friend => @juice, :status => FriendshipStatus::PENDING),
                     Friendship.create(:user => @jax, :friend => @happy, :status => FriendshipStatus::REJECTED),
                     Friendship.create(:user => @jax, :friend => @cley, :status => FriendshipStatus::BLOCKED) ]
    @jax_friends.each do |friendship|
      friendship.save
    end

  end

  it { should belong_to :user }
  it { should belong_to :friend }

  it "validate status enum defaults" do
    should allow_value(FriendshipStatus::PENDING, FriendshipStatus::REJECTED, FriendshipStatus::BLOCKED, FriendshipStatus::ACCEPTED).for(:status)
  end

  it "validate if user has friends" do
    expect(@jax.has_friends?).to be(true)
    expect(@cley.has_friends?).to be(false)
  end

  it "validate the friends list" do
    # expect(@jax.real_friends.map(&:user)).to include(@chibs, @tig)
  end
end
