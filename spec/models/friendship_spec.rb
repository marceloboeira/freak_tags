require 'spec_helper'

describe Friendship do
  it { should belong_to :user }
  it { should belong_to :friend }

  it "validate status enum defaults" do
    should allow_value(FriendshipStatus::PENDING, FriendshipStatus::REJECTED, FriendshipStatus::BLOCKED, FriendshipStatus::ACCEPTED).for(:status)
  end
end
