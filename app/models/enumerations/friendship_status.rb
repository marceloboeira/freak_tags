class FriendshipStatus < EnumerateIt::Base
  associate_values :pending, :rejected, :accepted, :blocked

  sort_by :translation
end
